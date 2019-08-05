-- Evidencia
ALTER TABLE "public"."Evidencia" 
  ADD COLUMN "iActivo" int2 NOT NULL;

COMMENT ON COLUMN "public"."Evidencia"."iEstatus" IS '"Nuevo","Rechazado","Aprobado","Pubicado"';

COMMENT ON COLUMN "public"."Evidencia"."iActivo" IS '1=Activo, 0=Inactivo';

-- Agregar Revisado

ALTER TABLE "public"."Compromiso" RENAME COLUMN "iEstatus" TO "iRevisado";

ALTER TABLE "public"."Compromiso" 
  ALTER COLUMN "iRevisado" TYPE int2 USING "iRevisado"::int2;

COMMENT ON COLUMN "public"."Compromiso"."iRevisado" IS '1=Si, 0=No';

-- Eliminar campo Estatus Revisión
ALTER TABLE "public"."Compromiso" 
  DROP COLUMN "iEstatusRevision";
  
-- Tabla ComponenteUBP
CREATE TABLE public."ComponenteUBP"
(
    "iIdComponente" integer NOT NULL,
    "iIdUbp" integer NOT NULL,
    "nMonto" numeric(20, 2) NOT NULL,
    PRIMARY KEY ("iIdComponente", "iIdUbp"),
    CONSTRAINT "FK_CompUbp_Componente" FOREIGN KEY ("iIdComponente")
        REFERENCES public."Componente" ("iIdComponente") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "FK_CompUbp_UBP" FOREIGN KEY ("iIdUbp")
        REFERENCES public."UBP" ("iIdUbp") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
);

ALTER TABLE public."ComponenteUBP"
    OWNER to postgres;

--	Tabla paramétros
CREATE TABLE public."Parametro"
(
    "iIdParametro" serial NOT NULL,
    "vValor" text,
    "vParametro" character varying(250) NOT NULL,
    "vDescripcion" character varying(250) NOT NULL,
    "iActivo" smallint NOT NULL DEFAULT 1,
    PRIMARY KEY ("iIdParametro")
)
WITH (
    OIDS = FALSE
);

ALTER TABLE public."Parametro"
    OWNER to postgres;

COMMENT ON COLUMN public."Parametro"."iActivo"
    IS '0=Inactivo, 1=Activo';
	