ALTER TABLE "public"."PED2019Eje" 
  ADD COLUMN "vIcono" varchar(100) DEFAULT '';

ALTER TABLE "public"."PED2019Tema" 
  ADD COLUMN "vIcono" varchar(100) DEFAULT '';
  
UPDATE "PED2019Eje" SET "vIcono" = 'public/img/icons/desca/economia-inclusiva.png' WHERE "iIdEje" =1;
UPDATE "PED2019Eje" SET "vIcono" = 'public/img/icons/desca/calidad-de-vida.png' WHERE "iIdEje" =2;
UPDATE "PED2019Eje" SET "vIcono" = 'public/img/icons/desca/cultural.png' WHERE "iIdEje" =3;
UPDATE "PED2019Eje" SET "vIcono" = 'public/img/icons/desca/verde.png' WHERE "iIdEje" =4;
UPDATE "PED2019Eje" SET "vIcono" = 'public/img/icons/desca/igualdad.png' WHERE "iIdEje" =5;
UPDATE "PED2019Eje" SET "vIcono" = 'public/img/icons/desca/innovacion.png' WHERE "iIdEje" =6;
UPDATE "PED2019Eje" SET "vIcono" = 'public/img/icons/desca/paz.png' WHERE "iIdEje" =7;
UPDATE "PED2019Eje" SET "vIcono" = 'public/img/icons/desca/gobierno.png' WHERE "iIdEje" =8;
UPDATE "PED2019Eje" SET "vIcono" = 'public/img/icons/desca/ciudades.png' WHERE "iIdEje" =9;

UPDATE "PED2019Tema" SET "vIcono" = 'public/img/icons/desca/eco-desarrollo-comercial.png' WHERE "iIdTema" =1;
UPDATE "PED2019Tema" SET "vIcono" = 'public/img/icons/desca/eco-competitividad.png' WHERE "iIdTema" =2;
UPDATE "PED2019Tema" SET "vIcono" = 'public/img/icons/desca/eco-desarrollo-industrial.png' WHERE "iIdTema" =3;
UPDATE "PED2019Tema" SET "vIcono" = 'public/img/icons/desca/eco-impulso-al-turismo.png' WHERE "iIdTema" =4;
UPDATE "PED2019Tema" SET "vIcono" = 'public/img/icons/desca/eco-capital-humano.png' WHERE "iIdTema" =5;
UPDATE "PED2019Tema" SET "vIcono" = 'public/img/icons/desca/eco-fomento-empresarial.png' WHERE "iIdTema" =6;
UPDATE "PED2019Tema" SET "vIcono" = 'public/img/icons/desca/eco-desarrollo-agropecuario.png' WHERE "iIdTema" =7;
UPDATE "PED2019Tema" SET "vIcono" = 'public/img/icons/desca/eco-desarrollo-pesquero.png' WHERE "iIdTema" =8;
UPDATE "PED2019Tema" SET "vIcono" = 'public/img/icons/desca/cal-salud-y-bienestar.png' WHERE "iIdTema" =9;
UPDATE "PED2019Tema" SET "vIcono" = 'public/img/icons/desca/cal-hambre-cero.png' WHERE "iIdTema" =10;
UPDATE "PED2019Tema" SET "vIcono" = 'public/img/icons/desca/cal-pueblos-indigenas.png' WHERE "iIdTema" =11;
UPDATE "PED2019Tema" SET "vIcono" = 'public/img/icons/desca/cal-seguridad-social.png' WHERE "iIdTema" =12;
UPDATE "PED2019Tema" SET "vIcono" = 'public/img/icons/desca/cal-acceso-a-la-vivienda.png' WHERE "iIdTema" =13;
UPDATE "PED2019Tema" SET "vIcono" = 'public/img/icons/desca/cal-seguridad-social.png' WHERE "iIdTema" =14;
UPDATE "PED2019Tema" SET "vIcono" = 'public/img/icons/desca/cul-acceso-universal-a-la-cultura.png' WHERE "iIdTema" =15;
UPDATE "PED2019Tema" SET "vIcono" = 'public/img/icons/desca/cul-cultura-tradicional.png' WHERE "iIdTema" =16;
UPDATE "PED2019Tema" SET "vIcono" = 'public/img/icons/desca/cul-bellas-artes.png' WHERE "iIdTema" =17;
UPDATE "PED2019Tema" SET "vIcono" = 'public/img/icons/desca/cul-educacion-artistica-y-cultural.png' WHERE "iIdTema" =18;
UPDATE "PED2019Tema" SET "vIcono" = 'public/img/icons/desca/cul-patrimonio-cultural.png' WHERE "iIdTema" =19;
UPDATE "PED2019Tema" SET "vIcono" = 'public/img/icons/desca/cul-fomento-al-deporte.png' WHERE "iIdTema" =20;
UPDATE "PED2019Tema" SET "vIcono" = 'public/img/icons/desca/ver-conservacion-de-recursos-naturales.png' WHERE "iIdTema" =21;
UPDATE "PED2019Tema" SET "vIcono" = 'public/img/icons/desca/ver-accion-por-el-clima.png' WHERE "iIdTema" =22;
UPDATE "PED2019Tema" SET "vIcono" = 'public/img/icons/desca/ver-agua-limpia.png' WHERE "iIdTema" =23;
UPDATE "PED2019Tema" SET "vIcono" = 'public/img/icons/desca/cul-manejo-integral-de-residuos.png' WHERE "iIdTema" =24;
UPDATE "PED2019Tema" SET "vIcono" = 'public/img/icons/desca/cul-energia-asequible.png' WHERE "iIdTema" =25;
UPDATE "PED2019Tema" SET "vIcono" = 'public/img/icons/desca/ver-vida-submarina.png' WHERE "iIdTema" =26;
UPDATE "PED2019Tema" SET "vIcono" = 'public/img/icons/desca/ver-movilidad-sustentable.png' WHERE "iIdTema" =27;
