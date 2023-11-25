#!/bin/bash

# Get user input for the domain
read -p "Enter the domain: " full_domain
# Extract the domain without the TLD
domain=$(echo "$full_domain" | awk -F. '{print $(NF-1)}')

# Create a directory to store the results
mkdir "$domain"
echo "Made Directory $domain"
source go.sh
echo "go variables initilized"
# Certificate search
echo " running cert.sh"
source cert.sh "$full_domain" > "$domain/cert-$domain.txt"
echo "cert.sh finished running"
# Subfinder
echo "running subfinder"
subfinder -d "$full_domain" -t 100 -v -o "$domain/subfinder-$domain.txt"
echo "subfinder finished"
# Sort and unique subdomains
echo "sorting subfinder and cert"
sort "$domain/subfinder-$domain.txt" "$domain/cert-$domain.txt" | uniq -u > "$domain/sort-$domain.txt"
echo "sorting finished"
# HTTPX scan
echo "running httpx"
cat "$domain/sort-$domain.txt" | httpx -threads 100 | tee -a "$domain/httpx-$domain.txt"
echo "httpx finished"
# Waybackurls
echo "running wayback"
cat "$domain/httpx-$domain.txt" | waybackurls | tee -a "$domain/wayback-$domain.txt"
echo "wayback finished"
# Amass
echo "Running amass"
amass enum -brute -d "$full_domain" -nocolor  -o "$domain/amass-$domain.txt"
echo "amass finished"

