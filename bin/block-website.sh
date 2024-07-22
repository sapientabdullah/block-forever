#!/bin/bash
WEBSITE=$1
IP=$(dig +short $WEBSITE)
if [ -z "$IP" ]; then
  echo "Unable to resolve IP for $WEBSITE"
  exit 1
fi

iptables -A INPUT -s $IP -j DROP
iptables -A OUTPUT -d $IP -j DROP