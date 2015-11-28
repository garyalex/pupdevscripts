#!/bin/bash

# Script which takes a list of hosts on the command line
# Will go through the directories specified and do a 'git pull'
# Assumes your git repos are already setup

# Requires toilet ascii art generator to be installed
# Or just remove toilet for standard output

HIERADIR="/etc/puppet/hieradata"
PUPPETENVDIR="/etc/puppet/environments"
REMOTEDIRS="$PUPPETENVDIR/development $PUPPETENVDIR/staging $HIERADIR"

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

echo "REMOTES: $REMOTES"

for REMOTEHOST in $REMOTES
do
  echo "$REMOTEHOST" | tr '[:lower:]' '[:upper:]' | toilet -F gay -t -f ascii9
  for DIR in $REMOTEDIRS
    do
      echo "UPDATING $DIR" | toilet -t -f smbraille
      echo 
      ssh root@$REMOTEHOST "cd $DIR; git pull"
      echo 
    done
done
exit 0
