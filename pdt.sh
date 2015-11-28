#!/bin/bash

# Script to get list of hosts on command line and run 'puppet agent -t -v' on them

# Requires toilet ascii art generator to be installed
# Or just remove toilet for standard output

if (( $# > 0 )); then
  REMOTES=$1
  while [ "$2" != "" ]; do
    shift
    REMOTES="$REMOTES $1"
  done
else
  echo "Usage: $0 remoteserver1 remoteserver2 etc..."
  exit 1
fi

for REMOTEHOST in $REMOTES
do
  echo "$REMOTEHOST" | tr '[:lower:]' '[:upper:]' | toilet -F gay -t -f pagga
  echo 
  ssh root@$REMOTEHOST "puppet agent -t -v"
  echo 
done
exit 0
