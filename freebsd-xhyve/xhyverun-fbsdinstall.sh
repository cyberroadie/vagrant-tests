#!/bin/sh

UUID="-U aaaddead-dead-dead-dead-deaddeaddead"

USERBOOT="./userboot.so"
BOOTVOLUME="mfsbsd-se-10.3-RELEASE-amd64.iso"
IMG="fbsd.img"
KERNELENV=""

MEM="-m 2G"
SMP="-c 2"
PCI_DEV="-s 0:0,hostbridge -s 31,lpc"
NET="-s 2:0,virtio-net"
IMG_CD="-s 3:0,ahci-cd,mfsbsd-se-10.3-RELEASE-amd64.iso"
IMG_HDD="-s 4:0,virtio-blk,$IMG"
LPC_DEV="-l com1,stdio"
ACPI="-A"

xhyve $ACPI $MEM $SMP $PCI_DEV $LPC_DEV $NET $IMG_CD $IMG_HDD $UUID -f fbsd,$USERBOOT,$BOOTVOLUME,"$KERNELENV"

