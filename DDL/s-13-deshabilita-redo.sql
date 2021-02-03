--@Autores: Jaime Garcia Frnacisco
--     	    Mora Magaña Jose David Divad
--@Fecha:   01/02/2021
--@Descripcion: Deshabilitar la generación de datos redo en la carga inicial

connect sys/systemproy as sysdba

alter tablespace tst_tramites nologging;
alter tablespace tsi_tramites nologging;
alter tablespace tst_ciudadanos nologging;
alter tablespace tsi_ciudadanos nologging;
alter tablespace comun_blob nologging;