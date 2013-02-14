#!/bin/sh

for dev in `ls /sys/bus/pci/devices/0000:$1/iommu_group/devices`; do
    echo $dev
    vendor=$(cat /sys/bus/pci/devices/$dev/vendor | sed 's/^0x//')
    device=$(cat /sys/bus/pci/devices/$dev/device | sed 's/^0x//')
    if [ -e /sys/bus/pci/devices/$dev/driver ]; then
        echo $dev > /sys/bus/pci/devices/$dev/driver/unbind
    fi
    echo $vendor $device > /sys/bus/pci/drivers/vfio-pci/new_id
    #echo $vendor $device > /sys/bus/pci/drivers/pci-stub/new_id
    #echo $dev > /sys/bus/pci/drivers/vfio-pci/bind
done

#dev1="0000:$1"
#vendor1=$(cat /sys/bus/pci/devices/$dev1/vendor | sed 's/^0x//')
#device1=$(cat /sys/bus/pci/devices/$dev1/device | sed 's/^0x//')
#if [ -e /sys/bus/pci/devices/$dev1/driver ]; then
#	echo $dev1 > /sys/bus/pci/devices/$dev/driver/unbind
#fi
#echo $vendor1 $device1 > /sys/bus/pci/drivers/vfio-pci/new_id
#echo $dev1 > /sys/bus/pci/drivers/vfio-pci/bind


