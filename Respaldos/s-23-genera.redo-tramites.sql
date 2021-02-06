--@Autores: Jaime Garcia Frnacisco
--     	    Mora Magaña Jose David Divad
--@Fecha:   01/02/2021
--@Descripcion: Simulación de un día de trabajo para el modulo TRAMITES

connect admin_tramites/tramites
set serveroutput on;
whenever sqlerror exit rollback

--Redo para FALTA_CIVIL, ALTO, VELOCIDAD y INCONVENIENTE

declare
    v_count_historico number;
    v_count number;
    v_crucero varchar2(40);
    v_alcohol number;
    v_centro_d varchar(40);
    v_latitud number;
    v_longitud number;
    v_velocidad_max number;
    v_velocidad_repor number;
    v_falta_civil_id number;

    cursor cur_insert is
        select falta_civil_seq.nextval as falta_civil_id, cliente, numero_falta,
            sysdate as fecha_estatus, tipo_falta, puntos_negativos, sysdate as fecha_ocurrencia,
            sysdate + 30 as fecha_limite, estatus_id, auto_id, dispositivo_id
        from falta_civil sample(60) 
        where rownum <= 500;
    
    cursor cur_update is
        select falta_civil_id, round(dbms_random.value(1,7)) as estatus_id, puntos_negativos
    from falta_civil sample(60) 
    where rownum <= 50;

begin
    v_count_hist := 0;
    --INSERT
    v_count := 0;
    for r un cur_insert loop
        insert into falta_civil(falta_civil_id, cliente, numero_falta, fecha_estatus,
            tipo_falta, puntos_negativos, fecha_ocurrencia, fecha_limite, estatus_id, 
            auto_id, dispositivo_id)
        values (r.falta_civil_id, r.cliente, r.numero_falta, r.fecha_estatus, r.tipo_falta
            r.puntos_negativos, r.fecha_ocurrencia, r.fecha_limite, r.estatus_id, r.auto_id,
            r.dispositivo_id);
        
        insert into historico_falta (historico_falta_id, fecha, falta_civil_id, estatus_falta_id)
        values(historico_falta_seq.nextval, sysdate, r.falta_civil_id, r.estatus_falta_id);

        if r.tipo_falta = 'A' then
            select crucero into v_crucero
            from (
                select crucero from alto sample(10)
                order by dbms_random.random
            )
            where rownum < 2;

            insert into alto(falta_civil_id, crucero)
            values (r.falta_civil_id, v_crucero);
        elsif r.tipo_falta = 'I' then 
            v_alcohol := round(dbms_random.value(1,100));
            select centro_detencion into v_centro_d
            from (
                select centro_detencion from inconveniente sample(10)
                order by dbms_random.random
            )
            where rownum < 2;
            insert into inconveniente(falta_civil_id, centro_detencion, nivel_alcohol)
            values (r.falta_civil_id, v_centro_d, v_alcohol);
        elsif r.tipo_falta = 'V'
            v_latitud := dbms_random.value(1,120);
            v_longitud := dbms_random.value(1,120);
            v_velocidad_max := dbms_random.value(50,80);
            v_velocidad_repor := dbms_random.value(81,120);
            insert into velocidad(falta_civil_id, latitud, longitud, velocidad_max, velocidad_reportada)
            values (r.falta_civil_id, v_latitud, v_longitud, v_velocidad_max, v_velocidad_repor);
        end if;
        v_count := v_count + 1;
    end loop;
    dbms_output.put_line('Registros insertados en FALTA_CIVIL: ' || v_count);
    v_count_hist := v_count_hist + v_count;
    --UPDATE
    v_count := 0;

    for r in cur_update loop
        update falta_civil set falta_civil_id = r.falta_civil_id, estatus_falta_id = r.estatus_falta_id,
        numero_falta = r.numero_falta, fecha_estatus = r.fecha_estatus
        where falta_civil_id = r.falta_civil_id;
        insert into historico_falta(historico_falta_id, fecha, falta_civil_id, estatus_falta_id)
        values (historico_falta_seq.nextval, sysdate, r.falta_civil_id, r.estatus_falta_id);
        v_count := v_count + 1;
    end loop;
    dbms_output.put_line('Registros modificados en FALTA_CIVIL: ' || v_count);
    v_count_hist := v_count_hist + v_count;

    dbms_output.put_line('Registros insertados en HISTORICO_FALTA: ' || v_count_historico);
end:
/

--Redo para FALTA_EVIDENCIA
declare
    v_count number;
    v_insertar number;
    v_falta_civil_id number;
    v_actualizar number;
    v_falta_evidencia_id number;
begin
    v_count := 0;
    v_insertar := 300;
  -- INSERT
    for r in 1..v_insertar loop
        select falta_civil_id into v_falta_civil_id
        from (
            select falta_civil_id
            from falta_civil sample(10)
            order by dbms_random.random
        ) 
        where rownum < 2;

        insert into falta_evidencia(falta_evidencia_id, foto_video, falta_civil_id)
        values(falta_evidencia_seq.nextval, to_blob(hextoraw('ab9ef23123a')), v_falta_civil_id);
        v_count := v_count + 1;
    end loop;
    dbms_output.put_line('Registros insertados en FALTA_EVIDENCIA: ' || v_count);
    v_count := 0;
    v_actualizar := 100;
    --UPDATE
    for r in 1..v_actualizar loop
        select falta_evidencia_id into v_falta_evidencia_id
        from(
            select falta_evidencia_id
            from falta_evidencia sample(10)
            order by dbms_random.random
        )
        where rownum < 2;
        select falta_civil_id into v_falta_civil_id
        from (
            select falta_civil_id
            from falta_civil sample(10)
            order by dbms_random.random
        ) 
        where rownum < 2;
        update falta_evidencia set falta_civil_id = v.falta_civil_id
        where falta_evidencia_id = v_falta_evidencia_id;
        v_count := v_count + 1;
    end loop;
    dbms_output.put_line('Registros modificados en FALTA_EVIDENCIA: ' || v_count);
end;
/

Prompt Confirmando Cambios
commit;

whenever sqlerror continue none
