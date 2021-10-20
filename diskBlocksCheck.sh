#!/bin/bash
echo usage: ./diskBlocksCheck.sh sda sdb
for disk in $@
do
{
  badblocks -sv /dev/$disk -o $disk.txt 2> ${disk}.progress
  echo /dev/$disk
}&
done
