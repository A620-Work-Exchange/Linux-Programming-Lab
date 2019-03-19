#!/bin/sh
COUNT=${10}
first=0
second=1
for ((i=1;i<=10;i++))
do
	echo $first
	tmp=$first
	first=$second
	second=$((tmp+second))
done
