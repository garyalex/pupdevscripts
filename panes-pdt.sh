#!/bin/bash

# Script to get list of hosts on command line and run 'puppet agent -t -v' on them
# IN TMUX PANES!!!

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

WORDS=`echo $REMOTES | wc -w`
COUNT=1
LISTA=""
LISTB=""
while [[ $COUNT -le $WORDS ]]; do
  THISWORD=`echo $REMOTES | cut -d " " -f $COUNT`
  if [ `expr $COUNT % 2` == 0 ]; then
    LISTA="$LISTA $THISWORD"
  else
    LISTB="$LISTB $THISWORD"
  fi 
  COUNT=`expr $COUNT + 1`
done
echo "LISTA $LISTA"
echo "LISTB $LISTB"
