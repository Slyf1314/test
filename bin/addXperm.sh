#!/bin/bash
chmod +x *.sh
chmod +x mprime/mprime mprime/*.sh
chmod +x mlc-*/mlc*
chmod +x bin/*.sh
cd linpack
chmod +x *.sh runme_xeon64 xlinpack_xeon64 
cd singleCoreLpk
chmod +x runme_xeon64 xlinpack_xeon64 *.sh
cd ../..
