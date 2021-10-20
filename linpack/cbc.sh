#!/bin/bash

n=$1
N=`lscpu |sed -n '7,8p'|awk '{print $NF}'|tr '\n' '*'|sed s'/\*$//'|xargs echo|bc`
#N=$2
m=`echo $(((N-1)/n + 1))`
./geN-singleCore.sh
echo m: $m
echo n*m: $((n*m))

for ((j=0;j<$m;j++))
do
    for ((i=0;i<$n;i++))
    do
    {
        cpuid=`echo $((i*m+j))`
#        echo process_id: $process_id
        if [[ $cpuid -ge $N ]];then
            continue
        fi
    echo $cpuid
    mkdir test-$cpuid
    cd test-$cpuid
    cp ../{runme_xeon64,lininput_xeon64,xlinpack_xeon64} ./
#    cp ../xhpl ./
#    cp ../HPL.dat-1 ./HPL.dat
#    taskset -c $cpuid ./runme_xeon64 > /dev/null
    {
      date
      taskset -c $cpuid  ./xlinpack_xeon64 lininput_xeon64
      echo -n "Done: "
      date
    } > lin_xeon-$cpuid.txt

    cd ..

    }&
    done
    wait
done

