#!/bin/bash
threshold=90
while true; do
    usage = $(df / | grep / | awk  '{print $5}' | sed 's/%//g')
    if [ "$usage" -gt "$threshold"]; then
        echo "Disk space critical:usage at ${usage}%" | mail -s "Disk Space Alert'
    fi
    sleep 3600
done
