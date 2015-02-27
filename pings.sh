#!/bin/bash

# read a list of hosts from command line input file
# and output list of hosts that dont respond to ping
# note that a device may ignore/block pings or may be 
# simply turned off.

cat "$1"  |
  awk '{print $1}'  |
    while read hostname
      do
        ping -c 2 -t 2 $hostname
        if [ $? != 0 ] ; then
           echo $hostname >> /tmp/deadhosts.$$
        fi
      done
