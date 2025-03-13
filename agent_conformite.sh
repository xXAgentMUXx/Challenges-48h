#!/bin/bash

IP1="10.0.5.42"
IP2="10.0.6.42"
PORT="443"

TARGET_IP=$IP1

updates=$(apt-get update && apt-get upgrade -s)

ssh_config="/etc/ssh/sshd_config"
ssh_protocol=$(grep "Protocol" $ssh_config)

json_output=$(jq -n \
  --arg updates "$updates" \
  --arg ssh_protocol "$ssh_protocol" \
  '{
    "updates": $updates,
    "ssh_protocol": $ssh_protocol
  }')

curl -X POST "https://$TARGET_IP:$PORT" \
     -H "Content-Type: application/json" \
     -d "$json_output" \
     --insecure  
