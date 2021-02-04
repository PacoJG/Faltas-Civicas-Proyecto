--@Autores: Jaime Garcia Frnacisco
--     	    Mora Magaña Jose David Divad
--@Fecha:   01/02/2021
--@Descripcion:  Inserts de la tabla estatus_falta (4)

insert into ESTATUS_FALTA (ESTATUS_ID,DESCRIPCION) values (ESTATUS_FALTA_SEQ.NEXTVAL,'Capturada');
insert into ESTATUS_FALTA (ESTATUS_ID,DESCRIPCION) values (ESTATUS_FALTA_SEQ.NEXTVAL,'Notificada al ciudadano');
insert into ESTATUS_FALTA (ESTATUS_ID,DESCRIPCION) values (ESTATUS_FALTA_SEQ.NEXTVAL,'Pagada con trabajo comunitario');
insert into ESTATUS_FALTA (ESTATUS_ID,DESCRIPCION) values (ESTATUS_FALTA_SEQ.NEXTVAL,'Anulada por error de captura');

