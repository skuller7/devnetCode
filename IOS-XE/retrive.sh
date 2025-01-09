#!/bin/bash

# In this script we want to retrive config from IOS-XE device using RESTCONF HTTP API.
# The devices are located on a cisco platform called devnet and are deployed in a sandbox enviroment.
# To run this script you are required an Cisco AnyConnect VPN. 

# Default credentails to the host file.

HOST="$DEVICE_HOST"
USER="$DEVICE_USER"
PASS="$DEVICE_PASS"
URL="https://$HOST/restconf/data/ietf-interfaces:interfaces"

# Put in the .gitignore file -  

# RESTCONF headers - 

HEADERS=(
    -H "Content-Type: application/yang-data+json"
    -H "Accept: application/yang-data+json"
)

# Curl command that lets you create a specific type of HTTP API call in this case GET indicated above 

curl -k -u "$USER:$PASS" "${HEADERS[@]}" "$URL"


