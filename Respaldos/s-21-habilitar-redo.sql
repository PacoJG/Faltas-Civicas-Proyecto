--@Autores: Jaime Garcia Frnacisco
--     	    Mora Magaña Jose David Divad
--@Fecha:   01/02/2021
--@Descripcion: Deshabilitar la generación de datos redo en la carga inicial

connect sys/systemproy as sysdba

alter tablespace tst_tramites logging;
alter tablespace tsi_tramites logging;
alter tablespace tst_ciudadanos logging;
alter tablespace tsi_ciudadanos logging;
alter tablespace comun_blob logging;