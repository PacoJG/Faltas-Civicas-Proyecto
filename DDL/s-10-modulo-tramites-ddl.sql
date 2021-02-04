--@Autores: Jaime Garcia Frnacisco
--     	    Mora Magaña Jose David Divad
--@Fecha:   01/02/2021
--@Descripcion: Creacion de las tablas del modulo TRAMITES y su secuencia


-- 
-- TABLE: ESTATUS_FALTA
--
CREATE SEQUENCE ESTATUS_FALTA_SEQ
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCYCLE;

CREATE TABLE ESTATUS_FALTA(
    ESTATUS_FALTA_ID     NUMBER(10,0)    NOT NULL,
    DESCRIPCION          VARCHAR2(40)    NOT NULL,
    CONSTRAINT ESTATUS_FALTA_PK PRIMARY KEY (ESTATUS_ID)
    USING INDEX (
        CREATE UNIQUE INDEX ESTATUS_FALTA_PK ON ESTATUS_FALTA(ESTATUS_FALTA_ID)
        TABLESPACE TSI_TRAMITES)
) TABLESPACE TST_TRAMITES;

-- 
-- TABLE: DISPOSITIVO
--
CREATE SEQUENCE DISPOSITIVO_SEQ
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCYCLE;

CREATE TABLE DISPOSITIVO(
    DISPOSITIVO_ID    NUMBER(10, 0)    NOT NULL,
    CLAVE             VARCHAR2(40)     NOT NULL,
    TIPO              VARCHAR2(1)      NOT NULL,
    CONSTRAINT DISPOSITIVO_PK PRIMARY KEY (DISPOSITIVO_ID)
    USING INDEX (
        CREATE UNIQUE INDEX DISPOSITIVO_PK ON DISPOSITIVO(DISPOSITIVO_ID)
        TABLESPACE TSI_TRAMITES)
) TABLESPACE TST_TRAMITES;

-- 
-- TABLE: FALTA_CIVIL 
--
CREATE SEQUENCE FALTA_CIVIL_SEQ
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCYCLE;

CREATE TABLE FALTA_CIVIL(
    FALTA_CIVIL_ID    NUMBER(10, 0)    NOT NULL,
    CLIENTE           NUMBER(40, 0)    NOT NULL,
    NUMERO_FALTA      NUMBER(40, 0)    NOT NULL,
    FECHA_ESTATUS     DATE             NOT NULL,
    TIPO_FALTA        CHAR(1)          NOT NULL,
    PUNTOS_NEGATIVOS  NUMBER(18, 0)    NOT NULL,
    FECHA_OCURRENCIA  DATE             NOT NULL,
    FECHA_LIMITE      DATE             NOT NULL,
    ESTATUS_ID        NUMBER(10,0)     NOT NULL,
    AUTO_ID           NUMBER(10,0)     NOT NULL,
    DISPOSITIVO_ID    NUMBER(40, 0)    NOT NULL,
    CONSTRAINT FALTA_CIVIL_AUTO_ID_KF FOREIGN KEY (AUTO_ID)
    REFERENCES AUTO(AUTO_ID),
    CONSTRAINT FALTA_CIVIL_ESTATUS_ID_FK FOREIGN KEY (ESTATUS_ID)
    REFERENCES ESTATUS_FALTA(ESTATUS_ID),
    CONSTRAINT FALTA_CIVIL_DISPOSITIVO_ID_FK FOREIGN KEY (DISPOSITIVO_ID)
    REFERENCES DISPOSITIVO(DISPOSITIVO_ID),
    CONSTRAINT FALTA_CIVIL_TIPO_FALTA_CK CHECK (TIPO_FALTA IN ('A','I','V')),
    CONSTRAINT FALTA_CIVIL_PK PRIMARY KEY (FALTA_CIVIL_ID)
    USING INDEX (
        CREATE UNIQUE INDEX FALTA_CIVIL_PK ON FALTA_CIVIL(FALTA_CIVIL_ID)
        TABLESPACE TSI_TRAMITES)
) TABLESPACE TST_TRAMITES;

-- 
-- TABLE: ALTO
--
CREATE TABLE ALTO(
    FALTA_CIVIL_ID    NUMBER(10, 0)    NOT NULL,
    CRUCERO           VARCHAR2(40)     NOT NULL,
    CONSTRAINT ALTO_FALTA_CIVIL_ID_FK FOREIGN KEY (FALTA_CIVIL_ID)
    REFERENCES FALTA_CIVIL(FALTA_CIVIL_ID),
    CONSTRAINT ALTO_PK PRIMARY KEY (FALTA_CIVIL_ID)
    USING INDEX (
        CREATE UNIQUE INDEX ALTO_PK ON ALTO(FALTA_CIVIL_ID)
        TABLESPACE TSI_TRAMITES)
) TABLESPACE TST_TRAMITES;

-- 
-- TABLE: INCONVENIENTE 
--
CREATE TABLE INCONVENIENTE(
    FALTA_CIVIL_ID      NUMBER(10, 0)    NOT NULL,
    CENTRO_DETENCION    VARCHAR2(40)     NOT NULL,
    NIVEL_ALCOHOL       NUMBER(18, 0)    NOT NULL,
    CONSTRAINT INCONVENIENTE_FALTA_CIVIL_ID_PK FOREIGN KEY (FALTA_CIVIL_ID)
    REFERENCES FALTA_CIVIL(FALTA_CIVIL_ID),
    CONSTRAINT INCONVENIENTE_PK PRIMARY KEY (FALTA_CIVIL_ID)
    USING INDEX (
        CREATE UNIQUE INDEX INCONVENIENTE_PK ON INCONVENIENTE(FALTA_CIVIL_ID)
        TABLESPACE TSI_TRAMITES)
) TABLESPACE TST_TRAMITES;

