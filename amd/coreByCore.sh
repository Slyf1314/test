#!/bin/bash
for i in $(seq 0 31)
do
    echo $i

    mkdir test-$i
    cp xhpl HPL.dat test-$i
    cd test-$i 
    echo \t $i
    /opt/openmpi-4.0.4/bin/mpiexec --cpu-set $i --allow-run-as-root -n 1 ./xhpl &
    cd ..

    mkdir test-$((i+32))
    cp xhpl HPL.dat test-$((i+32))
    cd test-$((i+32)) 
    echo \t $((i+32))
    /opt/openmpi-4.0.4/bin/mpiexec --cpu-set $((i+32)) --allow-run-as-root -n 1 ./xhpl &
    cd ..

    mkdir test-$((i+64))
    cp xhpl HPL.dat test-$((i+64))
    cd test-$((i+64)) 
    echo \t $((i+64))
    /opt/openmpi-4.0.4/bin/mpiexec --cpu-set $((i+64)) --allow-run-as-root -n 1 ./xhpl &
    cd ..

    mkdir test-$((i+96))
    cp xhpl HPL.dat test-$((i+96))
    cd test-$((i+96)) 
    echo \t $((i+96))
    /opt/openmpi-4.0.4/bin/mpiexec --cpu-set $((i+96)) --allow-run-as-root -n 1 ./xhpl 
    cd ..
wait
done
