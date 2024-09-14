#!/bin/bash

CACHE_SIZE=100
CACHE_TIMEOUT=300
cache_file="/tmp/dns_cache.txt"
get_record() {
  domain=$1
  if [[ -f $cache_file ]]; then
    grep "$domain" $cache_file | cut -d':' -f2-
  else
    echo "Not found"
  fi
}
put_record() {
  domain=$1
  record=$2
  if [[ $(wc -l <(echo "$record" | sort -n)) -ge $CACHE_SIZE ]]; then
    head -n 1 <(echo "$record" | sort -n) | cut -d' ' -f1- > temp.txt
    mv temp.txt $cache_file
  fi
  echo "$record" >> $cache_file
}
evict_expired() {
  now=$(date +%s)
  while IFS= read -r line; do
    timestamp=$(echo "$line" | cut -d' ' -f2-)
    if (( $(date +%s) - $timestamp > $CACHE_TIMEOUT )); then
      echo "$line" | cut -d' ' -f1- > temp.txt && rm $cache_file && mv temp.txt $cache_file
    fi
  done < $cache_file
}
while true; do
  evict_expired
  sleep 1
done

get_record github.com
put_record exgithub.com "A=93.184.215.14"
