#!/bin/bash
# Autores: Jaime Garcia Frnacisco
#      	Mora Magaña Jose David Divad
# Fecha: 24/01/2021
# Descripcion: Creacion de los directorios.

mkdir -p /disk_4/app/oracle/oradata/jamoproy
mkdir -p /disk_5/app/oracle/oradata/jamoproy

chown -R oracle:oinstall /disk_4/*
chmod 754 /disk_4/app/oracle/oradata/jamoproy

chown -R oracle:oinstall /disk_5/*
chmod 754 /disk_5/app/oracle/oradata/jamoproy

cd /u01/app/oracle/oradata
mkdir -p jamoproy
chown -R oracle:oinstall /u01/*
chmod 754 jamoproy
