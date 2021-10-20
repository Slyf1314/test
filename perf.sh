#!/bin/bash

bin/addXperm.sh

[ -d test ]|| mkdir test

#HDD or SSD
#    parted -l|grep "/dev/sd"|awk '{print $2}'|awk -F: '{print $1}'|awk -F/ '{print $3}'|tee /tmp/sdx.txt
#    for par in `more /tmp/sdx.txt`
    for d in ` parted -l|awk '/Disk \/dev/ {print $2}'`
    do
      hdparm -tT ${d//://} |tee test/hdparm-tT-${d//://}-$(date +%y%m%d).txt
    done
#    rm -f /tmp/sdx.txt

#Memory
    cd mlc-*/
    ./mlc |tee ../test/mlc.txt
    cd ../

#Linpack test
cd linpack
./geN.sh
./runme_xeon64
mv lin_*.txt ../test/

#./singleCoreLpk.sh
./cbc.sh 2
cd ../

#mprime 
cd mprime
./mprime -t
