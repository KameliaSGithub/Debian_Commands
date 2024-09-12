#!/bin/bash

file_to_count=/path/to/file
line_count=$(wc -l < "$file_to_count")
echo "The file contains $line_count lines."
