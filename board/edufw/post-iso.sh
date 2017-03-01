#!/bin/sh

cp "$BINARIES_DIR/bzImage" "$BR2_EXTERNAL_EDUFW_PATH/iso/bzImage"
cp "$BINARIES_DIR/rootfs.cpio.bz2" "$BR2_EXTERNAL_EDUFW_PATH/iso/initrd.bz2"
"$HOST_DIR/usr/bin/grub-mkrescue" -o "$BINARIES_DIR/edufw.iso" --volid EDUFW_ISO "$BR2_EXTERNAL_EDUFW_PATH/iso/"
