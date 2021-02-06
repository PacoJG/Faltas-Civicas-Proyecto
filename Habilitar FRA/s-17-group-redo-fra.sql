--@Autores: Jaime Garcia Frnacisco
--     	    Mora Magaña Jose David Divad
--@Fecha:   01/02/2021
--@Descripcion:  Genarar una copia del grupo 1 de los redo logs en la FRA

--Se crean carpetas para simular el multiplexeado que teniamos anterioemente
!mkdir /u01/app/oracle/oradata/jamoproy/respaldo_fra/u01
!mkdir /u01/app/oracle/oradata/jamoproy/respaldo_fra/disk_2
!mkdir /u01/app/oracle/oradata/jamoproy/respaldo_fra/disk_3

shutdown immediate
--Se copia el grupo 1 a su nueva ubicación
!mv /u01/app/oracle/oradata/jamoproy/REDO_LOGS/redo01a.log /u01/app/oracle/oradata/jamoproy/respaldo_fra/u01/redo01a.log
!mv /disk_2/app/oracle/oradata/jamoproy/REDO_LOGS/redo01b.log /u01/app/oracle/oradata/jamoproy/respaldo_fra/disk_2/redo01b.log
!mv /disk_3/app/oracle/oradata/jamoproy/REDO_LOGS/redo01c.log /u01/app/oracle/oradata/jamoproy/respaldo_fra/disk_3/redo01c.log

startup mount

alter database
rename file
'/u01/app/oracle/oradata/jamoproy/REDO_LOGS/redo01a.log',
'/disk_2/app/oracle/oradata/jamoproy/REDO_LOGS/redo01b.log',
'/disk_3/app/oracle/oradata/jamoproy/REDO_LOGS/redo01c.log'
to
'/u01/app/oracle/oradata/jamoproy/respaldo_fra/u01/redo01a.log',
'/u01/app/oracle/oradata/jamoproy/respaldo_fra/disk_2/redo01b.log',
'/u01/app/oracle/oradata/jamoproy/respaldo_fra/disk_3/redo01c.log';

alter database open;