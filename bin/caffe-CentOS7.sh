#!/bin/bash
yum install protobuf-devel leveldb-devel snappy-devel opencv-devel boost-devel hdf5-devel
yum install gflags-devel glog-devel lmdb-devel
yum install atlas-devel

## glog
#wget https://storage.googleapis.com/google-code-archive-downloads/v2/code.google.com/google-glog/glog-0.3.3.tar.gz
#tar zxvf glog-0.3.3.tar.gz
#cd glog-0.3.3
#./configure
#make && make install
## gflags
#wget https://github.com/schuhschuh/gflags/archive/master.zip
#unzip master.zip
#cd gflags-master
#mkdir build && cd build
#export CXXFLAGS="-fPIC" && cmake .. && make VERBOSE=1
#make && make install
## lmdb
#git clone https://github.com/LMDB/lmdb
#cd lmdb/libraries/liblmdb
#make && make install

