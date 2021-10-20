#!/bin/bash

n=$1
N=`lscpu |sed -n '7,8p'|awk '{print $NF}'|tr '\n' '*'|sed s'/\*$//'|xargs echo|bc`
#N=$2
m=`echo $(((N-1)/n + 1))`

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
    cp ../xhpl ./
    cp ../HPL.dat-1 ./HPL.dat
    /opt/openmpi-4.0.4/bin/mpiexec --cpu-set $cpuid --allow-run-as-root -n 1 ./xhpl
    cd ..

    }&
    done
    wait
done

