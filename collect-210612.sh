#!/bin/bash

# Prepare directories
DIR=~/test-$(date +%y%m%d)
SYSINFO=$DIR/sysinfo
LOG=$DIR/log
TEST=$DIR/test
[ -d $DIR ]|| mkdir $DIR
[ -d $SYSINFO ]|| mkdir $SYSINFO
[ -d  $LOG ]|| mkdir $LOG
[ -d $TEST ]|| mkdir $TEST

#System config 
SYSFILES="/boot/grub/grub.cfg /etc/fstab"
cp $SYSFILES $SYSINFO/

#System log
tar czf $LOG/var-log-$(date +%y%m%d).tgz /var/log
#rm -f /var/log/messages*
dmesg |egrep -i 'error|warn'
dmesg > $LOG/dmesg-$(date +%y%m%d).txt

#System information
dmidecode > $SYSINFO/dmidecode-$(date +%y%m%d).txt
lspci -v > $SYSINFO/lspci-v.txt

#ipmi infomation
IPMITOOL=$(which ipmitool)
if [ $IPMITOOL != "" ];then
  $IPMITOOL sel list > $LOG/ipmi-sel.txt
  $IPMITOOL fru |tee $SYSINFO/ipmi-fru.txt
  $IPMITOOL sdr |tee $LOG/ipmi-sdr.txt
  $IPMITOOL lan print > $SYSINFO/ipmi-lan.txt
fi
#CPU 
    lscpu |tee $SYSINFO/lscpu-$(date +%y%m%d).txt
    cp /proc/cpuinfo $SYSINFO/cpuinfo-$(date +%y%m%d).txt
#Memory
    cp /proc/meminfo $SYSINFO/meminfo-$(date +%y%m%d).txt
    free -m |tee $SYSINFO/free-m-$(date +%y%m%d).txt
    #bin/mlc |tee $TEST/mlc.txt
#HDD or SSD
##    df -h |tee $SYSINFO/df-h-$(date +%y%m%d).txt
##    parted -l|grep "/dev/sd"|awk '{print $2}'|awk -F: '{print $1}'|awk -F/ '{print $3}'|tee /tmp/sdx.txt
##    parted -l |tee $SYSINFO/parted-l-$(date +%y%m%d).txt
##    for par in `more /tmp/sdx.txt`
##    do
##    hdparm -tT /dev/${par} |tee $TEST/hdparm-tT-${par}-$(date +%y%m%d).txt
##    done
##    rm -f /tmp/sdx.txt
    {
	lsblk
	blkid
	parted -l
        df -h
    }|tee $SYSINFO/partition.txt
#Network interface cards
    ifconfig -a |tee $SYSINFO/ifconfig-a-$(date +%y%m%d).txt
#Graphic cards
    nvsmi=$(which nvidia-smi) > /dev/null 2&>1
    if [ "$nvsmi" != "" ]; then
    $nvsmi -a >$SYSINFO/nvsmi-a.txt
    $nvsmi
    fi
#performance test results files
###mv mprime/{results.txt,local.txt} linpack/lin_xeon64* mlc-*/mlc*.txt/$TEST/
mv mprime/{results.txt,local.txt}  $TEST/
mv  test/* $TEST/
rmdir test
