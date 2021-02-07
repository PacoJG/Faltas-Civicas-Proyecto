--@Autores: Jaime Garcia Frnacisco
--     	    Mora Magaña Jose David Divad
--@Fecha:   01/02/2021
--@Descripcion: Creacion de los indices necesarios para el modulo CIUDADANOS

CREATE UNIQUE INDEX CIUDADANO_CURP_UK
    ON CIUDADANO(CURP)
TABLESPACE TSI_CIUDADANOS;

CREATE INDEX TRABAJO_TIPO_TC_ID_IX
    ON TRABAJO_COMUNITARIO(TIPO_TRABAJO_COMUNITARIO_ID)
TABLESPACE TSI_CIUDADANOS;

CREATE INDEX TRABAJO_LICENCIA_ID_IX
    ON TRABAJO_COMUNITARIO(LICENCIA_ID)
TABLESPACE TSI_CIUDADANOS;

CREATE INDEX CIUDADANO_TELEFONO_CIUDADANO_ID_IX
    ON CIUDADANO_TELEFONO(CIUDADANO_ID)
TABLESPACE TSI_CIUDADANOS;

CREATE INDEX CIUDADANO_LICENCIA_ID_IX
    ON CIUDADANO(LICENCIA_ID)
TABLESPACE TSI_CIUDADANOS;

CREATE UNIQUE INDEX LICENCIA_FOLIO_UK
    ON LICENCIA(FOLIO)
TABLESPACE TSI_CIUDADANOS;

CREATE INDEX DATOS_BIOMETRICOS_LICENCIA_ID_IX
    ON DATOS_BIOMETRICOS(LICENCIA_ID)
TABLESPACE TSI_CIUDADANOS;

CREATE INDEX AUTO_CIUDADANO_ID_IX
    ON AUTO(CIUDADANO_ID)
TABLESPACE TSI_CIUDADANOS;

CREATE UNIQUE INDEX AUTO_PLACA_UK
    ON AUTO(PLACA)
TABLESPACE TSI_CIUDADANOS;

CREATE INDEX HISTORICO_AUTO_AUTO_ID_IX
    ON HISTORICO_AUTO(AUTO_ID)
TABLESPACE TSI_CIUDADANOS;

CREATE INDEX HISTORICO_AUTO_CIUDADANO_ID_IX
    ON HISTORICO_AUTO(CIUDADANO_ID)
TABLESPACE TSI_CIUDADANOS;

CREATE INDEX DB_FOTO_IX
    ON DATOS_BIOMETRICOS(FOTO)
TABLESPACE TSI_CIUDADANOS;

CREATE INDEX DB_FIRMA_IX
    ON DATOS_BIOMETRICOS(FIRMA)
TABLESPACE TSI_CIUDADANOS;

CREATE INDEX DB_HUELLA_1_IX
    ON DATOS_BIOMETRICOS(HUELLA_1)
TABLESPACE TSI_CIUDADANOS;

CREATE INDEX DB_HUELLA_2_IX
    ON DATOS_BIOMETRICOS(HUELLA_2)
TABLESPACE TSI_CIUDADANOS;

CREATE INDEX DB_HUELLA_3_IX
    ON DATOS_BIOMETRICOS(HUELLA_3)
TABLESPACE TSI_CIUDADANOS;

CREATE INDEX DB_HUELLA_4_IX
    ON DATOS_BIOMETRICOS(HUELLA_4)
TABLESPACE TSI_CIUDADANOS;

CREATE INDEX DB_HUELLA_5_IX
    ON DATOS_BIOMETRICOS(HUELLA_5)
TABLESPACE TSI_CIUDADANOS;

CREATE INDEX DB_HUELLA_6_IX
    ON DATOS_BIOMETRICOS(HUELLA_6)
TABLESPACE TSI_CIUDADANOS;

CREATE INDEX DB_HUELLA_7_IX
    ON DATOS_BIOMETRICOS(HUELLA_7)
TABLESPACE TSI_CIUDADANOS;

CREATE INDEX DB_HUELLA_8_IX
    ON DATOS_BIOMETRICOS(HUELLA_8)
TABLESPACE TSI_CIUDADANOS;

CREATE INDEX DB_HUELLA_9_IX
    ON DATOS_BIOMETRICOS(HUELLA_9)
TABLESPACE TSI_CIUDADANOS;

CREATE INDEX DB_HUELLA_10_IX
    ON DATOS_BIOMETRICOS(HUELLA_10)
TABLESPACE TSI_CIUDADANOS;