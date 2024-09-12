#!/bin/bash

disk_usage=$(df / | grep / | awk '{ print $5 }' | sed 's/%//g')
if [ "$disk_usage" -gt 90 ]; then
  echo "Critical: Disk usage has reached ${disk_usage}%, immediate action required!"
else
  echo "Disk space usage at ${disk_usage}%, everything is fine."
fi
