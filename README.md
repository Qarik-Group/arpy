# Meet Arpy - A BOSH VM Networking Validator

Ever needed to diagnose weird networking bugs on BOSH deployed VMs?  We ran into a problem with a BOSH release that would create routes for itself on the networking stack.  To detect this, Arpy was created.

## How it Works

Arpy is a simple bash script which uses the BOSH CLI and jq.  The ip addresses of each of the vms in a particular deployment are looped through.  An ssh session is established and an `arping` command is run against all the ip addresses in the deployment.  You can quickly identify which virtual machines can (and importantly cannot) send and receive traffic.

## Using Arpy

Start by setting a few environment variables:

```
export BOSH_ENVIRONMENT="name of your bosh director"
export BOSH_DEPLOYMENT="name of your deployment"
```

Clone this repo and call the script to view the response.  To see the results on the screen and dump them to a flat file run:

```
./arpy.sh 2>&1 | tee results.out
```
