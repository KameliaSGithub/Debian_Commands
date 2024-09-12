#!/bin/bash

url="https://Web_Pages.com"
http_code=$(curl -s -I "$url" | grep HTTP | awk '{print $2}')
if [[ "$http_code" == "200" || "$http_code" == "301" ]]; then
  modification_time=$(curl -s -I "$url" | grep -i "Last-Modified:" | sed 's/Last-Modified: //I')

if [ ! -z "$modification_time" ]; then
    if [ $(($(date +%s) - $(date -d "$modification_time" +%s))) -lt 86400 ]; then
      curl -o output.html "$url"
      echo "Web page downloaded as output.html"
    else
      echo "Web page has not been modified in the last 24 hours."
    fi
  else
    curl -o output.html "$url"
    echo "Web page downloaded as output.html (no Last-Modified header found)."
  fi
else
  echo "Failed to access $url. HTTP Code: $http_code"
fi
