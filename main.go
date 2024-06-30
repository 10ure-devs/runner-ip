/*
Package main retrieves the public IP address of the machine it is executed on
and sets it as an output variable in a GitHub Actions workflow.

The program performs the following steps:
1. Checks if the GITHUB_ENV environment variable is set.
2. Makes an HTTP GET request to "https://api.ipify.org" to obtain the public IP address.
3. Sets the obtained IP address as an output variable named "ipv4" in the GitHub Actions environment.

This package requires:
- Go 1.15 or higher
- An internet connection to reach the ipify API service
- Execution within a GitHub Actions environment with the GITHUB_ENV environment variable set.
*/
package main

import (
	"io"
	"log"
	"net/http"
	"os"

	"github.com/sethvargo/go-githubactions"
)

func getPublicIP() (string, error) {
	resp, err := http.Get("https://api.ipify.org")
	if err != nil {
		return "", err
	}
	defer resp.Body.Close()

	ip, err := io.ReadAll(resp.Body)
	if err != nil {
		return "", err
	}

	return string(ip), nil
}

func main() {
	githubEnv := os.Getenv("GITHUB_ENV")
	if len(githubEnv) == 0 {
		log.Fatal("GITHUB_ENV variable is not set")
		return
	}
	ip, err := getPublicIP()
	if err != nil {
		log.Fatalf("failed to get public ip: %v", err)
	}

	githubactions.SetOutput("ipv4", ip)
}
