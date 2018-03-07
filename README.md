# edufw
Easy Deployment Unusual FireWall

The goal of this project is to create a firewall that is easy to install, to upgrade with a centralized management.
The unusual part is that apart from the first installation, everything will be done from the edufw-server and nothing locally.

Edufw is built with buildroot.

## Test
You can test this software using grub or any other virtualisation system.
On linux, the command is 
  truncate -s 512M edufw_sda1.image
  qemu-system-i386 edufw_sda1.image -m 256 -cdrom $ISO_IMAGE -boot order=dc

## Installation
To install edufw:
- download the iso image
- burn it on a cdrom or write it on a usb stick with dd ("dd if=edifw-version.iso of=/dev/sdb" on linux). Be carefull with this part to avoid destroying a disk of your computer instead of the usb stick
- boot the firewall on this image
- once booted, login as root with password "edufw1234"
- run the "`edufw_initdisk`" command to destroy all data on the disk and install edufw
- unplug the usb stick from the firewall or eject the cdrom
- run the reboot command to reboot from the disk of your firewall
- initialize network with the "`edufw_initnet`" command
- connect to the edufw-server with "`edufw_enroll`" command
Everything else will be done from the edufw-server ...

## Upgrading
Edufw upgrades should be done via edufw-server.

If your really need to upgrade it manually:
- download the iso file of the new version of edufw on the firewall (via wget or an usb stick)
- run the "`edufw_installimage <ISOFILE>`" command

## Rebuild an image
To rebuild an image from edufw:
- download this project
- download buildroot from https://buildroot.org/download.html and install it anywhere
- in the buildroot main directory, start these commands :
```
EDUFW_PATH=<PATH_TO_EDUFW_REPOSITORY>
make defconfig BR2_EXTERNAL=$EDUFW_PATH BR2_DEFCONFIG=$EDUFW_PATH/configs/edufw_rpi3_defconfig
make UCLIBC_CONFIG_FILE=$EDUFW_PATH/board/edufw/uclibc.config
```
Be careful ... the first compilation can be very long (about 1 hour and 40 minutes on my laptop).

The iso image will be built in output/images/ in this buildroot main directory

## Roadmap
- Version 0.1: boot and install on harddrive
- Version 0.2: use a local configuration file for simple IP config, syslog, dhcp server and simple IPv4 firewalling rules
- Version 0.3: use the edufw-server (enroll + update firmware)
- Version 0.4: allow more complicated IP configurations
- Version 0.5: simple http proxy
- Version 0.6: proxy with url filtering
- Version 0.7: implement snmp
- Version 1.0: use the edufw-server for all config parameters
- Version 1.1: allow IPv6 firewalling rules

## Configuration
