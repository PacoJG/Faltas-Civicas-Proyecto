--@Autores: Jaime Garcia Frnacisco
--     	    Mora Magaña Jose David Divad
--@Fecha:   01/02/2021
--@Descripcion: Creacion de los usuarios y les asigna privilegios

connect sys/systemproy as sysdba;

create user admin_ciudadanos identified by ciudadanos 
quota unlimited on tst_ciudadanos default tablespace tst_ciudadanos;
grant create table, create session, create sequence to admin_ciudadanos;


create user admin_tramites identified by ciudadanos 
quota unlimited on tst_tramites default tablespace tst_tramites;
grant create table, create session, create sequence to admin_tramites;

-- Falta darle permisos a admin_tramites para que acceda a las tablas de admin_ciudadanos
-- pero aun no se crean las tablas.

