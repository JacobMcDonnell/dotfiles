package main

import (
	"encoding/json"
	"errors"
	"fmt"
	"os"
	"os/exec"
	"slices"
)

type CommandPair struct {
	Program string
	Args    []string
}

type Source struct {
	Type    string
	Target  string
	Repo    string
	Dir     string
	Command CommandPair
}

type Programs struct {
	OS       map[string]CommandPair
	Programs []map[string]string
	Vcs      map[string]CommandPair
	Sources  []Source
}

func ParsePrograms(path string) (*Programs, error) {
	file, err := os.ReadFile(path)
	if err != nil {
		return nil, err
	}

	var programs Programs
	err = json.Unmarshal(file, &programs)
	return &programs, err
}

func (p *Programs) Install(osName string) error {
	installPair, ok := p.OS[osName]
	if !ok {
		return fmt.Errorf("Unsupported OS \"%s\"", osName)
	}

	n := 0
	programs := make([]string, len(p.Programs))
	for i := range p.Programs {
		var program string
		var ok bool
		program, ok = p.Programs[i][osName]
		if !ok {
			program, ok = p.Programs[i]["default"]
			if !ok {
				continue
			}
		}

		programs[n] = program
		n++
	}

	installPair.Args = slices.Concat(installPair.Args, programs[:n])
	return RunCommand(installPair)
}

func (p *Programs) Build() error {
	for _, source := range p.Sources {
		clone, ok := p.Vcs[source.Type]
		if !ok {
			return fmt.Errorf("Unsupported VCS \"%s\"", source.Type)
		}

		err := Build(clone, source)
		if err != nil {
			return err
		}
	}

	return nil
}

func Build(clone CommandPair, source Source) error {
	err := os.Chdir(os.ExpandEnv(source.Target))
	if err != nil {
		return err
	}

	clone.Args = append(clone.Args, source.Repo)

	err = RunCommand(clone)
	if err != nil {
		return err
	}

	err = os.Chdir(os.ExpandEnv(source.Dir))
	if err != nil {
		return err
	}

	return RunCommand(source.Command)
}

func RunCommand(command CommandPair) error {
	fmt.Println(command.Program, command.Args)

	cmd := exec.Command(command.Program, command.Args...)
	cmd.Stdout = os.Stdout
	cmd.Stderr = os.Stderr

	err := cmd.Run()

	if eerr, ok := errors.AsType[*exec.ExitError](err); ok {
		return errors.New(eerr.Error())
	} else if eerr, ok := errors.AsType[*exec.Error](err); ok {
		return fmt.Errorf("%s: %s", eerr.Name, eerr.Err)
	}
	return err
}
