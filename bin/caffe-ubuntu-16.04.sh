#!/bin/bash
sudo apt-get install libprotobuf-dev libleveldb-dev libsnappy-dev libopencv-dev libhdf5-serial-dev protobuf-compiler $@
sudo apt-get install --no-install-recommends libboost-all-dev $@
sudo apt-get install libopenblas-dev libatlas-base-dev $@
sudo apt-get install python-numpy python-dev python-pip python-wheel $@
sudo apt-get install libgflags-dev libgoogle-glog-dev liblmdb-dev $@
