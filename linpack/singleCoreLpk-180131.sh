#!/bin/bash
N=`grep proces /proc/cpuinfo |tail -1|awk '{print $3}'`
for i in $(seq 0 $N)
do
{
  cp -a test test-$i
  cd test-$i
  export OMP_NUM_THREADS=1
  #taskset -c $i ./runme_xeon64
  cp lin_xeon64.txt ../lin_xeon64-$i.txt
}&
done
wait
