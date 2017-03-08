edufw_sda1.image:
	dd if=/dev/zero of=edufw_sda1.image bs=1M count=200
test: ~/buildroot/output/images/edufw.iso edufw_sda1.image
	kvm -m size=256M -cdrom ~/buildroot/output/images/edufw.iso -drive file=edufw_sda1.image,format=raw -boot menu=on -net user -net nic -net nic
clean:
	rm edufw_sda1.image
