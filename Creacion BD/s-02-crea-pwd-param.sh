#!/bin/bash
# Autores: Jaime Garcia Frnacisco
#      	Mora Magaña Jose David Divad
# Fecha: 24/01/2021
# Descripcion: Script que crea el archivo de contraseñas y de parametros

export ORACLE_SID=jamoproy
pass_name="orapw${ORACLE_SID}"
pass_dir="${ORACLE_HOME}/dbs"
pfile_name="init${ORACLE_SID}.ora"

if [ -f "${pass_dir}/${pass_name}" ]; then
  #Si ya existe un respaldo lo elimina
  rm "${pass_dir}/${pass_name}"
fi

orapwd FILE="${pass_dir}"/"${pass_name}" FORCE=y FORMAT=12.2 SYS=password SYSBAKCUP=password

if [ -f "${pass_dir}/${pfile_name}" ]; then
  #Si ya existe un respaldo lo elimina
  rm "${pass_dir}/${pfile_name}"
fi

touch "${pass_dir}/${pfile_name}"

echo "db_name=${ORACLE_SID}" >> "${pass_dir}/${pfile_name}"

echo "control_files=(/u01/app/oracle/oradata/${ORACLE_SID}/control01.ctl," >> "${pass_dir}/${pfile_name}"
echo " /disk_2/app/oracle/oradata/${ORACLE_SID}/control02.ctl," >> "${pass_dir}/${pfile_name}"
echo " /disk_3/app/oracle/oradata/${ORACLE_SID}/control03.ctl)" >> "${pass_dir}/${pfile_name}"

echo "memory_target=1024M" >> "${pass_dir}/${pfile_name}"
