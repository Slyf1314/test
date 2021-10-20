#!/bin/bash
SVCS="cups.path  bluetooth.service  cups.service  dmraid-activation.service  iscsi.service  lvm2-monitor.service  ModemManager.service  multipathd.service  Cups.socket  dm-event.socket  iscsid.socket  iscsiuio.socket  lvm2-lvmetad.socket  lvm2-lvmpolld.socket  nfs-client.target  remote-fs.target"

function disablesvc()
{
# echo "Stoping/Disablingservice $SVC"
if systemctl -t service |grep runn |grep $SVC; then systemctl stop $SVC ;  fi
if systemctl list-unit-files --type service |grep enabled |grep $SVC; then systemctl disable $SVC; fi
}
LINUXVER=$(cat /etc/*release |tail -n 1 |awk '{ print $(NF - 1) }')
LINUXVER_MINOR=$(echo $LINUXVER |awk -F"." '{ print $NF}' )
LINUXVER=$(echo $LINUXVER |awk -F"." '{ print $1}' )
if [ $LINUXVER -eq 7 ]; then
for SVC in $SVCS
do
disablesvc $SVC
done
else
echo "Only works for Linux CentOS/RedHat 7"
fi
echo -e "\nDONE"
