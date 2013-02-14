#!/bin/sh

APPEND=''

for arg in $@
do
        APPEND="$APPEND -device vfio-pci,host=$arg"
done


/usr/local/bin/qemu-system-x86_64 -uuid f106add0-5440-0130-4f4c-003018a7f71e -name Elastix -m 768 -vnc :1 -k it -pidfile /var/run/onboard/qemu-f106add0.pid -monitor unix:/var/run/onboard/qemu-f106add0.sock,server,nowait -smp 2 -drive serial=QMF106ADD000,if=virtio,file=/home/onboard/files/QEMU/Elastix/disk0.qcow2,media=disk,cache=unsafe,index=0 -drive serial=QMF106ADD001,if=ide,media=cdrom,bus=1,unit=0 -net nic,vlan=0,macaddr=DE:AD:BE:12:FE:41,model=rtl8139 -net tap,vlan=0,ifname=vElastix_0,script=no,downscript=no -boot menu=on,order=dc -cpu host -usbdevice tablet -enable-kvm -runas onboard -S $APPEND
