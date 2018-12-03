#!/bin/bash
## By Leandro Fabris Milani
## 30/01/2014
## Bash pingtest
 
OP="$1"
IP="$2"
DOWN=0
REGEX_IP="^([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3})\.([0-9]{1,3})$"
 
if [[ ! $IP =~ $REGEX_IP ]] ; then
  echo "Incorrect IP address"
  exit 1
fi
 
case $OP in
  up) 
    echo "Wait... testing..."
    RESPONSE="1 received"
    while [[ $PINGTEST != $RESPONSE ]] 
    do
        PINGTEST=`ping -c 1 $IP | grep -o '1 received'`
    done
    DATE=`date`
    echo "Reponse from $IP - $DATE" >> /var/log/ping.log
    echo "Reponse from $IP - $DATE | log /var/log/ping.log"
    xmessage -title "Response" -nearmouse "Reponse from $IP"
  ;;
 
  down)
    echo "Wait... testing..."
    RESPONSE="0 received"
    while [[ $PINGTEST != $RESPONSE ]] 
    do
        PINGTEST=`ping -c 2 $IP | grep -o '0 received'`
    done
    DATE=`date`
    echo "No response from $IP - $DATE"  >> /var/log/ping.log
    echo "No response from $IP - $DATE | log /var/log/ping.log"
    xmessage -title "No response" -nearmouse "No response from $IP"
  ;;
 
  *)
    echo "Usage: pingtest {up|down} before IP address!"
    exit 1
esac