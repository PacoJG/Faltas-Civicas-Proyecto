--@Autores: Jaime Garcia Frnacisco
--     	    Mora Magaña Jose David Divad
--@Fecha:   01/02/2021
--@Descripcion: Script que generá una configuración en modo compartido

create spfile from pfile;
alter system set db_domain='fi.unam' scope=spfile;
alter system set dispatchers='(dispatchers=3)(protocol=tcp)' scope=spfile;
alter system set shared_servers=20 scope=spfile;

--Actualizar la configuración en el listener
alter system register;

--Lista de servicios registrados en el listener
!lsnrctl services

Prompt Reiniciar instancia para ver cambios reflejados