#!/bin/bash

export GRIDPATH=/net/timor/vol/software/gridengine

if [ !$SGE_ROOT ]; then
   . $GRIDPATH/default/common/settings.sh 
fi

clear

while [ 1 ]
do
   qstat -f
	sleep 5
	clear
done
