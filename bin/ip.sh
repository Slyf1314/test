sed -i -e '/ONBOOT/s/no/yes/' -e '/IPV6/d'  -e '/BOOTPROTO/s/dhcp/static/' -e '/BOOTPROTO/aIPADDR=10.1.1.1' -e '/BOOTPROTO/aNETMASK=255.255.255.0' /etc/sysconfig/network-scripts/ifcfg-eno1
sed -i -e /ONBOOT/s/no/yes/ -e /IPV6/d /etc/sysconfig/network-scripts/ifcfg-eno2
