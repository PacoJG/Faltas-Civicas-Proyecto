--@Autores: Jaime Garcia Frnacisco
--     	    Mora Magaña Jose David Divad
--@Fecha:   01/02/2021
--@Descripcion: Simulación de un día de trabajo para el modulo TRAMITES

connect admin_tramites/tramites
set serveroutput on;
whenever sqlerror exit rollback

--Redo para FALTA_CIVIL

declare
    v_count number;
    v_max_falta number;
    v_max_cliente number;
    v_max_num_falta number;
    v_id number;

    cursor cur_insert is
        select falta_civil_seq.nextval as falta_civil_id, cliente, numero_falta,
            sysdate as fecha_estatus, tipo_falta, puntos_negativos, sysdate as fecha_ocurrencia,
            sysdate + 30 as fecha_limite, estatus_id, auto_id, dispositivo_id
        from falta_civil
        where falta_civil_id <= 100;
    
    cursor cur_update is
        select * from falta_civil
        where falta_civil_id <= 100;

begin
    --INSERT
    v_count := 0;
    select max(cliente) into v_max_cliente from falta_civil;
    select max(numero_falta) into v_max_num_falta from falta_civil;
    select max(falta_civil_id) into v_id from falta_civil;
    v_id := v_id +1;
    v_max_cliente := v_max_cliente + 1;
    v_max_num_falta := v_max_num_falta +1;
    for r in cur_insert loop
        insert into falta_civil(falta_civil_id, cliente, numero_falta, fecha_estatus,
            tipo_falta, puntos_negativos, fecha_ocurrencia, fecha_limite, estatus_id, 
            auto_id, dispositivo_id)
        values (v_id,v_max_cliente, v_max_num_falta, r.fecha_estatus, r.tipo_falta,
            r.puntos_negativos, r.fecha_ocurrencia, r.fecha_limite, dbms_random.value(1,4), r.auto_id,
            dbms_random.value(1,100));
        
        insert into falta_evidencia(falta_evidencia_id, foto_video, falta_civil_id)
        values (falta_evidencia_seq.nextval, to_blob(hextoraw('ab9ef23123a')), v_id);

        v_count := v_count + sql%rowcount;
        v_id := v_id + 1;
        v_max_cliente := v_max_cliente + 1;
        v_max_num_falta := v_max_num_falta +1;
    end loop;

    dbms_output.put_line('Registros insertados en FALTA_CIVIL: ' || v_count);
    dbms_output.put_line('Registros insertados en EVIDENCIA_FALTA: ' || v_count);
    select max(falta_civil_id) into v_max_falta from falta_civil;
    --UPDATE
    v_count := 0;

    for r in cur_update loop
        update falta_civil set estatus_id = dbms_random.value(1,4),
        dispositivo_id = dbms_random.value(1,100), fecha_estatus = r.fecha_estatus
        where falta_civil_id = (select trunc(dbms_random.value(1,v_max_falta))from dual);
        v_count := v_count + sql%rowcount;
    end loop;
    dbms_output.put_line('Registros modificados en FALTA_CIVIL: ' || v_count);
end;
/

--Redo para FALTA_EVIDENCIA
declare
    v_count number;
    cursor cur_update is
        select * from falta_evidencia
        where falta_evidencia_id <= 100;
    cursor cur_delete is
        select * from falta_evidencia
        where falta_evidencia_id<=70;
begin
    v_count := 0;
    -- INSERT
    v_count := 0;

    --UPDATE
    for r in cur_update loop
        update falta_evidencia set foto_video = to_blob(hextoraw('abcde123'))
        where falta_evidencia_id = r.falta_evidencia_id;
        v_count := v_count + 1;
    end loop;
    dbms_output.put_line('Registros modificados en FALTA_EVIDENCIA: ' || v_count);

    --DELETE
    for r in cur_delete loop
        delete from falta_evidencia
        where falta_evidencia_id = r.falta_evidencia_id
        and falta_civil_id = r.falta_civil_id;
        v_count := v_count + 1;
    end loop;
    dbms_output.put_line('Registros eliminados en FALTA_EVIDENCIA: ' || v_count);
end;
/

--Redo para HISTORICO_FALTA
declare
    v_count number;
    cursor cur_insert is
        select * from historico_falta
        where historico_falta_id <=50;
    cursor cur_update is
        select * from historico_falta
        where historico_falta_id <=100;
begin
    --INSERT
    v_count := 0;
    for r in cur_insert loop
        for v_index in 1..4 loop
            insert into historico_falta(historico_falta_id, fecha, falta_civil_id, estatus_falta_id)
            values (historico_falta_seq.nextval,sysdate+v_index,r.falta_civil_id, v_index);
            v_count := v_count + 1;
        end loop;
    end loop;
    dbms_output.put_line('Registros insertados en HISTORICO_FALTA: ' || v_count);

    --UPDATE
    v_count := 0;
    for r in cur_update loop
        update historico_falta set
            fecha = r.fecha + dbms_random.value(1,20),
            estatus_falta_id = round(dbms_random.value(1,4))
            where historico_falta_id = r.historico_falta_id;
            v_count := v_count + 1;
    end loop;
    dbms_output.put_line('Registros MODIFICADOS en HISTORICO_FALTA: ' || v_count);
end;
/


--Redo para ALTO, INVONVENIENTE y VELOCIDAD
declare
    cursor cur_update_alto is
        select falta_civil_id, crucero from alto where falta_civil_id<=50;
    cursor cur_update_vel is
        select falta_civil_id from velocidad where falta_civil_id<=50;
    cursor cur_update_incon is
        select falta_civil_id, centro_detencion from inconveniente  where falta_civil_id<=50;
    v_count number;
begin
    --UPDATE para ALTO
    v_count := 0;
    for r in cur_update_alto loop
        update alto set
        crucero = r.crucero
        where falta_civil_id = r.falta_civil_id;
        v_count := v_count +1;
    end loop;
    dbms_output.put_line('Registros modificados en ALTO: ' || v_count);

    --UPDATE para VELOCIDAD
    v_count := 0;
    for r in cur_update_vel loop
        update velocidad set
        latitud = trunc((dbms_random.value(1,120)),2),
        longitud = trunc((dbms_random.value(1,120)),2),
        velocidad_max = round(dbms_random.value(50,80)),
        velocidad_reportada = round(dbms_random.value(81,120))
        where falta_civil_id = r.falta_civil_id;
        v_count := v_count +1;
    end loop;
    dbms_output.put_line('Registros modificados en VELOCIDAD: ' || v_count);

    --UPDATE para INCONVENIENTE
    v_count := 0;
    for r in cur_update_incon loop
        update inconveniente set
        centro_detencion = r.centro_detencion,
        nivel_alcohol = round(dbms_random.value(1,100))
        where falta_civil_id = r.falta_civil_id;
        v_count := v_count +1;
    end loop;
    dbms_output.put_line('Registros modificados en INCONVENIENTE: ' || v_count);
end;
/

Prompt Confirmando Cambios
commit;

whenever sqlerror continue none
