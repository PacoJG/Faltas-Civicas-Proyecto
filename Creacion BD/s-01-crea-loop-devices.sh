#!/bin/bash
# Autores: Jaime Garcia Frnacisco
#          Mora Magaña Jose David Divad
# Fecha: 24/01/2021
# Descripcion: Shell script que crea los loops device, los cuales simulan
#              discos.

#Crear carpeta
mkdir -p /unam-bda
cd /unam-bda

#crear archivos binarios que simularan a los discos
dd if=/dev/zero of=disk1.img bs=100M count=10
dd if=/dev/zero of=disk2.img bs=100M count=10

du -sh disk*.img
echo 'Se crearon los archivos correctamente'

#crear loop device
losetup -fP disk1.img
losetup -fP disk2.img
losetup -a

#Dar formato a los archivos para ser montados
mkfs.ext4 disk1.img
mkfs.ext4 disk2.img
mkdir -p /disk_1
mkdir -p /disk_2

mount -o loop /dev/loop0 /disk_1
mount -o loop /dev/loop1 /disk_2
