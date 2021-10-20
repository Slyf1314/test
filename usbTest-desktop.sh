#!/bin/bash
dev=$1
if [ "$dev" = '' ];then
  dev=/dev/sdb
fi
while [ 1 ]
do
  read -p "Please input ENTER if you are ready"
  echo "---------------------"
  lsusb	|tee -a usb.txt
  echo "*********************"
  hdparm -tT $dev|tee -a usb.txt
  echo "---------------------"
  echo
done
