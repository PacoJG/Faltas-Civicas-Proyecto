#!/bin/bash
# Autores: Jaime Garcia Frnacisco
#      	Mora Magaña Jose David Divad
# Fecha: 24/01/2021
# Descripcion: Creacion de los directorios para el funcionamient0.

mkdir -p /disk_2/app/oracle/oradata/jamoproy
mkdir -p /disk_2/app/oracle/oradata/jamoproy/REDO_LOGS
mkdir -p /disk_2/app/oracle/oradata/jamoproy/TBS

mkdir -p /disk_3/app/oracle/oradata/jamoproy
mkdir -p /disk_3/app/oracle/oradata/jamoproy/REDO_LOGS
mkdir -p /disk_3/app/oracle/oradata/jamoproy/TBS

chown -R oracle:oinstall /disk_2/*
chmod 754 /disk_2/app/oracle/oradata/jamoproy
chmod 754 /disk_2/app/oracle/oradata/jamoproy/REDO_LOGS
chmod 754 /disk_2/app/oracle/oradata/jamoproy/TBS

chown -R oracle:oinstall /disk_3/*
chmod 754 /disk_3/app/oracle/oradata/jamoproy
chmod 754 /disk_3/app/oracle/oradata/jamoproy/REDO_LOGS
chmod 754 /disk_3/app/oracle/oradata/jamoproy/TBS


cd /u01/app/oracle/oradata
mkdir -p jamoproy

mkdir -p jamoproy/REDO_LOGS
mkdir -p jamoproy/TBS

chown -R oracle:oinstall /u01/*

chmod 754 jamoproy
chmod 754 jamoproy/REDO_LOGS
chmod 754 jamoproy/TBS
