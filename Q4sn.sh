#!/bin/bash

# set the input file name
input_file="input.txt"

# set the output file name
output_file="output.csv"

# check if the input file exists
if [ ! -f "$input_file" ]; then
  echo "Input file not found: $INPUT_FILE"
  exit 1
fi

# remove the output file if it already exists
if [ -f "$output_file" ]; then
  rm "$output_file"
fi

# loop through each line in the input file
while read line
do
    
    # extract the Scheme Name and Net Asset Value fields
    scheme_name=$(echo "$line" | awk -F";" '{print $4}')
    nav=$(echo "$line" | awk -F";" '{print $5}')
    # write the fields to the output file
    echo "$scheme_name,$nav" >> $output_file
done < $input_file

