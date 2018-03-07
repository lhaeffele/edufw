#!/bin/bash


mkdir -p "$BINARIES_DIR/rpi-firmware"
cd "$BINARIES_DIR/rpi-firmware"

#for f in bootcode.bin start.elf fixup.dat; do
#  wget -O "$f" "https://raw.githubusercontent.com/raspberrypi/firmware/master/boot/$f"
#done
#

cp "$BINARIES_DIR/zImage" kernel.img
cp "$BINARIES_DIR/bcm2710-rpi-3-b.dtb" .
cp "$BINARIES_DIR/bcm2710-rpi-cm3.dtb" .
#cp "$BINARIES_DIR/rootfs.tar.gz" initrd.gz

cat >cmdline.txt <<_END_
dwc_otg.lpm_enable=0 console=ttyAMA0,115200 console=tty1 elevator=deadline
_END_

cat >config.txt <<_END_
kernel kernel.img
dtoverlay=pi3-miniuart-bt
_END_
