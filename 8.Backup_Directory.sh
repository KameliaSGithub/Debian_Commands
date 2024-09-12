#!/bin/bash
directory_to_backup=/path/to/directory
backup_directory=/path/to/backup/directory
backup_file="backup_$(date +%F).tar"

for file in "$directory_to_backup"/*; do
  if [ $(stat -c "%Y" "$file" | awk '{print $1}') -gt $(date +%s) - 86400 ]; then
    tar -rf "$backup_directory/$backup_file" "$file"
  fi
done
echo "Backup created successfully."
