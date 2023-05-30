#!/bin/bash
if ! dpkg -s jq >/dev/null 2>&1; then
  apt install jq -y 
fi

# 使用curl下载文件，并将结果存入变量
json=$(curl -s -m 10 "https://api.nasa.gov/planetary/apod?api_key=1thfPMfPbM23lvZBCjg8FKVZQ4792tO18xRFZbfn") && \
url=$(echo $json | jq -r '.url') && \
curl -sSLO "$url"
