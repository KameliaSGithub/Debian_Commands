#!/bin/bash

directory_to_backup=/path/to/directory
backup_directory=/path/to/backup/directory
backup_file="backup_$(date +%F).tar"
tar -czf "$backup_directory/$backup_file" "$directory_to_backup"
echo "Backup created successfully."
