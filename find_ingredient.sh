#!/bin/bash

# Simple ingredient search in Open Food Facts CSV files
# Usage: ./find_ingredient.sh -i "ingredient" -d /path/to/data

while getopts "i:d:" opt; do
  case $opt in
    i) ingredient="$OPTARG" ;;
    d) data_dir="$OPTARG" ;;
    *) echo "Usage: $0 -i ingredient -d data_directory"; exit 1 ;;
  esac
done

# Check that both arguments were provided
if [[ -z "$ingredient" || -z "$data_dir" ]]; then
  echo "Both -i and -d arguments are required."
  exit 1
fi

# Search all CSV files in the directory for the ingredient
grep -i "$ingredient" "$data_dir"/*.csv

