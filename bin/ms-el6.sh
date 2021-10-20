yum --disablerepo=\* --enablerepo=c6-media install glibc.i686 libgcc.i686 libstdc++.i686 compat-libstdc++-33.i686 nss-softokn-freebl.i686 redhat-lsb.i686
yum --disablerepo=\* --enablerepo=c6-media install gcc-c++ openmpi openmpi-devel  fftw fftw-devel mpich mpich-3.2-devel  mpich-3.2-doc 
yum --disablerepo=\* --enablerepo=c6-media install kernel-devel 
yum --disablerepo=\* --enablerepo=c6-media install ipmitool 
yum --disablerepo=\* --enablerepo=c6-media install hdparm iperf
