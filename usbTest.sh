#!/bin/bash
dev=$1
if [ "$dev" = '' ];then
  dev=/dev/sdb
fi
while [ 1 ]
do
  read -p "Please press ENTER if you are ready"
  echo "---------------------"
  lsusb	
  echo "*********************"
  hdparm -tT $dev
  echo "---------------------"
  echo
done
