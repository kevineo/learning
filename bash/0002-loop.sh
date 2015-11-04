#!/bin/bash

# For loop
for i in $( ls ); do
	echo item: $i
done

# While Loop
COUNTER=0
while [ $COUNTER -lt 10 ]; do
	echo "The counter is $COUNTER"
	let COUNTER=COUNTER+1
done

# Until Loop
COUNTER=20
until [ $COUNTER -lt 10 ]; do
	echo COUNTER $COUNTER
	let COUNTER-=1
done
