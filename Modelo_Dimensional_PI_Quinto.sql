
CREATE TABLE public.DIM_TIEMPO (
                Sk_TIEMPO INTEGER NOT NULL,
                Anio INTEGER NOT NULL,
                Semestre INTEGER NOT NULL,
                Nombre_semestre VARCHAR(10) NOT NULL,
                Trimestre INTEGER NOT NULL,
                Nombre_trimestre VARCHAR(10) NOT NULL,
                Mes INTEGER NOT NULL,
                Nombre_mes VARCHAR(15) NOT NULL,
                Dia INTEGER NOT NULL,
                Fecha DATE NOT NULL,
                CONSTRAINT sk_tiempo PRIMARY KEY (Sk_TIEMPO)
);


CREATE TABLE public.DIM_PERSONA (
                Sk_PERSONA INTEGER NOT NULL,
                PK_PERSONA INTEGER NOT NULL,
                ESTADO_CIVIL VARCHAR(100) NOT NULL,
                OCUPACION VARCHAR(100) NOT NULL,
                CULTURA VARCHAR(100) NOT NULL,
                EDUCACION VARCHAR(100) NOT NULL,
                Valido_desde DATE,
                Valido_hasta DATE,
                Version INTEGER NOT NULL,
                CONSTRAINT sk_persona PRIMARY KEY (Sk_PERSONA)
);


CREATE TABLE public.DIM_MUERTE (
                Sk_MUERTE INTEGER NOT NULL,
                PK_MUERTE INTEGER NOT NULL,
                TIPO_MUERTE VARCHAR(50) NOT NULL,
                ASISTENCIA VARCHAR(50) NOT NULL,
                Valido_desde DATE,
                Valido_hasta DATE,
                Version INTEGER NOT NULL,
                CONSTRAINT sk_muerte PRIMARY KEY (Sk_MUERTE)
);


CREATE TABLE public.DIM_LUGAR (
                Sk_LUGAR INTEGER NOT NULL,
                PK_LUGAR INTEGER NOT NULL,
                DEPARTAMENTO VARCHAR(100),
                AREA VARCHAR(100) NOT NULL,
                SITIO VARCHAR(100) NOT NULL,
                INSTITUTO VARCHAR(100) NOT NULL,
                Valido_desde DATE,
                Valido_hasta DATE,
                Version INTEGER NOT NULL,
                CONSTRAINT sk_lugar PRIMARY KEY (Sk_LUGAR)
);


CREATE TABLE public.DEFUNCION (
                Sk_LUGAR INTEGER NOT NULL,
                Sk_PERSONA INTEGER NOT NULL,
                Sk_MUERTE INTEGER NOT NULL,
                Sk_TIEMPO INTEGER NOT NULL,
                NIVEL VARCHAR(100) NOT NULL,
                GENERO VARCHAR(100) NOT NULL,
                EDAD VARCHAR(100) NOT NULL,
                CERTIFICACION VARCHAR(100) NOT NULL,
                MES VARCHAR(50) NOT NULL,
                CONSTRAINT defuncion_pk PRIMARY KEY (Sk_LUGAR, Sk_PERSONA, Sk_MUERTE, Sk_TIEMPO)
);


ALTER TABLE public.DEFUNCION ADD CONSTRAINT dim_tiempo_defuncion_fk
FOREIGN KEY (Sk_TIEMPO)
REFERENCES public.DIM_TIEMPO (Sk_TIEMPO)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.DEFUNCION ADD CONSTRAINT dim_persona_hechos_fk
FOREIGN KEY (Sk_PERSONA)
REFERENCES public.DIM_PERSONA (Sk_PERSONA)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.DEFUNCION ADD CONSTRAINT dim_muerte_hechos_fk
FOREIGN KEY (Sk_MUERTE)
REFERENCES public.DIM_MUERTE (Sk_MUERTE)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;

ALTER TABLE public.DEFUNCION ADD CONSTRAINT dim_lugar_hechos_fk
FOREIGN KEY (Sk_LUGAR)
REFERENCES public.DIM_LUGAR (Sk_LUGAR)
ON DELETE NO ACTION
ON UPDATE NO ACTION
NOT DEFERRABLE;
