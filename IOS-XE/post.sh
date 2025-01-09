#!/bin/bash

# Simmilar script like the retrive.sh, but in this script we are basically creating an interface Loopback100 & basic config.
# This is done via RESTCONF POST REQUEST but in the script i used PUT, cos there were some issues regarding authtentication vit the Router

## Credentials in the credentials.env file - replace with your own 

USER="$DEVICE_USER"
PASS="$DEVICE_PASS"
HOST="$DEVICE_HOST"


# RESTCONF headers - 

HEADERS=(
    -H "Content-Type: application/yang-data+json"
    -H "Accept: application/yang-data+json"
)

# This is th actual data we will be sending and configuring using RESTCONF 
# In this section after executing new interface with private ip address and subnet mask will be created
# JSON payload - 

DATA='{
    "ietf-interfaces:interface": {
        "name": "Loopback100",
        "description": "Ovde je bio urosZ",
        "type": "iana-if-type:softwareLoopback",
        "enabled": true,
        "ietf-ip:ipv4": {
            "address": [
                {
                    "ip": "172.16.100.1",
                    "netmask": "255.255.255.0"
                }
            ]
        }
    }
}'

# RESTCONF URL - 

URL="https://$HOST/restconf/data/ietf-interfaces:interfaces/interface=Loopback100"

# Execute the RESTCONF PUT request -  -X option must be specified indicating the POST request and -d option for --data 

curl -k -u "$USER:$PASS" -X PUT "${HEADERS[@]}" -d "$DATA" "$URL"
echo "Configuration applied to $HOST."

## After executing there will be no output.
## To see config on Cat8000v do -> enable -> show running-config
