--@Autores: Jaime Garcia Frnacisco
--     	    Mora Magaña Jose David Divad
--@Fecha:   01/02/2021
--@Descripcion:  Habilitar la FRA

--Se crea la carpeta para FRA
!mkdir /u01/app/oracle/oradata/jamoproy/respaldo_fra

--Se modifica tamaño cuando se calculen los datos
alter system set db_recovery_file_dest_size=1700m scope=both;

--ruta destino
alter system set db_recovery_file_dest='/u01/app/oracle/oradata/jamoproy/respaldo_fra' scope=both;

--Periodo de retención de 1 día
alter system set db_flashback_retention_target=1440 scope=both;

--segunda copia de los ARCHIVELOG en la carpeta de la FRA
alter system set log_archive_dest_2='LOCATION=USE_DB_RECOVERY_FILE_DEST' scope=both;