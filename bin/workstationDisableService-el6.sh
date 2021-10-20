#!/bin/bash
diservices="bluetooth cups libvirt-guests lvm2-monitor spice-vdagentd"
for iterm in  $diservices
do
  chkconfig --del $iterm
  echo $iterm
done
