#!/bin/bash
# Autores: Jaime Garcia Frnacisco
#          Mora Magaña Jose David Divad
# Fecha: 24/01/2021
# Descripcion: Shell script que las carpetas para el modo archive

mkdir -p /disk_2/app/oracle/oradata/jamoproy/archivelogs
mkdir -p /disk_2/app/oracle/oradata/jamoproy/archivelogs/disk_a
cd /disk_2/app/oracle/oradata/jamoproy
chown -R oracle:oinstall archivelogs
chmod -R 750 archivelogs


mkdir -p /u01/app/oracle/oradata/jamoproy/respaldo_fra/archivelogs
mkdir -p /u01/app/oracle/oradata/jamoproy/respaldo_fra/archivelogs/disk_b

cd /u01/app/oracle/oradata/jamoproy/respaldo_fra
chown -R oracle:oinstall archivelogs
chmod -R 750 archivelogs