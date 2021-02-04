--@Autores: Jaime Garcia Frnacisco
--     	    Mora Magaña Jose David Divad
--@Fecha:   24/01/2021
--@Descripcion: Creacion de la Base de Datos con la instrucción
--              create database

connect sys/hola123* as sysdba;
startup nomount

whenever sqlerror exit rollback;

create database jamoproy
user sys identified by systemproy
user system identified by systemproy
logfile group 1 (
  '/u01/app/oracle/oradata/jamoproy/REDO_LOGS/redo01a.log',
  '/disk_2/app/oracle/oradata/jamoproy/REDO_LOGS/redo01b.log',
  '/disk_3/app/oracle/oradata/jamoproy/REDO_LOGS/redo01c.log') size 50m blocksize 512,
group 2 (
  '/u01/app/oracle/oradata/jamoproy/REDO_LOGS/redo02a.log',
  '/disk_2/app/oracle/oradata/jamoproy/REDO_LOGS/redo02b.log',
  '/disk_3/app/oracle/oradata/jamoproy/REDO_LOGS/redo02c.log') size 50m blocksize 512,
group 3 (
  '/u01/app/oracle/oradata/jamoproy/REDO_LOGS/redo03a.log',
  '/disk_2/app/oracle/oradata/jamoproy/REDO_LOGS/redo03b.log',
  '/disk_3/app/oracle/oradata/jamoproy/REDO_LOGSredo03c.log') size 50m blocksize 512
maxloghistory 1
maxlogfiles 16
maxlogmembers 3
maxdatafiles 1024
character set AL32UTF8
national character set AL16UTF16
extent management local
datafile '/u01/app/oracle/oradata/jamoproy/TBS/system01.dbf'
size 700m reuse autoextend on next 10240k maxsize unlimited
sysaux datafile '/u01/app/oracle/oradata/jamoproy/TBS/sysaux01.dbf'
size 550m reuse autoextend on next 10240k maxsize unlimited
default tablespace users
datafile '/u01/app/oracle/oradata/jamoproy/TBS/users01.dbf'
size 500m reuse autoextend on maxsize unlimited
default temporary tablespace tempts1
tempfile '/u01/app/oracle/oradata/jamoproy/TBS/temp01.dbf'
size 20m reuse autoextend on next 640k maxsize unlimited
undo tablespace undotbs1
datafile '/u01/app/oracle/oradata/jamoproy/TBS/undotbs01.dbf'
size 200m reuse autoextend on next 5120k maxsize unlimited
user_data tablespace usertbs
datafile '/u01/app/oracle/oradata/jamoproy/TBS/usertbs01.dbf'
size 200m reuse autoextend on maxsize unlimited;

alter user sys identified by systemproy;
alter user system identified by systemproy;

whenever sqlerror continue none;