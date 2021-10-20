#!/bin/bash

# set time zone and system time
timedatectl set-timezone Asia/Shanghai
timedatectl set-local-rtc 1

systemctl start chronyd
#chronyc makestep
sleep 15
systemctl stop chronyd
hwclock -w

# sync system time to  bmc
dt=`date "+%m/%d/%Y %T"`
ipmitool sel time set "$dt"
