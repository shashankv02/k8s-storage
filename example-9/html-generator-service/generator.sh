#!/bin/bash
trap "exit" SIGINT
mkdir /root/html
#QUOTE_INTERVAL=$(cat /root/config/INTERVAL)
while :
do
  echo $(date) Writing fortune to /root/html/index.html
  /usr/games/fortune > /root/html/index.html
  sleep 5
done
