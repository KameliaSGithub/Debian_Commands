#!/bin/bash

while true; do
  cpu_usage=$(top -b -n 1 | grep chrome | awk '{print $9}')
  if [ $cpu_usage -gt 20 ]; then
    echo "CPU Usage: $cpu_usage%"
  fi
  sleep 1
done
echo "CPU monitoring started successfully."
