-- Campo para establecer el porcentaje de ponderación de avance del entregable
ALTER TABLE public."DetalleEntregable"
    ADD COLUMN "iPonderacion" integer NOT NULL DEFAULT 0;
-- Campo para saber la cantidad de avance por actividad
ALTER TABLE public."DetalleActividad"
    ADD COLUMN "nAvance" numeric(10, 2) NOT NULL DEFAULT 0.00;