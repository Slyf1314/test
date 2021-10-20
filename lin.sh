cd amd 
/bin/cp HPL.dat-64 HPL.dat
/opt/openmpi-4.0.4/bin/mpiexec --allow-run-as-root -n 64 ./xhpl
cd ..

#mprime 
cd mprime
./mprime -t
