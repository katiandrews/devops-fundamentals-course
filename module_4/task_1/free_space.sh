#!/bin/bash

THRESHOLD=200000

disks=($(df | awk '{print $1}' | grep /))

if [ $1 > 0 ]; then
        THRESHOLD=$1
fi

for disk in " ${disks[@]}"; do
	available_space=`df $disk | grep / | awk '{print $4}'`

	if (( $available_space <= $THRESHOLD ));then
		echo "WARNING: Free space of disk ${disk} is below ${THRESHOLD}"
	else 
		echo "Free space on disk ${disk} is enough"
	fi
done
