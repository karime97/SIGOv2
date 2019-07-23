ALTER TABLE public."Avance"
    ADD COLUMN "iIdUsuarioCaptura" integer NOT NULL DEFAULT 0;

ALTER TABLE public."Avance"
    ADD COLUMN "dFechaCaptura" timestamp without time zone;

ALTER TABLE public."Avance"
    ADD COLUMN "iIdUsuarioAprueba" integer NOT NULL DEFAULT 0;

ALTER TABLE public."Avance"
    ADD COLUMN "dFechaAprueba" timestamp without time zone;