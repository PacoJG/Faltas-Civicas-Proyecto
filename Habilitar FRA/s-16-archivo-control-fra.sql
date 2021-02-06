--@Autores: Jaime Garcia Frnacisco
--     	    Mora Magaña Jose David Divad
--@Fecha:   01/02/2021
--@Descripcion:  Genarar una copia del archivo de control en la FRA

!mkdir -p /u01/app/oracle/oradata/jamoproy/respaldo_fra/controlfile


create pfile from spfile;

shutdown immediate

--Mover una copia de un archivo de control a la ubicación de la fra
!mv /u01/app/oracle/oradata/jamoproy/control01.ctl /u01/app/oracle/oradata/jamoproy/respaldo_fra/controlfile/control01.ctl

startup nomount;

alter system set control_files ='/u01/app/oracle/oradata/jamoproy/respaldo_fra/controlfile/control01.ctl',
'/disk_2/app/oracle/oradata/jamoproy/control02.ctl',
'/disk_3/app/oracle/oradata/jamoproy/control03.ctl' scope=spfile;

shutdown immediate

startup