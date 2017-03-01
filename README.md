# edufw
Easy Deployment Unusual FireWall

The goal of this project is to create a firewall that is easy to install, to upgrade with a centralized management.
The unusual part is that apart from the first installation, everything will be done from the edufw-server and nothing locally.
edufw is built with buildroot

## Installation
To install edufw :
- download the iso image
- burn it on a cdrom or write it on a usb stick with dd ("dd if=edifw-version.iso of=/dev/sdb" on linux). Be carefull with this part to avoid destroying a disk of your computer instead of the usb stick
- boot the firewall on this image
- once booted, login as root with password "edufw-123456"
- run the edufw_initdisk command to destroy all data on the disk and install edufw
- unplug the usb stick from the firewall or eject the cdrom
- run the reboot command to reboot from the disk of your firewall
- initialize network with the edufw_initnet command
- connect to the edufw-server with edufw_enroll command
Everything else will be done from the edufw-server ...

## Rebuild an image
To rebuild an image from edufw
- download this project
- download buildroot from https://buildroot.org/download.html and install it anywhere
- in the buildroot main directory, start these commands :

    make defconfig BR2_EXTERNAL=<YOUR_EDUFW_REPOSITORY> BR2_DEFCONFIG=<YOUR_EDUFW_REPOSITORY>/configs/edufw_defconfig
    make grub-tools-rebuild
    make
