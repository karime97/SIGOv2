
-- Tabla MaxNivelAcademico
Create table "MaxNivelAcademico"(
	"iIdMaxNivelAcademico" serial not null,
	"vNivelAcademico" varchar(255),
	"iActivo" int,
	primary key("iIdMaxNivelAcademico")
);

-- Tabla FormacionAcademica
Create table "FormacionAcademica"(
          "iIdFormacionAcademica" serial not null,
          "vFormacionAcademica" varchar(255),
          "iActivo" int,
	  primary key("iIdFormacionAcademica" )
);


ALTER TABLE public."Usuario"
    ADD COLUMN "iIdMaxNivelAcademico" integer;

ALTER TABLE public."Usuario"
    ADD COLUMN "iIdFormacionAcademica" integer;
ALTER TABLE public."Usuario"
    ADD CONSTRAINT "FK_Usuario_MaxNivelAca" FOREIGN KEY ("iIdMaxNivelAcademico")
    REFERENCES public."MaxNivelAcademico" ("iIdMaxNivelAcademico") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;

ALTER TABLE public."Usuario"
    ADD CONSTRAINT "FK_Usuario_FormAca" FOREIGN KEY ("iIdFormacionAcademica")
    REFERENCES public."FormacionAcademica" ("iIdFormacionAcademica") MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION;