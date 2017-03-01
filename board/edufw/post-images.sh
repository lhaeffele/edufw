#!/bin/sh

. "$BR2_EXTERNAL_EDUFW_PATH/board/edufw/rootfs-overlay/etc/edufw/version"
touch "$BR2_EXTERNAL_EDUFW_PATH/iso/EDUFW_ISO-$EDUFW_VERSION"

cp "$BINARIES_DIR/bzImage" "$BR2_EXTERNAL_EDUFW_PATH/iso/bzImage"
cp "$BINARIES_DIR/rootfs.cpio.bz2" "$BR2_EXTERNAL_EDUFW_PATH/iso/initrd.bz2"
"$HOST_DIR/usr/bin/grub-mkrescue" -o "$BINARIES_DIR/edufw.iso" --volid EDUFW_ISO "$BR2_EXTERNAL_EDUFW_PATH/iso/"
