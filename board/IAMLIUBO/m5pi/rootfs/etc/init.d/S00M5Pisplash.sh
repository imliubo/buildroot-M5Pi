#!/bin/sh
#
# Start M5Pisplash....
#

start() {
    mount -t vfat /dev/mmcblk0p2 /mnt/
	fbv -d 1 /mnt/splash.png > /dev/null 2>&1
	echo 6 > /sys/class/backlight/backlight/brightness
	umount /mnt/
}

stop() {
    mount -t vfat /dev/mmcblk0p2 /mnt/
	fbv -d 1 /mnt/splash.png > /dev/null 2>&1
	echo 6 > /sys/class/backlight/backlight/brightness
	umount /mnt/
}

case "$1" in
    start)
    start
    ;;
    stop)
    stop
    ;;
  *)
    echo "Usage: $0 {start|stop}"
    exit 1
esac

exit $?
