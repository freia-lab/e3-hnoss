#!/bin/bash

# Check if a file argument is provided
if [ $# -lt 1 ]; then
  echo "Usage: $0 <input_file>"
  exit 1
fi

INPUT_FILE="$1"

# Check if the file exists and is readable
if [ ! -f "$INPUT_FILE" ]; then
  echo "Error: File '$INPUT_FILE' does not exist."
  exit 1
fi

if [ ! -r "$INPUT_FILE" ]; then
  echo "Error: File '$INPUT_FILE' is not readable."
  exit 1
fi

# Process each PV record 
# Reads file line by line
while IFS= read -r line; do
  # Skip empty lines or comments
  [ -z "$line" ] && continue
  [[ "$line" =~ ^# ]] && continue

  echo "Processing: $line"
  caput "$line".PROC 1
  # For demo, just print the command that would run:
  echo "Running  command caput $line.PROC 1"
  
done < "$INPUT_FILE"
