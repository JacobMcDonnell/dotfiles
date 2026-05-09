package main

import (
	"flag"
	"fmt"
	"os"
)

func main() {
	programPath := flag.String("p", "programs.json", "Set the programs file path.")
	osName := flag.String("n", "", "Set the OS name.")

	flag.Parse()

	programs, err := ParsePrograms(*programPath)
	if err != nil {
		fmt.Fprintf(os.Stderr, "Error: %s\n", err)
		os.Exit(-1)
	}

	err = programs.Install(*osName)
	if err != nil {
		fmt.Fprintf(os.Stderr, "Error: %s\n", err)
		os.Exit(-1)
	}

	fmt.Println("Done.")
}
