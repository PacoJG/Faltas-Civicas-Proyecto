--@Autores: Jaime Garcia Frnacisco
--     	    Mora Magaña Jose David Divad
--@Fecha:   01/02/2021
--@Descripcion: Creacion de los tablespace para el proyecto

connect sys/systemproy as sysdba;

create tablespace comun_blob
    datafile '/u01/app/oracle/oradata/jamoproy/comun_blob01.dbf' size 100m, 
             '/disk_2/app/oracle/oradata/jamoproy/comun_blob02.dbf' size 100m, 
             '/disk_3/app/oracle/oradata/jamoproy/comun_blob03.dbf' size 100m
    autoextend on next 100m maxsize unlimited
    extent management local autoallocate
    segment space management auto
;

create tablespace tst_tramites
    datafile '/u01/app/oracle/oradata/jamoproy/TBS/tst_tramites.dbf' size 100m
    autoextend on next 100m maxsize unlimited
    extent management local autoallocate
    segment space management auto
;

create tablespace tsi_tramites
    datafile '/disk_3/app/oracle/oradata/jamoproy/TBS/tsi_tramites.dbf' size 100m
    autoextend on next 100m maxsize unlimited
    extent management local autoallocate
    segment space management auto
;

create tablespace tst_ciudadanos
    datafile '/disk_2/app/oracle/oradata/jamoproy/TBS/tst_ciudadanos.dbf' size 100m
    autoextend on next 100m maxsize unlimited
    extent management local autoallocate
    segment space management auto
;

create tablespace tsi_ciudadanos
    datafile '/disk_3/app/oracle/oradata/jamoproy/TBS/tsi_ciudadanos.dbf' size 100m
    autoextend on next 100m maxsize unlimited
    extent management local autoallocate
    segment space management auto
;