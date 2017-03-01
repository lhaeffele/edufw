all: edufw.iso
iso/bzImage: ~/buildroot/output/images/bzImage
	cp ~/buildroot/output/images/bzImage iso/bzImage
iso/initrd.bz2: ~/buildroot/output/images/rootfs.cpio.bz2
	cp ~/buildroot/output/images/rootfs.cpio.bz2 iso/initrd.bz2
edufw.iso: iso/boot/grub/grub.cfg iso/bzImage iso/initrd.bz2 board/edufw/rootfs-overlay/etc/edufw/version
	board/edufw/pre-iso.sh
	grub-mkrescue -o edufw.iso --product-name=EDUFW --product-version=0.1 -- -volid EDUFW_ISO iso
test:
	kvm -m size=256M -cdrom edufw.iso -drive file=edufw_sda1.image,format=raw -boot menu=on
clean:
	rm edufw.iso
