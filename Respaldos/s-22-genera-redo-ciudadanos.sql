--@Autores: Jaime Garcia Frnacisco
--     	    Mora Magaña Jose David Divad
--@Fecha:   01/02/2021
--@Descripcion: Simulación de un día de trabajo para el modulo CIUDADANOS

connect admin_ciudadanos/ciudadanos
set serveroutput on;
whenever sqlerror exit rollback

--Redo para tabla CIUDADANO

declare
  v_count number;

  cursor cur_insert is
    select ciudadano_seq.nextval as ciudadano_id, dbms_random.string('x',18) as curp,  
      (dbms_random.string('l',8) || substr(correo_electronico, instr(correo_electronico,'@',4), length(correo_electronico))) as correo_electronico,
      dbms_random.string('l',8) as domicilio, nombre, apellido_materno as apellido_paterno,
      apellido_paterno as apellido_materno, licencia_id
    from usuario sample(60) where rownum <= 1000;

 cursor cur_update is
    select * from usuario sample(60) where rownum <= 100;

begin
  -- INSERT
    v_count := 0;
    for r in cur_insert loop
      insert into ciudadano(ciudadano_id, curp, correo_electronico, domicilio, nombre, apellido_materno, apellido_paterno, licencia_id)
      values(r.ciudadano_id, r.curp, r.correo_electronico, r.domicilio, r.nombre, r.apellido_materno, r.apellido_paterno, r.licencia_id);
      v_count := v_count + 1;
    end loop;
    dbms_output.put_line('Registros insertados en CIUDADANO: ' || v_count);

  -- UPDATE
    v_count := 0;
    for r in cur_update loop
      update ciudadano set correo_electronico = r.correo_electronico, domicilio = r.domicilio, curp = r.curp, apellido_paterno = r.apellido_paterno
      where ciudadano_id = r.ciudadanp_id;
      v_count := v_count + 1;
    end loop;
    dbms_output.put_line('Registros modificados en CIUDADANO: ' || v_count);

end;
/

--Redo para tabla LICENCIA

declare
  v_count number;

  cursor cur_insert is
    select licencia_seq.nextval as licencia_id, folio, permanente, 
      sysdate as vigencia_inicial, sysdate + 30 as vigencia_final
    from licencia sample(60) where rownum <= 1000;

 cursor cur_update is
    select * from licencia sample(95) where rownum <= 100;

begin
-- INSERT
    v_count := 0;
    for r in cur_insert loop
      insert into licencia(licencia_id, folio, permanente, vigencia_inicial, vigencia_final)
      values(r.licencia_id, r.folio, r.permanente, r.vigencia_inicial, r.vigencia_final);
      v_count := v_count + 1;
    end loop;
    dbms_output.put_line('Registros insertados en LICENCIA: ' || v_count);

  -- UPDATE
    v_count := 0;
    for r in cur_update loop
      update licencia set licencia_id = r.licencia_id, folio = r.folio, permanente = r.permanente,
      vigencia_inicial = r.vigencia_inicial, vigencia_final = r.vigencia_final
      where licencia_id = r.licencia_id;
      v_count := v_count + 1;
    end loop;
    dbms_output.put_line('Registros modificados en LICENCIA: ' || v_count);

end;
/

Prompt Confirmando Cambios
commit;

whenever sqlerror continue none