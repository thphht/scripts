#!/bin/bash


# accept stdin a list of media IDs to unfreeze


for i in "$@"
    do
      /usr/openv/netbackup/bin/admincmd/bpmedia -unfreeze -m $i
      echo "Unfreezing: $i"
      echo
    done 
