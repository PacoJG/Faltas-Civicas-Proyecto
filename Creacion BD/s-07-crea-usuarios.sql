--@Autores: Jaime Garcia Frnacisco
--     	    Mora Magaña Jose David Divad
--@Fecha:   01/02/2021
--@Descripcion: Creacion de los usuarios y les asigna privilegios

connect sys/systemproy as sysdba;

create user admin_ciudadanos identified by ciudadanos 
  default tablespace tst_ciudadanos
  quota unlimited on tst_ciudadanos
  quota unlimited on tsi_ciudadanos
  quota unlimited on comun_blob;

grant create table, create session, create sequence, create procedure to admin_ciudadanos;
grant create any index to admin_ciudadanos;


create user admin_tramites identified by tramites
  default tablespace tst_tramites
  quota unlimited on tst_tramites
  quota unlimited on tsi_tramites
  quota unlimited on comun_blob;

grant create table, create session, create sequence, create procedure to admin_tramites;
grant create any index to admin_tramites;


