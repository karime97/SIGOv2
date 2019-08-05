-- Tabla de compromisos
CREATE TABLE public."Compromiso"
(
    "iIdCompromiso" serial NOT NULL,
    "vCompromiso" character varying(800) NOT NULL,
    "iNumero" integer NOT NULL,
    "iEstatus" integer NOT NULL,
    "dPorcentajeAvance" numeric(5, 2) NOT NULL DEFAULT 0,
    "iIdDependencia" integer NOT NULL,
    "vFeNotarial" character varying(50) NOT NULL,
    "vNombreCorto" character varying(500) NOT NULL,
    "iEstatusRevision" integer NOT NULL,
    "dUltimaAct" timestamp without time zone,
    "vDescripcion" text NOT NULL,
    "iUltUsuarioAct" integer,
    "iUltUsuarioRev" integer,
    "iIdTema" integer NOT NULL,
    "vAntes" text NOT NULL,
    "vDespues" text NOT NULL,
    "vObservaciones" text NOT NULL,
    "iActivo" smallint NOT NULL DEFAULT 1,    
    PRIMARY KEY ("iIdCompromiso"),
    CONSTRAINT "FK_Compromiso_Dependencia" FOREIGN KEY ("iIdDependencia")
        REFERENCES public."Dependencia" ("iIdDependencia") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "FK_Compromiso_Tema" FOREIGN KEY ("iIdTema")
        REFERENCES public."PED2019Tema" ("iIdTema") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
);

ALTER TABLE public."Compromiso"
    OWNER to postgres;
COMMENT ON TABLE public."Compromiso"
    IS 'Compromisos del gobernador';

COMMENT ON COLUMN public."Compromiso"."vEstatus"
    IS '"Sin iniciar", "En cumplimiento", "Cumplido"';

COMMENT ON COLUMN public."Compromiso"."vEstatusRevision"
    IS '"Pendiente","Revisado","Publicado"';

-- Tabla de componentes

