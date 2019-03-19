#!/bin/sh
clear

echo "1) Continue"
echo "2) Finish"
echo -n "#? "

while read choice
do
	case $choice in
		1)echo -n "#? ";;
		2)break;;
		*)echo "Wrong choice! Please select again!"
		  echo -n "#? ";;
	esac
done
