#!/bin/bash
process_name=$1
log_file="${process_name}_status.log"
while true; do
    if pgrep "$process_name" > /dev/null; then
        cpu_usage=$(ps -C "$process_name" -o %cpu=)
        mem_usage=$(ps -C "$process_name" -o %mem=)
        echo "$(date): $process_name is running, CPU: $cpu_usage%, MEM: $mem_usage
    else 
        echo "$(date): $process_name is not running." >> $log_file"
        fi
        sleep 60
    done
