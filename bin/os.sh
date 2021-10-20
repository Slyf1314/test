#!/bin/bash
lsb_release -a|egrep 'Distributor ID|Release'|awk  '{print $NF}'
