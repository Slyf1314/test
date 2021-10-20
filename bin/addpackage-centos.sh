#!/bin/bash

# Prepare for the local yum repositiry
[ -d /media/CentOS ] || mkdir /media/CentOS
sed -i '/^        file/s/^/#/' /etc/yum.repos.d/CentOS-Media.repo
[ -f /root/CentOS-*.iso ] && mount -o loop ~/CentOS-*.iso /media/CentOS || { echo "Please copy CentOS iso file first"; exit 1; }

#Virtual machine related
yum remove libvirt-* qemu-kmv qemu-kvm-common qemu-guest-agent ipxe-roms-qemu qemu-img open-vm-tools open-vm-tools-desktop spice-vdagent $@

#Libs for MS
yum --disablerepo=\* --enablerepo=c7-media install glibc.i686 libgcc.i686 libstdc++.i686 compat-libstdc++-33.i686 nss-softokn-freebl.i686 redhat-lsb.i686 $@

#Some math libs
yum --disablerepo=\* --enablerepo=c7-media install gcc-c++ openmpi openmpi-devel lapack atlas fftw fftw-devel  mpich-3.2-devel  mpich-3.2-doc  $@

#kernel-devel
yum --disablerepo=\* --enablerepo=c7-media install kernel-devel  $@

#hdd and net tools
yum --disablerepo=\* --enablerepo=c7-media install hdparm smartmontools net-tools iperf3 ipmitool $@
rpm -ivh rpms/ntfs-3g-2017.3.23-11.el7.x86_64.rpm 

#tmux
yum --disablerepo=\* --enablerepo=c7-media install tmux $@
