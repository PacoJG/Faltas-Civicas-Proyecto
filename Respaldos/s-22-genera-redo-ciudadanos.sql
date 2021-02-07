--@Autores: Jaime Garcia Frnacisco
--     	    Mora Magaña Jose David Divad
--@Fecha:   01/02/2021
--@Descripcion: Simulación de un día de trabajo para el modulo CIUDADANOS

connect admin_ciudadanos/ciudadanos
set serveroutput on;
whenever sqlerror exit rollback

--Redo para tabla LICENCIA Y CIUDADANO

declare
  v_count number;
  v_max_folio number;
  v_max_licencia number;

  cursor cur_insert is
    select licencia_seq.nextval as licencia_id, folio, permanente, 
      sysdate as vigencia_inicial, sysdate + 40 as vigencia_final
    from licencia where licencia_id <= 200;

 cursor cur_update is
    select * from licencia where licencia_id <= 200;

begin
  -- INSERT
  select max(folio) into v_max_folio from licencia;
  v_max_folio := v_max_folio + 1;
  v_count := 0;
  for r in cur_insert loop
      insert into licencia(licencia_id, folio, permanente, vigencia_inicial, vigencia_final)
      values(r.licencia_id, v_max_folio, r.permanente, r.vigencia_inicial, r.vigencia_final);

      insert into ciudadano(ciudadano_id, curp, correo_electronico, domicilio, nombre, apellido_materno, apellido_paterno, licencia_id)
      values(ciudadano_seq.nextval, dbms_random.string('A',18), concat(dbms_random.string('A',20),'@gmail.com'), concat(dbms_random.string('X',5),'Jackson Way'), 
      dbms_random.string('A',18), dbms_random.string('A',18), dbms_random.string('A',18), r.licencia_id);

      insert into datos_biometricos(datos_biometricos_id, foto, firma, numero_renovacion, huella_1, huella_2, huella_3, huella_4,
      huella_5,huella_6, huella_7, huella_8, huella_9, huella_10, licencia_id)
      values(datos_biometricos_seq.nextval, to_blob(hextoraw(00)), to_blob(hextoraw(00)), round(dbms_random.value(1,200)), to_blob(hextoraw(00)), to_blob(hextoraw(00)),
      to_blob(hextoraw(00)), to_blob(hextoraw(00)), to_blob(hextoraw(00)), to_blob(hextoraw(00)), to_blob(hextoraw(00)), to_blob(hextoraw(00)), to_blob(hextoraw(00)),
      to_blob(hextoraw(00)), r.licencia_id );

      v_count := v_count + sql%rowcount;
      v_max_folio := v_max_folio +1;
    end loop;
    dbms_output.put_line('Registros insertados en LICENCIA: ' || v_count);
    dbms_output.put_line('Registros insertados en CIUDADANO: ' || v_count);
    dbms_output.put_line('Registros insertados en DATOS_BIOMETRICOS: ' || v_count);

  -- UPDATE
  select max(licencia_id) into v_max_licencia from licencia;
    v_count := 0;
    for r in cur_update loop
      update licencia set permanente = r.permanente,
      vigencia_inicial = r.vigencia_inicial, vigencia_final = r.vigencia_final
      where licencia_id = r.licencia_id;
      v_count := sql%rowcount;
    end loop;
    dbms_output.put_line('Registros modificados en LICENCIA: ' || v_count);

end;
/

--Redo para tabla CIUDADANO

declare
  v_count number;
  v_max_ciudadano number;

 cursor cur_update is
    select * from ciudadano where ciudadano_id <= 400;

begin
  select max(ciudadano_id) into v_max_ciudadano from ciudadano;
  -- UPDATE
    v_count := 0;
    for r in cur_update loop
      update ciudadano set correo_electronico = concat(dbms_random.string('A',20),'@gmail.com'), domicilio = r.domicilio, 
      curp = dbms_random.string('A',18), apellido_paterno = r.apellido_paterno
      where ciudadano_id = (select trunc(dbms_random.value(1,v_max_ciudadano)) from dual);
      v_count := v_count + sql%rowcount;
    end loop;
    dbms_output.put_line('Registros modificados en CIUDADANO: ' || v_count);

end;
/

--Redo para tabla TRABAJO_COMUNITARIO
declare
  v_count number;
  v_max_trabajocom number;
  cursor cur_insert is
    select * from trabajo_comunitario
    where trabajo_comunitario_id <= 100;
  cursor cur_update is
    select * from trabajo_comunitario
    where trabajo_comunitario_id <= 200;

begin
  v_count := 0;
  for r in cur_insert loop
    insert into trabajo_comunitario(trabajo_comunitario_id, tipo_trabajo_comunitario_id,
      horas, puntos_recuperados, licencia_id)
    values(trabajo_comunitario_seq.nextval, round(dbms_random.value(1,9)), round(dbms_random.value(1,10)), 
      round(dbms_random.value(1,10)), r.licencia_id);
    v_count := v_count + sql%rowcount;
  end loop;
  dbms_output.put_line('Registros insertados en TRABAJO_COMUNTARIO: ' || v_count);

select max(trabajo_comunitario_id) into v_max_trabajocom from trabajo_comunitario;

  for r in cur_update loop
    update trabajo_comunitario set
      tipo_trabajo_comunitario_id = round(dbms_random.value(1,9)),
      horas = round(dbms_random.value(1,10)),
      puntos_recuperados = round(dbms_random.value(1,10))
      where trabajo_comunitario_id = (select trunc(dbms_random.value(1,v_max_trabajocom)) from dual);
      v_count := v_count + sql%rowcount;
  end loop;
  dbms_output.put_line('Registros modifcados en TRABAJO_COMUNTARIO: ' || v_count);
end;
/

--Redo para tabla AUTO
declare
  v_count number;
  v_max_auto number;
  v_sum number;
  cursor cur_insert is 
    select auto_seq.nextval as auto_id, placa, tarjeta_circulacion, vigencia, ciudadano_id
    from auto where auto_id <=100;
  cursor cur_update is
    select * from auto where auto_id <= 100;

begin
  v_count := 0;
  v_sum := 1;
  for r in cur_insert loop
    insert into auto(auto_id, placa, tarjeta_circulacion, vigencia, ciudadano_id)
    values(r.auto_id, dbms_random.string('A',4) || '-' || to_char('1001' + v_sum), dbms_random.string('A',10), sysdate + 30, r.ciudadano_id);
    v_count := v_count + sql%rowcount;
    v_sum := v_sum + 1;
  end loop;
  dbms_output.put_line('Registros insertados en AUTO: ' || v_count);

  select max(auto_id) into v_max_auto from auto;
  for r in cur_update loop
    update auto set
      tarjeta_circulacion = dbms_random.string('A',10),
      vigencia = sysdate + 40
    where auto_id = (select trunc(dbms_random.value(1,v_max_auto)) from dual);
  end loop;
  dbms_output.put_line('Registros modificados en AUTO: ' || v_count);
end;
/

Prompt Confirmando Cambios
commit;

whenever sqlerror continue none