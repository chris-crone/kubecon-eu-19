package main

import (
	"fmt"
	"os"
)

// CNAB environment variables.
const (
	// ActionKey is the env var key for the CNAB action.
	ActionKey = "CNAB_ACTION"
	// BundleNameKey is the name of the CNAB bundle.
	BundleNameKey = "CNAB_BUNDLE_NAME"
	// InstallationNameKey is the env var key for the CNAB installation name.
	InstallationNameKey = "CNAB_INSTALLATION_NAME"
)

// CNAB actions
const (
	ActionInstall   = "install"
	ActionUpgrade   = "upgrade"
	ActionUninstall = "uninstall"
)

func main() {
	bundle := os.Getenv(BundleNameKey)
	action := os.Getenv(ActionKey)
	if action == "" {
		fatal("no action specified")
	}
	installation := os.Getenv(InstallationNameKey)
	if installation == "" {
		fatal("no installation name specified")
	}
	fmt.Printf("%s: run %q on %q\n", bundle, action, installation)
	switch action {
	case ActionInstall:
		fmt.Println("Hello KubeCon!")
	case ActionUpgrade:
	case ActionUninstall:
		fmt.Println("Goodbye KubeCon!")
	default:
		fatal("unknown action %q", action)
	}
}

func fatal(msg string, v ...interface{}) {
	fmt.Printf(msg+"\n", v...)
	os.Exit(1)
}
