#!/bin/bash
set -u
INST=$(bosh vms --json | jq -r '.Tables[0].Rows[].instance')
IPS=$(bosh vms --json | jq -r '.Tables[0].Rows[].ips')
for inst in $INST; do
    for ip in $IPS; do
        echo "checking arping $ip from $inst"
        bosh ssh $inst -- sudo arping -c 1 -I eth0 $ip
    done
done
