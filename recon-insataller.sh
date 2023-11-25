#!/bin/bash
wget "https://dl.google.com/go/go1.21.4.linux-arm64.tar.gz"
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.21.4.linux-arm64.tar.gz

source go.sh

go version

go install -v github.com/projectdiscovery/subfinder/v2/cmd/subfinder@latest

go install -v github.com/projectdiscovery/httpx/cmd/httpx@latest

go install github.com/tomnomnom/waybackurls@latest

go install -v github.com/owasp-amass/amass/v4/...@master

