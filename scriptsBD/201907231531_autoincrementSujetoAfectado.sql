CREATE SEQUENCE id_sujeto_seq;
ALTER TABLE "SujetoAfectado" ALTER COLUMN "iIdSujetoAfectado" SET DEFAULT nextval('id_sujeto_seq');
ALTER TABLE "SujetoAfectado" ALTER COLUMN "iIdSujetoAfectado" SET NOT NULL;
ALTER SEQUENCE id_sujeto_seq OWNED BY "SujetoAfectado"."iIdSujetoAfectado";
ALTER SEQUENCE id_sujeto_seq RESTART WITH 1;