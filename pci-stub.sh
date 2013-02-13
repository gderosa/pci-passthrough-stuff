dev="0000:$1"
vendor=$(cat /sys/bus/pci/devices/$dev/vendor | sed 's/^0x//')
device=$(cat /sys/bus/pci/devices/$dev/device | sed 's/^0x//')
if [ -e /sys/bus/pci/devices/$dev/driver ]; then
	echo $dev > /sys/bus/pci/devices/$dev/driver/unbind
fi
echo "$vendor $device" > /sys/bus/pci/drivers/pci-stub/new_id
echo $dev > /sys/bus/pci/drivers/pci-stub/bind