CREATE TABLE public."Componente"
(
    "iIdComponente" serial NOT NULL,
    "vComponente" character varying(500) COLLATE pg_catalog."default" NOT NULL,
    "vDescripcion" text COLLATE pg_catalog."default" NOT NULL,
    "nPonderacion" numeric(5,2) NOT NULL,
    "nAvance" numeric(5,2),
    "iIdCompromiso" integer NOT NULL,
    "iIdUnidadMedida" integer NOT NULL,
    "nMeta" numeric(10,2) NOT NULL DEFAULT 0,
    "iOrden" integer NOT NULL DEFAULT 0,
    "iActivo" smallint NOT NULL DEFAULT 1,
    CONSTRAINT "Componente_pkey" PRIMARY KEY ("iIdComponente"),
    CONSTRAINT "FK_Componente_Compromiso" FOREIGN KEY ("iIdCompromiso")
        REFERENCES public."Compromiso" ("iIdCompromiso") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "FK_Componente_UnidadMedida" FOREIGN KEY ("iIdUnidadMedida")
        REFERENCES public."UnidadMedida" ("iIdUnidadMedida") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."Componente"
    OWNER to postgres;

-- Tabla de evidencia

CREATE TABLE public."Evidencia"
(
    "iIdEvidencia" serial NOT NULL,
    "iIdComponente" integer NOT NULL,
    "vEvidencia" character varying(200) NOT NULL,
    "iEstatus" integer NOT NULL,
    "vTipo" character varying(50) NOT NULL,
    "dFechaSubida" timestamp without time zone NOT NULL,
    "dFechaRevision" timestamp without time zone,
    "iFotoInicio" smallint NOT NULL DEFAULT 0,
    "iOrdenFoto" smallint NOT NULL DEFAULT 0,
    "iIdUsuarioSube" integer,
    "iIdUsuarioRevisa" integer,
    PRIMARY KEY ("iIdEvidencia"),
    CONSTRAINT "FK_Evidencia_Componente" FOREIGN KEY ("iIdComponente")
        REFERENCES public."Componente" ("iIdComponente") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
);

ALTER TABLE public."Evidencia"
    OWNER to postgres;

COMMENT ON COLUMN public."Evidencia"."vEstatus"
    IS '"Eliminado","Nuevo","Rechazado","Aprobado","Pubicado"';

COMMENT ON COLUMN public."Evidencia"."vTipo"
    IS '"Documento","Fotografía","Video"';

COMMENT ON COLUMN public."Evidencia"."iFotoInicio"
    IS '1=Sí, 0=No';

COMMENT ON COLUMN public."Evidencia"."iOrdenFoto"
    IS 'Determina el orden de las fotos de inicio';

COMMENT ON COLUMN public."Evidencia"."iIdUsuarioSube"
    IS 'Indica el id del usuario que subió el archivo';

COMMENT ON COLUMN public."Evidencia"."iIdUsuarioRevisa"
    IS 'Indica el id del usuario que revisó';





-- Tabla de compromisos página
CREATE TABLE public."CompromisoPag"
(
    "iIdCompromiso" serial NOT NULL,
    "vCompromiso" character varying(800) NOT NULL,
    "iNumero" integer NOT NULL,
    "iEstatus" integer NOT NULL,
    "dPorcentajeAvance" numeric(5, 2) NOT NULL DEFAULT 0,
    "iIdDependencia" integer NOT NULL,
    "vFeNotarial" character varying(50) NOT NULL,
    "vNombreCorto" character varying(500) NOT NULL,
    "dUltimaAct" timestamp without time zone,
    "vDescripcion" text NOT NULL,
    "iUltUsuarioAct" integer,
    "iIdTema" integer NOT NULL,
    "vAntes" text NOT NULL,
    "vDespues" text NOT NULL,
    PRIMARY KEY ("iIdCompromiso"),
    CONSTRAINT "FK_CompromisoPag_Dependencia" FOREIGN KEY ("iIdDependencia")
        REFERENCES public."Dependencia" ("iIdDependencia") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "FK_CompromisoPag_Tema" FOREIGN KEY ("iIdTema")
        REFERENCES public."PED2019Tema" ("iIdTema") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
);

ALTER TABLE public."CompromisoPag"
    OWNER to postgres;
COMMENT ON TABLE public."CompromisoPag"
    IS 'Compromisos del gobernador';

COMMENT ON COLUMN public."CompromisoPag"."vEstatus"
    IS '"Sin iniciar", "En cumplimiento", "Cumplido"';


-- Tabla de componentes página

CREATE TABLE public."ComponentePag"
(
    "iIdComponente" serial NOT NULL,
    "vComponente" character varying(500) COLLATE pg_catalog."default" NOT NULL,
    "vDescripcion" text COLLATE pg_catalog."default" NOT NULL,
    "nPonderacion" numeric(5,2) NOT NULL,
    "nAvance" numeric(5,2),
    "iIdCompromiso" integer NOT NULL,
    "iIdUnidadMedida" integer NOT NULL,
    "nMeta" numeric(10,2) NOT NULL DEFAULT 0,
    "iOrden" integer NOT NULL DEFAULT 0,
    PRIMARY KEY ("iIdComponente"),
    CONSTRAINT "FK_ComponentePag_Compromiso" FOREIGN KEY ("iIdCompromiso")
        REFERENCES public."CompromisoPag" ("iIdCompromiso") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "FK_ComponentePag_UnidadMedida" FOREIGN KEY ("iIdUnidadMedida")
        REFERENCES public."UnidadMedida" ("iIdUnidadMedida") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public."ComponentePag"
    OWNER to postgres;

-- Tabla de evidencia Página

CREATE TABLE public."EvidenciaPag"
(
    "iIdEvidencia" serial NOT NULL,
    "iIdComponente" integer NOT NULL,
    "vEvidencia" character varying(200) NOT NULL,
    "vTipo" character varying(50) NOT NULL,
    "dFechaSubida" timestamp without time zone NOT NULL,
    "dFechaRevision" timestamp without time zone,
    "iFotoInicio" smallint NOT NULL DEFAULT 0,
    "iOrdenFoto" smallint NOT NULL DEFAULT 0,
    "iIdUsuarioSube" integer,
    "iIdUsuarioRevisa" integer,
    PRIMARY KEY ("iIdEvidencia"),
    CONSTRAINT "FK_EvidenciaPag_Componente" FOREIGN KEY ("iIdComponente")
        REFERENCES public."ComponentePag" ("iIdComponente") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
);

ALTER TABLE public."EvidenciaPag"
    OWNER to postgres;

COMMENT ON COLUMN public."EvidenciaPag"."vTipo"
    IS '"Documento","Fotografía","Video"';

COMMENT ON COLUMN public."Evidencia"."iFotoInicio"
    IS '1=Sí, 0=No';

COMMENT ON COLUMN public."EvidenciaPag"."iOrdenFoto"
    IS 'Determina el orden de las fotos de inicio';

COMMENT ON COLUMN public."EvidenciaPag"."iIdUsuarioSube"
    IS 'Indica el id del usuario que subió el archivo';

COMMENT ON COLUMN public."EvidenciaPag"."iIdUsuarioRevisa"
    IS 'Indica el id del usuario que revisó';



-- Corresponsables
CREATE TABLE public."CompromisoCorresponsable"
(
    "iIdCompromiso" integer NOT NULL,
    "iIdDependencia" integer NOT NULL,
    PRIMARY KEY ("iIdCompromiso", "iIdDependencia"),
    CONSTRAINT "FK_CompromisoCo_Compromiso" FOREIGN KEY ("iIdCompromiso")
        REFERENCES public."Compromiso" ("iIdCompromiso") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "FK_CompromisoCo_Dependencia" FOREIGN KEY ("iIdDependencia")
        REFERENCES public."Dependencia" ("iIdDependencia") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
);

ALTER TABLE public."CompromisoCorresponsable"
    OWNER to postgres;

-- Corresponsables Página
CREATE TABLE public."CompromisoCorresponsablePag"
(
    "iIdCompromiso" integer NOT NULL,
    "iIdDependencia" integer NOT NULL,
    PRIMARY KEY ("iIdCompromiso", "iIdDependencia"),
    CONSTRAINT "FK_CompromisoCoPag_Compromiso" FOREIGN KEY ("iIdCompromiso")
        REFERENCES public."CompromisoPag" ("iIdCompromiso") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "FK_CompromisoCoPag_Dependencia" FOREIGN KEY ("iIdDependencia")
        REFERENCES public."Dependencia" ("iIdDependencia") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
);

ALTER TABLE public."CompromisoCorresponsablePag"
    OWNER to postgres;


-- Estatus 

CREATE TABLE public."Estatus"
(
    "iIdEstatus" serial NOT NULL,
    "vEstatus" character varying(100) NOT NULL,
    "iActivo" smallint NOT NULL DEFAULT 1,
    "vEntidadMide" character varying(100) NOT NULL,
    PRIMARY KEY ("iIdEstatus")
)
WITH (
    OIDS = FALSE
);

ALTER TABLE public."Estatus"
    OWNER to postgres;
COMMENT ON TABLE public."Estatus"
    IS 'Estatus usados en el sistema';