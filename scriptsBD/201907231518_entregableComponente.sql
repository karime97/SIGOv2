CREATE TABLE public."EntregableComponente"
(
    "iIdEntregable" serial NOT NULL,
    "iIdComponente" serial NOT NULL,
    PRIMARY KEY ("iIdEntregable", "iIdComponente"),
    CONSTRAINT "FK_EntregableComp_Entregable" FOREIGN KEY ("iIdEntregable")
        REFERENCES public."Entregable" ("iIdEntregable") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION,
    CONSTRAINT "FK_EntregableComp_Comp" FOREIGN KEY ("iIdComponente")
        REFERENCES public."Componente" ("iIdComponente") MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)
WITH (
    OIDS = FALSE
);

ALTER TABLE public."EntregableComponente"
    OWNER to postgres;