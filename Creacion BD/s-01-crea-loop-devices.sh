#!/bin/bash
# Autores: Jaime Garcia Frnacisco
#          Mora Magaña Jose David Divad
# Fecha: 24/01/2021
# Descripcion: Shell script que crea los loops device, los cuales simulan
#              discos.

mkdir -p /proyecto-bda
cd /proyecto-bda

#crear archivos binarios que simularan a los discos
dd if=/dev/zero of=disk_2.img bs=200M count=10
dd if=/dev/zero of=disk_3.img bs=200M count=10

du -sh disk*.img
echo 'Se crearon los archivos correctamente'

#crear loop device
losetup -fP disk_2.img
losetup -fP disk_3.img
losetup -a

#Dar formato a los archivos para ser montados
mkfs.ext4 disk_2.img
mkfs.ext4 disk_3.img

mkdir -p /disk_2
mkdir -p /disk_3

mount -o loop /dev/loop0 /disk_2
mount -o loop /dev/loop1 /disk_3
