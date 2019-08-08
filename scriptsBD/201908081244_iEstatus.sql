ALTER TABLE public."Compromiso"
    ADD COLUMN "iEstatus" integer NOT NULL;
ALTER TABLE public."Compromiso"
    ADD CONSTRAINT "FK_Compromiso_Estatus" FOREIGN KEY ("iEstatus")
    REFERENCES public."Estatus" ("iIdEstatus") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;