-- 
-- TABLE: VELOCIDAD 
--
CREATE TABLE VELOCIDAD(
    FALTA_CIVIL_ID         NUMBER(10, 0)    NOT NULL,
    LATITUD                NUMBER(40, 6)    NOT NULL,
    LONGITUD               NUMBER(40, 6)    NOT NULL,
    VELOCIDAD_MAX          NUMBER(18, 2)    NOT NULL,
    VELOCIDAD_REPORTADA    NUMBER(18, 2)    NOT NULL,
    CONSTRAINT VELOCIDAD_FALTA_CIVIL_ID_FK FOREIGN KEY (FALTA_CIVIL_ID)
    REFERENCES FALTA_CIVIL(FALTA_CIVIL_ID),
    CONSTRAINT VELOCIDAD_PK PRIMARY KEY (FALTA_CIVIL_ID)
    USING INDEX (
        CREATE UNIQUE INDEX VELOCIDAD_PK ON VELOCIDAD(FALTA_CIVIL_ID)
        TABLESPACE TSI_TRAMITES)
) TABLESPACE TST_TRAMITES;

-- 
-- TABLE: FALTA_EVIDENCIA
--
CREATE SEQUENCE FALTA_EVIDENCIA_SEQ
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCYCLE;

CREATE TABLE FALTA_EVIDENCIA(
    FALTA_EVIDENCIA_ID    NUMBER(10, 0)    NOT NULL,
    FOTO_VIDEO            BLOB             NOT NULL,
    FALTA_CIVIL_ID        NUMBER(10, 0)    NOT NULL,
    CONSTRAINT FALTA_EVIDENCIA_FALTA_CIVIL_ID_FK FOREIGN KEY (FALTA_CIVIL_ID)
    REFERENCES FALTA_CIVIL(FALTA_CIVIL_ID),
    CONSTRAINT FALTA_EVIDENCIA_PK PRIMARY KEY (FALTA_EVIDENCIA_ID)
    USING INDEX (
        CREATE UNIQUE INDEX FALTA_EVIDENCIA_PK ON FALTA_EVIDENCIA(FALTA_EVIDENCIA_ID)
        TABLESPACE TSI_TRAMITES)
) TABLESPACE TST_TRAMITES
LOB (FOTO_VIDEO) STORE AS SECUREFILE (TABLESPACE COMUN_BLOB);

-- 
-- TABLE: HISTORICO_FALTA 
--
CREATE SEQUENCE HISTORICO_FALTA_SEQ
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCYCLE;

CREATE TABLE HISTORICO_FALTA(
    HISTORICO_FALTA_ID    NUMBER(10, 0)    NOT NULL,
    FECHA                 DATE             NOT NULL,
    FALTA_CIVIL_ID        NUMBER(10, 0)    NOT NULL,
    ESTATUS_FALTA_ID            NUMBER(10,0)     NOT NULL,
    CONSTRAINT HISTORICO_FALTA_FALTA_CIVIL_ID_FK FOREIGN KEY (FALTA_CIVIL_ID)
    REFERENCES FALTA_CIVIL(FALTA_CIVIL_ID),
    CONSTRAINT HISTORICO_FALTA_ESTATUS_FALTA_ID_FK FOREIGN KEY (ESTATUS_FALTA_ID)
    REFERENCES ESTATUS_FALTA(ESTATUS_FALTA_ID),
    CONSTRAINT HISTORICO_FALTA_PK PRIMARY KEY (HISTORICO_FALTA_ID)
    USING INDEX (
        CREATE UNIQUE INDEX HISTORICO_FALTA_PK ON HISTORICO_FALTA(HISTORICO_FALTA_ID)
        TABLESPACE TSI_TRAMITES)
) TABLESPACE TST_TRAMITES;

-- 
-- TABLE: ROBO 
--
CREATE SEQUENCE ROBO_SEQ
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOMINVALUE
NOCYCLE;

CREATE TABLE ROBO(
    ROBO_ID           NUMBER(10, 0)    NOT NULL,
    ESTADO            VARCHAR2(40)     NOT NULL,
    FECHA             DATE             NOT NULL,
    LATITUD           NUMBER(40, 6),
    LONGITUD          NUMBER(40, 6),
    RECUPERADO        VARCHAR2(3),
    AUTO_ID           NUMBER(10,0)     NOT NULL,
    DISPOSITIVO_ID    NUMBER(10, 0)    NOT NULL,
    CONSTRAINT ROBO_AUTO_ID_FK FOREIGN KEY (AUTO_ID)
    REFERENCES AUTO(AUTO_ID),
    CONSTRAINT ROBO_DISPOSITIVO_ID_FK FOREIGN KEY (DISPOSITIVO_ID)
    REFERENCES DISPOSITIVO(DISPOSITIVO_ID),
    CONSTRAINT ROBO_PK PRIMARY KEY (ROBO_ID)
    USING INDEX (
        CREATE UNIQUE INDEX ROBO_PK ON ROBO(ROBO_ID)
        TABLESPACE TSI_TRAMITES)
) TABLESPACE TST_TRAMITES;
