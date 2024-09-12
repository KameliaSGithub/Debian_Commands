#!/bin/bash

report_file="system_report_$(date +%F).txt"
echo "System Resource Report - $(date)" >> $report_file
echo "-----------------------------" >> $report_file
cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *%) */\)")
echo "CPU Usage: $cpu_usage" >> $report_file
memory_usage=$(free -h | grep "Mem:" | awk '{print $3 "/" $2}')
echo "Memory Usage: $memory_usage" >> $report_file
disk_space=$(df -h | grep "/")
echo "Disk Space: $disk_space" >> $report_file
echo "System resource report generated successfully."
