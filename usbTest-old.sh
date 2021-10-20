{
lsusb
mount /dev/$1 /media
tmpFile=/media/tmp-xxx
date
dd if=/dev/zero of=$tmpFile bs=4M count=256 oflag=direct
date
rm -f $tmpFile
umount /dev/$1
}|tee -a usbTest.txt
