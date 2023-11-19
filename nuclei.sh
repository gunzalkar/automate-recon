#!/bin/bash

# Change the path to the folder containing YAML files
yaml_folder="/root/nuclei-templates/http/vulnerabilities/generic/"

# Iterate through all YAML files in the folder
for yaml_file in "$yaml_folder"/*.yaml; do
    if [ -f "$yaml_file" ]; then
        # Run the command for each YAML file
        echo "$yaml_file"
        cat wp.txt | nuclei -t "$yaml_file"
    fi
done
