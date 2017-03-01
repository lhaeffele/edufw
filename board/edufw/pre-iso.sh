#!/bin/sh

. $(dirname $0)/rootfs-overlay/etc/edufw/version
touch "iso/EDUFW_ISO-$EDUFW_VERSION"
