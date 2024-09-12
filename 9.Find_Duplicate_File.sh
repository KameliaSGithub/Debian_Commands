#!/bin/bash

directory_to_search=/path/to/directory
file_dict=()

for file in "$directory_to_search"/*; do
  file_name=$(basename "$file")
  file_size=$(stat -c "%s" "$file")

  if [[ "${file_dict[@]}" =~ $file_name ]] && [ $file_size -gt 1048576 ]; then
  
    if [ $(cmp -s "$file" "${file_dict[$file_name]}" ) ]; then
      echo "Duplicate files found: $file_name"
    fi
  else
    file_dict+=($file_name)
  fi
done
echo "Duplicate files found successfully."
