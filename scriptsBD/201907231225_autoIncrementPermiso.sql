--AutoIncrement Permiso
CREATE SEQUENCE id_permiso_seq;
ALTER TABLE "Permiso" ALTER COLUMN "iIdPermiso" SET DEFAULT nextval('id_permiso_seq');
ALTER TABLE "Permiso" ALTER COLUMN "iIdPermiso" SET NOT NULL;
ALTER SEQUENCE id_permiso_seq OWNED BY "Permiso"."iIdPermiso";
ALTER SEQUENCE id_permiso_seq RESTART WITH 27;