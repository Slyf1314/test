#!/bin/bash
###rocks run host "mkdir test"
bin/addXperm.sh
[ -d test ]|| mkdir test
#HDD or SSD
    parted -l|grep "/dev/sd"|awk '{print $2}'|awk -F: '{print $1}'|awk -F/ '{print $3}'|tee /tmp/sdx.txt
    for par in `more /tmp/sdx.txt`
    do
      hdparm -tT /dev/${par} |tee test/hdparm-tT-${par}-$(date +%y%m%d).txt
    done
    rm -f /tmp/sdx.txt
#Memory
    cd mlc-*/
    ./mlc |tee ../test/mlc-$(date +%y%m%d).txt
    cd ../
