#!/bin/bash
#get average linpack performance of a core
grep -A 2 Ave $*|grep -v Ave|grep -ve '--' |awk '{sum+=$4}END{print sum/NR}'
grep -A 2 Ave $*|grep -v Ave|grep -ve '--' |sort -k 4|sed -n '1p;$p'
