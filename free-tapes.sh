#!/bin/bash

# generate two reports, 1 for LTO3 scratch tapes, 1 for LTO4 scratch tapes


/usr/openv/volmgr/bin/vmquery -pn Scratch -W | grep L4|awk {'print $1"\t"$15}' | sort -t: -k1 > /scr/L4-scratch.txt

/usr/openv/volmgr/bin/vmquery -pn Scratch -W | grep L3|awk {'print $1"\t"$15}' | sort -t: -k1 > /scr/L3-scratch.txt


