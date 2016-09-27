#!/bin/sh

UUID="-U aeaddead-dead-dead-dead-deaddeaddead"

USERBOOT="./userboot.so"
BOOTVOLUME="fbsd.img"
KERNELENV=""

MEM="-m 2G"
SMP="-c 2"
PCI_DEV="-s 0:0,hostbridge -s 31,lpc"
NET="-s 2:0,virtio-net"
IMG_HDD="-s 4:0,virtio-blk,$BOOTVOLUME"
LPC_DEV="-l com1,stdio"
ACPI="-A"

xhyve $ACPI $MEM $SMP $PCI_DEV $LPC_DEV $NET $IMG_HDD $UUID -f fbsd,$USERBOOT,$BOOTVOLUME,"$KERNELENV"

