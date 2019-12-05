#!/bin/bash
trap "exit" SIGINT
mkdir /root/html
#QUOTE_INTERVAL=$(cat /root/config/INTERVAL)
while :
do
  echo $(date) Writing fortune to /root/html/index.html
  /usr/games/fortune > /root/html/index.html
  echo "    New quote coming up in ${QUOTE_INTERVAL}" >>  /root/html/index.html
  sleep ${QUOTE_INTERVAL}
done
