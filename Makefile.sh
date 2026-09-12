KERNEL=kernel8
make bcm2711_defconfig

nano .config

make -j6 Image.gz modules dtbs
make -j6 modules_install

cp /boot/$KERNEL.img /boot/$KERNEL-backup.img

cp arch/arm64/boot/Image.gz /boot/$KERNEL.img
cp arch/arm64/boot/dts/broadcom/*.dtb /boot/
cp arch/arm64/boot/dts/overlays/*.dtb* /boot/overlays/
cp arch/arm64/boot/dts/overlays/README /boot/overlays/