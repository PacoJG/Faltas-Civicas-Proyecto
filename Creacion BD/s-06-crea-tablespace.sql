--@Autores: Jaime Garcia Frnacisco
--     	    Mora Magaña Jose David Divad
--@Fecha:   01/02/2021
--@Descripcion: Creacion de los tablespace para el proyecto

connect sys/systemproy as sysdba;

create tablespace comun_blob
    datafile '/u01/app/oracle/oradata/jamoproy/comun_blob_01.dbf' size 100m,
             '/u01/app/oracle/oradata/jamoproy/comun_blob_02.dbf' size 100m
    autoextend on next 100m maxsize unlimited
    extent management local autoallocate
    segment space management auto
;

create bigfile tablespace tst_tramites
    datafile '/disk_2/app/oracle/oradata/jamoproy/TBS/tst_tramites_01.dbf' size 300m,
             '/disk_2/app/oracle/oradata/jamoproy/TBS/tst_tramites_02.dbf' size 300m
    autoextend on next 100m maxsize unlimited
    extent management local autoallocate
    segment space management auto
;

create tablespace tsi_tramites
    datafile '/u01/app/oracle/oradata/jamoproy/TBS/tsi_tramites_01.dbf' size 100m,
             '/u01/app/oracle/oradata/jamoproy/TBS/tsi_tramites_02.dbf' size 100m
    autoextend on next 1280k maxsize unlimited
    extent management local autoallocate
    segment space management auto
;

create bigfile tablespace tst_ciudadanos
    datafile '/disk_3/app/oracle/oradata/jamoproy/TBS/tst_ciudadanos_01.dbf' size 300m,
             '/disk_3/app/oracle/oradata/jamoproy/TBS/tst_ciudadanos_02.dbf' size 300m
    autoextend on next 100m maxsize unlimited
    encryption using 'aes256' encrypt
    extent management local autoallocate
    segment space management auto
;

create tablespace tsi_ciudadanos
    datafile '/u01/app/oracle/oradata/jamoproy/TBS/tsi_ciudadanos_01.dbf' size 100m,
             '/u01/app/oracle/oradata/jamoproy/TBS/tsi_ciudadanos_02.dbf' size 100m
    autoextend on next 1280k maxsize unlimited
    extent management local autoallocate
    segment space management auto
;