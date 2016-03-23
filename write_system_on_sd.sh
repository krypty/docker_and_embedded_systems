#!/bin/bash

#Warning: please replace sdc by the location of your sd card
# Please review this script before use it. It can harm your system :-)

sudo dd if=/dev/zero of=/dev/sdc bs=4k count=32768
sudo parted /dev/sdc mklabel msdos
sudo parted /dev/sdc mkpart primary ext4 131072s 2228223s
sudo parted /dev/sdc mkpart primary ext4 2228224s 4325375s
sudo mkfs.ext4 /dev/sdc2 -L usrfs
#sudo mkfs.ext4 /dev/sdc1 -L rootfs
sync
sudo dd if=/tftpboot/xu3-bl1.bin of=/dev/sdc bs=512 seek=1
sudo dd if=/tftpboot/xu3-bl2.bin of=/dev/sdc bs=512 seek=31
sudo dd if=/tftpboot/xu3-tzsw.bin of=/dev/sdc bs=512 seek=2111
sudo dd if=/tftpboot/xu3-u-boot.bin of=/dev/sdc bs=512 seek=63
sudo dd if=/tftpboot/xu3-uImage of=/dev/sdc bs=512 seek=6304
sudo dd if=/tftpboot/exynos5422-odroidxu3.dtb of=/dev/sdc bs=512 seek=22688
sudo dd if=/tftpboot/xu3-rootfs.ext4 of=/dev/sdc1
sync
sudo resize2fs /dev/sdc1
