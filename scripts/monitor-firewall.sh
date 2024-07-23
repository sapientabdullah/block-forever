#!/bin/bash
while true; do
  RULE_COUNT=$(iptables -L | grep "DROP" | wc -l)
  if [ "$RULE_COUNT" -eq "0" ]; then
    sudo /usr/local/bin/block-website.sh example.com
  fi
  sleep 60
done