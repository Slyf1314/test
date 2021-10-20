#!/bin/bash
#N=`grep proces /proc/cpuinfo |tail -1|awk '{print $3}'`
N=`lscpu |grep NUMA|tail -1|awk -F- '{print $2}'`
  #cd singleCoreLpk
  ./geN-singleCore.sh
  #cd ../
for i in $(seq 0 $N)
do
{
  #cp -a singleCoreLpk test-$i
  mkdir test-$i
  cd test-$i
  cp ../{runme_xeon64,lininput_xeon64,xlinpack_xeon64} ./
  export OMP_NUM_THREADS=1
  taskset -c $i ./runme_xeon64 > /dev/null
  cp lin_xeon64.txt ../../test/lin_xeon64-$i.txt
}&
done
wait
