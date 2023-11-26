#!/bin/bash
go install github.com/tomnomnom/gf@latest
git clone https://github.com/1ndianl33t/Gf-Patterns
sudo cp ~/go/bin/gf /bin/
mkdir ~/.gf
mv Gf-Patterns/*.json ~/.gf
gf -list
