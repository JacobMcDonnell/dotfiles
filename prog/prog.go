package main

import (
	"encoding/json"
	"errors"
	"fmt"
	"os"
	"os/exec"
	"slices"
)

type InstallPair struct {
	Program string
	Args []string
}

type Programs struct {
	OS       map[string]InstallPair
	Programs []map[string]string
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

	return Install(installPair, programs[:n])
}

func Install(installCmd InstallPair, programs []string) error {
	installCmd.Args = slices.Concat(installCmd.Args, programs)

	fmt.Println(installCmd.Program, installCmd.Args)

	cmd := exec.Command(installCmd.Program, installCmd.Args...)
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
