#!/bin/sh

rm -f "$BR2_EXTERNAL_EDUFW_PATH/iso/EDUFW_ISO-"*
. "$BR2_EXTERNAL_EDUFW_PATH/board/edufw/rootfs-overlay/etc/edufw/version"
touch "$BR2_EXTERNAL_EDUFW_PATH/iso/EDUFW_ISO-$EDUFW_VERSION"

mkdir -p "$BR2_EXTERNAL_EDUFW_PATH/iso/boot/grub/"
cat >"$BR2_EXTERNAL_EDUFW_PATH/iso/boot/grub/grub.cfg" <<_END_
set timeout=10
set default="0"
set serial --speed=9600 --unit=0 --word=8 --parity=no --stop=1

menuentry "EduFW $EDUFW_VERSION from ISO" {
    search --set=root --label EDUFW_ISO --hint hd0,msdos5
    linux /bzImage
    initrd /initrd.bz2
}

_END_

if [ -L "$TARGET_DIR/var/log" ]; then
    rm "$TARGET_DIR/var/log"
    mkdir "$TARGET_DIR/var/log"
fi

cp "$BINARIES_DIR/bzImage" "$BR2_EXTERNAL_EDUFW_PATH/iso/bzImage"
cp "$BINARIES_DIR/rootfs.cpio.bz2" "$BR2_EXTERNAL_EDUFW_PATH/iso/initrd.bz2"
"$HOST_DIR/usr/bin/grub-mkrescue" -o "$BINARIES_DIR/edufw.iso" --volid EDUFW_ISO "$BR2_EXTERNAL_EDUFW_PATH/iso/"
