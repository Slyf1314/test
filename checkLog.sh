#!/bin/bash
dmesg |egrep --color -i 'error|warn|trace|fail' 
read -p "Press ENTER to continue..."
egrep --color -i 'error|warn|trace|fail' /var/log/messages
