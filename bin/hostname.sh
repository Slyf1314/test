#!/bin/bash
# Define default hostname
hn=finestation

echo -e "Please select hostname:\n '1' for finestation\n '2' for fineserver\n or input the hostname directly: "
read -t 20   hn
#echo "\n You select $hn"
[ $? -ne 0 ] && let hn=1

case $hn in
    1)
        hostnamectl set-hostname finestation
        ;;
    2)
        hostnamectl set-hostname fineserver
        ;;
    *)
        hostnamectl set-hostname $hn
        ;;
esac

echo
echo "Hostname: $(hostname)"
