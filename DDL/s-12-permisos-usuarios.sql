--@Autores: Jaime Garcia Frnacisco
--     	    Mora Magaña Jose David Divad
--@Fecha:   01/02/2021
--@Descripcion: Dar permisos a admin_tramites 

--Ejecutar como usuarios sys
connect sys/systemproy as sysdba

grant select, insert, update, delete on admin_ciudadanos.licencia to admin_tramites;
grant select, insert, update, delete on admin_ciudadanos.ciudadano to admin_tramites;
grant select, insert, update, delete on admin_ciudadanos.auto to admin_tramites;
grant select, insert, update, delete on admin_ciudadanos.ciudadano_telefono to admin_tramites;
grant select, insert, update, delete on admin_ciudadanos.datos_biometricos  to admin_tramites; 
grant select, insert, update, delete on admin_ciudadanos.historico_auto to admin_tramites;
grant select, insert, update, delete on admin_ciudadanos.tipo_trabajo_comunitario to admin_tramites;
grant select, insert, update, delete on admin_ciudadanos.trabajo_comunitario to admin_tramites;

grant references on admin_ciudadanos.licencia to admin_tramites;
grant references on admin_ciudadanos.ciudadano to admin_tramites;
grant references on admin_ciudadanos.auto to admin_tramites;
grant references on admin_ciudadanos.ciudadano_telefono to admin_tramites;
grant references on admin_ciudadanos.datos_biometricos to admin_tramites;
grant references on admin_ciudadanos.historico_auto to admin_tramites;
grant references on admin_ciudadanos.tipo_trabajo_comunitario to admin_tramites;
grant references on admin_ciudadanos.trabajo_comunitario to admin_tramites;