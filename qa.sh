#!/bin/bash

read -p "Press any key if you are ready"

echo ---CPU Information---
which lscpu > /dev/null
if [ $? == 0 ];then
lscpu |sed -n '5p;7,9p;14p'
else
  cpu_model=`grep "model name" /proc/cpuinfo|uniq|gawk -F: '{print $2}'`
  number_of_threads=`grep processor /proc/cpuinfo|wc -l`
  number_of_cpus=`grep "physical id" /proc/cpuinfo|sort|uniq|wc -l`
  number_of_cores_per_cpu=`grep "cores" /proc/cpuinfo|sort|uniq -c|gawk '{print $5}'`
  number_of_threads_per_core=`echo $number_of_threads/$number_of_cpus/$number_of_cores_per_cpu|bc`
  echo CPU Model: $cpu_model
  echo CPUs: $number_of_cpus
  echo Cores Per CPU: $number_of_cores_per_cpu
  echo Threads Per Core: $number_of_threads_per_core
fi
  echo
read -p "Press any key if you are ready"

echo ---Memory Information---
free -m
echo
dmidecode -t 17|grep "Part Number"|sort|uniq -c
dmidecode -t 17|grep "Manufacturer"|sort|uniq -c
echo
read -p "Press any key if you are ready"

echo ---HDD or SSD Information---
parted -l|egrep "Model|Disk"
echo
read -p "Press any key if you are ready"

echo ---M/B Information---
dmidecode -t 2|egrep 'Manufacturer|Product'
echo
read -p "Press any key if you are ready"

echo ---Chassis and Power Supply Information---
dmidecode -t 39|egrep "Manufacture|Max"
echo
read -p "Press any key if you are ready"

echo ---NIC Information---
lspci |grep Ethernet
echo
read -p "Press any key if you are ready"

echo ---Graphic Card Information---
    nvsmi=$(which nvidia-smi)
    if [ "$nvsmi" != "" ]; then
    $nvsmi -a >test/nvsmi-a.txt
    $nvsmi
    fi
echo ---Completed---

