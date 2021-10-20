#!/bin/bash
sudo apt-get install binutils build-essential gfortran $@
sudo apt-get install liblapack-dev libfftw3-dev libatlas-dev libopenblas-dev $@
sudo apt-get install libopenmpi-dev mpich $@
sudo apt-get install dkms $@
sudo apt-get install tmux sysstat environment-modules bc parted smarttools hdparm net-tools iperf numactl ipmitool $@
sudo apt-get install libgl1-mesa-dev libglu1-mesa-dev freeglut3-dev libglew-dev libgl1-mesa-glx libxmu-dev
sudo apt-get install ubuntu-desktop
