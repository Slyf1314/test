#!/bin/bash

echo Usage: ./dd.sh [sdc1]
if [ $# -lt 2 ];then
    echo "Writing in the current directory"
    dd if=/dev/zero of=./test-$$ bs=4M count=125  oflag=direct
    exit
fi

  MP=/tmp/mp-$$
  mkdir $MP
  mount /dev/$1 $MP
  if  [ $? != 0 ];then
      exit $? 
  fi
{
  echo Writing /dev/$1 ...
  cd $MP
  date
  echo "Writing in $MP ..."
  #dd if=/dev/zero of=$tmpFile bs=4M count=256 oflag=direct
  dd if=/dev/zero of=./test-$$ bs=4M count=125  oflag=direct
  date

  rm -f test-$$
  umount /dev/$1
  rmdir  $MP
}|tee  hd-write.txt
