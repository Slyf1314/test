#!/bin/bash
coresNum=`lscpu |grep NUMA|tail -1|awk -F- '{print $2}'`
#total mem
mem=`grep MemTotal /proc/meminfo |awk '{print $2}'`
#mem=32000000
memAve=`echo $mem/$coresNum*0.5|bc`
Mmin=`echo $memAve*0.8|bc`
Mmax=`echo $memAve*0.9|bc`
#n^2*8=mem*0.8
Nmin=`echo sqrt\($Mmin*1024/8\)|bc`
Nmax=`echo sqrt\($Mmax*1024/8\)|bc`
Ndiff=`echo $Nmax-$Nmin|bc`
for i in 128 256 512 1024 2048 4096
do
 # echo $i
  if [ "$Ndiff" -ge "$i" ];then
  Nstep=$i
  fi
  if [ "$Ndiff" -le "$i" ];then
  break
  fi
done
N=`echo $Nmax/$Nstep|bc`
Ntimes=2
for ((j=1;j<=Ntimes;j++))
do
  n=$[N*Nstep]
  echo $n>>n.txt
  N=$[N-1]
done
Nlists=`cat n.txt|tr '\n' ' '`
#echo $Nlists
sed -i "4s/^.*/$Nlists/" lininput_xeon64
rm -rf n.txt
