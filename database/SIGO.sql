--
-- PostgreSQL database dump
--

-- Dumped from database version 10.5
-- Dumped by pg_dump version 10.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: Actividad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Actividad" (
    "iIdActividad" integer NOT NULL,
    "vActividad" character varying(255) NOT NULL,
    "vObjetivo" text,
    "vPoblacionObjetivo" text,
    "vDescripcion" text,
    "iActivo" smallint DEFAULT 1 NOT NULL,
    "iIdDependencia" integer NOT NULL
);


ALTER TABLE public."Actividad" OWNER TO postgres;

--
-- Name: ActividadLineaAccion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ActividadLineaAccion" (
    "iIdActividad" integer NOT NULL,
    "iIdLineaAccion" integer NOT NULL,
    "tInforme1" text,
    "tInforme2" text,
    "tInforme3" text,
    "tInforme4" text
);


ALTER TABLE public."ActividadLineaAccion" OWNER TO postgres;

--
-- Name: Avance; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Avance" (
    "iIdAvance" integer NOT NULL,
    "iIdDetalleEntregable" integer NOT NULL,
    "dFecha" date NOT NULL,
    "nAvance" double precision NOT NULL,
    "nEjercido" double precision NOT NULL,
    "nBeneficiariosH" integer NOT NULL,
    "vObservaciones" character varying(255),
    "iAprobado" smallint DEFAULT 0 NOT NULL,
    "iMunicipio" integer DEFAULT 0 NOT NULL,
    "iActivo" smallint DEFAULT 1 NOT NULL,
    "iIdUsuarioActualiza" integer DEFAULT 0 NOT NULL,
    "dFechaActualiza" timestamp without time zone,
    "iIdUsuarioAprueba" integer DEFAULT 0 NOT NULL,
    "dFechaAprueba" timestamp without time zone,
    "nBeneficiariosM" integer NOT NULL,
    "nDiscapacitadosH" integer NOT NULL,
    "nDiscapacitadosM" integer NOT NULL,
    "nLenguaH" integer NOT NULL,
    "nLenguaM" integer NOT NULL
);


ALTER TABLE public."Avance" OWNER TO postgres;

--
-- Name: Componente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Componente" (
    "iIdComponente" integer NOT NULL,
    "vComponente" character varying(500) NOT NULL,
    "vDescripcion" text NOT NULL,
    "nPonderacion" numeric(5,2) NOT NULL,
    "nAvance" numeric(5,2),
    "iIdCompromiso" integer NOT NULL,
    "iIdUnidadMedida" integer NOT NULL,
    "nMeta" numeric(10,2) DEFAULT 0 NOT NULL,
    "iOrden" integer DEFAULT 0 NOT NULL,
    "iActivo" smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public."Componente" OWNER TO postgres;

--
-- Name: ComponentePag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ComponentePag" (
    "iIdComponente" integer NOT NULL,
    "vComponente" character varying(500) NOT NULL,
    "vDescripcion" text NOT NULL,
    "nPonderacion" numeric(5,2) NOT NULL,
    "nAvance" numeric(5,2),
    "iIdCompromiso" integer NOT NULL,
    "iIdUnidadMedida" integer NOT NULL,
    "nMeta" numeric(10,2) DEFAULT 0 NOT NULL,
    "iOrden" integer DEFAULT 0 NOT NULL
);


ALTER TABLE public."ComponentePag" OWNER TO postgres;

--
-- Name: ComponentePag_iIdComponente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."ComponentePag_iIdComponente_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."ComponentePag_iIdComponente_seq" OWNER TO postgres;

--
-- Name: ComponentePag_iIdComponente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."ComponentePag_iIdComponente_seq" OWNED BY public."ComponentePag"."iIdComponente";


--
-- Name: ComponenteUBP; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ComponenteUBP" (
    "iIdComponente" integer NOT NULL,
    "iIdUbp" integer NOT NULL,
    "nMonto" numeric(20,2) NOT NULL
);


ALTER TABLE public."ComponenteUBP" OWNER TO postgres;

--
-- Name: Componente_iIdComponente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Componente_iIdComponente_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Componente_iIdComponente_seq" OWNER TO postgres;

--
-- Name: Componente_iIdComponente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Componente_iIdComponente_seq" OWNED BY public."Componente"."iIdComponente";


--
-- Name: Compromiso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Compromiso" (
    "iIdCompromiso" integer NOT NULL,
    "vCompromiso" character varying(800) NOT NULL,
    "iNumero" integer NOT NULL,
    "iRevisado" smallint NOT NULL,
    "dPorcentajeAvance" numeric(5,2) DEFAULT 0 NOT NULL,
    "iIdDependencia" integer NOT NULL,
    "vFeNotarial" character varying(50) NOT NULL,
    "vNombreCorto" character varying(500) NOT NULL,
    "dUltimaAct" timestamp without time zone,
    "vDescripcion" text NOT NULL,
    "iUltUsuarioAct" integer,
    "iUltUsuarioRev" integer,
    "iIdTema" integer NOT NULL,
    "vAntes" text NOT NULL,
    "vDespues" text NOT NULL,
    "iActivo" smallint DEFAULT 1 NOT NULL,
    "vObservaciones" text NOT NULL
);


ALTER TABLE public."Compromiso" OWNER TO postgres;

--
-- Name: TABLE "Compromiso"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Compromiso" IS 'Compromisos del gobernador';


--
-- Name: COLUMN "Compromiso"."iRevisado"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Compromiso"."iRevisado" IS '1=Si, 0=No';


--
-- Name: CompromisoCorresponsable; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CompromisoCorresponsable" (
    "iIdCompromiso" integer NOT NULL,
    "iIdDependencia" integer NOT NULL
);


ALTER TABLE public."CompromisoCorresponsable" OWNER TO postgres;

--
-- Name: CompromisoCorresponsablePag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CompromisoCorresponsablePag" (
    "iIdCompromiso" integer NOT NULL,
    "iIdDependencia" integer NOT NULL
);


ALTER TABLE public."CompromisoCorresponsablePag" OWNER TO postgres;

--
-- Name: CompromisoPag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."CompromisoPag" (
    "iIdCompromiso" integer NOT NULL,
    "vCompromiso" character varying(800) NOT NULL,
    "iNumero" integer NOT NULL,
    "iEstatus" integer NOT NULL,
    "dPorcentajeAvance" numeric(5,2) DEFAULT 0 NOT NULL,
    "iIdDependencia" integer NOT NULL,
    "vFeNotarial" character varying(50) NOT NULL,
    "vNombreCorto" character varying(500) NOT NULL,
    "dUltimaAct" timestamp without time zone,
    "vDescripcion" text NOT NULL,
    "iUltUsuarioAct" integer,
    "iIdTema" integer NOT NULL,
    "vAntes" text NOT NULL,
    "vDespues" text NOT NULL
);


ALTER TABLE public."CompromisoPag" OWNER TO postgres;

--
-- Name: TABLE "CompromisoPag"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."CompromisoPag" IS 'Compromisos del gobernador';


--
-- Name: COLUMN "CompromisoPag"."iEstatus"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."CompromisoPag"."iEstatus" IS '"Sin iniciar", "En cumplimiento", "Cumplido"';


--
-- Name: CompromisoPag_iIdCompromiso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."CompromisoPag_iIdCompromiso_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."CompromisoPag_iIdCompromiso_seq" OWNER TO postgres;

--
-- Name: CompromisoPag_iIdCompromiso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."CompromisoPag_iIdCompromiso_seq" OWNED BY public."CompromisoPag"."iIdCompromiso";


--
-- Name: Compromiso_iIdCompromiso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Compromiso_iIdCompromiso_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Compromiso_iIdCompromiso_seq" OWNER TO postgres;

--
-- Name: Compromiso_iIdCompromiso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Compromiso_iIdCompromiso_seq" OWNED BY public."Compromiso"."iIdCompromiso";


--
-- Name: Dependencia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Dependencia" (
    "iIdDependencia" integer NOT NULL,
    "vDependencia" character varying(255) NOT NULL,
    "vNombreCorto" character varying(100),
    "iActivo" smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public."Dependencia" OWNER TO postgres;

--
-- Name: DependenciaEje; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DependenciaEje" (
    "iIdDependencia" integer NOT NULL,
    "iIdEje" integer NOT NULL
);


ALTER TABLE public."DependenciaEje" OWNER TO postgres;

--
-- Name: DetalleActividad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DetalleActividad" (
    "iIdDetalleActividad" integer NOT NULL,
    "iIdActividad" integer NOT NULL,
    "iAnio" smallint NOT NULL,
    "dInicio" date,
    "dFin" date,
    "iActivo" smallint DEFAULT 1 NOT NULL,
    "nAvance" numeric(10,2) DEFAULT 0.00 NOT NULL
);


ALTER TABLE public."DetalleActividad" OWNER TO postgres;

--
-- Name: DetalleActividadFinanciamiento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DetalleActividadFinanciamiento" (
    "iIdDetalleActividad" integer NOT NULL,
    "iIdFinanciamiento" integer NOT NULL,
    monto numeric(20,2) DEFAULT 0 NOT NULL
);


ALTER TABLE public."DetalleActividadFinanciamiento" OWNER TO postgres;

--
-- Name: DetalleActividadUBP; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DetalleActividadUBP" (
    "iIdDetalleActividad" integer NOT NULL,
    "iIdUbp" integer NOT NULL
);


ALTER TABLE public."DetalleActividadUBP" OWNER TO postgres;

--
-- Name: DetalleEntregable; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DetalleEntregable" (
    "iIdDetalleEntregable" integer NOT NULL,
    "iIdEntregable" integer NOT NULL,
    "iIdDetalleActividad" integer NOT NULL,
    "nMeta" double precision NOT NULL,
    "iActivo" smallint NOT NULL,
    "iPonderacion" integer DEFAULT 0 NOT NULL
);


ALTER TABLE public."DetalleEntregable" OWNER TO postgres;

--
-- Name: DetalleEntregableMetaMunicipio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."DetalleEntregableMetaMunicipio" (
    "iIdDetalleEntregable" integer NOT NULL,
    "iIdMunicipio" integer NOT NULL,
    "nMeta" double precision NOT NULL
);


ALTER TABLE public."DetalleEntregableMetaMunicipio" OWNER TO postgres;

--
-- Name: Entregable; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Entregable" (
    "iIdEntregable" integer NOT NULL,
    "vEntregable" character varying(350) NOT NULL,
    "iIdUnidadMedida" integer NOT NULL,
    "iIdPeriodicidad" integer NOT NULL,
    "iMunicipalizacion" smallint DEFAULT 1 NOT NULL,
    "iMismosBeneficiarios" smallint DEFAULT 0 NOT NULL,
    "iActivo" smallint DEFAULT 1 NOT NULL,
    "iIdDependencia" integer NOT NULL,
    "iIdSujetoAfectado" integer NOT NULL
);


ALTER TABLE public."Entregable" OWNER TO postgres;

--
-- Name: COLUMN "Entregable"."iMismosBeneficiarios"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Entregable"."iMismosBeneficiarios" IS 'Reporta los mismos beneficiarios: 1= Sí, 0=No';


--
-- Name: EntregableComponente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."EntregableComponente" (
    "iIdEntregable" integer NOT NULL,
    "iIdComponente" integer NOT NULL
);


ALTER TABLE public."EntregableComponente" OWNER TO postgres;

--
-- Name: EntregableComponente_iIdComponente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."EntregableComponente_iIdComponente_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."EntregableComponente_iIdComponente_seq" OWNER TO postgres;

--
-- Name: EntregableComponente_iIdComponente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."EntregableComponente_iIdComponente_seq" OWNED BY public."EntregableComponente"."iIdComponente";


--
-- Name: EntregableComponente_iIdEntregable_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."EntregableComponente_iIdEntregable_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."EntregableComponente_iIdEntregable_seq" OWNER TO postgres;

--
-- Name: EntregableComponente_iIdEntregable_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."EntregableComponente_iIdEntregable_seq" OWNED BY public."EntregableComponente"."iIdEntregable";


--
-- Name: Estatus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Estatus" (
    "iIdEstatus" integer NOT NULL,
    "vEstatus" character varying(100) NOT NULL,
    "iActivo" smallint DEFAULT 1 NOT NULL,
    "vEntidadMide" character varying(100) NOT NULL
);


ALTER TABLE public."Estatus" OWNER TO postgres;

--
-- Name: TABLE "Estatus"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public."Estatus" IS 'Estatus usados en el sistema';


--
-- Name: Estatus_iIdEstatus_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Estatus_iIdEstatus_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Estatus_iIdEstatus_seq" OWNER TO postgres;

--
-- Name: Estatus_iIdEstatus_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Estatus_iIdEstatus_seq" OWNED BY public."Estatus"."iIdEstatus";


--
-- Name: Evidencia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Evidencia" (
    "iIdEvidencia" integer NOT NULL,
    "iIdComponente" integer NOT NULL,
    "vEvidencia" character varying(200) NOT NULL,
    "iEstatus" integer NOT NULL,
    "vTipo" character varying(50) NOT NULL,
    "dFechaSubida" timestamp without time zone NOT NULL,
    "dFechaRevision" timestamp without time zone,
    "iFotoInicio" smallint DEFAULT 0 NOT NULL,
    "iOrdenFoto" smallint DEFAULT 0 NOT NULL,
    "iIdUsuarioSube" integer,
    "iIdUsuarioRevisa" integer,
    "iActivo" smallint NOT NULL
);


ALTER TABLE public."Evidencia" OWNER TO postgres;

--
-- Name: COLUMN "Evidencia"."iEstatus"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Evidencia"."iEstatus" IS '"Nuevo","Rechazado","Aprobado","Pubicado"';


--
-- Name: COLUMN "Evidencia"."vTipo"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Evidencia"."vTipo" IS '"Documento","Fotografía","Video"';


--
-- Name: COLUMN "Evidencia"."iFotoInicio"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Evidencia"."iFotoInicio" IS '1=Sí, 0=No';


--
-- Name: COLUMN "Evidencia"."iOrdenFoto"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Evidencia"."iOrdenFoto" IS 'Determina el orden de las fotos de inicio';


--
-- Name: COLUMN "Evidencia"."iIdUsuarioSube"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Evidencia"."iIdUsuarioSube" IS 'Indica el id del usuario que subió el archivo';


--
-- Name: COLUMN "Evidencia"."iIdUsuarioRevisa"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Evidencia"."iIdUsuarioRevisa" IS 'Indica el id del usuario que revisó';


--
-- Name: COLUMN "Evidencia"."iActivo"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Evidencia"."iActivo" IS '1=Activo, 0=Inactivo';


--
-- Name: EvidenciaPag; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."EvidenciaPag" (
    "iIdEvidencia" integer NOT NULL,
    "iIdComponente" integer NOT NULL,
    "vEvidencia" character varying(200) NOT NULL,
    "vTipo" character varying(50) NOT NULL,
    "dFechaSubida" timestamp without time zone NOT NULL,
    "dFechaRevision" timestamp without time zone,
    "iFotoInicio" smallint DEFAULT 0 NOT NULL,
    "iOrdenFoto" smallint DEFAULT 0 NOT NULL,
    "iIdUsuarioSube" integer,
    "iIdUsuarioRevisa" integer
);


ALTER TABLE public."EvidenciaPag" OWNER TO postgres;

--
-- Name: COLUMN "EvidenciaPag"."vTipo"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."EvidenciaPag"."vTipo" IS '"Documento","Fotografía","Video"';


--
-- Name: COLUMN "EvidenciaPag"."iOrdenFoto"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."EvidenciaPag"."iOrdenFoto" IS 'Determina el orden de las fotos de inicio';


--
-- Name: COLUMN "EvidenciaPag"."iIdUsuarioSube"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."EvidenciaPag"."iIdUsuarioSube" IS 'Indica el id del usuario que subió el archivo';


--
-- Name: COLUMN "EvidenciaPag"."iIdUsuarioRevisa"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."EvidenciaPag"."iIdUsuarioRevisa" IS 'Indica el id del usuario que revisó';


--
-- Name: EvidenciaPag_iIdEvidencia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."EvidenciaPag_iIdEvidencia_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."EvidenciaPag_iIdEvidencia_seq" OWNER TO postgres;

--
-- Name: EvidenciaPag_iIdEvidencia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."EvidenciaPag_iIdEvidencia_seq" OWNED BY public."EvidenciaPag"."iIdEvidencia";


--
-- Name: Evidencia_iIdEvidencia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Evidencia_iIdEvidencia_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Evidencia_iIdEvidencia_seq" OWNER TO postgres;

--
-- Name: Evidencia_iIdEvidencia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Evidencia_iIdEvidencia_seq" OWNED BY public."Evidencia"."iIdEvidencia";


--
-- Name: Financiamiento; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Financiamiento" (
    "iIdFinanciamiento" integer NOT NULL,
    "vClave" character varying(5) NOT NULL,
    "vFinanciamiento" character varying(255) NOT NULL,
    "iAnio" smallint DEFAULT 0 NOT NULL,
    "iActivo" smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public."Financiamiento" OWNER TO postgres;

--
-- Name: FormacionAcademica; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."FormacionAcademica" (
    "iIdFormacionAcademica" integer NOT NULL,
    "vFormacionAcademica" character varying(255),
    "iActivo" integer
);


ALTER TABLE public."FormacionAcademica" OWNER TO postgres;

--
-- Name: FormacionAcademica_iIdFormacionAcademica_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."FormacionAcademica_iIdFormacionAcademica_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."FormacionAcademica_iIdFormacionAcademica_seq" OWNER TO postgres;

--
-- Name: FormacionAcademica_iIdFormacionAcademica_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."FormacionAcademica_iIdFormacionAcademica_seq" OWNED BY public."FormacionAcademica"."iIdFormacionAcademica";


--
-- Name: MaxNivelAcademico; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."MaxNivelAcademico" (
    "iIdMaxNivelAcademico" integer NOT NULL,
    "vNivelAcademico" character varying(255),
    "iActivo" integer
);


ALTER TABLE public."MaxNivelAcademico" OWNER TO postgres;

--
-- Name: MaxNivelAcademico_iIdMaxNivelAcademico_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."MaxNivelAcademico_iIdMaxNivelAcademico_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."MaxNivelAcademico_iIdMaxNivelAcademico_seq" OWNER TO postgres;

--
-- Name: MaxNivelAcademico_iIdMaxNivelAcademico_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."MaxNivelAcademico_iIdMaxNivelAcademico_seq" OWNED BY public."MaxNivelAcademico"."iIdMaxNivelAcademico";


--
-- Name: Municipio; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Municipio" (
    "iIdMunicipio" integer NOT NULL,
    "vClave" character varying(3) NOT NULL,
    "vMunicipio" character varying(100) NOT NULL,
    "iIdRegion" integer NOT NULL
);


ALTER TABLE public."Municipio" OWNER TO postgres;

--
-- Name: ODS; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ODS" (
    "iIdOds" integer NOT NULL,
    "iNumero" smallint NOT NULL,
    "vOds" character varying(255) NOT NULL
);


ALTER TABLE public."ODS" OWNER TO postgres;

--
-- Name: PED2019Eje; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PED2019Eje" (
    "iIdEje" integer NOT NULL,
    "vEje" character varying(100) NOT NULL,
    "vIcono" character varying(100) DEFAULT ''::character varying
);


ALTER TABLE public."PED2019Eje" OWNER TO postgres;

--
-- Name: PED2019Estrategia; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PED2019Estrategia" (
    "iIdEstrategia" integer NOT NULL,
    "vEstrategia" character varying(500) NOT NULL,
    "iIdObjetivo" integer NOT NULL
);


ALTER TABLE public."PED2019Estrategia" OWNER TO postgres;

--
-- Name: PED2019LineaAccion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PED2019LineaAccion" (
    "iIdLineaAccion" integer NOT NULL,
    "vLineaAccion" character varying(500) NOT NULL,
    "iIdEstrategia" integer NOT NULL,
    "iIdOds" integer NOT NULL
);


ALTER TABLE public."PED2019LineaAccion" OWNER TO postgres;

--
-- Name: PED2019Objetivo; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PED2019Objetivo" (
    "iIdObjetivo" integer NOT NULL,
    "vObjetivo" character varying(255) NOT NULL,
    "iIdTema" integer NOT NULL
);


ALTER TABLE public."PED2019Objetivo" OWNER TO postgres;

--
-- Name: PED2019Tema; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."PED2019Tema" (
    "iIdTema" integer NOT NULL,
    "vTema" character varying(255) NOT NULL,
    "iIdEje" integer NOT NULL,
    "vIcono" character varying(100) DEFAULT ''::character varying
);


ALTER TABLE public."PED2019Tema" OWNER TO postgres;

--
-- Name: Parametro; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Parametro" (
    "iIdParametro" integer NOT NULL,
    "vValor" text,
    "vParametro" character varying(250) NOT NULL,
    "vDescripcion" character varying(250) NOT NULL,
    "iActivo" smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public."Parametro" OWNER TO postgres;

--
-- Name: COLUMN "Parametro"."iActivo"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Parametro"."iActivo" IS '0=Inactivo, 1=Activo';


--
-- Name: Parametro_iIdParametro_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."Parametro_iIdParametro_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Parametro_iIdParametro_seq" OWNER TO postgres;

--
-- Name: Parametro_iIdParametro_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."Parametro_iIdParametro_seq" OWNED BY public."Parametro"."iIdParametro";


--
-- Name: Periodicidad; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Periodicidad" (
    "iIdPeriodicidad" integer NOT NULL,
    "vPeriodicidad" character varying(100) NOT NULL,
    "iActivo" smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public."Periodicidad" OWNER TO postgres;

--
-- Name: Permiso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Permiso" (
    "iIdPermiso" integer NOT NULL,
    "vIdentificador" character varying(50) NOT NULL,
    "vPermiso" character varying(100) NOT NULL,
    "vDescripcion" character varying(255),
    "iTipo" smallint DEFAULT 1 NOT NULL,
    "vUrl" character varying(255) NOT NULL,
    "iIdPermisoPadre" integer DEFAULT 0 NOT NULL,
    "vClass" character varying(100),
    "iOrden" smallint DEFAULT 0 NOT NULL,
    "iActivo" smallint DEFAULT 1 NOT NULL,
    "iInicial" smallint DEFAULT 0 NOT NULL
);


ALTER TABLE public."Permiso" OWNER TO postgres;

--
-- Name: COLUMN "Permiso"."iTipo"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Permiso"."iTipo" IS '1=Permiso de Menú, 2=Acción';


--
-- Name: COLUMN "Permiso"."vUrl"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Permiso"."vUrl" IS 'Link al controlador si es del tipo menú o cadena vacía si es del tipo acción';


--
-- Name: COLUMN "Permiso"."iIdPermisoPadre"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Permiso"."iIdPermisoPadre" IS 'Sirve para generar las opciones del SubMenú, hace referencia a si misma';


--
-- Name: COLUMN "Permiso"."vClass"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Permiso"."vClass" IS 'Para el tipo menu, aplica estilo o icono a la opción';


--
-- Name: COLUMN "Permiso"."iOrden"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Permiso"."iOrden" IS 'Establece el orden de las opciones del menú';


--
-- Name: COLUMN "Permiso"."iInicial"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Permiso"."iInicial" IS 'De acuerdo a los permisos y el orden, se muestra como pantalla inicial del sistema';


--
-- Name: ProgramaPresupuestario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."ProgramaPresupuestario" (
    "iIdProgramaPresupuestario" integer NOT NULL,
    "vProgramaPresupuestario" character varying(255) NOT NULL,
    "iActivo" smallint DEFAULT 1 NOT NULL,
    "iNumero" smallint NOT NULL
);


ALTER TABLE public."ProgramaPresupuestario" OWNER TO postgres;

--
-- Name: Region; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Region" (
    "iIdRegion" integer NOT NULL,
    "vRegion" character varying(100) NOT NULL,
    "iActivo" smallint DEFAULT 1 NOT NULL,
    "iPoblacion" integer DEFAULT 0 NOT NULL
);


ALTER TABLE public."Region" OWNER TO postgres;

--
-- Name: Rol; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Rol" (
    "iIdRol" integer NOT NULL,
    "vRol" character varying(100) NOT NULL,
    "iActivo" smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public."Rol" OWNER TO postgres;

--
-- Name: RolPermiso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."RolPermiso" (
    "iIdRol" integer NOT NULL,
    "iIdPermiso" integer NOT NULL,
    "iTipoAcceso" smallint DEFAULT 2 NOT NULL
);


ALTER TABLE public."RolPermiso" OWNER TO postgres;

--
-- Name: SujetoAfectado; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."SujetoAfectado" (
    "iIdSujetoAfectado" integer NOT NULL,
    "vSujetoAfectado" character varying(100) NOT NULL,
    "iActivo" smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public."SujetoAfectado" OWNER TO postgres;

--
-- Name: TipoUBP; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."TipoUBP" (
    "iIdTipoUbp" integer NOT NULL,
    "vTipoUbp" character varying NOT NULL,
    "iActivo" smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public."TipoUBP" OWNER TO postgres;

--
-- Name: UBP; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."UBP" (
    "iIdUbp" integer NOT NULL,
    "vClave" character varying(5) NOT NULL,
    "vUBP" character varying(255) NOT NULL,
    "iAnio" smallint NOT NULL,
    "iActivo" smallint DEFAULT 1 NOT NULL,
    "iIdTipoUbp" integer NOT NULL,
    "iIdDependencia" integer NOT NULL,
    "iIdProgramaPresupuestario" integer NOT NULL
);


ALTER TABLE public."UBP" OWNER TO postgres;

--
-- Name: UnidadMedida; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."UnidadMedida" (
    "iIdUnidadMedida" integer NOT NULL,
    "vUnidadMedida" character varying(100) NOT NULL,
    "iActivo" smallint DEFAULT 1 NOT NULL
);


ALTER TABLE public."UnidadMedida" OWNER TO postgres;

--
-- Name: Usuario; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Usuario" (
    "iIdUsuario" integer NOT NULL,
    "vNombre" character varying(255) NOT NULL,
    "vPrimerApellido" character varying(100) NOT NULL,
    "vSegundoApellido" character varying(100),
    "vPassword" character varying(255) NOT NULL,
    "vCorreo" character varying(150) NOT NULL,
    "dFechaNacimiento" date,
    "vToken" character varying(255),
    "vTelefono" character varying(100),
    "vCelular" character varying(100),
    "iIdDependencia" integer,
    "vUsuario" character varying(100) NOT NULL,
    "iActivo" smallint DEFAULT 1,
    "iIdRol" integer NOT NULL,
    "vCargo" character varying(150),
    "vCorreoPersonal" character varying(150),
    "dFechaRegistro" date,
    "iIdMaxNivelAcademico" integer,
    "iIdFormacionAcademica" integer
);


ALTER TABLE public."Usuario" OWNER TO postgres;

--
-- Name: COLUMN "Usuario"."iActivo"; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON COLUMN public."Usuario"."iActivo" IS '0=No, 1 = Sí';


--
-- Name: UsuarioPermiso; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."UsuarioPermiso" (
    "iIdUsuario" integer NOT NULL,
    "iIdPermiso" integer NOT NULL,
    "iTipoAcceso" smallint DEFAULT 2
);


ALTER TABLE public."UsuarioPermiso" OWNER TO postgres;

--
-- Name: id_actividad_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_actividad_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_actividad_seq OWNER TO postgres;

--
-- Name: id_actividad_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.id_actividad_seq OWNED BY public."Actividad"."iIdActividad";


--
-- Name: id_avance_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_avance_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_avance_seq OWNER TO postgres;

--
-- Name: id_avance_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.id_avance_seq OWNED BY public."Avance"."iIdAvance";


--
-- Name: id_dependencia_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_dependencia_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_dependencia_seq OWNER TO postgres;

--
-- Name: id_dependencia_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.id_dependencia_seq OWNED BY public."Dependencia"."iIdDependencia";


--
-- Name: id_det_act_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_det_act_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_det_act_seq OWNER TO postgres;

--
-- Name: id_det_act_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.id_det_act_seq OWNED BY public."DetalleActividad"."iIdDetalleActividad";


--
-- Name: id_det_ent_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_det_ent_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_det_ent_seq OWNER TO postgres;

--
-- Name: id_det_ent_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.id_det_ent_seq OWNED BY public."DetalleEntregable"."iIdDetalleEntregable";


--
-- Name: id_entregable_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_entregable_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_entregable_seq OWNER TO postgres;

--
-- Name: id_entregable_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.id_entregable_seq OWNED BY public."Entregable"."iIdEntregable";


--
-- Name: id_financiamiento_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_financiamiento_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_financiamiento_seq OWNER TO postgres;

--
-- Name: id_financiamiento_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.id_financiamiento_seq OWNED BY public."Financiamiento"."iIdFinanciamiento";


--
-- Name: id_municipio_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_municipio_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_municipio_seq OWNER TO postgres;

--
-- Name: id_permiso_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_permiso_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_permiso_seq OWNER TO postgres;

--
-- Name: id_permiso_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.id_permiso_seq OWNED BY public."Permiso"."iIdPermiso";


--
-- Name: id_rol_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_rol_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_rol_seq OWNER TO postgres;

--
-- Name: id_rol_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.id_rol_seq OWNED BY public."Rol"."iIdRol";


--
-- Name: id_sujeto_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_sujeto_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_sujeto_seq OWNER TO postgres;

--
-- Name: id_sujeto_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.id_sujeto_seq OWNED BY public."SujetoAfectado"."iIdSujetoAfectado";


--
-- Name: id_ubp_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_ubp_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_ubp_seq OWNER TO postgres;

--
-- Name: id_ubp_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.id_ubp_seq OWNED BY public."UBP"."iIdUbp";


--
-- Name: id_usuario_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.id_usuario_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.id_usuario_seq OWNER TO postgres;

--
-- Name: id_usuario_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.id_usuario_seq OWNED BY public."Usuario"."iIdUsuario";


--
-- Name: Actividad iIdActividad; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Actividad" ALTER COLUMN "iIdActividad" SET DEFAULT nextval('public.id_actividad_seq'::regclass);


--
-- Name: Avance iIdAvance; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Avance" ALTER COLUMN "iIdAvance" SET DEFAULT nextval('public.id_avance_seq'::regclass);


--
-- Name: Componente iIdComponente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Componente" ALTER COLUMN "iIdComponente" SET DEFAULT nextval('public."Componente_iIdComponente_seq"'::regclass);


--
-- Name: ComponentePag iIdComponente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ComponentePag" ALTER COLUMN "iIdComponente" SET DEFAULT nextval('public."ComponentePag_iIdComponente_seq"'::regclass);


--
-- Name: Compromiso iIdCompromiso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Compromiso" ALTER COLUMN "iIdCompromiso" SET DEFAULT nextval('public."Compromiso_iIdCompromiso_seq"'::regclass);


--
-- Name: CompromisoPag iIdCompromiso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CompromisoPag" ALTER COLUMN "iIdCompromiso" SET DEFAULT nextval('public."CompromisoPag_iIdCompromiso_seq"'::regclass);


--
-- Name: Dependencia iIdDependencia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Dependencia" ALTER COLUMN "iIdDependencia" SET DEFAULT nextval('public.id_dependencia_seq'::regclass);


--
-- Name: DetalleActividad iIdDetalleActividad; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DetalleActividad" ALTER COLUMN "iIdDetalleActividad" SET DEFAULT nextval('public.id_det_act_seq'::regclass);


--
-- Name: DetalleEntregable iIdDetalleEntregable; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DetalleEntregable" ALTER COLUMN "iIdDetalleEntregable" SET DEFAULT nextval('public.id_det_ent_seq'::regclass);


--
-- Name: Entregable iIdEntregable; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Entregable" ALTER COLUMN "iIdEntregable" SET DEFAULT nextval('public.id_entregable_seq'::regclass);


--
-- Name: EntregableComponente iIdEntregable; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EntregableComponente" ALTER COLUMN "iIdEntregable" SET DEFAULT nextval('public."EntregableComponente_iIdEntregable_seq"'::regclass);


--
-- Name: EntregableComponente iIdComponente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EntregableComponente" ALTER COLUMN "iIdComponente" SET DEFAULT nextval('public."EntregableComponente_iIdComponente_seq"'::regclass);


--
-- Name: Estatus iIdEstatus; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Estatus" ALTER COLUMN "iIdEstatus" SET DEFAULT nextval('public."Estatus_iIdEstatus_seq"'::regclass);


--
-- Name: Evidencia iIdEvidencia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Evidencia" ALTER COLUMN "iIdEvidencia" SET DEFAULT nextval('public."Evidencia_iIdEvidencia_seq"'::regclass);


--
-- Name: EvidenciaPag iIdEvidencia; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EvidenciaPag" ALTER COLUMN "iIdEvidencia" SET DEFAULT nextval('public."EvidenciaPag_iIdEvidencia_seq"'::regclass);


--
-- Name: Financiamiento iIdFinanciamiento; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Financiamiento" ALTER COLUMN "iIdFinanciamiento" SET DEFAULT nextval('public.id_financiamiento_seq'::regclass);


--
-- Name: FormacionAcademica iIdFormacionAcademica; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FormacionAcademica" ALTER COLUMN "iIdFormacionAcademica" SET DEFAULT nextval('public."FormacionAcademica_iIdFormacionAcademica_seq"'::regclass);


--
-- Name: MaxNivelAcademico iIdMaxNivelAcademico; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MaxNivelAcademico" ALTER COLUMN "iIdMaxNivelAcademico" SET DEFAULT nextval('public."MaxNivelAcademico_iIdMaxNivelAcademico_seq"'::regclass);


--
-- Name: Parametro iIdParametro; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Parametro" ALTER COLUMN "iIdParametro" SET DEFAULT nextval('public."Parametro_iIdParametro_seq"'::regclass);


--
-- Name: Permiso iIdPermiso; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Permiso" ALTER COLUMN "iIdPermiso" SET DEFAULT nextval('public.id_permiso_seq'::regclass);


--
-- Name: Rol iIdRol; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rol" ALTER COLUMN "iIdRol" SET DEFAULT nextval('public.id_rol_seq'::regclass);


--
-- Name: SujetoAfectado iIdSujetoAfectado; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SujetoAfectado" ALTER COLUMN "iIdSujetoAfectado" SET DEFAULT nextval('public.id_sujeto_seq'::regclass);


--
-- Name: UBP iIdUbp; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UBP" ALTER COLUMN "iIdUbp" SET DEFAULT nextval('public.id_ubp_seq'::regclass);


--
-- Name: Usuario iIdUsuario; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario" ALTER COLUMN "iIdUsuario" SET DEFAULT nextval('public.id_usuario_seq'::regclass);


--
-- Data for Name: Actividad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Actividad" ("iIdActividad", "vActividad", "vObjetivo", "vPoblacionObjetivo", "vDescripcion", "iActivo", "iIdDependencia") FROM stdin;
1	Actividad 1	  	  	  	1	1
2	Actividad de prueba	\N	\N	\N	1	73
3	Actividad de prueba	\N	\N	\N	1	73
6	Actividad de prueba 2	\N	\N	\N	1	73
4	Actividad de prueba 2	Hola	\N	frf	1	73
\.


--
-- Data for Name: ActividadLineaAccion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ActividadLineaAccion" ("iIdActividad", "iIdLineaAccion", "tInforme1", "tInforme2", "tInforme3", "tInforme4") FROM stdin;
4	776	\N	\N	\N	\N
4	773	\N	\N	\N	\N
4	772	\N	\N	\N	\N
\.


--
-- Data for Name: Avance; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Avance" ("iIdAvance", "iIdDetalleEntregable", "dFecha", "nAvance", "nEjercido", "nBeneficiariosH", "vObservaciones", "iAprobado", "iMunicipio", "iActivo", "iIdUsuarioActualiza", "dFechaActualiza", "iIdUsuarioAprueba", "dFechaAprueba", "nBeneficiariosM", "nDiscapacitadosH", "nDiscapacitadosM", "nLenguaH", "nLenguaM") FROM stdin;
\.


--
-- Data for Name: Componente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Componente" ("iIdComponente", "vComponente", "vDescripcion", "nPonderacion", "nAvance", "iIdCompromiso", "iIdUnidadMedida", "nMeta", "iOrden", "iActivo") FROM stdin;
\.


--
-- Data for Name: ComponentePag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ComponentePag" ("iIdComponente", "vComponente", "vDescripcion", "nPonderacion", "nAvance", "iIdCompromiso", "iIdUnidadMedida", "nMeta", "iOrden") FROM stdin;
\.


--
-- Data for Name: ComponenteUBP; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ComponenteUBP" ("iIdComponente", "iIdUbp", "nMonto") FROM stdin;
\.


--
-- Data for Name: Compromiso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Compromiso" ("iIdCompromiso", "vCompromiso", "iNumero", "iRevisado", "dPorcentajeAvance", "iIdDependencia", "vFeNotarial", "vNombreCorto", "dUltimaAct", "vDescripcion", "iUltUsuarioAct", "iUltUsuarioRev", "iIdTema", "vAntes", "vDespues", "iActivo", "vObservaciones") FROM stdin;
\.


--
-- Data for Name: CompromisoCorresponsable; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."CompromisoCorresponsable" ("iIdCompromiso", "iIdDependencia") FROM stdin;
\.


--
-- Data for Name: CompromisoCorresponsablePag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."CompromisoCorresponsablePag" ("iIdCompromiso", "iIdDependencia") FROM stdin;
\.


--
-- Data for Name: CompromisoPag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."CompromisoPag" ("iIdCompromiso", "vCompromiso", "iNumero", "iEstatus", "dPorcentajeAvance", "iIdDependencia", "vFeNotarial", "vNombreCorto", "dUltimaAct", "vDescripcion", "iUltUsuarioAct", "iIdTema", "vAntes", "vDespues") FROM stdin;
\.


--
-- Data for Name: Dependencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Dependencia" ("iIdDependencia", "vDependencia", "vNombreCorto", "iActivo") FROM stdin;
1	Secretaría de Desarrollo Rural 	SEDER	1
2	Secretaría de Fomento Económico y Trabajo 	SEFOET	1
3	Secretaría de Fomento Turístico 	SEFOTUR	1
5	Aeropuerto de Chichen Itzá del Estado de Yucatán	 	1
6	Agencia para el Desarrollo de Yucatán 	ADY	1
7	Fideicomiso Público para el Desarrollo del Turismo de Reuniones en Yucatán 	FIDETURE	1
8	Instituto de Capacitación para el Trabajo del Estado de Yucatán 	ICATEY	1
9	Instituto Promotor de Ferias de Yucatán 	IPFY	1
10	Instituto Yucateco de Emprendedores 	IYEM	1
11	Patronato de las Unidades de Servicios Culturales y Turísticos del Estado de Yucatán 	CULTUR	1
12	Empresa Portuaria de Yucatán 	EPY	1
13	Secretaría de Desarrollo Social 	SEDESOL	1
14	Secretaría de Salud 	SSY	1
15	Secretaría de Educación del Gobierno del Estado de Yucatán 	SEGEY	1
17	Centro Estatal de Trasplantes de Yucatán 	CEETRY	1
18	Colegio de Bachilleres del Estado de Yucatán 	COBAY	1
19	Colegio de Educación Profesional Técnica del Estado de Yucatán 	CONALEP	1
21	Hospital Comunitario de Peto, Yucatán 	HCPY	1
22	Hospital Comunitario de Ticul, Yucatán 	HCTY	1
23	Hospital de la Amistad Corea-México 	HA	1
24	Hospital General de Tekax	 	1
25	Instituto de Becas y Crédito Educativo del Estado de Yucatán 	IBECEY	1
26	Instituto de Educación para Adultos del Estado de Yucatán 	IEAEY	1
27	Instituto para el Desarrollo de la Cultura Maya del Estado de Yucatán 	INDEMAYA	1
28	Junta de Asistencia Privada del Estado de Yucatán 	JAPEY	1
29	Régimen Estatal de Protección Social en Salud 	REPSSY	1
30	Sistema para el Desarrollo Integral de la Familia en Yucatán 	DIF Yucatán	1
31	Secretaría de la Cultura y las Artes 	SEDECULTA	1
32	Casa de las Artesanías del Gobierno del Estado de Yucatán 	CAEY	1
33	Escuela Superior de Artes de Yucatán 	ESAY	1
34	Fideicomiso Garante de la Orquesta Sinfónica de Yucatán 	FIGAROSY	1
35	Fideicomiso Público para la Administración del Palacio de la Música	 	1
36	Instituto del Deporte de Yucatán 	IDEY	1
37	Secretaría de Desarrollo Sustentable	SDS	1
38	Instituto de Movilidad y Desarrollo Urbano Territorial 	IMDUT	1
39	Junta de Agua Potable y Alcantarillado de Yucatán 	JAPAY	1
40	Secretaría de las Mujeres	SEMUJERES	1
41	Instituto para la Inclusión de las Personas con Discapacidad 	IIPEDEY	1
42	Secretaría de Investigación, Innovación y Educación Superior 	SIIES	1
43	Consejo de Ciencia, Innovación y Tecnología del Estado de Yucatán 	CONCIYTEY	1
44	Instituto Tecnológico Superior de Motul 	ITSM	1
45	Instituto Tecnológico Superior de Progreso 	ITSP	1
46	Instituto Tecnológico Superior de Valladolid 	ITSVA	1
47	Instituto Tecnológico Superior del Sur del Estado de Yucatán 	ITSSY	1
48	Universidad de Oriente 	UNO	1
49	Universidad Politécnica de Yucatán 	UPY	1
50	Universidad Tecnológica del Centro 	UTC	1
51	Universidad Tecnológica del Mayab 	UT del Mayab	1
52	Universidad Tecnológica del Poniente 	UTP	1
53	Universidad Tecnológica Metropolitana 	UTM	1
55	Escuela normal superior de Yucatán	 	1
56	Escuela normal de Dzidzantún	 	1
57	Escuela normal de Ticul	 	1
58	Escuela normal de Valladolid Juan de Dios Rodriguez Heredia	 	1
59	Escuela normal de educación preescolar	 	1
60	Escuela normal de educación primaria Rodolfo Menéndez de la Peña	 	1
61	Fiscalía General del Estado 	FGE	1
62	Secretaría de Seguridad Pública 	SSP	1
63	Secretaría General de Gobierno 	SGG	1
64	Consejería Juridica 	CJ	1
65	Comisión Ejecutiva Estatal de Atención a Víctimas 	CEEAV	1
66	Secretaría Ejecutiva del Sistema Estatal Anticorrupción 	SESEAY	1
67	Instituto de Seguridad Jurídica Patrimonial de Yucatán 	INSEJUPY	1
68	Instituto de Desarrollo Regional Municipal 	INDERM	1
69	Centro Estatal de Prevención al Delito de Yucatán 	CEPREDEY	1
70	Secretaría de Administración y Finanzas	SAF	1
71	Secretaría de la Contraloría General 	SECOGEY	1
72	Jefatura del Despacho del Gobernador 	JDG	1
73	Secretaría Técnica de Planeación y Evaluación 	SEPLAN	1
75	Fideicomiso Público para la Administración de la Reserva Territorial de Ucú 	Fidartu	1
76	Sistema Teleyucatán, S.A. de C.V. 	Trece TV	1
77	Agencia de Adminitración Fiscal de Yucatán	AAFY	1
78	XH-YUC 92.9 F.M. La Radio Yucateca 	IMER	1
79	Secretaría de Obras Públicas	SOP	1
80	Instituto de Infraestructura Carretera de Yucatán 	INCAY	1
81	Instituto para el Desarrollo y Certificación de la Infraestructura Física Educativa de Yucatán 	IDEFEY	1
82	Instituto para la Construcción y Conservación de Obra Pública en Yucatán 	INCCOPY	1
83	Instituto de Vivienda del Estado de Yucatán 	IVEY	1
84	Auditoría Superior del Estado de Yucatán	ASEY	1
85	Congreso del Estado de Yucatán	CEY	1
86	Comisión de Derechos Humanos del Estado de Yucatán	CODHEY	1
87	Consejo de la Judicatura del Poder Judicial del Estado de Yucatán	CONJUPOJ	1
88	Despacho del Gobernador	DG	1
16	Administración del Patrimonio de la Beneficencia Pública del Estado de Yucatán 	APBPY	1
4	Secretaría de Pesca y Acuacultura Sustentables 	SEPASY	1
20	Colegio de Estudios Científicos y Tecnológicos del Estado de Yucatán 	CECYTEY	1
54	Universidad Tecnológica Regional del Sur 	UT Regional del Sur	1
74	Instituto de Seguridad Social de los Trabajadores del Estado de Yucatán 	ISSTEY	1
89	Instituto Electoral y de Participación Ciudadana de Yucatán	IEPAC	1
90	Instituto Estatal de Acceso a la Información Pública	INAIP	1
91	Junta de Electrificación de Yucatán	JEDEY	1
92	Poder Judicial del Estado de Yucatán	PJEY	1
93	Sistema Tele Yucatán, S.A. de C.V.	STY	1
94	Tribunal Electoral del Estado de Yucatán	TEEY	1
95	Tribunal Electoral del Estado de Yucatán	TJAY	1
96	Tribunal de los Trabajadores al Servicio del Estado	TTSEY	1
97	Universidad Autónoma de Yucatán	UADY	1
98	Aeropuerto Internacional de Chichén Itzá	AICI	1
99	Centro Estatal de Capacitación, Investigación y Difusión Humanística de Yucatán	CECIDHY	1
100	Universidad Pedagógica Nacional	Upedagógica	1
101	Agencia de Administración Fiscal de Yucatán	AAFY	1
102	SOP	SOP	1
103	Dep1	Dependencia de prueba 1	1
104	Subsecretaría de Tecnologías de la Información	SUCETI	1
\.


--
-- Data for Name: DependenciaEje; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."DependenciaEje" ("iIdDependencia", "iIdEje") FROM stdin;
1	1
2	1
3	1
4	1
5	1
6	1
7	1
8	1
9	1
10	1
11	1
12	1
13	2
14	2
15	2
16	2
17	2
18	2
19	2
20	2
21	2
22	2
23	2
24	2
25	2
26	2
27	2
28	2
29	2
30	2
31	3
32	3
33	3
34	3
35	3
36	3
37	4
38	4
39	4
40	5
41	5
42	6
43	6
44	6
45	6
46	6
47	6
48	6
49	6
50	6
51	6
52	6
53	6
54	6
55	6
56	6
57	6
58	6
59	6
60	6
61	7
62	7
63	7
64	7
65	7
66	7
67	7
68	7
69	7
70	8
71	8
72	8
73	8
74	8
75	8
76	8
77	8
78	8
79	9
80	9
81	9
82	9
83	9
88	8
93	8
100	6
101	8
\.


--
-- Data for Name: DetalleActividad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."DetalleActividad" ("iIdDetalleActividad", "iIdActividad", "iAnio", "dInicio", "dFin", "iActivo", "nAvance") FROM stdin;
2	3	2019	\N	\N	1	50.00
5	6	2019	\N	\N	1	0.00
3	4	2019	2019-07-12	2019-07-19	1	0.00
\.


--
-- Data for Name: DetalleActividadFinanciamiento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."DetalleActividadFinanciamiento" ("iIdDetalleActividad", "iIdFinanciamiento", monto) FROM stdin;
\.


--
-- Data for Name: DetalleActividadUBP; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."DetalleActividadUBP" ("iIdDetalleActividad", "iIdUbp") FROM stdin;
\.


--
-- Data for Name: DetalleEntregable; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."DetalleEntregable" ("iIdDetalleEntregable", "iIdEntregable", "iIdDetalleActividad", "nMeta", "iActivo", "iPonderacion") FROM stdin;
\.


--
-- Data for Name: DetalleEntregableMetaMunicipio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."DetalleEntregableMetaMunicipio" ("iIdDetalleEntregable", "iIdMunicipio", "nMeta") FROM stdin;
\.


--
-- Data for Name: Entregable; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Entregable" ("iIdEntregable", "vEntregable", "iIdUnidadMedida", "iIdPeriodicidad", "iMunicipalizacion", "iMismosBeneficiarios", "iActivo", "iIdDependencia", "iIdSujetoAfectado") FROM stdin;
\.


--
-- Data for Name: EntregableComponente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."EntregableComponente" ("iIdEntregable", "iIdComponente") FROM stdin;
\.


--
-- Data for Name: Estatus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Estatus" ("iIdEstatus", "vEstatus", "iActivo", "vEntidadMide") FROM stdin;
7	Rechazado	1	Evidencia
1	Pendiente	1	Evidencia
3	Publicado	1	Evidencia
2	Aprobado	1	Evidencia
4	Sin iniciar	1	Compromiso
5	En cumplimiento	1	Compromiso
6	Cumplido	1	Compromiso
\.


--
-- Data for Name: Evidencia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Evidencia" ("iIdEvidencia", "iIdComponente", "vEvidencia", "iEstatus", "vTipo", "dFechaSubida", "dFechaRevision", "iFotoInicio", "iOrdenFoto", "iIdUsuarioSube", "iIdUsuarioRevisa", "iActivo") FROM stdin;
\.


--
-- Data for Name: EvidenciaPag; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."EvidenciaPag" ("iIdEvidencia", "iIdComponente", "vEvidencia", "vTipo", "dFechaSubida", "dFechaRevision", "iFotoInicio", "iOrdenFoto", "iIdUsuarioSube", "iIdUsuarioRevisa") FROM stdin;
\.


--
-- Data for Name: Financiamiento; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Financiamiento" ("iIdFinanciamiento", "vClave", "vFinanciamiento", "iAnio", "iActivo") FROM stdin;
1	1	Recursos Propios	2019	1
2	2	Fondo de Aportaciones para el Fortalecimiento de las Entidades Federativas Fafef	2019	1
3	3	Fone	2019	1
4	4	Fassa Ramo 33	2019	1
5	6	Fondo de Infraestructura Social para Entidades Fise	2019	1
6	7	Fam Asistencia Social Ramo 33	2019	1
7	8	Fam Infraestructura Educativa Básica	2019	1
8	9	Fam-IE Superior Ramo 33	2019	1
9	10	Fam Infraestructura Educativa Media Superior	2019	1
10	11	Faeta Ramo 33	2019	1
11	12	Fone Años Anteriores  Ramo 33	2019	1
12	15	Fortalecimiento a Municipios Ramo 33	2019	1
13	16	Infraestructura a Municipios Ramo 33	2019	1
14	17	Fondo de Aportaciones para la Seguridad Pública de Los Estados Fasp	2019	1
15	21	Fondo de Infraestructura Social para Entidades Fise A.A.	2019	1
16	22	Fam Infraestructura Educativa Básica A.A.	2019	1
17	28	Fam IE Superior Años Anteriores  Ramo 33	2019	1
18	30	Fassa Años Anteriores Ramo 33	2019	1
19	31	Faeta Años Anteriores Ramo 33	2019	1
20	34	Fondo de Aportaciones para la Seguridad Pública de los Estados Fasp A.A.	2019	1
21	45	Uady Subsidio Federal Años Anteriores	2019	1
22	46	Uady Subsidio Federal	2019	1
23	50	Convenio Parte Estatal	2019	1
24	53	Zona Metropolitana de la Ciudad de Mérida	2019	1
25	58	Proyectos de Desarrollo Regional Años Anteriores	2019	1
26	62	Fondo para la Accesibilidad en El Transporte Público para las Personas con Discapacidad Fotradis	2019	1
27	64	Fondo de Aportaciones para el Fortalecimiento de las Entidades Federativas Fafef A.A.	2019	1
28	69	Fondo para la Accesibilidad de las Personas con Discapacidad A.A.	2019	1
29	73	Recursos Propios de las Entidades Paraestatales	2019	1
30	79	Aportación Solidaria Estatal al Seguro Popular	2019	1
31	85	Fondo de Apoyo a Migrantes Años Anteriores	2019	1
32	90	Fideicomiso para la Infraestructura de los Estados Fies Años Anteriores	2019	1
33	94	Fideicomiso para la Infraestructura de los Estados	2019	1
35	101	Ingresos Fiscales Recursos Propios	2019	1
36	102	Fondo para el Fortalecimiento Financiero para la Inversión A.A.	2019	1
37	5001	Ingresos Fiscales Convenios Participación Estatal	2019	1
38	7901	Ingresos Fiscales Aportación Solidaria Estatal al Seguro Popular	2019	1
39	9201	Ingresos Fiscales Aportación Solidaria Liquida al Seguro Popular	2019	1
40	18001	Subsidio para el Colegio de Estudios Científicos y Tecnológicos del Estado de Yu	2019	1
41	18003	Subsidio para el Colegio de Bachilleres del Estado de Yucatán (Cobay) Años Anter	2019	1
42	18017	Programa Nacional de Becas Años Anteriores	2019	1
43	18023	Anexo Específico del Convenio de Coordinación y Colaboración Conade Años Anterio	2019	1
44	18037	Programa de Atención a la demanda Ieaey Años Anteriores	2019	1
45	18047	Programa de Fortalecimiento a la Transversalidad de la Perspectiva de Genero A.A.	2019	1
46	18057	Programa Agua Potable Alcantarillado y Saneamiento Urbano AA	2019	1
47	18060	Proagua Rural AA	2019	1
48	18067	Proyectos de Cultura (Pef) Años Anteriores	2019	1
49	18073	Programa de Infraestructura Indígena Proii Años Anteriores	2019	1
50	18075	Programa de Producción de Planta Forestal (Conafor) Años Anteriores	2019	1
51	18098	Fortaseg Años Anteriores	2019	1
52	18106	Programa de Protección Social en Salud Seguro Popular Años Anteriores	2019	1
53	18112	Instituciones Estatales de Cultura Años Anteriores	2019	1
54	18115	Programa de Fortalecimiento de la Calidad Educativa A.A.	2019	1
55	18116	Programa de Escuelas de Tiempo Completo Años Anteriores	2019	1
56	18126	Componente de Atención a desastres Naturales en el Sector Agropecuario AA	2019	1
57	18128	Modernizacion Integral del Registro Civil Años Anteriores	2019	1
58	18132	Programa Nacional de Inglés en la Educación Básica (Pnieb) Años Anteriores	2019	1
59	18138	Convenio de Apoyo Financiero para el Programa de Carrera Docente Años Anteriores	2019	1
60	18145	Programa de Estímulo a la Creación y al desarrollo Artístico Años Anteriores	2019	1
61	18149	Convenio 5% Museos o Zonas Arqueológicas Años Anteriores	2019	1
62	18174	Convenio de Colaboración de Apoyos del Fondo Nacional Emprendedor AA	2019	1
63	18180	Fondo para Fortalecer la Autonomía de la Gestión en Planteles de Educación Media Superior A.A.	2019	1
64	18186	Programa de Fortalecimiento de la Calidad en Educación Básica Años Anteriores	2019	1
65	18187	Programa Reforma Educativa A.A.	2019	1
66	18189	Apoyo Financiero del Servicio Educativo denominado Telebachillerato Comunitario AA	2019	1
67	18192	Apoyo Financiero Extraordinario No Regularizable Años Anteriores	2019	1
68	18202	Programa para la Inclusión y la Equidad Educativa Años Anteriores	2019	1
69	18215	Beca de Apoyo a la Práctica Intensiva y al Servicio Social	2019	1
70	18216	Convenio de Coordinación para la Creación Operación y  Apoyo Financiero del Icaty Años Anteriores	2019	1
71	18217	Programa Nacional Convivencia Escolar A.A.	2019	1
72	18223	Convenio de Coordinación para la Implementación del Programa parae el desarrollo  Profesional Docente Tipo Básico A.A.	2019	1
73	18229	Programa de Infraestructura en Su Vertiente Ampliación Mejoramiento de la Vivienda de la Sedatu	2019	1
74	18230	Fondo Institucional de Fomento Regional para el desarrollo Científico Tecnológico y de Innovación Fordecyt AA	2019	1
75	18231	Convenio de Apoyo Financiero para el Reconocimiento de la Plantilla Uady Años Anteriores	2019	1
76	18232	Programa Fortalecimiento de la Calidad Educativa Pacten A.A.	2019	1
77	18244	Programa de Apoyo a la Infraestructura Hidroagrícola Conagua Años Anteriores	2019	1
78	18245	Convenio de Coordinación para el Otorgamiento del Subsidio para el Fortalecimiento del Centro de Justicia para las Mujeres de Yucatán Años Anteriores	2019	1
79	18246	Programa de Apoyo al desarrollo de la Educación Superior (Pades) Años Anteriores	2019	1
80	19001	Subsidio para el Colegio de Estudios Científicos y Tecnológicos del Estado de Yucatán (Cecitey)	2019	1
81	19003	Subsidio para el Colegio de Bachilleres del Estado de Yucatán (Cobay)	2019	1
82	19004	Programa de Incubación de Empresas de Tecnologías de la Información (Incubatics)	2019	1
83	19012	Programa de Estrategia Integral de desarrollo Comunitario Comunidad Diferente	2019	1
84	19017	Programa Nacional de Becas	2019	1
85	19023	Anexo Específico del Convenio de Coordinación y Colaboración Conade	2019	1
86	19037	Programa de Atención a la demanda (Ieaey)	2019	1
87	19046	Programa de Apoyo a las Instancias de Mujeres en las Entidades Federativas para Ejecutar Acciones de Prevención de la Violencia Contra las Mujeres Paimef	2019	1
88	19047	Programa de Fortalecimiento a la Transversalidad de la Perspectiva de Género	2019	1
89	19059	Proagua Agua Limpia	2019	1
90	19062	Extensión e Innovación Productiva	2019	1
91	19063	Conservación y Uso Sustentable de Suelo y Agua Coussa	2019	1
92	19064	Programa de Sanidad e Inocuidad Agroalimentaria	2019	1
93	19065	Proyecto Estratégico de Seguridad Alimentaria Pesa	2019	1
94	19081	Apoyos Financieros para la Universidad de Oriente	2019	1
95	19086	Proyectos de Construcción de Carreteras Alimentadoras y Caminos Rurales	2019	1
96	19091	Apoyos Financieros para la Universidad Tecnólogica Metropolitana	2019	1
97	19092	Apoyos Financieros para la Universidad Tecnológica Regional del Sur	2019	1
98	19093	Apoyos Financieros para la Universidad Tecnológica del Centro	2019	1
99	19094	Apoyos Financieros para la Universidad Tecnológica del Poniente	2019	1
100	19095	Apoyos Financieros para la Universidad Tecnológica del Mayab	2019	1
101	19098	Fortaseg	2019	1
102	19100	Fondo para el Fortalecimiento de Acciones de Salud Pública en las Entidades Federativas (Afaspe)	2019	1
103	19101	Unidades Medicas Móviles	2019	1
104	19102	Programa de Cultura del Agua	2019	1
105	19104	Programa Seguro Médico Siglo XXI	2019	1
106	19106	Programa de Protección Social en Salud (Seguro Popular)	2019	1
107	19107	Convenio para la Ejecución de Acciones de Prospera Programa de Inclusión Social	2019	1
108	19108	Fondo de Protección contra Gastos Catastróficos	2019	1
109	19116	Programa Escuelas de Tiempo Completo	2019	1
110	19117	Apoyo al Fortalecimiento de Instancias Estatales de Juventud	2019	1
111	19118	Espacios Poder Joven	2019	1
112	19119	Red Nacional de Programas de Radio y Television Poder Joven y Radio por Internet	2019	1
113	19121	Convenio de Coordinacion para la Creacion, Operación y Apoyo Financiero de Los I	2019	1
114	19122	laboratorio Estatal de Salud Publica (Cofepris	2019	1
115	19126	Componente de Atención a Desastres Naturales en el Sector Agropecuario	2019	1
116	19128	Modernizacion Integral del Registro Civil	2019	1
117	19132	Programa Nacional de Inglés en la Educación Básica (Pnieb)	2019	1
118	19137	Fondo para Ampliar y Diversificar la Oferta Educativa en Educación Superior Fadoe	2019	1
119	19138	Convenio de Apoyo Financiero para el Programa de Carrera Docente	2019	1
120	19144	Programa Nacional de Fomento A la Lectura	2019	1
121	19145	Programa de Estímulo a la Creación y al desarrollo Artístico	2019	1
122	19146	Programa de Apoyo a las Culturas Municipales y Comunitarias Pacmyc	2019	1
123	19148	Fondo Especial para la Ejecución del Programa para el desarrollo Integral de las Culturas de los Pueblos y Comunidades Indígenas	2019	1
124	19162	Programa de desarrollo Cultural Infantil del Estado de Yucatán  Alas Y Raíces	2019	1
125	19174	Convenio de Colaboración de Apoyos del Fondo Nacional Emprendedor	2019	1
126	19180	Fondo para Fortalecer la Autonomía de la Gestión en Planteles de Educación Media Superior	2019	1
127	19186	Programa Fortalecimiento de Calidad Educativa Tipo Básico	2019	1
128	19187	Programa de Reforma Educativa	2019	1
129	19189	Apoyo Financiero del Servicio Educativo  denominado Telebachillerato  Comunitario	2019	1
130	19192	Apoyo Financiero Extraordinario	2019	1
131	19193	Unidad Regional de Culturas Populares del Estado de Yucatán	2019	1
132	19197	Convenio de Colaboración para el desarrollo del Programa de Estímulos a la Investigación de desarrollo Tecnológico e Innovación PEI del Conacyt	2019	1
133	19200	Convenio Específico Cresca Conadic Cenadic Yuc 001	2019	1
134	19202	Programa para la Inclusión y la Equidad Educativa	2019	1
135	19206	Información Estadística y Estudios (Snidrus)	2019	1
136	19208	Programa Rehabilitación Modernización Tecnificación y Equipamiento de Unidades de Riego	2019	1
137	19216	Convenio de Coordinación para la Creación Operación y  Apoyo Financiero del Icaty	2019	1
138	19217	Programa Nacional Convivencia Escolar	2019	1
139	19220	Agua Potable Drenaje y Tratamiento	2019	1
140	19223	Convenio de Coordinación para la Implementación del Programa para el desarrollo  Profesional Docente Tipo Básico Prodep	2019	1
141	19224	C-291045.82/2016 Formación Temprana de Científicos de Yucatán	2019	1
142	19230	Fondo Institucional de Fomento Regional para el desarrollo Científico, Tecnológico y de Innovación Fordecyt	2019	1
143	19232	Programa Fortalecimiento de la Calidad Educativa Pacten	2019	1
144	19234	Convenio para el Fortalecimiento de los Servicios de Salud a Través del Repssy	2019	1
145	19235	Apoyo Solidario para la Operación de la Universidad Politécnica del Estado de Yucatán	2019	1
146	68778	Convenio parte federal.	2019	1
34	97001	Programa de Fortalecimiento Financiero Libre AA.	2018	1
148	98787	Financiamiento	2018	0
147	0	Fin	2019	0
\.


--
-- Data for Name: FormacionAcademica; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."FormacionAcademica" ("iIdFormacionAcademica", "vFormacionAcademica", "iActivo") FROM stdin;
1	Licenciado en Econmía	1
2	Maestro en Impuestos	1
\.


--
-- Data for Name: MaxNivelAcademico; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."MaxNivelAcademico" ("iIdMaxNivelAcademico", "vNivelAcademico", "iActivo") FROM stdin;
1	Bachiller	1
2	Licenciatura	1
3	Maestría	1
4	Doctorado	1
\.


--
-- Data for Name: Municipio; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Municipio" ("iIdMunicipio", "vClave", "vMunicipio", "iIdRegion") FROM stdin;
1	001	Abalá	2
2	002	Acanceh	2
3	003	Akil	7
4	004	Baca	2
5	005	Bokobá	4
6	006	Buctzotz	5
7	007	Cacalchén	4
8	008	Calotmul	5
9	009	Cansahcab	4
10	010	Cantamayec	6
11	011	Celestún	1
12	012	Cenotillo	5
13	013	Conkal	2
14	014	Cuncunul	6
15	015	Cuzamá	2
16	016	Chacsinkín	7
17	017	Chankom	6
18	018	Chapab	7
19	019	Chemax	6
20	020	Chicxulub Pueblo	2
21	021	Chichimilá	6
22	022	Chikindzonot	6
23	023	Chocholá	1
24	024	Chumayel	7
25	025	Dzán	7
26	026	Dzemul	4
27	027	Dzidzantún	4
28	028	Dzilam de Bravo	4
29	029	Dzilam González	4
30	030	Dzitás	6
31	031	Dzoncauich	4
32	032	Espita	5
33	033	Halachó	1
34	034	Hocabá	3
35	035	Hoctún	3
36	036	Homún	2
37	037	Huhí	3
38	038	Hunucmá	1
39	039	Ixil	2
40	040	Izamal	3
41	041	Kanasín	2
42	042	Kantunil	3
43	043	Kaua	6
44	044	Kinchil	1
45	045	Kopomá	1
46	046	Mama	7
47	047	Maní	7
48	048	Maxcanú	1
49	049	Mayapán	7
50	050	Mérida	2
51	051	Mocochá	2
52	052	Motul	4
53	053	Muna	7
54	054	Muxupip	4
55	055	Opichén	1
56	056	Oxkutzcab	7
57	057	Panabá	5
58	058	Peto	7
59	059	Progreso	2
60	060	Quintana Roo	6
61	061	Río Lagartos	5
62	062	Sacalum	7
63	063	Samahil	1
64	064	Sanahcat	3
65	065	San Felipe	5
66	066	Santa Elena	7
67	067	Seyé	2
68	068	Sinanché	4
69	069	Sotuta	6
70	070	Sucilá	5
71	071	Sudzal	3
72	072	Suma	4
73	073	Tahdziú	7
74	074	Tahmek	3
75	075	Teabo	7
76	076	Tecoh	2
77	077	Tekal de Venegas	3
78	078	Tekantó	3
79	079	Tekax	7
80	080	Tekit	7
81	081	Tekom	6
82	082	Telchac Pueblo	4
83	083	Telchac Puerto	4
84	084	Temax	4
85	085	Temozón	6
86	086	Tepakán	3
87	087	Tetiz	1
88	088	Teya	3
89	089	Ticul	7
90	090	Timucuy	2
91	091	Tinum	6
92	092	Tixcacalcupul	6
93	093	Tixkokob	2
94	094	Tixmehuac	7
95	095	Tixpéhual	2
96	096	Tizimín	5
97	097	Tunkás	3
98	098	Tzucacab	7
99	099	Uayma	6
100	100	Ucú	2
101	101	Umán	2
102	102	Valladolid	6
103	103	Xocchel	3
104	104	Yaxcabá	6
105	105	Yaxkukul	2
106	106	Yobaín	4
\.


--
-- Data for Name: ODS; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ODS" ("iIdOds", "iNumero", "vOds") FROM stdin;
1	1	FIN DE LA POBREZA
2	2	HAMBRE CERO
3	3	SALUD Y BIENESTAR
4	4	EDUCACIÓN DE CALIDAD
5	5	IGUALDAD DE GÉNERO
6	6	AGUA LIMPIA Y SANEAMIENTO
7	7	ENERGÍA ASEQUIBLE Y NO CONTAMINANTE
8	8	TRABAJO DECENTE Y CRECIMIENTO ECONÓMICO
9	9	INDUSTRIA, INNOVACIÓN E INFRAESTRUCTURA
10	10	REDUCCIÓN DE LAS DESIGUALDADES
11	11	CIUDADES Y COMUNIDADES SOSTENIBLES
12	12	PRODUCCIÓN Y CONSUMO RESPONSABLES
13	13	ACCIÓN POR EL CLIMA
14	14	VIDA SUBMARINA
15	15	VIDA DE ECOSISTEMAS TERRESTRES
16	16	PAZ, JUSTICIA E INSTITUCIONES SÓLIDAS
17	17	ALIANZAS PARA LOGRAR LOS OBJETIVOS
\.


--
-- Data for Name: PED2019Eje; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PED2019Eje" ("iIdEje", "vEje", "vIcono") FROM stdin;
10	Desarrollo regional	
1	Yucatán con Economía Inclusiva	public/img/icons/desca/economia-inclusiva.png
2	Yucatán con Calidad de Vida y Bienestar Social 	public/img/icons/desca/calidad-de-vida.png
3	Yucatán Cultural con Identidad para el Desarrollo	public/img/icons/desca/cultural.png
4	Yucatán Verde y Sustentable	public/img/icons/desca/verde.png
5	Igualdad de género oportunidades y no discriminación	public/img/icons/desca/igualdad.png
6	Innovación, conocimiento y tecnología	public/img/icons/desca/innovacion.png
7	Paz, Justicia y Gobernabilidad	public/img/icons/desca/paz.png
8	Gobierno Abierto, Eficiente y Finanzas Sanas	public/img/icons/desca/gobierno.png
9	Ciudades y Comunidades Sostenibles	public/img/icons/desca/ciudades.png
\.


--
-- Data for Name: PED2019Estrategia; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PED2019Estrategia" ("iIdEstrategia", "vEstrategia", "iIdObjetivo") FROM stdin;
1	Fortalecer la profesionalización de las empresas para el comercio local, nacional e internacional con enfoque de sostenibilidad y responsabilidad social.	1
2	Impulsar la tecnificación digital en las actividades comerciales.	1
3	Fortalecer la productividad y competitividad empresarial. 	2
4	Impulsar la comercialización de los productos locales.	2
5	Impulsar las ventajas competitivas del estado.	3
6	Fomentar esquemas que eleven la competitividad del talento en Yucatán.	3
7	Promocionar la propuesta de valor del estado.	4
8	Fomentar la reducción de costos de inversión extranjera a través de un sistema de consolidación de inversiones para el estado de Yucatán 	4
9	Fortalecer la producción sostenible entre las empresas del sector manufacturero e industrial.	5
10	Inducir las condiciones para el desarrollo industrial integral.	5
11	Impulsar el desarrollo de las zonas y proyectos industriales sostenibles.	6
12	Impulsar la inclusión y responsabilidad social en el sector industrial	6
13	Fomentar la especialización de los prestadores de servicios turísticos del estado orientados a la sostenibilidad.	7
14	Impulsar la diversificación de los productos y  servicios turísticos sostenibles	7
15	Promover la imagen y los atractivos turísticos del estado a nivel nacional e internacional.	8
16	Fortalecer los segmentos de mercado turístico, existentes y potenciales.	8
17	 Desarrollar la calidad de los productos y servicios turísticos del estado.	9
18	Fomentar una economía turística incluyente en las comunidades del estado con potencial turístico.	9
19	Promover la inclusión laboral productiva.	10
20	Impulsar la regularización de la seguridad social de la población trabajadora.	10
21	Impulsar esquemas que aumenten la productividad laboral en el estado.	11
22	Promover la alta productividad de las empresas.	11
23	Generar capacidades de emprendimiento inclusivo y sostenible.	12
24	Impulsar el emprendimiento en los grupos vulnerables.	12
25	Impulsar acciones que permitan el emprendimiento local en igualdad de oportunidades en el mercado interno, nacional e internacional.	12
26	Fortalecer la capacidad del sector agropecuario de manera sostenible.	13
27	Fomentar el uso de la tecnología en el sector agropecuario.	13
28	Fomentar la sostenibilidad ambiental y sanidad en las actividades agropecuarias del estado.	13
29	Impulsar un sector pecuario productivo y sostenible.	14
30	Promover la mejora genética de las especies pecuarias del estado. 	14
31	Consolidar un sector agroalimentario productivo que garantice la seguridad alimentaria en el estado.	15
32	Fomentar la calidad de la producción agrícola.	15
33	Impulsar la competitividad sostenible de los productos pesqueros y acuícolas.	16
34	Promover el consumo interno de productos acuícolas y pesqueros para mejorar la calidad alimenticia de los sectores más desprotegidos.	16
35	Promover la investigación y transferencia tecnológica para el desarrollo sustentable de la pesca y la acuacultura.	16
36	Fomentar acciones para proteger los ecosistemas en las zonas donde se desarrollan actividades pesqueras y acuícolas.	16
37	Fortalecer la gestión hospitalaria y el desarrollo del capital humano en salud con enfoque de inclusión e interculturalidad.	17
38	Impulsar una estrategia integral de formación para la mejora continua de la calidad de los servicios de salud del estado.	17
39	Impulsar el desarrollo y uso de infraestructura sostenible, así como de las tecnologías de la información, en las instituciones de salud de todos los municipios del estado.	17
40	Fomentar acciones de promoción y prestación de servicios de la salud entre la población en situación de vulnerabilidad.	18
41	Fortalecer acciones de prevención y atención integral de enfermedades para reducir los daños a la salud.	18
42	Fortalecer la prevención y atención integral de los trastornos mentales y riesgo suicida para favorecer el bienestar biopsicosocial del individuo y la sociedad.	18
43	Fortalecer la protección contra riesgos sanitarios en establecimientos y puntos sujetos a control sanitario para prevenir enfermedades asociadas.	18
44	Impulsar la participación de autoridades locales y comunitarias en el mejoramiento de las determinantes sociales en salud para incidir positivamente en la salud pública.	18
45	Impulsar la atención integral para las personas con malnutrición y desnutrición severa y moderada.	19
46	Promover hábitos alimenticios con alto valor nutricional con énfasis en las comunidades marginadas.	19
47	Fomentar mecanismos que garanticen el acceso a una vida sana a la población con inseguridad alimentaria.	20
48	Incentivar el autoconsumo, principalmente en zonas de alta inseguridad alimentaria.	20
49	Impulsar mecanismos que reduzcan las carencias sociales en las comunidades indígenas.	21
50	Fomentar esquemas que eliminen las brechas sociales de personas maya hablantes potenciando el respeto a los derechos y sus tradiciones.	21
51	Fortalecer la infraestructura educativa básica y media superior, priorizando a las comunidades con mayor rezago educativo.	22
52	Fomentar acciones de alfabetización integral en las comunidades con mayor rezago educativo.	22
53	Fortalecer la calidad de la educación en todos sus niveles.	23
54	Impulsar mecanismos que garanticen el derecho a la educación laica, gratuita, de calidad y libre de discriminación.	23
55	Impulsar esquemas de financiamiento para la adquisición, construcción, ampliación y mejoramiento de vivienda.	24
56	Fortalecer las acciones que mejoran la calidad y los espacios de la vivienda.	24
57	Promover acciones de infraestructura básica que permitan el acceso de la población a servicios de calidad para la vivienda.	25
58	Elevar la calidad del entorno y el acceso a servicios básicos en la vivienda.	25
59	Impulsar acciones dirigidas a la protección laboral y social de la población, que permitan llevar una vida digna.	26
60	Fortalecer esquemas que incrementen la cobertura y el acceso al sistema de seguridad social para la población en situación de pobreza.	26
61	Impulsar un sistema de seguridad social que garantice el bienestar del adulto mayor.	26
62	Fortalecer la infraestructura cultural de calidad incluyente y resiliente.	27
63	Fortalecer la oferta cultural incluyente y accesible para toda la población.	27
64	Impulsar la adopción del modelo de economía naranja, logrando con ello el encadenamiento de ideas para su posterior transformación en bienes y servicios culturales cuyo valor este determinado por su contenido de propiedad intelectual.	27
65	Promocionar los eventos y servicios culturales.	28
66	Facilitar el acceso a los eventos, productos y servicios artísticos y culturales.	28
67	Fomentar la producción literaria y el hábito de la lectura.	28
68	Promover las tradiciones, lenguaje, costumbres, valores y todas las formas de expresión de la identidad y la cultura yucateca.	29
69	Fomentar el desarrollo de las actividades artesanales.	29
70	Fomentar el surgimiento de nuevos creadores de arte.	30
71	Impulsar a los creadores de arte y promotores de cultura de la entidad.	30
72	Fortalecer el aprendizaje musical y la educación artística de calidad en el sistema educativo.	31
73	Procurar la vinculación entre el sistema educativo y profesionales del arte.	31
74	Impulsar la formación de profesionales de las artes.	32
75	Consolidar la oferta educativa superior en artes.	32
76	Fomentar el conocimiento del patrimonio material, natural e inmaterial del estado.	33
77	Fortalecer el patrimonio cultural.	33
78	Fortalecer la preparación de los talentos deportivos de forma incluyente.	34
79	Fortalecer el nivel de desarrollo de los deportistas de alto rendimiento.	34
80	Fomentar la cultura física como estilo de vida saludable.	35
81	Fomentar la cultura de recreación física.	35
82	Facilitar el acceso a los eventos deportivos.	36
83	Promover la realización de eventos deportivos.	36
84	Fortalecer acciones para la conservación de las áreas naturales protegidas.	37
85	Impulsar acciones a favor de la protección y aprovechamiento sustentable de la biodiversidad.	37
86	Fortalecer los mecanismos de regulación y capacitación para la administración y conservación de los recursos naturales del estado. 	37
87	Impulsar acciones de reforestación mediante el manejo sustentable de especies endémicas que incrementen la superficie arbórea.	38
88	Fortalecer acciones de prevención que disminuyan la deforestación.	38
89	Impulsar medidas de adaptación y mitigación ante el cambio climático.	39
90	Impulsar acciones que reduzcan el impacto de los desastres naturales.	39
91	Fomentar una economía baja en emisiones de carbono en Yucatán.	40
92	Fomentar la gestión integral de la calidad del aire.	40
93	Fortalecer la cultura de reutilización de aguas residuales, para disminuir la demanda del agua.	41
94	Mejorar la infraestructura y el funcionamiento en torno al abastecimiento y tratamiento del agua.	41
95	Promover la innovación y la economía circular en el saneamiento del agua.	41
96	Impulsar el uso responsable del agua para disminuir su contaminación y desperdicio.	42
97	Impulsar mecanismos e instrumentos de monitoreo e inspección de la calidad del agua. 	42
98	Impulsar una cultura del adecuado manejo de residuos que disminuya los riesgos ambientales.	43
99	Impulsar acciones que contribuyan a la reducción de residuos sólidos.	44
100	Promover acciones que contribuyan a la reutilización de materiales de desecho.	44
101	Impulsar el desarrollo tecnológico de energías limpias.	45
102	Impulsar la generación de energía de fuentes renovables y la eficiencia energética compatible con el entorno social y ambiental.	45
103	Fomentar la generación de energías limpias.	46
104	Priorizar acciones que reduzcan costos por consumo de energéticos. 	46
105	Fortalecer las acciones que incrementen la conservación de las especies marinas.	47
106	Impulsar acciones de protección de playas y mares que aumenten su conservación.	47
107	Fortalecer el sistema de transporte público para disminuir los tiempos de traslado de la población.	48
108	Impulsar acciones que permitan el acceso al transporte público atendiendo las necesidades de las personas en situación de vulnerabilidad.	48
109	Fortalecer la infraestructura vial urbana que incremente las alternativas de movilidad en las ciudades.	49
110	Impulsar la cultura vial para la reducción de accidentes.	49
111	Promover sistemas de movilidad urbana asequibles y sustentables.	49
112	Impulsar la mejora continua de los servicios y capacitación del personal de salud para garantizar el acceso y ejercicio del derecho a la salud de las mujeres en forma incluyente.	50
113	Promover mecanismos para la prevención y atención del embarazo adolescente en todo el Sistema de Salud.	50
114	Reducir la deserción, abandono y rezago educativo de las mujeres.	51
115	Impulsar una mayor participación y presencia de las mujeres en los campos de las ciencias, ingenierías, y tecnologías.	51
116	Promover la autonomía y el empoderamiento de las mujeres para el desarrollo económico sostenible. 	52
117	Impulsar el acceso de las mujeres a cargos de toma de decisiones y un mayor involucramiento en las decisiones públicas.	52
118	Fortalecer la coordinación interinstitucional para prevenir, atender y sancionar  prácticas que vulneren los derechos de las mujeres.	53
119	Promover mecanismos para involucrar a la sociedad en la prevención de las violencias hacia las mujeres.	53
120	Implementar acciones que garanticen la seguridad y la salud integral de las mujeres en situación de violencia. 	53
121	Facilitar el acceso de las mujeres a la justicia.	53
122	Fortalecer los sistemas de información sobre las violencias hacia las mujeres.	53
123	Fomentar la igualdad de oportunidades de los derechos de las personas en situación de vulnerabilidad.	54
124	Impulsar la igualdad de oportunidades de bienestar social de las personas en situación de vulnerabilidad.	54
125	Promover oportunidades de una vida digna para las personas en situación de vulnerabilidad.	54
126	Impulsar acciones que contribuyan con el ejercicio de los derechos políticos, sociales y culturales en condiciones de igualdad y no discriminación.	54
127	Mejorar la cobertura de la educación superior en el estado de manera sostenible e inclusiva.	55
128	Vincular de manera sostenible y permanente el sector productivo con el educativo para satisfacer la demanda actual y emergente de capital humano de las empresas.	55
129	Impulsar de manera sostenible e inclusiva la formación temprana de la ciencia.	55
130	Fortalecer la pertinencia de la educación superior en el estado de manera sostenible e inclusiva.	55
131	Mejorar de manera permanente y sostenible la calidad de los posgrados.	56
132	Fortalecer de manera sostenible e inclusiva la eficiencia terminal de los estudiantes de educación superior.	56
133	Impulsar la generación de conocimiento en ciencia, tecnología, artes y humanidades.	57
134	Extender de manera sostenible e inclusiva la vinculación de las ciencias, la tecnología, las artes y las humanidades con instituciones nacionales e internacionales. 	57
135	Impulsar la aplicación de la ciencia y la tecnología en la solución de problemas estratégicos de manera permanente y sostenible.	57
136	Impulsar de manera permanente y sostenible la innovación para el desarrollo del estado.	58
137	Favorecer de manera sostenible e inclusiva el desarrollo de invenciones en los sectores público, privado y social.	58
138	Fortalecer de manera sostenible la infraestructura para el conocimiento científico, tecnológico e innovación.	58
139	Fortalecer de manera sostenible la prevención del delito con un enfoque de derechos humanos y especial énfasis en la igualdad de género y la interculturalidad.	59
140	Impulsar la mediación comunitaria con perspectiva de género.	59
141	Fortalecer la profesionalización y dignificación de los elementos policiales del estado de forma incluyente y sostenible.	59
142	Reforzar las acciones de seguridad vial en el estado.	59
143	Fortalecer la seguridad pública  con énfasis en las regiones de mayor vulnerabilidad y en apego a los derechos humanos.	60
144	Implementar acciones que fomenten el cumplimiento de la Ley en favor de la seguridad de las y los habitantes.	60
145	Fortalecer la infraestructura y organización institucional de procuración de justicia en el estado.\n	61
146	Mejorar  la calidad en la atención a las y los usuarios del Sistema de Justicia.	61
147	Fortalecer los mecanismos de acceso a la justicia de los grupos en situación de vulnerabilidad.	61
148	Fortalecer el marco normativo de procuración de justicia en el estado,con enfoque de derechos humanos. 	62
149	Fortalecer las instituciones de justicia se constituyan como instituciones sólidas y de vanguardia.	62
150	 Fortalecer la cultura de la transparencia en las instituciones de seguridad y justicia en el estado.	63
151	Impulsar acciones que aumenten la certeza jurídica de las personas de forma incluyente y sostenible.	63
152	Promover acciones para el desarrollo integral de los municipios del estado.	63
153	Acercar los servicios de las instituciones vinculadas con la seguridad, justicia y certeza jurídica de forma incluyente y sostenible.	63
154	Fortalecer la coordinación para la cooperación internacional y entre gobiernos subnacionales para el desarrollo incluyente y sostenible.	64
155	Impulsar la participación y organización de  eventos de carácter internacional.	64
156	Facilitar la accesibilidad, consulta y procesamiento de la información para la toma de decisiones.	65
157	Fomentar la participación y colaboración ciudadana para que la Administración Pública Estatal realice sus acciones en apego a los principios de transparencia y rendición de cuentas.	65
158	Vigilar la correcta aplicación de los recursos públicos	66
159	Fortalecer los mecanismos de prevención y sanción ante actos de corrupción.	66
160	Fomentar la incorporación del enfoque a resultados en el proceso de planeación, programación, presupuestación, control, seguimiento y evaluación.	67
161	Favorecer los mecanismos de seguimiento y evaluación del desempeño.	67
162	Impulsar la política de mejora regulatoria para mejorar la atracción de inversiones y el bienestar social en el Estado de Yucatán y sus municipios.	68
163	Impulsar la gestión por procesos para mejorar la eficiencia y calidad en la administración pública estatal.	68
164	Fortalecer la gestión de los recursos humanos y patrimoniales del Gobierno del Estado garantizando su sostenibilidad.	68
165	Fortalecer las capacidades de recaudación del Gobierno del Estado.	69
166	Mejorar la gestión del gasto público.	69
167	Fomentar la inversión pública y privada sostenible.	70
168	Establecer mecanismos de cobertura vial que permita el acceso a todas las comunidades del estado.	71
169	Fortalecer la infraestructura ferroviaria sostenible.	71
170	Fortalecer la infraestructura logística de transporte a través del rescate y modernización integral y sostenible de los puertos y aeropuertos del estado.	71
171	Fortalecer el acceso a las redes y servicios de telecomunicaciones en las comunidades del estado.	72
172	Fortalecer la infraestructura tecnológica con enfoque de sostenibilidad.	72
173	Impulsar la participación de la industria de telecomunicaciones en los modelos educativos.	72
174	Impulsar un esquema de ordenamiento territorial de los asentamientos humanos que favorezca el desarrollo sostenible de las ciudades y comunidades.	73
175	Impulsar acciones para el cumplimiento de la normatividad urbana en coordinación con los sectores público, privado, social y académico.	73
176	Impulsar la elaboración de planes de ordenamiento ecológico local.	73
177	Estructurar los proyectos de infraestructura mediante una planeación consciente y racional con base en la rentabilidad económica y social.	73
178	Establecer áreas prioritarias de inversión que permitan enfocar los recursos de los programas federales, estatales y municipales desde una perspectiva territorial.	74
179	Fortalecer programas integrales de bienestar social regional que permitan mejorar la calidad de vida y la igualdad de condiciones, derechos y oportunidades de la población.	74
180	Fortalecer los programas culturales para potencializar el acceso a los servicios y actividades culturales en todas las regiones.	74
181	Promover buenas prácticas de sustentabilidad que garanticen la reducción de los impactos en el medio ambiente.	74
182	Desarrollar políticas de base territorial que permitan disminuir la incidencia delictiva en los municipios y regiones del Estado.	74
183	Apoyar a los municipios en la implantación y operación del Presupuesto Basado en Resultados y del Sistema de Evaluación del Desempeño PBR-SED.	74
184	Constituir un proceso de planificación territorial bajo un marco integrado que considere los diferentes instrumentos de planeación con la óptica de sustentabilidad para la provisión óptima de bienes y servicios públicos.	74
185	Favorecer la integración meso regional entre Yucatán, Campeche y Quintana Roo que permitan favorecer el desarrollo de la península.	75
\.


--
-- Data for Name: PED2019LineaAccion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PED2019LineaAccion" ("iIdLineaAccion", "vLineaAccion", "iIdEstrategia", "iIdOds") FROM stdin;
1	Profesionalizar a las empresas a través del fomento a las buenas prácticas comerciales y un enfoque de mejora continua.	1	8
2	Impulsar alianzas estratégicas en materia comercial con empresas especializadas y el sector académico.	1	8
3	Promover la responsabilidad social en el sector comercial y las empresas locales.	1	8
4	Establecer programas de inversión en tecnología para los productos comerciales.	2	8
5	Fomentar herramientas para el comercio digital de compra y venta de productos yucatecos en línea.	2	8
6	Dotar de equipo básico digital a las empresas para su crecimiento.	2	8
7	Establecer programas de capacitación de herramientas digitales.	2	8
8	Impulsar convenios de colaboración entre micro, pequeñas y medianas con las grandes empresas para el desarrollo de cadenas productivas.	3	8
9	Fomentar en las empresas el análisis de mercado previo, durante y después de la inversión y producción.	3	8
10	Impulsar la capacitación a las empresas en materia de productividad y aprovechamiento estratégico del sector comercial.	3	8
11	Gestionar estímulos e incentivos a las empresas para promover su formalización.	3	8
12	Impulsar esquemas de financiamiento accesible para las empresas en apoyo de sus procesos operativos.	3	8
13	Simplificar el marco regulatorio, los trámites de apertura de empresas y el acceso a apoyos financieros.	3	8
14	Promover las fortalezas y valores de los productos yucatecos.	4	8
15	Fomentar el crecimiento de la cadena de suministros local.	4	8
16	Favorecer el vínculo entre las empresas locales, nacionales e internacionales para la comercialización de sus productos.	4	8
17	Motivar la participación en exposiciones comerciales para la expansión de los productos yucatecos.	4	8
18	Incentivar la innovación en las empresas para que sus productos y servicios sean más competitivos.	5	17
19	Promover la producción de insumos acordes con la demanda del mercado	5	17
20	Incentivar la conformación de órganos ciudadanos, académicos y empresariales en materia de competitividad para implementar y dar seguimiento a buenas prácticas.	5	17
21	Promover el desarrollo de las zonas estratégicas  en el estado que respondan a sus vocaciones particulares.	5	17
22	Poner en marcha campañas para la atracción de talento en Yucatán.	6	17
23	Promover el establecimiento de incentivos en el sector privado que permitan incrementar la inversión en capital humano.	6	17
24	Elaborar un plan de gestión de capacidades técnicas que cubra las demandas del mercado local.	6	17
25	Difundir las bondades estratégicas y geográficas del estado	7	17
26	Promocionar los casos de éxito de las empresas que invierten en Yucatán.	7	17
27	Promover la relevancia, valor y diferenciación del estado de forma coordinada con los sectores público, privado, social y académico.	7	17
28	Gestionar estímulos fiscales rentables y atractivos a las inversiones internacionales	8	17
29	Impulsar el potencial de recursos energéticos y la infraestructura necesaria para la atracción de inversiones.	8	17
30	Propiciar un marco regulatorio eficiente para la atracción de inversiones en el estado.	8	17
31	Facilitar mediante herramientas digitales el proceso de inversión en Yucatán.	8	17
32	Impulsar esquemas de acompañamiento en las empresas para proveer la demanda de insumos industriales.	9	9
33	Establecer programas de sensibilización hacia la sostenibilidad industrial.	9	9
34	Estimular el diseño de procesos y productos industriales innovadores.	9	9
35	Facilitar la modernización de infraestructura logística para la movilización eficiente de productos industriales	10	9
36	Impulsar la disponibilidad energética para la realización de procesos de producción eficientes en el sector industrial.	10	9
37	Promover la constitución y modernización de parques industriales sostenibles e incluyentes.	10	9
38	Promover el aprovechamiento de las Tecnologías de Información y Comunicación (TICs) en la industria del estado.	10	9
39	Promover el progreso industrial sostenible en las zonas estratégicas del estado.	11	9
40	Reforzar los financiamientos a empresas y emprendedores del sector industrial con enfoque sostenible.	11	9
41	Garantizar la capacidad técnica industrial a través de la vinculación con el sector académico.	11	9
42	Promover la creación de grupos empresariales con enfoque de impulso a grupos en situación de vulnerabilidad.	12	9
43	Mejorar las condiciones de trabajo para los grupos en situación de vulnerabilidad por medio de programas de equidad en el sector industrial.	12	9
44	Diseñar mecanismos de regulación ambiental para fomentar la sostenibilidad de las empresas del sector secundario. 	12	9
45	Promover incentivos para desarrollar una cultura sostenible dentro del sector secundario.	12	9
46	Implementar talleres de sostenibilidad y de profesionalización para los prestadores de servicios turísticos del estado.	13	8
47	Promover distintivos y certificados de calidad a las empresas turísticas del estado.	13	8
48	Impulsar la adopción de sellos de calidad y certificaciones en los restaurantes que usan productos locales.	13	8
49	Consolidar los instrumentos y sistemas de información estadística y geográfica en materia turística.	13	8
50	Vincular al sector empresarial turístico con organismos de educación para la integración de mano de obra especializada y certificada al mercado laboral.	13	8
51	Estimular el diseño de nuevos proyectos turísticos sostenibles en el estado.	14	8
52	Fomentar la creación de productos y servicios turísticos sustentables e innovadores.	14	8
53	Impulsar el aprovechamiento de nichos de mercado novedosos y con alta demanda.	14	8
54	Promover alianzas estratégicas con empresas turísticas nacionales e internacionales.	14	8
55	Fomentar la participación del estado en eventos de promoción turística nacionales e internacionales.	15	8
56	Promocionar la imagen de la cultura maya en las campañas de promoción nacional e internacional.	15	8
57	Realizar campañas de promoción turística a través de diferentes medios nacionales e internacionales.	15	8
58	Impulsar el uso de herramientas tecnológicas para la difusión turística en medios electrónicos.	15	8
59	Promover la apertura de más rutas aéreas que se conecten a lugares estratégicos.	15	8
60	Establecer vínculos con los ayuntamientos para mejorar la imagen turística del estado.	15	8
61	Reforzar las acciones de atracción de turistas de negocios, con énfasis en la calidad y diversidad de los productos y servicios locales.	15	8
62	Restaurar la infraestructura de servicios para el turismo sostenible.	16	8
63	Consolidar el segmento de turismo de naturaleza en los municipios turísticos.	16	8
64	Poner en marcha acciones integrales de atracción y comercialización de congresos y convenciones nacionales e internacionales.	16	8
65	Diseñar programas de comercialización de productos y servicios para el turismo de lujo.	16	8
66	Facilitar la prestación de servicios de movilidad turística sostenible a través del vínculo entre el sector académico, empresarial y público.	16	8
67	Reforzar el desarrollo de centros turísticos en zonas con alto patrimonio cultural.	16	8
68	Promocionar la oferta de todos los segmentos turísticos consolidados y potenciales con un enfoque particular para cada tipo.	16	8
69	Promover que los residentes de la península consuman los productos y servicios turísticos de Yucatán.	16	8
70	Promover el turismo médico para convertirse en una opción más de servicios y productos turísticos que generen empleos y beneficios para el estado.	16	8
71	Impulsar la celebración de festivales, exposiciones y eventos turísticos de talla internacional.	17	8
72	Adecuar los paradores turísticos del estado para que sean modernos, accesibles e incluyentes.	17	8
73	Adecuar la infraestructura turística a las nuevas demandas y necesidades del mercado con especial énfasis en la accesibilidad	17	8
74	Rescatar los espacios con alto valor turístico para los visitantes nacionales e internacionales.	17	8
75	Diseñar herramientas digitales que faciliten la difusión de los atractivos turísticos en segmentos preferentes.	17	8
76	 Coordinar la realización de eventos turísticos y gastronómicos en los municipios del estado en conjunto con los sectores público, privado y social.	17	8
77	 Promover las ferias y tradiciones del estado en localidades con alto potencial turístico.	17	8
78	Desarrollar el turismo alternativo y comunitario en los municipios con mayor potencial.	18	8
79	Otorgar facilidades de acceso a la oferta turística a los yucatecos y nacionales con énfasis a la población en situación de vulnerabilidad.	18	8
80	Fomentar la accesibilidad en los servicios turísticos del estado.	18	8
81	Facilitar el establecimiento de nuevas rutas turísticas sostenibles en las comunidades del estado respetando su identidad cultural.	18	8
82	Promover a los artesanos, comerciantes y productores turísticos y gastronómicos locales en ferias y eventos turísticos nacionales e internacionales.	18	8
83	Vincular los sectores público, privado, social y académico para mejorar el acceso laboral incluyente y productivo	19	8
84	Fomentar el establecimiento de condiciones justas, equitativas y satisfactorias de trabajo en las empresas.	19	8
85	Promover los beneficios del sentido de identidad y pertenencia como consecuencia de mejores condiciones laborales.	19	8
86	Facilitar la inserción en el mercado laboral de todos los grupos sociales.	19	8
87	Promocionar los beneficios de la formalidad laboral entre la población trabajadora	20	8
88	Coadyuvar con el sector privado para que las empresas impulsen la seguridad social laboral.	20	8
89	Impulsar la coordinación efectiva entre los distintos órdenes de gobierno para mejorar los procesos de incorporación a la seguridad social.	20	8
90	Capacitar a las empresas en materia de productividad laboral.	21	8
91	Implementar tecnología que mejore la productividad de las empresas.	21	8
92	Promover la formación de capital humano en las áreas de alto impacto económico acorde con la demanda actual y emergente.	21	8
93	Crear un certificado de calidad para las empresas con alta productividad.	22	8
94	Otorgar estímulos a las empresas que cuenten con procesos de calidad y demuestren ser productivas.	22	8
95	Promocionar las mejores prácticas de productividad en las empresas.	22	8
96	Promover una cultura del emprendimiento desde la educación básica.	23	8
97	Fomentar la formación de aptitudes empresariales en estudiantes de educación media superior y superior.	23	8
98	Promover la aplicación de buenas prácticas en materia de emprendimiento.	23	8
99	Ofrecer capacitación con valor curricular, para acciones de emprendimiento en el hogar, que permitan conciliar la vida laboral y personal.	23	8
100	Celebrar convenios de colaboración entre organizaciones de apoyo al ecosistema emprendedor para la formación de capacidades de emprendimiento.	23	8
101	Realizar un seguimiento a las acciones de emprendimiento a fin de detectar necesidades de formación, fortalezas y áreas de oportunidad.	23	8
102	Impulsar la formación de equipos multidisciplinarios y con diferentes niveles de especialización técnica para la formación de capacidades empresariales.	23	8
103	Desarrollar programas formativos de habilidades proactivas para aumentar la eficiencia y la modernización continua en las empresas.	23	8
104	Crear programas de inversión para emprendedores con esquemas de financiamiento vinculados a los sectores público, privado, social y académico.	23	8
105	Desarrollar acciones de fortalecimiento a emprendedores con enfoque de inclusión.	24	8
106	Incorporar habilidades de liderazgo y herramientas de empoderamiento en los procesos de acompañamiento y formación.	24	8
107	Promover redes que impulsen de manera focalizada el emprendimiento inclusivo a través del acompañamiento, servicios y comercialización de sus productos.	24	8
108	Establecer espacios físicos o virtuales que permitan visibilizar las acciones de los emprendedores locales en el ecosistema de emprendimiento de la entidad.	25	8
109	Impulsar el uso de las Tecnologías de la Información y Comunicación (TICs) para vincular a los emprendedores en la cadena de valor que les permita mejorar la competitividad empresarial.	25	8
110	Promover el uso de tecnología e innovación para acceder a los financiamientos	25	8
111	Promover la integración de cadenas de valor para aumentar la productividad, calidad y rentabilidad entre los emprendedores.	25	8
112	Gestionar insumos para los productores del sector agropecuario.	26	2
113	Generar acciones para promover el consumo de productos agropecuarios locales. 	26	2
114	Impulsar esquemas de financiamiento y reducción de costos financieros para el desarrollo del sector agropecuario.	26	2
115	Impulsar acciones de infraestructura que faciliten el movimiento de productos agropecuarios.	26	2
116	Inducir la implementación de procesos productivos que favorezcan la producción sostenible.	26	2
117	Favorecer la comercialización estratégica de productos agropecuarios locales en los mercados locales e internacionales.	26	2
118	Desarrollar acciones para la industrialización de productos agropecuarios de manera sostenible	26	2
119	Fomentar la creación de mecanismos para el aprovechamiento de la denominación de origen de productos locales o indicación geográfica. 	26	2
120	Impulsar la certificación de la calidad de los productos agropecuarios.	26	2
121	Desarrollar acciones para el aprovechamiento de productos agropecuarios de manera sostenible	26	2
122	Promover la investigación y el desarrollo de innovaciones en los procesos agropecuarios.	26	2
123	Impulsar la mecanización y tecnificación del sector agropecuario.	27	2
124	Apoyar a productores y emprendedores en procesos y técnicas que permitan mejorar la calidad de su producción.	27	2
125	Dotar de herramientas tecnológicas al sector agropecuario para mejorar sus procesos productivos.	27	2
126	Promover el uso de insumos que minimicen el impacto ambiental. 	28	2
127	Incentivar prácticas que ayuden a la conservación de los recursos hídricos del estado.	28	2
128	Gestionar herramientas para los productores a efecto de prevenir y combatir plagas y enfermedades en el sector agropecuario.	28	2
129	Realizar un control de seguimiento y vigilancia de sanidad a las unidades productivas así como reforzar los comités de sanidad estatal.	28	2
130	Incentivar la producción de las especies con mayor valor y rendimiento.	29	2
131	Proporcionar cursos de inocuidad pecuaria sostenible.	29	2
132	Otorgar apoyos para la producción pecuaria.	29	2
133	Impulsar la creación de centros de transferencia y tecnología genética pecuaria.	30	2
134	Promover la asistencia técnica y la capacitación en procesos reproductivos que mejoren la genética de las especies pecuarias.	30	2
135	Otorgar apoyos para el mejoramiento genético del sector pecuario. 	30	2
136	Apoyar la producción agrícola de los cultivos con mayor rentabilidad en el estado.	31	2
137	Reforzar la cadena de suministros agroalimentaria estatal.	31	2
138	Consolidar programas de producción y consumo responsable en temas agroalimentarios	31	2
139	Favorecer el cultivo de productos agrícolas con mayor demanda en la entidad.	31	2
140	Promover mecanismos que propicien el trato directo entre los productores agrícolas y los consumidores finales.	31	2
141	Reforzar la inocuidad y diversificación de la producción agrícola.	32	2
142	Estimular las inversiones que favorezcan la calidad y disponibilidad de productos agrícolas.	32	2
143	Proporcionar capacitación sobre prevención de riesgos en materia agrícola.	32	2
144	Modernizar la infraestructura para la pesca a fin de dar mayor valor agregado a los productos pesqueros.	33	2
145	Brindar asesoría a las empresas pesqueras y acuícolas del estado.	33	2
146	Reforzar la cadena productiva y los canales de comercialización del sector pesquero de forma eficiente.	33	2
147	Impulsar campañas de concientización de los tiempos de veda y fomento de la acuacultura en el estado.	33	2
148	Incentivar el emprendimiento para fomentar la creación de unidades económicas del sector pesquero y acuícola.	33	2
149	Establecer mecanismos de control y seguimiento de embarcaciones pesqueras y unidades acuícolas.	33	2
150	Gestionar campañas de concientización sobre el valor nutrimental de los productos acuícolas y pesqueros en el estado.	34	2
151	Promover el desarrollo de proyectos de granjas acuícolas en las poblaciones rurales.	34	2
152	Fomentar la cultura de consumo de productos pesqueros y acuícolas entre la población rural.	34	2
153	Gestionar apoyos justos para mejorar la calidad de las condiciones de los pescadores.	34	2
154	Consolidar la producción de especies marinas nativas mediante la elaboración de estudios que garanticen la capacidad productiva.	35	2
155	Suscribir convenios con instituciones educativas para capacitar a los productores pesqueros y acuícolas del estado.	35	2
156	Impulsar el uso de tecnología para las actividades pesqueras y acuícolas sostenibles.	35	2
157	Crear campañas de concientización sobre la preservación del medio ambiente de la zona costera.	36	2
158	Realizar un monitoreo de la calidad de las aguas subterráneas para identificar zonas con potencial acuícola en el estado.	36	2
159	Identificar zonas de anidamiento y reproducción de las especies marítimas para reforzar la vigilancia.	36	2
160	Organizar las unidades de primer nivel y la atención pre hospitalaria con medicamentos suficientes, equipos especializados y atención de los padecimientos con mayor frecuencia en las regiones de mayor vulnerabilidad social.  	37	3
161	Reorganizar el recurso humano de salud con esquemas que amplíen la cobertura en el estado y aseguren la atención en hogares y comunidades.  	37	3
162	Expandir los horarios de atención médica para brindar servicios  en el primer nivel de atención durante las 24 horas del día, los siete días de la semana. 	37	3
163	Incentivar la actualización de los conocimientos y habilidades del personal de salud con la participación de organismos oficialmente reconocidos y especializados en temas de prevención y atención integral.	38	3
164	Consolidar la calidad del servicio médico mediante la ampliación y certificación periódica del personal de salud. 	38	3
499	Reforzar programas de educación ambiental enfocados a la conservación costera. 	106	14
165	Promover el apego de los establecimientos de salud públicos y privados a los estándares de calidad en materia de salud.	38	3
166	Fortalecer la relación médico-paciente en los tres niveles de atención especializada de forma incluyente.	38	3
167	Incentivar la aplicación de la biotecnología roja en los procesos médicos. 	38	3
168	Promover una red de hospitales que cuenten con las herramientas y tecnologías robóticas, para brindar un servicio especializado y de vanguardia al cuidado de la salud.	38	3
169	Consolidar la infraestructura y equipamiento de las unidades médicas y establecimientos de apoyo para la prestación de servicios de manera incluyente y sostenible.	39	3
170	Expandir la cobertura de conectividad de voz y datos en las unidades médicas y establecimientos pertenecientes al Sistema Estatal de Salud. 	39	3
171	Modernizar la infraestructura y  promover el uso y aprovechamiento de sistemas informáticos integrales en el Sistema Estatal de Salud. 	39	3
172	Consolidar el uso de las tecnologías de la información para la capacitación continua del personal de salud, así como la prestación de servicios médicos a distancia.	39	3
173	Impulsar la atención integral en las unidades médicas del sector salud a personas que viven violencia familiar y/o sexual con énfasis en grupos en situación de vulnerabilidad.	40	3
174	Fomentar la atención integral a las mujeres, en especial durante el periodo preconcepcional, embarazo, parto y puerperio, para disminuir el riesgo de enfermedades obstétricas y ginecológicas.	40	3
175	Promover en las unidades médicas la orientación y consejería sobre planificación familiar. 	40	3
176	Desarrollar mecanismos de prevención y atención integral que reduzcan la mortalidad materna e infantil.	40	3
177	Promover nuevas habilidades y formas de comportamiento entre la población en situación de vulnerabilidad que permita el mejoramiento de las condiciones de salud en el estado.	40	3
178	Reforzar los esquemas de atención en el sector público para la detección y atención oportuna de las enfermedades que más afectan a la población en situación de vulnerabilidad.	40	3
179	Reforzar las acciones de prevención y atención integral de enfermedades crónico degenerativas, respiratorias e infecto contagiosas, con énfasis en las más frecuentes.	41	3
180	Promover la cobertura de vacunación universal con esquema completo. 	41	3
181	Reforzar las acciones de prevención y control de las enfermedades transmitidas por vector y zoonosis. 	41	3
182	Impulsar acciones de promoción de la salud, prevención y atención integral de enfermedades metabólicas asociadas a la nutrición, para el combate al sobrepeso y la obesidad.	41	3
183	Reforzar los mecanismos de prevención, detección, atención integral y seguimiento de las personas que viven con el Virus de la Inmunodeficiencia Humana (VIH), sida y otras Infecciones de Transmisión Sexual (ITS).	41	3
184	Reforzar las acciones de promoción de la salud en la población para la adopción habitual de medidas de autocuidado de la salud, donación de sangre y adopción de conductas seguras en la vida cotidiana.	41	3
185	Reforzar las acciones de prevención, atención y control de trastornos mentales, padecimientos psicosociales y por uso de sustancias, con especial atención en la población en situación de vulnerabilidad.	42	3
186	Desarrollar acciones de mejora en las unidades de atención de salud mental con enfoque a los derechos humanos de los pacientes.	42	3
187	Promover acciones de sensibilización en los diferentes órdenes de gobierno y la sociedad sobre salud mental y la inclusión de personas con trastornos mentales.	42	3
188	Reforzar la vigilancia y control sanitario de establecimientos que ofrecen bienes y servicios de uso y/o consumo humano así como los asociados a factores ambientales y de salud ocupacional.	43	3
189	Reforzar las acciones de saneamiento básico derivados de la ocurrencia de emergencias y desastres en el estado.	43	3
190	Consolidar las acciones de regulación de la publicidad y etiquetado de alimentos, bebidas y sustancias adictivas legales. 	43	3
191	Fomentar la actualización del marco legal que permita la regulación sanitaria de establecimientos no formales.	43	3
192	Gestionar el trabajo colaborativo en las comunidades, escuelas y municipios que propicien la certificación como entornos saludables que mejoran la condición de vida de la población.	44	3
193	Promover la colaboración con las y los auxiliares de salud comunitarias y parteras tradicionales en el reforzamiento de acciones de prevención y control de las enfermedades en las comunidades.	44	3
194	Reforzar la colaboración interinstitucional en la operación de puntos de control de niveles de alcohol en conductores de vehículos como medida en la prevención de accidentes viales.	44	3
195	Generar acciones que garanticen la sostenibilidad alimentaria de las personas en condición de desnutrición.	45	2
196	Incentivar la sana alimentación de las y los lactantes y de la niñez en el desarrollo de la primera infancia.	45	2
197	Elaborar campañas que incentiven el consumo de alimentos con alta calidad nutricia y erradiquen conductas alimentarias que generan desnutrición.	45	2
198	Coordinar acciones entre los sectores académico, privado, público y personas de las comunidades para abatir el hambre.	45	2
199	Proporcionar capacitación sobre los hábitos de una buena alimentación y la importancia del desarrollo infantil.	46	2
200	Apoyar a las personas y/u organizaciones que propicien la sana alimentación en las comunidades de mayor carencia alimentaria en el estado.	46	2
201	Promover la entrega de desayunos y paquetes alimenticios con alta calidad nutricia, priorizando a las comunidades con mayor marginación y carencia alimentaria, previniendo las enfermedades relacionadas con la desnutrición.	46	2
202	Impulsar, en coordinación con las organizaciones de la sociedad civil, una campaña de manejo de excedentes y de las pérdidas post cosecha con el objetivo de disminuir la malnutrición y desnutrición.	46	2
203	Impartir capacitaciones sobre la selección e inocuidad de cultivos con alto valor calórico.	47	2
204	Promover la investigación sobre la diversidad genética de las semillas, las plantas y los animales de granja para el procesamiento de alimentos nutritivos e inocuos.	47	2
205	Gestionar una mayor inversión en infraestructura rural, servicios de extensión, desarrollo tecnológico y en bancos de granos o de animales de crianza.	47	2
206	Promover la producción agropecuaria sostenible y la autogestión alimentaria, priorizando a las familias indígenas con mayor inseguridad alimentaria. 	48	2
207	Brindar capacitación sobre técnicas de producción eficiente y sostenible en las comunidades rurales con un enfoque incluyente.	48	2
208	Expandir el sistema educativo a las comunidades indígenas para reducir el rezago.	49	10
209	Realizar acciones que garanticen la seguridad alimentaria y nutricional en los pueblos indígenas.	49	10
210	Extender la cobertura y calidad de los servicios de salud en las comunidades indígenas.	49	10
211	Proporcionar la infraestructura adecuada y de calidad para las viviendas en comunidades indígenas.	49	10
212	Reforzar el acceso a los servicios básicos para las viviendas en comunidades indígenas.	49	10
213	Promover el acceso a la seguridad social sostenible para las comunidades indígenas.	49	10
214	Impulsar intérpretes traductores que proveen asistencia multidisciplinaria a la población maya hablante.	50	10
215	Realizar campañas de respeto a los derechos de los maya hablantes con un lenguaje incluyente y accesible.	50	10
216	Organizar consejos comunitarios que supervisen el cumplimiento de los derechos de la población maya hablante.	50	10
217	Reforzar la medicina tradicional maya a través de un registro único de mujeres y hombres que ejercen esta milenaria práctica en Yucatán.	50	10
218	Incorporar la perspectiva de género en la asignación de apoyos y recursos de los programas federales dirigidos a la población indígena.	50	10
219	Ampliar la cobertura de los centros educativos, principalmente en las comunidades indígenas.	51	4
220	Rehabilitar los espacios educativos con infraestructura accesible e inclusiva.	51	4
221	Impulsar acciones de construcción y mantenimiento en las escuelas, que satisfagan las necesidades de los usuarios.	51	4
222	Implementar acciones de equipamiento en escuelas del interior del estado.	51	4
223	Consolidar los espacios radioeléctricos y televisivos para ofertar la educación básica y media superior en comunidades de difícil acceso.	51	4
224	Desarrollar acciones de alfabetización para la atención de jóvenes y adultos en rezago educativo.	52	4
225	Organizar grupos de enseñanza continua entre la comunidad con técnicas de aprendizaje que prioricen la atención de la primera infancia, adultos mayores y personas con discapacidad.	52	4
226	Generar apoyos para las organizaciones que combaten el analfabetismo.	52	4
227	Impartir asesoría extra clases en comunidades con altos niveles de rezago educativo y/o personas con discapacidad.	52	4
228	Establecer programas de regularización educativa en las comunidades que presentan mayor rezago educativo.	52	4
229	Reforzar la profesionalización integral del personal docente para la educación multigrado y la innovación de los procesos pedagógicos, incluyendo contenidos de emprendimiento desde nivel básico.	53	4
230	Coordinar acciones que vinculen la educación media superior y superior con el mercado laboral, mediante el reforzamiento de la educación dual y profesionalización técnica.	53	4
231	Promover programas para el desarrollo socioemocional de las y los estudiantes.	53	4
232	Desarrollar mecanismos innovadores que promuevan la mejora en el desempeño de las y los estudiantes.	53	4
233	Adaptar el aprendizaje en función al uso de tecnologías de la información y comunicación.	54	4
234	Reforzar la atención y calidad de los centros que brindan educación especial y los centros de atención múltiple con enfoque de inclusión, prioritariamente aquellas asociadas con discapacidad y/o con aptitudes sobresalientes.	54	4
235	Instruir a los padres de familia y personal docente sobre el pleno desarrollo integral de las personas con necesidades educativas especiales.	54	4
236	Proporcionar materiales académicos para las y los estudiantes de educación básica y media superior, principalmente a las personas de comunidades indígenas.	54	4
237	Extender la oferta de becas para las y los estudiantes de todos los niveles educativos, priorizando a las madres adolescentes, la niñez con alguna discapacidad y la población en situación de vulnerabilidad.	54	4
238	Establecer acciones para mejorar las capacidades de las y los trabajadores sociales en las instituciones educativas, con énfasis en las zonas con altos niveles de rezago.	54	4
239	Asegurar la educación integral con un  esquema de participación social que favorezca las decisiones libres, responsables e informadas de niñas, niños y adolescentes, sobre el ejercicio de su sexualidad y salud sexual y reproductiva.	54	4
240	Promover acciones que fortalezcan la educación intercultural bilingüe y el uso de la lengua maya en escuelas públicas de educación básica.	54	4
241	Gestionar recursos para la adquisición, construcción, ampliación y mejoramiento de viviendas, principalmente en comunidades marginadas.	55	11
242	Establecer mecanismos de coordinación con los diferentes órdenes y niveles de gobierno para reforzar las acciones de vivienda.	55	11
243	Fomentar la adquisición, construcción y ampliación de viviendas adecuadas, especialmente para personas con discapacidad 	55	11
244	Desarrollar acciones que faciliten el acceso a planes de financiamiento de viviendas dignas y de bajo costo, para mujeres y  grupos en situación de vulnerabilidad.	55	11
245	Promocionar la participación de organizaciones no gubernamentales en el financiamiento para la construcción, ampliación y mejoramiento de vivienda.	55	11
246	Promover el financiamiento de desarrollos habitacionales con materiales y tecnologías que que reduzcan el consumo de energía eléctrica, emisión de CO2 y residuos contaminantes.	55	11
247	Promover el financiamiento de proyectos de desarrollos habitacionales que cumplan con la normatividad de desarrollo sustentable.	55	11
248	Establecer programas de acceso y financiamiento de viviendas sustentables o amigables con el medio ambiente.	56	11
249	Realizar acciones de vivienda con materiales duraderos, priorizando las familias en situación de pobreza y marginación.	56	11
250	Promover la investigación de nuevas propuestas para el uso de materiales alternativos y energías renovables para la construcción de viviendas.	56	11
251	Implementar programas de reubicación de viviendas asentadas en zonas de alto riesgo o no aptas para uso habitacional.	56	11
252	Promover acciones de prevención y mantenimiento de viviendas regulares con mayor exposición y vulnerabilidad a fenómenos naturales.	56	11
253	Consolidar la red de agua potable, drenaje y alcantarillado en zonas habitacionales que presenten mayor rezago.	57	11
254	Implementar acciones de electrificación que garanticen a la población el acceso a energía continua y suficiente.	57	11
255	Desarrollar acciones que permitan el acceso de la población a combustibles amigables con la salud y el medio ambiente.	57	11
256	Incentivar la participación del sector privado en la provisión de servicios básicos de calidad, suficientes y accesibles para las viviendas del estado.	57	11
257	Promover el desarrollo de nuevas opciones de financiamiento para constructores del sector privado que ofrezcan viviendas de bajo costo y con servicios básicos de calidad.	57	11
258	Promover asentamientos humanos en zonas seguras y con acceso a servicios básicos.	57	11
259	Fomentar el uso de materiales alternativos y energías renovables para dotar de servicios básicos a las viviendas.	57	11
260	Planear redes de infraestructura que permitan la ampliación de la cobertura de los servicios de agua potable, alcantarillado y electrificación con un enfoque de desarrollo sostenible y con prioridad en las zonas marginadas.	58	11
261	Promover una normativa que garantice el desarrollo de proyectos de viviendas seguras, dignas, saludables y amigables con el medio ambiente.	58	11
262	Poner en marcha la reubicación de asentamientos en condiciones de riesgo ante fenómenos naturales, focos de contaminación o riesgos derivados de la acción humana.	58	11
263	Organizar grupos comunitarios que favorezcan el desarrollo y el bienestar social.	59	10
264	Salvaguardar el patrimonio de las familias que habitan principalmente en zonas de riesgo.	59	10
265	Asesorar a la población en situación de vulnerabilidad y de comunidades indígenas sobre el derecho a prestaciones y garantías laborales.	59	10
266	Mejorar la cobertura y beneficios del sistema de seguridad social de los trabajadores al servicio de los poderes públicos estatales y de los municipios.	59	10
267	Elaborar campañas de afiliación al sistema de salud, principalmente a la población que vive en comunidades indígenas.	60	10
268	Crear ventanillas o campañas de difusión para asesorar a las personas sobre la adquisición de un seguro.	60	10
269	Promover un sistema de protección social universal de amplio alcance en el estado.	60	10
270	Promover acciones que incentiven la participación y bienestar del adulto mayor.	61	10
271	Promover afiliaciones a la seguridad social de personas adultas mayores en comunidades con alto grado de pobreza y/o marginación.	61	10
272	Promover la seguridad social de los adultos mayores para mejorar su calidad de vida.	61	10
273	Impulsar el desarrollo de espacios incluyentes en los municipios para la realización de actividades artísticas y culturales.	62	8
274	Adecuar la infraestructura cultural existente en los municipios del estado, garantizando su resiliencia y sostenibilidad, así como la accesibilidad de personas con discapacidad, adultos mayores y mujeres embarazadas.	62	8
275	Diseñar normas y lineamientos claros y transparentes para el uso adecuado y óptimo de la infraestructura cultural.	62	8
276	Optimizar espacios e infraestructura existente para la realización de actividades y eventos artísticos y culturales.	62	8
277	Implementar acciones, como circuitos culturales, que favorezcan  la descentralización de los servicios artísticos y culturales hacia zonas de Mérida con baja oferta cultural y municipios del interior del estado, garantizando la inclusión y accesibilidad.	63	8
278	Estimular la diversificación de la oferta cultural apoyando producciones de grupos independientes y emitiendo convocatorias incluyentes.	63	8
279	Incentivar la creación de productos y servicios artísticos y culturales, con enfoque de igualdad de género. 	63	8
280	Estimular el desarrollo y consolidación de niños y jóvenes creadores mediante recintos culturales infantiles, creación de compañías de danza y teatro infantil, así como la realización de eventos y festivales.	63	8
281	Incentivar proyectos y eventos culturales que busquen la transformación social y sensibilización en inclusión, igualdad y atención a grupos en situación de vulnerabilidad.	63	8
282	Diseñar un sistema de información cultural que permita medir cuantitativamente y cualitativamente la economía cultural e industrias creativas	64	8
283	Incorporar a las políticas públicas, programas y acciones la validación de la dimensión comercial de la cultura y la creatividad, y su articulación con tecnología, infraestructura, acceso a mercados, entre otros	64	8
284	Implementar acciones de vinculación entre el sector cultural e industrias creativas con el sector turístico y económico.	64	8
285	Motivar la innovación dentro de las industrias culturales y creativas, que estimulen a los artistas y creadores locales.	64	8
286	Utilizar herramientas de las Tecnologías de la Información y la Comunicación para acercar los eventos, productos y servicios culturales a la población.      	65	12
287	Desarrollar acciones de sensibilización del valor del arte y la cultura para contribuir a crear nuevos públicos.       	65	12
288	Propiciar una vinculación interinstitucional entre los tres órdenes de gobierno para impulsar el arte y la cultura.  	65	12
289	Generar información que ayude a mejorar la realización de los eventos artísticos y culturales a partir de la opinión y participación incluyente de la población.	66	12
290	Implementar acciones de movilidad para facilitar el consumo de bienes y servicios culturales.	66	12
291	Impulsar la incorporación  de grupos artísticos de municipios y comunidades a la agenda cultural del estado	66	12
292	Incentivar el consumo de la población de eventos, productos y servicios culturales mediante apoyos o subvenciones.	66	12
293	Motivar la generación, edición y publicación de medios escritos (libros, revistas, periódicos, entre otros), procurando la producción incluyente y con contenido dirigido a grupos en situación de vulnerabilidad, así como la generación de obras inéditas en diferentes géneros literarios, de investigación y divulgación científica.	67	12
294	Crear colecciones incluyentes en formatos económicos.	67	12
392	Generar plataformas de comunicación para la difusión de la conservación y el desarrollo sustentable en el territorio. 	85	15
295	Desarrollar acciones que garanticen la distribución de los libros editados y coeditados en formato impreso y digital abarcando todas las regiones del estado, así como el mercado nacional e internacional.	67	12
296	Promover la realización de ferias y festivales del libro y lectura en los municipios del estado.                                                                                                                                                                                            	67	12
297	Reforzar las salas de lectura y bibliotecas en los municipios del estado con acciones de mantenimiento, equipamiento y acervo bibliográfico.	67	12
298	Estimular el acceso a la lectura en lugares no convencionales como áreas hospitalarias, cárceles, orfanatos, entre otros.	67	12
299	Desarrollar actividades de fomento a la lectura dirigidos a toda la población, pero con énfasis a niños, personas con discapacidad y grupos específicos que tengan limitaciones para acceder a medios escritos.  	67	12
300	Estimular la investigación y difusión de las manifestaciones de la cultura tradicional en Yucatán.	68	10
301	Fomentar espacios de difusión en medios de comunicación de la cultura maya, su lengua, tradiciones, costumbres e historia.	68	10
302	Impulsar acciones de profesionalización para los gestores y artistas de la cultura e identidad yucateca en sus propias localidades.	68	10
303	Incentivar la difusión de la identidad cultural, tradiciones, historias y costumbres mediante agentes locales, preferentemente mujeres mayahablantes.	68	10
304	Incentivar el desarrollo de eventos incluyentes que conlleven al rescate de los juegos y deportes tradicionales.	68	10
305	Implementar acciones que promuevan el orgullo por la cultura tradicional.	68	10
306	Exponer las expresiones artísticas, tradiciones y costumbres en un ámbito internacional a través de intercambios, colaboraciones y fusiones artísticas.	68	10
307	Reestructurar la agenda cultural de las comunidades y colonias, implementando eventos y actividades en lengua maya.	68	10
308	Incentivar los eventos y actividades de cultura tradicional como trova, teatro regional, bailes, festividades, fiestas patronales, entre otros.	68	10
309	 Establecer una vinculación entre los sectores cultural y educativo para implementar proyectos y programas educativos que favorezcan la preservación y desarrollo de las culturas populares y la cultura maya.	68	10
310	Estimular la creación de proyectos viables y autogestivos de la artesanía local.	69	10
311	Fomentar el interés por la creación artesanal en los jóvenes para preservar las costumbres y tradiciones.	69	10
312	Reforzar los canales de distribución y comercialización de productos artesanales en zonas estratégicas del estado.	69	10
313	Impulsar la creación de espacios físicos y virtuales para exposiciones y muestras artesanales.	69	10
314	Impartir talleres de formación y actualización artística garantizando la inclusión social y equidad.	70	11
315	Otorgar apoyos que incentiven la formación y profesionalización de nuevos artistas y creadores.	70	11
316	Consolidar los programas de educación y formación artística formal desde el grado inicial hasta posgrado con una perspectiva incluyente.	70	11
317	Implementar acciones que faciliten la empleabilidad de nuevos artistas.	70	11
318	Consolidar los centros de educación artística públicos y privados encargados de generar nuevos artistas.	70	11
319	Facilitar a los artistas y creadores el acceso a espacios incluyentes de expresión de las artes.	71	11
320	Estimular la creación de manifestaciones artísticas enfocadas en las artes.	71	11
321	Establecer esquemas de colaboración público-privada que permitan apoyar a compañías, artistas y creadores dedicados al teatro, artes escénicas, música, danza, artes visuales, multimedia  y demás manifestaciones artísticas contemporáneas.	71	11
322	Incentivar la profesionalización continua de los artistas y creadores mediante la vinculación de programas de profesionalización del sector privado y de los tres órdenes de gobierno.	71	11
323	Diagnosticar la calidad de la educación artística utilizando criterios y lineamientos pedagógicos de reconocida calidad nacional e internacional.	72	4
324	Reforzar la educación artística con enfoque intercultural e incluyente.	72	4
325	Promover la realización de actividades artísticas extraescolares.	72	4
326	Habilitar los Centros Culturales como un foro que ayude a la enseñanza y apreciación  del arte en la educación básica. 	72	4
327	Consolidar las capacidades docentes de las y los maestros de educación artística, haciendo hincapié en la adopción de enfoques pedagógicos actuales, administración eficiente del tiempo y nuevas estrategias de enseñanza-aprendizaje.	72	4
328	Crear espacios para el intercambio y crecimiento profesional de los docentes de educación artística. 	72	4
329	Motivar las manifestaciones artísticas de profesionales y profesionistas en el sistema educativo.	73	4
330	Incentivar la realización de eventos artísticos y culturales en instituciones educativas.	73	4
331	Estimular que los profesionales del arte participen con las escuelas de educación básica para mejorar los programas y procedimientos de impartición artística.	73	4
332	Promover los programas de educación superior en artes como opción de formación integral.	74	4
333	Apoyar los procesos de evaluación y acreditación de licenciaturas en artes en el estado.	74	4
334	Desarrollar acciones que garanticen el acceso incluyente a la formación artística.	74	4
335	Incentivar la labor social del estudiante en artes para que fomente la cultura y su valoración.	74	4
336	Implementar acciones que mejoren la calidad de la enseñanza en artes.	74	4
337	Proporcionar apoyos o estímulos para los estudiantes en artes para que motiven su permanencia y egreso.	74	4
338	Consolidar la formación de cuerpos académicos de educación superior en artes.	74	4
339	Gestionar apoyos y estímulos a las instituciones y escuelas que tengan programas de enseñanza superior de arte.	75	4
340	Estimular el emprendimiento y autoempleo de los estudiantes en artes.	75	4
341	Vincular a los estudiantes de educación superior en artes con el mercado laboral.	75	4
342	Fortalecer las capacidades de gestión y administrativas de las instituciones de educación superior en arte involucrando a la  sociedad civil principalmente en el patronazgo.	75	4
343	Conformar una instancia ciudadana con participación de distintos actores sociales, públicos y privados que coadyuve a promover, difundir y preservar el patrimonio cultural del estado.    	76	11
344	Promover mecanismos de intercambio de información sobre el estado y ubicación del patrimonio cultural entre académicos, gestores e instituciones de la Administración Pública.	76	11
345	Promover en los municipios y comisarías la realización de eventos, exhibiciones y actividades que promuevan el conocimiento y  conservación del patrimonio cultural.	76	11
346	Actualizar la normatividad vigente en materia de protección y promoción del patrimonio cultural.	77	11
347	Sensibilizar a los ayuntamientos a que tengan una participación activa en la protección e integración de su patrimonio.	77	11
348	Gestionar la preservación de los acervos bibliográficos, hemerográficos, documentales y audiovisuales. 	77	11
349	Incentivar acciones y proyectos encaminados a la preservación del patrimonio cultural.	77	11
350	Proporcionar mantenimiento a museos que promuevan y difundan el patrimonio cultural.	77	11
351	Generar nuevos contenidos en la red de museos que promuevan el patrimonio cultural.	77	11
352	Crear esquemas de identificación de talentos deportivos a través de un equipo multidisciplinario así como incentivar el desarrollo y permanencia de los talentos deportivos con enfoque incluyente.	78	3
353	Proporcionar seguimiento y acompañamiento permanente a los talentos deportivos con enfoque incluyente.	78	3
354	Reforzar los programas de exhibición de las disciplinas deportivas tradicionales y de deporte adaptado en escuelas de nivel preescolar y primaria.	78	3
355	Establecer convenios de coordinación de impulso al deporte entre las escuelas y centros educativos que faciliten los entrenamientos de los atletas con un enfoque incluyente.	78	3
356	Diseñar metodologías deportivas que abarquen todas las etapas de formación de un deportista.	78	3
357	Proporcionar una atención integral a los deportistas de alto rendimiento con enfoque incluyente, y usando evidencia científica que coadyuve al desarrollo de los deportistas.	79	3
358	Consolidar las capacidades de médicos y entrenadores de los deportistas de alto rendimiento con un enfoque incluyente.	79	3
359	Crear programas de entrenamiento adecuados para los deportistas de alto rendimiento con un enfoque incluyente.	79	3
360	Gestionar infraestructura deportiva incluyente y de calidad para la práctica de deporte de alto rendimiento.	79	3
361	Diseñar esquemas financieros que sirvan como base para proporcionar estímulos a entrenadores y deportistas, en especial a los que ganen medallas en competencias de alto rendimiento.	79	3
362	Consolidar la infraestructura deportiva existente garantizando su sostenibilidad para la realización de eventos y actividades físicas incluyentes.	80	3
363	Promover la generación de espacios deportivos incluyentes y resilientes.	80	3
364	Crear convenios de colaboración con la iniciativa privada para realizar acciones de rescate y mantenimiento de espacios públicos, así como implementar programas de activación física.	80	3
365	Crear una campaña para la activación física en municipios aprovechando la infraestructura existente (parques y campos).	80	3
366	Motivar la práctica deportiva y activación física desde la infancia.	80	3
367	Promover la vinculación laboral entre profesionistas y especialistas del deporte con los programas de activación física.	80	3
368	Diseñar programas especiales de activación física de acuerdo con padecimientos de salud.	80	3
369	Promover estrategias de prevención de la salud con acciones que impulsen la activación física de las y los estudiantes de educación básica	80	3
370	Apoyar a diferentes actores que promuevan o fomenten el deporte recreativo.	81	3
371	Crear academias que promuevan la práctica de deportes de conjunto, con un enfoque incluyente y que abarque a todos los municipios del interior del estado.	81	3
372	Utilizar técnicas alternativas que generen el interés por el deporte.	81	3
373	Crear modelos de inclusión en la realización de actividades deportivas para personas con alguna discapacidad.	81	3
374	Motivar la realización de  torneos y eventos deportivos	81	3
375	Fomentar esquemas de traslado económico y seguro para los aficionados a eventos deportivos profesionales.	82	12
376	Promover que el sistema de transporte proporcione una atención prioritaria en eventos deportivos masivos.	82	12
377	Crear sinergias con instituciones públicas y privadas para la promoción de eventos deportivos.	82	12
378	Implementar acciones que faciliten el acceso incluyente y seguro a los eventos deportivos.	82	12
379	Implementar acciones que fomenten la identidad de la población con los equipos profesionales.	83	12
380	Crear alianzas con instituciones públicas y privadas para la realización de eventos deportivos.	83	12
381	Incentivar la creación de eventos deportivos profesionales procurando la participación de equipos o jugadores  nacionales e internacionales.	83	12
382	Considerar las áreas naturales protegidas en los programas de desarrollo urbano como instrumentos básicos del ordenamiento territorial.	84	15
383	Estimular la creación de consejos comunitarios de vigilancia en todas las áreas protegidas del estado.	84	15
384	Elaborar y dar seguimiento a programas de rehabilitación, reforestación y revegetación de los diversos ecosistemas presentes en las áreas naturales protegidas.	84	15
385	Administrar las áreas naturales protegidas estatales para garantizar su protección.	84	15
386	Promover el manejo sustentable de los recursos naturales endémicos que incrementen la reforestación.	84	15
387	Implementar acciones de conservación de la superficie con vegetación.	84	15
388	Realizar la vinculación con los tres órdenes de gobierno para implementar acciones de arborización con participación ciudadana, en las áreas naturales protegidas. 	84	15
389	Promover sistemas silvopastoriles  que permitan el uso sustentable del suelo.	85	15
390	Guiar la participación de los municipios en la protección y respeto de las zonas sujetas a conservación, promoviendo la vigilancia en los territorios de su competencia. 	85	15
391	Proteger y aprovechar de manera sustentable la biodiversidad en el estado.	85	15
393	Reforzar la protección de animales de crianza, domésticos, de trabajo o de situación de calle.	85	15
394	Gestionar la creación de refugios de animales y veterinarias municipales	85	15
395	Promocionar campañas de educación y respeto hacia todos los animales en los municipios.	85	15
396	Establecer programas de rescate y atención de especies en peligro de extinción que habitan en el estado.	85	15
397	Plantear mecanismos de retribución económica que permitan el financiamiento de proyectos para la conservación de la naturaleza.	85	15
398	Promover una legislación en favor de la protección y bienestar animal.	86	15
399	Gestionar que los municipios cuenten con instrumentos de regulación ecológica que permitan la protección, preservación, restauración y aprovechamiento sustentable de los recursos naturales.	86	15
400	Promover la cultura del medio ambiente desde la edad escolar para generar conciencia.	86	15
401	Planificar el uso público de todos aquellos espacios protegidos que tengan entre sus objetivos facilitar el disfrute cultural, educativo y recreativo de la naturaleza.	86	15
402	Gestionar recursos y financiamientos a favor de programas de manejo sustentable de los recursos naturales.	86	15
403	Generar conocimientos en materia de gestión del ordenamiento ecológico territorial entre  los ayuntamientos.	86	15
404	Promover acciones que protejan el sistema kárstico del estado. 	86	15
405	Proponer una cultura forestal de sensibilización, organización y capacitación en los municipios.	86	15
406	Promover la investigación científica enfocada al conocimiento y protección de la biodiversidad y los recursos naturales del estado.	86	15
407	Dirigir la cooperación técnica ambiental con instituciones de educación superior, centros de investigación, organismos y agencias nacionales e internacionales.	86	15
408	Implementar mecanismos de control y vigilancia del uso de agroquímicos en la agricultura.	86	15
409	Impulsar la producción y uso de plantas nativas para la  arborización con principal atención a zonas prioritarias.	87	15
410	Promover la producción de plantas nativas que presten servicios ambientales a las comunidades.	87	15
411	Promover una mayor cobertura forestal a través de especies nativas.	87	15
412	Reforzar la normatividad legal aplicable a las acciones que contrarresten la deforestación en el estado. 	88	15
413	Realizar la vinculación con los tres órdenes de gobierno para implementar acciones de arborización de terrenos y edificios públicos con participación ciudadana.	88	15
414	Implementar programas enfocados a reducir la pérdida de cobertura forestal del estado. 	88	15
415	Regular el cambio de uso del suelo en terrenos forestales para su conservación y uso adecuado para evitar la degradación.	88	15
416	Elaborar diagnósticos para determinar cuáles son las áreas prioritarias para la conservación.	88	15
417	Impulsar la recuperación, restauración y reforestación de los ecosistemas que han sufrido algún cambio.	88	15
418	Reforzar los consejos ciudadanos para implementar acciones contra el cambio climático.	89	13
419	Promover la realización de estudios e investigaciones sobre posibles efectos derivados del cambio climático.	89	13
420	Promover entre la población la adopción de medidas de adaptación y mitigación ante el cambio climático.	89	13
421	Incorporar a los planes de estudio de todos los niveles educativos la enseñanza de medidas para la prevención, adaptación y mitigación de los efectos del cambio climático. 	89	13
422	Reforzar el fondo estatal de apoyo contra desastres naturales.	90	13
423	Plantear acciones para la concientización de la población que habita en zonas de riesgo de fenómenos meteorológicos.	90	13
424	Fomentar una cultura de prevención y respuesta eficaz ante desastres naturales en coordinación con los municipios del estado. 	90	13
425	Incorporar instrumentos para la gestión de riesgos que permitan accionar ante las posibles consecuencias de los fenómenos naturales adversos. 	90	13
426	Promover la restauración de las barreras naturales para disminuir los impactos de eventos meteorológicos extremos en la zona costera.	90	13
427	Poner en marcha mecanismos de mitigación con el sector agropecuario, industrial, comercial y de servicios, a fin de reducir sus emisiones de carbono.	91	13
428	Promover el uso de ecotecnias para reducir la huella ecológica y mejorar el aprovechamiento sustentable de los recursos naturales.	91	13
429	Generar incentivos económicos para la aplicación de modelos agropecuarios ecológicos y sostenibles. 	91	13
430	Promover prácticas que propicien la reducción de los gases de efecto invernadero.	91	13
431	Impulsar desde las compras y el consumo de la administración pública estatal, una economía baja en carbono.	91	13
432	Identificar y monitorear las fuentes de emisiones contaminantes.	92	13
433	Actualizar el  marco regulatorio vigente en materia de prevención y control de la contaminación atmosférica.	92	13
434	Sensibilizar a la ciudadanía sobre la calidad del aire, los efectos de la contaminación en la salud y en los ecosistemas, así como los riesgos por exposición.	92	13
435	Desarrollar un sistema integral de verificación de la calidad del aire que incluya el sistema de transporte y el sector industrial.	92	13
436	Promover la investigación y la innovación tecnológica como base de las políticas para mejorar la calidad del aire.	92	13
437	Establecer mecanismos para el monitoreo de la calidad del aire prioritariamente en los municipios más afectados por la contaminación. 	92	13
438	Promover el fortalecimiento y actualización de la legislación en materia hídrica en el estado.	93	6
439	Diseñar programas para la reutilización de las aguas residuales tratadas para uso general y en el sector industrial.	93	6
440	Identificar fuentes de financiamiento para fortalecer los sistemas de saneamiento y tratamiento de agua con visión a largo plazo.	94	6
441	Ampliar la infraestructura existente para el suministro de agua potable en el estado.	94	6
442	Establecer mecanismos de cooperación entre el gobierno estatal y la iniciativa privada, para desarrollar proyectos de materia de tratamiento de aguas residuales.	94	6
443	Establecer programas, procesos de mantenimiento y mejoramiento de las plantas de tratamiento de aguas residuales existentes.	94	6
444	Elaborar un plan de innovación tecnológica para el fomento al tratamiento de las descargas de aguas residuales.	95	6
445	Promover la regulación de las plantas de tratamiento residuales, para que incorporen las tecnologías que resulten más convenientes para la población.	95	6
446	Invertir en nuevas tecnologías que mejoren la calidad del agua tratada. 	95	6
447	Vincular a las universidades y centros de investigación para el desarrollo tecnológico en el mejoramiento del tratamiento de agua.	95	6
448	Desarrollar esquemas de economía circular para el cuidado del agua	95	6
449	Promover planes y normas que regulen el uso eficiente del agua.	96	6
450	Poner en marcha acciones para hacer más eficiente y mejorar la calidad en el servicio de potabilización del agua.	96	6
451	Desarrollar procesos de fortalecimiento y capacitación de los municipios para la gestión sustentable del agua.	96	6
452	Incrementar la captación y aprovechamiento del agua pluvial.	96	6
453	Promover en el sector empresarial, especialmente en la industria hotelera y de servicios turísticos, el uso eficiente del agua, reducción de emisiones contaminantes y reciclaje.	96	6
454	Promover la concientización de la población sobre el uso responsable y eficiente del agua así como el pago oportuno del servicio.	96	6
455	Promover prácticas sustentables en las actividades agrícolas eficientes en el uso del agua.	96	6
456	Estandarizar indicadores de medición de la calidad del agua en el manto acuífero. 	97	6
457	Implementar esquemas de vigilancia ciudadana del agua.	97	6
458	Promover la creación de un sistema de monitoreo e inspección de la calidad del agua a nivel estatal. 	97	6
459	Promover una cultura de sustentabilidad en torno al manejo integral de residuos desde la educación formal y no formal.	98	12
460	Organizar la gestión de los residuos sólidos y especiales de acuerdo con una lógica regional en los municipios, a fin de sumar las capacidades institucionales y hacer uso eficiente de los recursos.	98	12
461	Formular acciones que aumenten el valor de los residuos recolectados dentro de economías de escala.	98	12
462	Capacitar al sector empresarial, gubernamental y a la sociedad para la elaboración adecuada de sus planes de manejo de residuos.	98	12
463	Desarrollar esquemas de saneamiento y recuperación de sitios afectados por el inadecuado manejo de los residuos.	98	12
464	Estimular la participación de la población para elaborar iniciativas ciudadanas para el manejo integral de los residuos.	98	12
465	Promover la inversión privada en el manejo integral de los residuos sólidos y especiales.	98	12
466	Implementar mecanismos de monitoreo y evaluación del cumplimiento de los reglamentos y normas ambientales.	98	12
467	Regular el uso del plástico en el estado.	99	12
468	Promover en las empresas que fabrican bolsas y productos de plástico la adopción de tecnologías biodegradables	99	12
469	Incentivar a las empresas para que adopten una cultura de reducción de residuos.	99	12
470	Incentivar el uso de los empaques ambientalmente responsables en los establecimientos comerciales.	99	12
471	Reforzar y mejorar los esquemas de organización y comunicación dirigida a la reducción y aprovechamiento de los residuos.	99	12
472	Gestionar la infraestructura para aumentar el aprovechamiento y valorización de los residuos.	100	12
473	Diseñar campañas para la separación de residuos sólidos y la reutilización de materiales de desecho.	100	12
474	Fortalecer el marco jurídico, para establecer trabajo comunitario de recolección de residuos sólidos y limpieza de calles como sanción a quienes arrojan residuos sólidos en espacios públicos.	100	12
475	Incentivar y regular a la industria para el manejo sustentable de los residuos sólidos y especiales.	100	12
476	Promover el reciclaje inclusivo en los municipios.	100	12
477	Promover la innovación e investigación para eficientar la valorización de los residuos.	100	12
478	Promover proyectos en el sector empresarial que contribuyan al desarrollo tecnológico de energías limpias.	101	7
479	Vincular los diferentes sectores para la implementación conjunta de proyectos de eficiencia energética y energías limpias.	101	7
480	Promover la investigación y capacitación en torno a las energías renovables.	101	7
481	Promover proyectos de energías renovables en los ámbitos industrial y residencial.	102	7
482	Promover el desarrollo de inventarios de energías limpias en el estado. 	102	7
483	Favorecer la implementación de energías limpias en el gobierno estatal.	102	7
484	Promover la generación y gestión de energía distribuida y autónoma a través de fuentes renovables.	102	7
485	Promover con las autoridades competentes, la inclusión en la evaluación y autorización de proyectos de generación de energías renovables. 	102	7
486	Promover el uso de dispositivos compatibles con las energías limpias a la población.	103	7
487	Promover la operación de proyectos  de inversión privada de energías no contaminantes.	103	7
488	Establecer incentivos para que los sectores social y privado hagan uso de energías limpias. 	103	7
489	Establecer mecanismos de cooperación que ofrezcan alternativas viables con relación a los costos de insumos energéticos.	104	7
490	Promover proyectos científicos y tecnológicos, dirigidos a reducir la demanda energética e incrementar el uso de energías renovables.	104	7
491	Poner en marcha proyectos e inversiones dirigidas a un aprovechamiento sustentable de la energía en el estado.	104	7
492	Promover la acuacultura como medio para evitar la sobreexplotación de las especies marinas.	105	14
493	Reforzar la vigilancia del cumplimiento de los periodos de veda de las especies marinas.	105	14
494	Implementar programas de manejo y conservación de especies marinas en el estado.	105	14
495	Reforzar la regulación y vigilancia sobre la pesca recreativa y deportiva. 	105	14
496	Establecer programas de conservación y promover el rescate y cuidado de los manglares y playas de las zonas costeras.	106	14
497	Difundir campañas de limpieza de playas que fomenten la participación ciudadana.	106	14
498	Establecer programas de vigilancia permanente de las playas para evitar su contaminación. 	106	14
500	Implementar alternativas para la pesca, a fin de reducir la presión sobre especies submarinas en peligro o en riesgo. 	106	14
501	Promover programas y proyectos que favorezcan la restauración y conservación de la zona costera.	106	14
502	Reforzar el manejo adecuado de las zonas costeras protegidas.	106	14
503	Impulsar el desarrollo de infraestructura específica para optimizar el Sistema de Transporte Urbano.	107	11
504	Elaborar programas de capacitación para los prestadores de servicio de transporte público.	107	11
505	Establecer lineamientos que permitan castigar el acoso femenil dentro del sistema de transporte público.	108	11
506	Gestionar el incremento de las unidades de transporte público adecuadas para las personas con discapacidad.	108	11
507	Implementar acciones que prioricen al peatón y modifiquen la infraestructura de calles y banquetas, dando especial atención a personas con discapacidad.	109	11
508	Elaborar programas de ampliación de la infraestructura urbana para movilidad no motorizada.	109	11
509	Elaborar programas que promuevan el uso de medios de transporte  sustentables como alternativa a los medios de transporte motorizados. 	109	11
510	Formular programas de desarrollo urbano que contribuyan y fortalezcan la movilidad integral en todos los municipios del estado.	109	11
511	Promover esquemas de capacitación y cultura vial para operadores y usuarios del transporte público.	110	11
512	Adecuar las vialidades en zonas de alto riesgo para los peatones con enfoque incluyente.	110	11
513	Promover la realización de estudios y proyectos que contribuyan a mejorar la cultura vial y la reducción de accidentes.	110	11
514	Crear programas e instrumentos para mejorar la accesibilidad universal a corto, mediano y largo plazo.	111	11
515	Elaborar un plan de movilidad urbana sustentable bajo en carbono.	111	11
516	Reforzar el transporte interurbano de calidad y con accesibilidad universal.	111	11
517	Motivar el desarrollo de propuestas ciudadanas de movilidad asequible, segura y no contaminante, en los instrumentos de planeación.	111	11
518	Proponer esquemas integrales de movilidad urbana.	111	11
519	Fortalecer la legislación estatal en materia de movilidad sustentable.	111	11
520	Incentivar la transición del uso del automóvil hacia medios de transporte más sustentables.	111	11
521	Incorporar la conectividad urbana y la provisión de redes de transporte público como exigencia para nuevas urbanizaciones.	111	11
522	Revisar y actualizar los instrumentos normativos existentes en materia de movilidad urbana sustentable.	111	11
523	Facilitar el acceso a los métodos anticonceptivos de la población para el ejercicio de sus derechos sexuales y reproductivos.	112	5
524	Propiciar las condiciones para la atención integral, especializada y con perspectiva de género de salud de las mujeres, con énfasis en mujeres con alguna discapacidad, en situación de pobreza extrema o marginación.	112	5
525	Fortalecer los esquemas de atención con enfoque intercultural en el sector público para la detección y atención oportuna de las enfermedades que más afectan a las mujeres.	112	5
526	Facilitar el acceso a los servicios médicos y psicológicos a niñas, mujeres adultas y adultas mayores con discapacidad, en situación de pobreza extrema o marginación.	113	5
527	Impulsar campañas de prevención del embarazo adolescente, con un enfoque inclusivo y con atención especial en zonas marginadas y en el interior del estado.	113	5
528	Facilitar el acceso a servicios médicos y psicológicos a niñas y adolescentes embarazadas para garantizar su salud.	113	5
529	Sensibilizar sobre el paradigma de los nuevos modelos de masculinidad en la prevención del embarazo adolescente.	113	5
530	Impulsar convenios de colaboración y fomentar la coordinación con los sectores público, privado, social y académico para fortalecer la educación inclusiva, con atención especial  en comunidades alejadas.	114	5
531	Promover esquemas especiales de alfabetización para mujeres adolescentes y adultas.	114	5
532	Impulsar acciones afirmativas que permitan a las mujeres embarazadas o madres solteras continuar con su formación educativa.	114	5
533	Promover el enfoque de género en los procesos de diseño de programas educativos de todos los niveles de atención.	114	5
534	Impulsar acciones interinstitucionales en el ámbito educativo para la prevención del embarazo adolescente.  	114	5
535	Facilitar apoyos e incentivos para fortalecer la permanencia escolar de las niñas y mujeres, con énfasis en zonas de alto riesgo de deserción educativa.	114	5
536	Promover la inclusión de mujeres estudiantes, docentes, personal administrativo y con discapacidad en el sector educativo, en especial en profesiones altamente masculinizadas.	115	5
537	Establecer escenarios propicios para la integración de las mujeres indígenas y mayahablantes a la educación. 	115	5
538	Fomentar acciones para eliminar estereotipos de género en la educación.	115	5
539	Implementar programas de capacitación que permitan a las mujeres fortalecer sus habilidades en el uso de tecnologías.	115	5
540	Crear una estrategia coordinada para combatir la pobreza y fomentar la inserción laboral de las mujeres.	116	5
541	Impulsar una bolsa de trabajo inclusiva para mujeres con discapacidad y adultas mayores.	116	5
542	Impulsar acciones en beneficio de mujeres con bajo nivel de escolaridad, madres solteras, mujeres adultas mayores o con discapacidad en beneficio de su autonomía financiera.	116	5
543	Implementar acciones que favorezcan las condiciones de competitividad para las mujeres emprendedoras y generadoras de empleo.	116	5
544	Promover redes comunitarias de mujeres productoras y comerciantes que fortalezcan el desarrollo económico.	116	5
545	Impulsar alianzas, entre el sector público y privado, que premien la responsabilidad social empresarial y permitan a las mujeres conciliar su vida familiar y laboral.	116	5
546	Promover un salario equitativo entre mujeres y hombres por trabajo de igual valor.	116	5
547	Promover apoyos para mujeres que presten cuidados no remunerados a personas dependientes conocidos como cuidados prolongados.	116	5
548	Promover redes que impulsen de manera focalizada el emprendimiento de las mujeres a través del acompañamiento, servicios eficientes y comercialización de sus productos.	116	5
549	Incrementar la participación política de las mujeres, especialmente para los puestos públicos de toma de decisiones e impartición de justicia.	117	5
550	Promover la corresponsabilidad de los hogares para facilitar la participación de las mujeres en la toma de decisiones familiares, educativas y económicas.	117	5
551	Promover la transversalización de la perspectiva de género en todos los ciclos de las políticas públicas.	117	5
552	Fortalecer las instituciones enfocadas a transversalizar  la perspectiva de género en la entidad.	117	5
553	Fomentar el empoderamiento de las mujeres para aumentar la resiliencia y adaptación al cambio climático.	117	5
554	Impulsar  el acceso de las mujeres a la información y participación en decisiones ambientales  y manejo sustentable de los recursos.	117	5
555	Capacitar a las y los titulares de las dependencias y entidades para la institucionalización e incorporación de la perspectiva de género.	118	5
556	Promover la incorporación de buenas prácticas para la igualdad laboral y no discriminación con el objetivo de que los sectores públicos y privados obtengan certificaciones en la materia.	118	5
557	Fortalecer a las instancias de las mujeres en los municipios para prevenir la violencia de género hacia las mujeres y la desigualdad entre mujeres y hombres.	118	5
558	Impulsar mecanismos para la prevención, atención y denuncia de la violencia sexual en instituciones educativas e instancias públicas y privadas que trabajen con niñas, niños y adolescentes.	118	5
559	Fortalecer las capacidades en el sistema educativo estatal para la atención de conductas de riesgo y prevención de violencia de género.	118	5
560	Impulsar que las empresas apliquen medidas para prevenir y erradicar el acoso laboral, la discriminación por razones de género y cualquier otra práctica que vulnere los derechos de las mujeres.	118	5
561	Promover la cultura de la denuncia a través de medios accesibles con especial atención en  personas con discapacidad y mayahablantes.	119	5
562	Fortalecer la participación ciudadana, así como de los medios de comunicación, para rechazar la normalización de la violencia en contra de las mujeres.	119	5
563	Fomentar campañas permanentes en contra del acoso y violencia contra las mujeres  en espacios públicos.	119	5
564	Fortalecer la protección de los derechos de las niñas y mujeres adolescentes en especial el derecho a una vida libre de violencia.	119	5
565	Promover el uso de las Tecnologías de la Información y la Comunicación para acercar los servicios de emergencia ante situaciones de violencia.	119	5
566	Generar campañas dirigidas a hombres que promuevan las masculinidades no violentas y el involucramiento activo en la prevención de la violencia contra las mujeres.	119	5
567	Promover la capacitación de los elementos de seguridad pública para que sus intervenciones en situaciones de violencia hacia las mujeres sean efectivas, apegadas a la ley y oportunas.	120	5
568	Facilitar la accesibilidad segura de las mujeres a los centros municipales de atención a la violencia contra las mujeres, en especial en las comunidades mayas.	120	5
569	Impulsar la capacitación del personal médico en la aplicación de las normas mexicanas dirigidas a brindar servicios de calidad y prevenir prácticas de discriminación o actos de violencia contra las mujeres.	120	5
570	Fortalecer los órganos estatales encargados de promover los derechos humanos de las mujeres y establecer acciones para la igualdad de género.	120	5
571	Impulsar los servicios itinerantes de primer contacto ante situaciones de violencia, especialmente en comunidades alejadas.	120	5
572	Promover acciones multidisciplinarias para la atención integral de las causas y efectos de la violencia de género	120	5
573	Impulsar la capacitación de los jueces de paz de los municipios en perspectiva de género, con énfasis en la atención de casos de violencia hacia las mujeres y violencia intrafamiliar.	121	5
574	Fortalecer la legislación estatal para que contribuya a la igualdad de oportunidades y al acceso de las mujeres a una vida libre de violencia y armonizarla con las normas generales y tratados internacionales.	121	5
575	Fortalecer el trabajo operativo a través de protocolos que eviten la revictimización de las mujeres en el sistema de justicia.	121	5
576	Fortalecer los servicios de defensoría de oficio con personal especializado en género y derechos humanos.	121	5
577	Impulsar redes interinstitucionales que generen datos con desagregación estadística por sexo y edad, para la toma de decisiones públicas en favor de las mujeres, en especial en el tema de prevención, atención, sanción y combate de violencia y defensa de los derechos.	122	5
578	Impulsar mecanismos de vinculación interinstitucional que fortalezca el banco de datos estatal sobre violencia para que sea alimentado por las instancias competentes.	122	5
579	Evaluar y certificar los registros estadísticos e informáticos que concentran datos sobre la violencia contra las mujeres. 	122	5
580	Estimular las habilidades y conocimientos técnicos y operativos para el trabajo de las y los jóvenes en situación de vulnerabilidad	123	10
581	Promover acciones de autoempleo y financiamiento que proyecten el desarrollo empresarial de la población en situación de vulnerabilidad.	123	10
582	Promover acuerdos y convenios en el sector público y grupos empresariales para la incorporación al empleo de personas en situación de vulnerabilidad, en especial de personas con discapacidad y adultas mayores.	123	10
583	Asesorar a la población en situación de vulnerabilidad sobre los derechos de los trabajadores para garantizar su protección laboral.	123	10
584	Fomentar acciones especiales para que la población con alguna discapacidad tenga acceso a empleo de calidad.	123	10
585	Instrumentar medidas que combatan el trabajo infantil y permitan el disfrute a los niños de los derechos de la niñez	123	10
586	Fortalecer las áreas gubernamentales encargadas de garantizar los derechos de las personas con alguna discapacidad o en situación de vulnerabilidad	123	10
587	Facilitar el acceso y la permanencia de personas con alguna discapacidad a una educación integral y de calidad.	124	10
588	Facilitar espacios culturales y deportivos incluyentes para el esparcimiento e interacción de los grupos en situación de vulnerabilidad.	124	10
589	Incentivar a organizaciones que elaboren proyectos o acciones de desarrollo comunitario, de combate a las desigualdades sociales y acceso incluyente.	124	10
590	Promover la participación de la sociedad civil en la implementación de acciones innovadoras que destacan la inclusión social al desarrollo comunitario.	124	10
591	Promover un sistema de asistencia y apoyo para personas en situación de dependencia, con énfasis en las que presenten carencia alimentaria.	124	10
592	Impulsar el desarrollo comunitario que permita la inclusión de los grupos en situación de  vulnerabilidad en el bienestar social	124	10
593	Fomentar programas de apoyo para personas en situación de vulnerabilidad que faciliten el acceso a la vivienda y servicios básicos.	124	10
594	Facilitar el acceso a la seguridad social y servicios de salud a personas con alguna discapacidad o en situación de vulnerabilidad.	124	10
595	Fortalecer los espacios públicos para que sean accesibles y que cumplan con los estándares de calidad e inclusión para las personas con alguna discapacidad.	125	10
596	Impulsar acciones de equipamiento en las unidades básicas de rehabilitación integral para personas con discapacidad. 	125	10
597	Fortalecer la infraestructura, equipamiento y tecnología asistiva para la población en situación de vulnerabilidad, con énfasis en las personas con alguna discapacidad.	125	10
598	Impulsar el uso de las Tecnologías de la Información y Comunicación para la asistencia a la población en situación de vulnerabilidad y/o dependencia.	125	10
599	Capacitar al personal de las instituciones públicas y privadas en temas de sensibilización y acompañamiento a la inclusión social de la población en situación de vulnerabilidad con énfasis en las personas con alguna discapacidad y de comunidades indígenas.	125	10
600	Reforzar el marco normativo vigente para aplicar sanciones más estrictas en casos de discriminación y violencia contra la mujer, así como a grupos en situación de vulnerabilidad	125	10
601	Fortalecer las capacidades del personal de las instituciones encargadas de la atención de la violencia hacia las mujeres, niñas, niños, adolescentes y otras en situación de vulnerabilida	125	10
602	Impulsar mecanismos educativos de concientización, que propicien la igualdad y la no discriminación hacia los grupos en situación de vulnerabilidad. 	126	10
603	Promover una cultura de tolerancia y no discriminación en todos los niveles educativos.	126	10
604	Promover la educación cívica y el respeto a la Ley en todas las esferas institucionales, con énfasis en la familia y escuelas.	126	10
605	Implementar campañas de difusión de los derechos civiles, políticos, económicos, sociales, culturales y ambientales.	126	10
606	Diseñar campañas de fomento para la inclusión social en la participación política del estado y el ejercicio pleno de los derechos.	126	10
607	Coordinar una vinculación efectiva entre los niveles de educación media superior y la educación superior para mejorar la absorción y la pertinencia de los programas educativos.	127	9
608	Impulsar mecanismos de difusión en línea que faciliten el conocimiento de la oferta educativa existente en el nivel superior.	127	9
609	Proveer de Tecnologías de la Información y la Comunicación a las instituciones de educación superior para fomentar la innovación de los métodos educativos.	127	9
610	Generar las condiciones adecuadas para que más programas educativos del nivel superior puedan ser impartidos en línea. 	127	9
611	Procurar la inversión en infraestructura física y equipamiento acorde a los requerimientos actuales de cada institución de educación superior.	127	9
612	Promocionar a las universidades como centros de capacitación certificados para la profesionalización basada en competencias laborales de calidad.	128	9
613	Impulsar programas de formación continua para personal de las empresas, con especial énfasis en las capacidades científicas y técnicas.	128	9
614	Generar alianzas entre las universidades, centros de investigación, instituciones tecnológicas e iniciativa privada para la formación de capital humano de calidad acorde a la demanda del mercado laboral.	128	9
615	Desarrollar una oferta de educación superior adaptada a la demanda de la industria 4.0 .	128	9
616	Impulsar bolsas de trabajo y seguimiento de egresados para la comunidad de estudiantes de nivel superior, a través de convenios de colaboración entre el sector privado y las instituciones de educación superior. 	128	9
617	Promover mecanismos de asesoría especializada del sector educativo hacia el sector privado, con especial énfasis en temas científicos y técnicos.	128	9
618	Vincular la participación de las universidades en la solución de problemas locales a través de la investigación aplicada.	128	9
619	Ampliar la cobertura de programas de fomento científico que beneficie a un mayor número de niñas, niños y jóvenes.	129	9
620	Implementar mecanismos de divulgación de la ciencia a la población en general que generen interés por la misma.	129	9
621	Diseñar programas de ciencias, tecnología, ingeniería y matemáticas para desarrollar las destrezas o habilidades de los estudiantes en estas disciplinas.	129	9
622	Diseñar planes de estudio adecuados a las vocaciones regionales actuales y emergentes.	130	9
623	Fortalecer los planes de estudio existentes para su actualización de acuerdo a las necesidades de los sectores económico, social y ambiental, y con enfoque de sostenibilidad.	130	9
624	Diseñar mecanismos que permitan flexibilizar los procesos de terminación y titulación en los programas educativos.	130	9
625	Establecer mecanismos para una adecuada formación, profesionalización y actualización docente en las Instituciones de educación superior a través de programas de ciencias, tecnología, ingeniería y matemáticas.	130	9
626	Fomentar la acreditación de programas y procesos eeducativos del nivel superior con base en estándares de calidad y pertinencia.	130	9
627	Promover canales de colaboración entre las instituciones de educación superior del estado con las instituciones del orden nacional e internacional.	131	9
628	Fortalecer los programas de idiomas y de vinculación al extranjero.	131	9
629	Facilitar la modernización y adaptación de las Instituciones de educación superior a las nuevas tecnologías y necesidades educativas.	131	9
630	Establecer esquemas adecuados para orientar los programas de posgrado en el estado hacia el cumplimiento de estándares de calidad reconocidos por organismos nacionales e internacionales.	131	9
631	Diseñar esquemas para fortalecer los programas de licenciatura a fin de contar con egresados del nivel con mejor calidad para su incorporación a estudios de posgrado.	131	9
632	Diseñar esquemas para fortalecer la formación de recursos humanos en el extranjero, que contribuyan a elevar la calidad de la planta docente de estudios de posgrado en el estado.	131	9
633	Diseñar esquemas para fortalecer los programas de tutorías existentes en las instituciones de educación superior a fin de garantizar su efectividad.	132	9
634	Promover en conjunto con el sector empresarial, mecanismos que permitan a los estudiantes, insertarse en la industria desde su formación en las instituciones de educación superior.	132	9
635	Fortalecer los programas de apoyos que contribuyan a evitar la deserción en la educación superior. 	132	9
636	Fortalecer de manera sostenible la normatividad de la gestión institucional para asegurar el funcionamiento pertinente de las instituciones de educación superior.	132	9
637	Favorecer la incorporación de organismos independientes en la evaluación de los programas educativos.	132	9
638	Diseñar mecanismos de capacitación y evaluación integral del desempeño docente que asegure la mejora continua.	132	9
639	Consolidar el Sistema de Investigación, Innovación y Desarrollo Tecnológico del Estado de Yucatán (SIIDETEY).	133	9
640	Incentivar las actividades de investigación y desarrollo en sectores estratégicos como agrobiotecnología, energías sustentables, salud, manejo de los recursos naturales entre otros.	133	9
641	Promover la formación de recursos humanos altamente calificados en el campo de la investigación y desarrollo tecnológico.	133	9
642	Establecer esquemas de apoyo financiero a proyectos de investigación científica y tecnológica.	133	9
643	Impulsar convenios de colaboración entre centros de investigación, instituciones de educación superior y empresas privadas para el desarrollo de tecnología.	134	9
644	Diseñar mecanismos de movilidad de recursos humanos hacia las instituciones de educación superior internacionales.	134	9
645	Estimular la participación del sector privado en las estrategias de movilidad internacional que se impulsen desde el estado, con énfasis en ciencia, tecnología , artes y humanidades.	134	9
646	Diseñar un sistema de estancias estudiantiles en empresas para la colaboración en proyectos de investigación y desarrollo.	134	9
647	Fortalecer los procesos de investigación y desarrollo tecnológico en los campos de artes y humanidades.	134	9
648	Sensibilizar a la población sobre la importancia del aprovechamiento científico y tecnológico en las artes y humanidades.	134	9
649	Impulsar el desarrollo de un clúster de innovación y desarrollo de Tecnologías de la Información y la Comunicación en el estado.	134	9
650	Gestionar fondos para la colaboración pública y privada en la implementación de proyectos científicos y tecnológicos.	135	9
651	Gestionar la transferencia de conocimientos y tecnología que permitan atender con mayor efectividad los problemas sociales.	135	9
652	Promover los avances y beneficios de la ciencia y tecnología en los municipios y en todos los niveles educativos.	135	9
653	Promover la formación de recursos humanos altamente calificados en el campo de la investigación, desarrollo científico, artes y humanidades.	135	9
654	Impulsar la investigación enfocada al sector salud para generar tecnología y biotecnología de vanguardia.	135	9
655	Proponer espacios para el intercambio entre ciencia, tecnología, sociedad y cultura.	136	9
656	Implementar esquemas de financiamiento para el fortalecimiento de infraestructura tecnológica.	136	9
657	Generar aciones que faciliten la atracción y retención de talento en sectores de alta complejidad económica.	136	9
658	Establecer mecanismos para incrementar el número de empresas e instituciones científicas y tecnológicas en el estado.	136	9
659	Desarrollar instrumentos de transferencia y difusión tecnológica en sectores estratégicos para el estado.	136	9
660	Incentivar a las empresas que generen investigación y desarrollo tecnológico en sus procesos de producción de manera sustentable y sostenible.	137	9
661	Otorgar facilidades a los investigadores e Instituciones de educación superior para gestionar y registrar sus invenciones.	137	9
662	Impulsar esquemas de sensibilización y difusión sobre la propiedad intelectual e industrial.	137	9
663	Generar acciones para la vinculación efectiva entre los centros de investigación, instituciones de educación superior y la industria, en torno a la generación de propiedad intelectual e industrial.	137	9
664	Estimular la generación y el aprovechamiento de invenciones o procesos novedosos en el sector público.	137	9
665	Consolidar el sistema de incubadoras en el estado mediante acciones de equipamiento e intercambio académico, científico y tecnológico.	138	9
666	Fortalecer el Parque Científico y Tecnológico del estado mediante esquemas efectivos de colaboración e impulso académico.	138	9
667	Estimular la inversión pública y privada en acciones de innovación, investigación científica y transferencia tecnológica.	138	9
668	Reforzar la consolidación de los ecosistemas de innovación, así como también, la infraestructura científica en zonas estratégicas del estado	138	9
669	Fortalecer las campañas de prevención del delito de forma inclusiva y sostenible con énfasis en zonas de mayor incidencia delictiva. 	139	16
670	Instrumentar acciones de manera coordinada con todos los órdenes de gobierno en materia de prevención del delito.	139	16
671	Diseñar sistemas de información estadística y geográfica para el mejoramiento de toma de decisiones en la prevención del delito.	139	16
672	Establecer operativos especiales para el combate a los delitos de robo a casa habitación, fraude, extorsión y robo parcial de vehículo.	139	16
673	Realizar acciones para la detección de portación de armas de fuego sin autorización y arma blanca.	139	16
674	Diseñar un programa de prevención social del delito que contemple las causas y particularidades de cada región, municipio y localidad.	139	16
675	Incentivar la participación ciudadana y de organizaciones para la prevención social del delito  que genere comunidades y ciudades resilientes.	139	16
676	Estimular la proximidad social entre las instituciones de seguridad y la ciudadanía para la detección oportuna de riesgos para su atención prioritaria.	139	16
677	Diseñar mecanismos de seguimiento a los requerimientos en materia de prevención social del delito derivados de la participación ciudadana.	139	16
678	Realizar actividades que fomenten la armonía comunitaria y la cohesión social en beneficio de la seguridad a nivel localidad.	139	16
679	Impulsar acciones específicas que promuevan la cultura de la paz, eviten la violencia en todos los niveles educativos.	139	16
680	Establecer programas integrales interinstitucionales de combate de adicciones con enfoque intercultural y de prevención del delito.	139	16
681	Capacitar a la población para la prevención, detección y denuncia de los delitos cibernéticos.	139	16
682	Reforzar las capacidades de los jueces de paz en el interior del estado para la aplicación de la mediación en conflictos de convivencia comunitaria.	140	16
683	Promover la aplicación de esquemas de mediación en el ámbito escolar para la resolución de conflictos.	140	16
684	Implementar modelos de mediación para la resolución de conflictos bajo el principio de igualdad de derechos.	140	16
685	Impulsar la instrumentación del servicio profesional de carrera policial.	141	16
686	Reforzar la capacitación inicial y continua de los policías estatales y municipales, así como su especialización.	141	16
687	Capacitar a mandos medios y altos dentro de nuevos modelos estratégicos para la investigación policial y el combate a la delincuencia.	141	16
688	Promover los programas de renivelación académica de los elementos policiales.	141	16
689	Establecer un programa de mejoramiento de las condiciones sociales, económicas y de vida de los policías del estado.	141	16
690	Impulsar campañas de seguridad vial y respeto a las normas de tránsito y vialidad.	142	16
691	Reforzar los operativos de vigilancia vial y de alcoholimetría para prevenir accidentes de tránsito.	142	16
692	Impulsar acciones para la modernización de la infraestructura de tránsito en materia de señalización y semaforización.	142	16
693	Promover la realización de pláticas de educación vial en las escuelas y entre las organizaciones civiles.	142	16
694	Reforzar la infraestructura, equipamiento y tecnología de las instituciones de seguridad, en beneficio de la población y visitantes del estado.	143	16
695	Reforzar las acciones de vigilancia en la entrada y salida del estado con aprovechamiento tecnológico.	143	16
696	Fortalecer las capacidades del sistema de videovigilancia en toda la entidad y sus carreteras con énfasis especial en zonas de mayor presencia delictiva.	143	16
697	Reforzar el estado de fuerza policial, así como sus capacidades  técnicas y habilidades con enfoque basado en derechos humanos para la atención de situaciones de auxilio a la población, especialmente en localidades y municipios de mayor incidencia delictiva.	143	16
698	Establecer nuevos esquemas para la prevención y combate de robos a casa  habitación y comercios.	143	16
699	Diseñar mecanismos eficientes de vigilancia policiaca en zonas de alto riesgo delictivo con especial énfasis en la protección de las mujeres y población en situación de vulnerabilidad.	143	16
700	Implementar acciones para el uso de nuevas Tecnologías de la Información y la Comunicación en materia de prevención y seguridad pública.	143	16
701	Establecer esquemas para la reinserción social efectiva de personas que han cometido algún tipo de delito.	143	16
702	Modernizar los centros de reinserción social del estado para garantizar el respeto de los  derechos humanos de las personas en detención.	143	16
703	Fortalecer los mecanismos de registro vehicular para contar con un padrón que ayude a la recuperación e identificación de vehículos involucrados en conflictos con la Ley.	144	16
704	Impulsar mecanismos para vigilar el cumplimiento de la Ley por parte de los elementos de los cuerpos de seguridad pública.	144	16
705	Impulsar acciones de infraestructura y equipamiento en materia de procuración de justicia.	145	16
706	Fortalecer los recursos humanos y capacidades técnicas de las instituciones de justicia, especialmente las relacionadas con las tareas de investigación y el ministerio público.	145	16
707	Fortalecer los mecanismos alternativos de solución de controversias a través de personal calificado y con perspectiva de género.	145	16
708	Consolidar el Sistema Acusatorio  Penal y el Sistema Oral de Justicia para agilizar su ejercicio en todas las áreas de derecho en especial en materia mercantil. 	145	16
709	Diseñar mecanismos administrativos para el control de reincidencias en materia de comisión de delitos.	145	16
710	Impulsar la simplificación de los procesos de denuncia para disminuir tiempos.	146	16
711	Mejorar el proceso de denuncia del delito para que mantenga parámetros de calidad en servicio y atención.	146	16
712	Impulsar el desarrollo del sistema de acceso a la información de estatus de personas en conflicto con la ley en los ministerios públicos.	146	16
713	Aplicar tecnologías de información para agilizar los procesos de denuncia.	146	16
714	Reforzar las capacidades de la defensoría legal en la entidad.	146	16
715	Ampliar los servicios de asesoría gratuita en otras materias como la civil, en especial para la población en situación de vulnerabilidad.	146	16
716	Facilitar la atención oportuna en los procesos de denuncia a mujeres víctimas de violencia doméstica o de género.	146	16
717	Adecuar los espacios físicos para la prestación de servicios de defensoría pública.	147	16
718	Instrumentar esquemas de capacitación en materia de procuración de justicia y defensoría legal con énfasis a grupos en situación de vulnerabilidad.	147	16
719	Promover campañas dirigidas a la cultura de respeto y difusión de derechos humanos.	147	16
720	Promover campañas de respeto a los valores humanos y principios de convivencia familiar.	147	16
721	Gestionar acciones de capacitación en lengua maya en el ámbito del Sistema de Justicia Penal.	147	16
722	Implementar acciones para profesionalización de peritos del Sistema de Justicia Penal.	147	16
723	Actualizar las leyes en materia de procuración de justicia para hacer eficiente su aplicación y desanimar la reincidencia delictiva.	148	16
724	Implementar acciones para el fortalecimiento de los juzgados en materia de procuración de justicia.	148	16
725	Mejorar los mecanismos legales para la calificación e identificación de delitos del fuero común.	148	16
726	Diseñar acciones para la reducción de la impunidad en casos de violencia familiar y de género.	148	16
727	Promover la presencia de policías ministeriales o investigadores en los municipios, en especial los de mayor incidencia delictiva.	149	16
728	Facilitar el acceso a los servicios de la Fiscalía y ministerios públicos a los ciudadanos del interior del estado.	149	16
729	Fortalecer la atención a víctimas del delito y la reparación del daño a las mismas.	149	16
730	Impulsar normas y  mecanismos que agilicen las notificaciones personales, garanticen la adecuada ejecución de las sentencias y reduzcan los tiempos y costos en la tramitación de juicios.	149	16
731	Establecer mecanismos claros para la rendición de cuentas y transparencia en los procesos de seguridad y justicia en beneficio de los derechos humanos.	150	16
732	Implementar acciones para difusión de datos abiertos a la ciudadanía en materia de seguridad y justicia con desagregación por género.	150	16
733	Promover campañas de difusión de la acciones implementadas  de la agenda gubernamental en materia de seguridad, justicia y gobernabilidad, así como de los resultados obtenidos.	150	16
734	Establecer acciones que fomenten la certeza jurídica de los habitantes en especial los relacionados al derecho a la identidad, el patrimonio y aquellos que condicionen acceso a otros derechos humanos.	151	16
735	Reforzar el derecho de propiedad de las mujeres.	151	16
736	Impulsar la modernización y actualización de los servicios relacionados al derecho a la identidad y el patrimonio de los habitantes.	151	16
737	Gestionar convenios con los municipios para el uso de recursos en coparticipación para  acciones que mejoren la calidad de vida de los habitantes .	152	16
738	Coadyuvar con los municipios en la implementación del modelo de Presupuesto basado en Resultados y del Sistema de Evaluación del Desempeño.	152	16
739	Fortalecer la coordinación en materia de protección civil, igualdad de género, inclusión social y otros temas vinculados con los derechos económicos, sociales, culturales y ambientales con los municipios.	152	16
740	Crear programas itinerantes que permitan a la población, especialmente la apartada geográficamente o con vulnerabilidad acceder a trámites y servicios relacionados con la seguridad, justicia y certeza jurídica.	153	16
741	Estimular capacidades e infraestructura para la descentralización de los servicios de seguridad, justicia y certeza jurídica.	153	16
742	Promover mecanismos de cooperación que permitan adaptar, adoptar e implementar las mejores prácticas internacionales para el logro de las metas de los Objetivos de Desarrollo Sostenible.	154	16
743	Fortalecer los instrumentos jurídicos estatales que contemplan la cooperación internacional.	154	16
744	Fortalecer a las instituciones estatales responsables de los asuntos nacionales e internacionales.	154	16
745	Gestionar el acercamiento entre autoridades internacionales y el gobierno del estado para fomentar la cooperación internacional.	155	16
746	Fomentar la inclusión de los municipios en las acciones de eventos de carácter internacional.	155	16
747	Desarrollar sistemas y aplicaciones inclusivas para la generación, conservación y gestión de la información pública.	156	17
748	Fortalecer las capacidades técnicas, financieras y normativas de los sistemas de información.	156	17
749	Desarrollar una política de datos abiertos que oriente la generación, sistematización y difusión de información.	156	17
750	Generar información pertinente, de calidad e incluyente que atienda las necesidades de los sectores público, privado, académico y social.	156	17
751	Establecer reglas de operación y padrones de beneficiarios claros, transparentes y consensuados de los bienes y servicios públicos.	156	17
752	Implementar catálogos que faciliten el registro, integración, consolidación y explotación de la información financiera, estadística y geográfica de la Administración Pública Estatal.	156	17
753	 Implementar esquemas que promuevan el enfoque de derechos humanos en la implementación del gobierno abierto y el acceso a la información.	156	17
754	Desarrollar esquemas que faciliten la participación y corresponsabilidad de la ciudadanía en la vigilancia, control y evaluación del quehacer gubernamental.	157	17
755	Consolidar las políticas de transparencia en el quehacer gubernamental con el apoyo de los sectores privado, académico y social.	157	17
756	Implementar acciones que garanticen el derecho de acceso a la información y protección de datos personales conforme a los ordenamientos jurídicos aplicables.	157	17
757	Implementar herramientas tecnológicas con base en estándares internacionales para llevar a cabo contrataciones abiertas y que sean aplicables en las etapas de planeación, licitación, adjudicación, contratación e implementación.	157	17
758	Establecer incentivos para el uso y aprovechamiento de datos abiertos entre los sectores público, privado, académico y social.	157	17
759	Establecer mecanismos de supervisión y control de los recursos públicos con la participación de la ciudadanía.	158	16
760	Establecer mecanismos de vinculación con órganos estatales de control de otras entidades federativas para el intercambio de buenas prácticas y herramientas que faciliten la inspección o verificación de los recursos públicos.	158	16
761	Implementar un Código de Ética que rija la conducta ética y establezca un conjunto de valores y principios que dirijan el cumplimiento de los deberes y obligaciones de todos los servidores públicos del Gobierno del Estado de Yucatán.	158	16
762	Capacitar a los órganos de control interno asignados en las dependencias y entidades de la Administración Pública Estatal para mejorar la fiscalización de los recursos públicos.	158	16
763	Fortalecer la normatividad para los procesos de adquisiciones y actuación de los servidores públicos que participen en los mismos.	158	16
764	Desarrollar un sistema integral, transparente y accesible de las compras, concursos y licitaciones que realice el Gobierno del Estado.	158	16
765	Fortalecer la realización de auditorías y la publicación de resultados conforme a la norma aplicable.	158	16
766	Presentar las declaraciones patrimonial y de intereses de los servidores públicos de todos los niveles del Poder Ejecutivo del estado de Yucatán.	158	16
767	Promover la cultura de la legalidad y anticorrupción entre los sectores público, privado y social. 	159	16
768	Consolidar las Dependencias, Entidades y Órganos dedicados a prevenir y sancionar la corrupción atendiendo las obligaciones y responsabilidades en la normatividad vigente.	159	16
769	Implementar acciones que permitan identificar actos de corrupción en los trámites y servicios que presta el Gobierno del Estado a la población.	159	16
770	Establecer mecanismos transparentes de sanción a servidores públicos que incurran en actos de corrupción.	159	16
771	Reorientar la programación del presupuesto asegurando su  alineación con la planeación del desarrollo.	160	17
772	Promover la implementación del modelo de Presupuesto basado en Resultados y el Sistema de Evaluación del Desempeño en los municipios.	160	17
773	Consolidar los mecanismos de diseño e implementación de los programas presupuestarios.	160	17
774	Consolidar las capacidades institucionales para implementar el diseño basado en evidencia en los programas presupuestarios con enfoque a resultados.	160	17
775	Fortalecer las capacidades de las y los servidores públicos dedicados a la implementación de la gestión para resultados en el desarrollo y la incorporación de enfoques transversales al ciclo de la gestión pública. 	160	17
776	Mejorar los mecanismos para la evaluación social de proyectos de preinversión, priorizando la evaluación de aquellos que sean socialmente rentables, incluyentes y sostenibles.	160	17
777	Consolidar el Sistema de Seguimiento y Evaluación del Desempeño para la mejora de la gestión pública y la rendición de cuentas.	161	17
778	Evaluar el desempeño de los programas y proyectos de gobierno y su impacto en la población.	161	17
779	Presupuestar las políticas, programas y proyectos de la Administración Pública con base en el análisis de la información que resulte del seguimiento y evaluación.	161	17
780	Establecer  mecanismos de cooperación con organismos nacionales e internacionales para fortalecer la gestión pública estatal.	161	17
781	Desarrollar acciones que mejoren la calidad de la atención de los servidores públicos a la ciudadanía.	162	16
782	Establecer mecanismos de colaboración con organismos nacionales e internacionales que permitan  incorporar mejores prácticas en materia de gobernanza y mejora regulatoria.	162	16
783	Desarrollar estrategias de simplificación y digitalización de los trámites y servicios del estado con criterios claros y transparentes para su realización.	162	16
784	Impulsar el Sistema Estatal de Mejora Regulatoria así como sus herramientas	162	16
785	Reforzar las capacidades técnicas y profesionales de los servidores públicos de una manera incluyente.	162	16
786	Consolidar herramientas que evalúen el impacto económico y social generado por la normatividad estatal y municipal.	162	16
787	Actualizar el marco normativo en materia de mejora regulatoria.	162	16
788	Implementar la simplificación administrativa y reducción de cargas burocráticas.	163	16
789	Implementar procesos de innovación y gestión del conocimiento en las dependencias y entidades.	163	16
790	Desarrollar instrumentos de gobierno digital que impulsen la eficiencia y mejora de la Administración Pública Estatal.	163	16
791	Documentar los procesos y procedimientos de la Administración Pública con énfasis en los que impactan directamente a la ciudadanía; así como crear metodologías para asegurar la calidad en los procesos de la administración pública.	163	16
792	Modernizar la gestión de los bienes patrimoniales para optimizar el valor del patrimonio del Gobierno del Estado.	164	16
793	Desarrollar procesos de gestión del patrimonio vinculados integralmente a las distintas fases de la administración de los recursos.	164	16
794	Reforzar la gestión de los recursos humanos, garantizando la inclusión e igualdad,  mediante esquemas de contratación acorde a las necesidades de las Dependencias y Entidades, y mecanismos para evaluar e incentivar el desempeño de los servidores públicos.	164	16
795	Consolidar la base tributaria en el estado y los municipios.	165	17
796	Impulsar mecanismos que prevengan y sancionen la evasión fiscal.	165	17
797	Establecer mecanismos de simplificación de pago de obligaciones fiscales estatales, así como de productos, derechos y aprovechamientos, tomando como base las Tecnologías de la Información y la Comunicación.	165	17
798	Reforzar los mecanismos de relación y colaboración fiscal entre la Federación, el Gobierno del Estado y los municipios.	165	17
799	Establecer esquemas que permitan vincular determinados ingresos estatales hacia la ejecución de proyectos con alto impacto económico y social.	165	17
800	Desarrollar nuevos esquemas de recaudación fiscal.	165	17
801	Consolidar la capacidad recaudatoria de la Administración Pública Estatal para disminuir y erradicar la evasión fiscal.	165	17
802	Promover la austeridad en el gasto corriente para favorecer el gasto en capital humano e inversión.	166	17
803	Ordenar el sistema de pensiones de los trabajadores del Gobierno del Estado bajo los principios de sostenibilidad, viabilidad y responsabilidad financiera.	166	17
804	Implementar programas, proyectos y acciones focalizadas que potencialicen y aprovechen la inversión de los entes públicos y privados.	166	17
805	Administrar de forma eficiente y responsable la deuda pública.	166	17
806	Transferir oportunamente los recursos correspondientes a las entidades, municipios y organismos del Estado de Yucatán para el cumplimiento de sus objetivos y fines.	166	17
807	Establecer mecanismos que faciliten la integración de un presupuesto ciudadano, incluyente y que responda a las necesidades de desarrollo.	166	17
808	Establecer herramientas y protocolos para la toma de decisiones en materia presupuestal.	166	17
809	Supervisar que se cumplan las obligaciones de disciplina financiera.	166	17
810	Planificar la inversión conjunta público-privada que contemple proyectos estratégicos para la economía.	167	17
811	Optimizar el gasto en inversión pública para alcanzar las metas físicas y financieras en materia de infraestructura.	167	17
812	Diseñar un plan para la construcción y recuperación de espacios públicos de convivencia en las ciudades y comunidades del estado.	167	17
813	Desarrollar un programa de posicionamiento estratégico para las localidades que ofrecen espacios adecuados y atractivos.	167	17
814	Promover la creación y adecuación de infraestructura pública con énfasis en el cumplimiento de las disposiciones en materia de inclusión.	167	17
815	Generar parámetros e indicadores para mejorar la infraestructura de la obra pública en el estado.	167	17
816	Estimular vínculos con la sociedad civil para el desarrollo de la obra pública sostenible.	167	17
817	Impulsar y fortalecer el alcance de la red de drenaje y alcantarillado del estado.	167	17
818	Impulsar la conexión con las viviendas a la red pública en materia de desalojo de residuos. 	167	17
819	Construir carreteras para las localidades más apartadas del estado.	168	9
820	Reconstruir la carpeta asfáltica de las vialidades, priorizando aquellas que presenten un alto nivel de daño e inseguridad.	168	9
821	Promover la modernización de la infraestructura vial en el interior del estado.	168	9
822	Realizar trabajos de conservación en las vialidades rurales.	168	9
823	Desarrollar circuitos carreteros  que permitan la conectividad vial de acuerdo a su actividad económica: agrícola, ganadera, turística e industrial.	168	9
824	Impulsar esquemas innovadores de transporte público de acuerdo a las características de las ciudades.	168	9
825	Fortalecer la red existente de transporte público y promover el diseño universal.	168	9
826	Promover la construcción de nuevos tramos ferroviarios sostenibles.	169	9
827	Modernizar la red ferroviaria estatal de forma conjunta y coordinada con los distintos órdenes de gobierno.	169	9
828	Consolidar los centros logísticos multimodales para el movimiento de carga por ferrocarril.	169	9
829	Implementar acciones de desazolve de puertos y zonas de embarcación.	170	9
830	Promover acciones de conservación, adaptación integral y mejoramiento sostenible de la infraestructura aeroportuaria y portuaria, en coordinación con los diferentes órdenes de gobierno.	170	9
831	Desarrollar espacios para el almacenamiento y movimiento logístico de mercancías.	170	9
832	Consolidar la operación de medios de transporte, seguros y sostenibles.	170	9
833	Reforzar la infraestructura de almacenamiento existente de forma equilibrada en las regiones del estado.	170	9
834	Consolidar la infraestructura digital sostenible en las comunidades.	171	9
835	Proporcionar internet gratuito en lugares y espacios públicos.	171	9
836	Gestionar convenios de desarrollo con otros órdenes de gobierno para fortalecer el despliegue de la infraestructura de telecomunicaciones.	171	9
837	Realizar estudios para determinar las zonas de mayor necesidad de acceso a las redes y servicios de telecomunicación en el estado.	171	9
838	Instruir sobre el uso responsable del internet a través de la capacitación con enfoque de integralidad.	171	9
839	Reforzar la calidad y el óptimo desempeño de los servicios electrónicos del gobierno.	172	9
840	Diseñar espacios de almacenamiento, integración, intercambio y aprovechamiento de recursos digitales.	172	9
841	Facilitar el acceso a herramientas tecnológicas que favorezcan la modernización digital.	172	9
842	Promover la inversión para el desarrollo de infraestructura tecnológica digital sostenible.	172	9
843	Desarrollar lineamientos que ofrezcan oportunidades de desarrollo sostenible e incluyente.	173	9
844	Generar alianzas con las instituciones educativas de nivel superior para elaborar programas de desarrollo sostenible e incluyente.	173	9
845	Promover el desarrollo de programas educativos integrales apoyados por las empresas e instituciones del sector de telecomunicaciones.	173	9
846	Gestionar convenios con asociaciones civiles, industrias e instituciones que apoyen la alfabetización digital.	173	9
847	Desarrollar acciones integrales que maximicen los esfuerzos educativos en el servicio de la red digital incluyente.	173	9
848	Diseñar programas de ordenamiento territorial en condiciones adecuadas de seguridad física y patrimonial.	174	11
849	Realizar intervenciones que reduzcan la vulnerabilidad y riesgo de los asentamientos humanos en las comunidades de mayor marginación.	174	11
850	Instituir la perspectiva de género, la accesibilidad universal y la seguridad como componentes transversales de la planeación urbana.	174	11
851	Implementar acciones en colaboración con los municipios para la delimitación territorial.	174	11
852	Promover el crecimiento urbano vertical y la adaptación del territorio.	174	11
853	Reforzar la vinculación con los municipios para la elaboración de proyectos que garanticen la calidad del espacio público y la  inclusión de espacios verdes.	175	11
854	Establecer observatorios de planeación y ordenamiento territorial con enfoque de sostenibilidad.	175	11
855	Fortalecer programas institucionales en los municipios y con vinculación a las dependencias en materia de ordenamiento territorial.	175	11
856	Gestionar la actualización del marco normativo en materia de ordenamiento territorial y desarrollo urbano para la regulación sostenible del territorio.	175	11
857	Instruir a los municipios en materia de regulación ecológica que permita la protección, preservación, restauración y aprovechamiento de los recursos naturales.	176	11
858	Conservar los recursos naturales locales a través de lineamientos en materia urbanística sustentable.	176	11
859	Diseñar programas regionales y metropolitanos que propicien el desarrollo urbano de las ciudades y comunidades con base en su potencialidad de patrimonio natural y ecológico.	176	11
860	Identificar áreas de oportunidad que propicien la generación de inversiones en energías limpias.	176	11
861	Promover que los proyectos de infraestructura se apeguen a una planeación sostenible con rentabilidad financiera y de impacto socioeconómico.	177	11
862	Incorporar el enfoque de sostenibilidad y desarrollo urbano sustentable en la prestación de los servicios públicos.	177	11
863	Planificar adecuadamente el desarrollo de las zonas destinadas al progreso económico del estado en coordinación con los sectores público, privado, social y académico.	177	11
864	Promover acciones para la sustitución del uso de leña y carbón dentro de las viviendas.	177	11
865	Promover esquemas asequibles de financiamiento a la vivienda para los trabajadores del estado y grupos en situación de vulnerabilidad. 	177	11
866	Definir áreas de atención prioritarias que coordinen los esfuerzos federales, estatales y municipales para la promoción de la inversión privada.	178	0
867	Establecer una cartera de proyectos estratégicos de inversión pública con impacto regional para su gestión y financiamiento conjunto.	178	0
868	Fortalecer los mecanismos de carácter participativo en las decisiones de inversión pública a nivel regional para priorizar aquellas acciones que sean de mayor interés para las comunidades.	178	0
869	Proporcionar la colaboración entre los municipios para la provisión de servicios públicos desde una perspectiva regional.	178	0
870	Incluir la perspectiva regional en la definición de las políticas de seguridad alimentaria, considerando las capacidades endógenas de las comunidades para mejorar la calidad de vida.	179	0
871	Ampliar la cobertura regional en educación preescolar y superior, para disminuir el rezago educativo.	179	0
872	Promover acciones coordinadas en materia de desarrollo económico y social para el bienestar de la etnia maya.	179	0
873	Promover la atención regional equilibrada de los servicios de salud públicos mediante la provisión de espacios, infraestructura, equipamiento, insumos y personal para un servicio de calidad.	179	0
874	Acercar los servicios públicos a las comunidades mayas considerando una perspectiva intercultural que permita mejorar su calidad de vida.	179	0
875	Incrementar la oferta de actividades culturales en los municipios del estado.	180	0
876	Fortalecer los programas de apoyo a la promoción cultural a las actividades que se realicen en los municipios.	180	0
877	Crear un inventario del patrimonio cultural de las regiones del estado.	180	0
878	Fortalecer la infraestructura cultural con enfoque regional.	180	0
879	Promover el uso de medios alternos de movilidad para garantizar la reducción de emisiones de gases contaminantes.	181	0
880	Establecer programas de educación ambiental en todo el estado.	181	0
881	Crear un sistema de información regional, que permita realizar el seguimiento y la evaluación a las políticas ambientales a nivel regional y municipal.	181	0
882	Establecer mecanismos de conservación y promoción para el uso sostenible de los recursos naturales.	181	0
883	Potencializar las aptitudes geográficas del estado para el desarrollo de energías renovables.	181	0
884	Involucrar a las comunidades del interior del estado como un elemento indispensable en el desarrollo de programas para el combate al delito.	182	0
885	Incorporar en las acciones de prevención y persecución del delito sistemas de información y herramientas de análisis con enfoque territorial.	182	0
886	Fortalecer la cobertura de servicios de la infraestructura regional en materia de seguridad.	182	0
887	Realizar convenios de colaboración entre estado y los municipios para la implementación del PBR-SED y su orientación al cumplimiento de los ODS.	183	0
888	Asesorar y capacitar a los Ayuntamientos en la implementación del PBR-SED.	183	0
889	Evaluar los avances de los municipios del estado en la implementación del PBR-SED.	183	0
890	Asesorar y capacitar a los municipios en el cumplimiento Ley de Disciplina Financiera de las Entidades Federativas y los Municipios.	183	0
891	Armonizar los diversos instrumentos de planeación regional, particularmente entre el ordenamiento territorial y del desarrollo urbano para eficientar la planeación del desarrollo.	184	0
892	Fomentar la elaboración e implementación de los programas de ordenamiento ecológico local que integren un enfoque de manejo del paisaje para garantizar la compatibilidad de las diversas actividades que se desarrollan de acuerdo a la vocación del territorio.	184	0
893	Mejorar la infraestructura del transporte en el Estado considerando una perspectiva regional en su cobertura para eficientar la movilidad en las comunidades.	184	0
894	Incrementar la cobertura regional en el otorgamiento de trámites y servicios públicos estatales que permita descentralizar su provisión desde Mérida para un acceso eficiente de las comunidades.	184	0
895	Promover proyectos de inversión pública con impacto meso regional que permitan el desarrollo de las comunidades en el área de influencia de los mismos.	185	0
896	Favorecer el intercambio comercial y turístico en la península de Yucatán, para dinamizar la economía entre las regiones fronterizas.	185	0
897	Establecer mecanismos de colaboración para la atención de retos comunes en materia de desarrollo en la península.	185	0
\.


--
-- Data for Name: PED2019Objetivo; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PED2019Objetivo" ("iIdObjetivo", "vObjetivo", "iIdTema") FROM stdin;
1	Aumentar la actividad comercial sostenible del estado	1
2	Incrementar la productividad de las empresas comerciales en el estado	1
3	Aumentar la competitividad del estado 	2
4	Incrementar la inversión extranjera en el estado	2
5	Incrementar la actividad económica sostenible del sector secundario	3
6	Incrementar la productividad del sector industrial sostenible	3
7	Aumentar el valor de los productos y servicios turísticos con enfoque de sostenibilidad en Yucatán	4
8	Incrementar la afluencia de visitantes a Yucatán	4
9	Incrementar la estadía turística en Yucatán	4
10	Incrementar la calidad del empleo en Yucatán 	5
11	Aumentar la productividad laboral en el estado	5
12	Aumentar la independencia económica de la población del estado de Yucatán	6
13	Mejorar la actividad económica del sector agropecuario con enfoque sostenible	7
14	Incrementar el valor de la producción del sector pecuario con enfoque de sostenibilidad	7
15	Incrementar el valor de la producción agrícola en el estado con enfoque de sostenibilidad	7
16	Incrementar el valor de la producción pesquera en el estado con enfoque de sostenibilidad	8
17	Incrementar el acceso incluyente y de calidad al Sistema Estatal de Salud	9
18	Mejorar la condición de salud de la población en el estado	9
19	Disminuir toda forma de desnutrición en la población del estado de Yucatán	10
20	Incrementar la seguridad e inocuidad alimentaria sostenible de la población del estado de Yucatán	10
21	Disminuir la pobreza y pobreza extrema en los pueblos indígenas de Yucatán	11
22	Disminuir el rezago educativo de la población del estado	12
23	Mejorar la calidad del sistema educativo estatal	12
24	Mejorar la calidad de la vivienda en Yucatán 	13
25	Mejorar los servicios básicos en las viviendas del estado	13
26	Incrementar el acceso a la seguridad social con enfoque de sostenibilidad de la población yucateca	14
27	Incrementar la producción de bienes y servicios culturales	15
28	Aumentar el consumo cultural y la participación de la población en espacios y eventos culturales	15
29	Preservar las tradiciones e identidad cultural	16
30	Incrementar las creaciones artísticas	17
31	Mejorar la cobertura de la educación artística en la educación básica con un enfoque integral e incluyente	18
32	Aumentar la formación de profesionales de las artes	18
33	Preservar el patrimonio cultural del estado	19
34	Mejorar el desempeño de los deportistas yucatecos en competencias de alto rendimiento	20
35	Aumentar la activación física de la población en todas las edades, grupos sociales y regiones del estado	20
36	Aumentar la presencia de la población en eventos deportivos profesionales	20
37	Preservar los recursos naturales protegidos del estado de Yucatán	21
38	Mejorar la protección del ecosistema terrestre del estado	21
39	Disminuir la vulnerabilidad del estado ante los efectos del cambio climático	22
40	Mejorar la calidad del aire en Yucatán	22
41	Mejorar el saneamiento de aguas residuales en Yucatán	23
42	Mejorar la calidad del agua en el estado 	23
43	Mejorar el manejo de los residuos en Yucatán	24
44	Reducir la generación de residuos en Yucatán	24
45	Incrementar la generación de energía no contaminante en Yucatán 	25
46	Mejorar el acceso a energías limpias en el estado 	25
47	Incrementar la protección del ecosistema marino del estado de Yucatán	26
48	Incrementar el acceso a sistemas de transporte seguros, asequibles y eficientes en Yucatán	27
49	Mejorar las condiciones de desplazamientos y accesibilidad en Yucatán	27
50	Reducir las brechas de género en salud	28
51	Reducir las brechas de género en educación	28
52	Incrementar la autonomía y empoderamiento de las mujeres	28
53	Reducir la incidencia de las violencias hacia las mujeres en el estado	28
54	Incrementar la igualdad de oportunidades de los grupos en situación de vulnerabilidad	29
55	Incrementar la formación de capital humano con competencias y habilidades productivas y técnicas	30
56	Mejorar la calidad de la educación superior en el estado	30
57	Incrementar el aprovechamiento del conocimiento científico y tecnológico en el estado	31
58	Fortalecer las condiciones para la innovación, ciencia y tecnología en el estado	31
59	Preservar altos niveles de paz en la entidad	32
60	Disminuir la incidencia delictiva en el estado	32
61	Mejorar el desempeño de las instituciones de procuración de justicia en el estado	33
62	Disminuir la impunidad en el estado	33
63	Mejorar la estabilidad de las instituciones y su apego al estado de derecho en Yucatán en beneficio de los derechos humanos, en especial de las personas en situación de vulnerabilidad	34
64	Aumentar la cooperación nacional e internacional de Yucatán	34
65	Mejorar la calidad, oportunidad y disponibilidad de la información para la toma de decisiones	35
66	Disminuir la incidencia de corrupción en la Administración Pública Estatal	35
67	Mejorar la calidad del gasto público con base en evidencia rigurosa	36
68	Mejorar la efectividad en la gestión pública  a través de la mejora  regulatoria	37
69	Mejorar la sostenibilidad de las finanzas públicas	38
70	Incrementar la inversión en obra pública sostenible y accesible	39
71	Incrementar la conectividad sostenible e incluyente en los municipios del estado	40
72	Incrementar el acceso a las redes y servicios de telecomunicaciones sostenibles e incluyentes en las ciudades y comunidades del estado	41
73	Mejorar la planeación territorial con un enfoque sostenible en el estado	42
74	Disminuir la desigualdad territorial en el acceso a los derechos económicos, sociales, culturales y ambientales entre de las regiones que conforman el estado de Yucatán	43
75	Disminuir la desigualdad meso regional en el acceso a los derechos económicos, sociales, culturales y ambientales en la península de Yucatán	43
\.


--
-- Data for Name: PED2019Tema; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."PED2019Tema" ("iIdTema", "vTema", "iIdEje", "vIcono") FROM stdin;
28	Igualdad de género	5	
29	Inclusión social y atención a grupos en situación de  vulnerabilidad	5	
30	Educación superior y enseñanza científica y técnica 	6	
31	Conocimiento científico, tecnológico e innovación	6	
32	Paz	7	
33	Justicia	7	
34	Gobernabilidad	7	
35	Gobierno abierto y combate a la corrupción	8	
36	Gestión para Resultados en el desarrollo	8	
37	Mejora regulatoria e innovación de la gestión pública	8	
38	Finanzas Sanas	8	
39	Inversión pública	9	
40	Conectividad y transporte	9	
41	Infraestructura digital	9	
42	Ordenamiento territorial	9	
43	N/A	10	
10	Hambre cero	2	public/img/icons/desca/cal-hambre-cero.png
11	Pueblos indígenas	2	public/img/icons/desca/cal-pueblos-indigenas.png
12	Educación integral de calidad	2	public/img/icons/desca/cal-seguridad-social.png
13	Acceso a la vivienda	2	public/img/icons/desca/cal-acceso-a-la-vivienda.png
14	Seguridad social	2	public/img/icons/desca/cal-seguridad-social.png
15	Acceso universal a la cultura	3	public/img/icons/desca/cul-acceso-universal-a-la-cultura.png
16	Cultura tradicional	3	public/img/icons/desca/cul-cultura-tradicional.png
17	Bellas artes	3	public/img/icons/desca/cul-bellas-artes.png
18	Educación artística y cultural	3	public/img/icons/desca/cul-educacion-artistica-y-cultural.png
1	Desarrollo comercial y fortalecimiento de las empresas locales.	1	public/img/icons/desca/eco-desarrollo-comercial.png
2	Competitividad e inversión extranjera.	1	public/img/icons/desca/eco-competitividad.png
3	Desarrollo industrial.	1	public/img/icons/desca/eco-desarrollo-industrial.png
4	Impulso al turismo.	1	public/img/icons/desca/eco-impulso-al-turismo.png
5	Capital humano generador de desarrollo y trabajo decente.	1	public/img/icons/desca/eco-capital-humano.png
6	Fomento empresarial y al emprendimiento.	1	public/img/icons/desca/eco-fomento-empresarial.png
7	Desarrollo agropecuario.	1	public/img/icons/desca/eco-desarrollo-agropecuario.png
8	Desarrollo pesquero.	1	public/img/icons/desca/eco-desarrollo-pesquero.png
9	Salud y bienestar	2	public/img/icons/desca/cal-salud-y-bienestar.png
19	Patrimonio cultural	3	public/img/icons/desca/cul-patrimonio-cultural.png
20	Fomento al deporte	3	public/img/icons/desca/cul-fomento-al-deporte.png
21	Conservación de recursos naturales 	4	public/img/icons/desca/ver-conservacion-de-recursos-naturales.png
22	Acción por el clima	4	public/img/icons/desca/ver-accion-por-el-clima.png
23	Agua limpia y saneamiento	4	public/img/icons/desca/ver-agua-limpia.png
24	Manejo integral de residuos	4	public/img/icons/desca/cul-manejo-integral-de-residuos.png
25	Energía asequible y no Contaminante	4	public/img/icons/desca/cul-energia-asequible.png
26	Vida submarina	4	public/img/icons/desca/ver-vida-submarina.png
27	Movilidad sustentable	4	public/img/icons/desca/ver-movilidad-sustentable.png
\.


--
-- Data for Name: Parametro; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Parametro" ("iIdParametro", "vValor", "vParametro", "vDescripcion", "iActivo") FROM stdin;
1	\N	Revision de compromisos	Activa el periodo de revisión de compromisos estatales. Deshabilita la modificación de información para los usuarios que no cuentan con el permiso especial	1
2	0	PAR_CAP_PAT	Si esta activo los operadores y administradores sectoriales pueden agregar y modificar actividades estratégicas y sus metas. Esto no aplica para los usuarios que cuenten con permisos especiales	1
3	2015	Año actividades	Año en  curso de las actividades estratégicas	1
4	4	PAR_TRIMESTRE	Indica el trimestre en curso de las actividades estrategicas	1
5	\N	revision_informe	2014	1
6	0	PAR_CAP_AVANCES	Indica si el periodo de captura de avances esta habilitado o no.	1
7	0	PAR_CAP_ACC_REL	Indica si el periodo de captura de acciones relevantes esta habilitado o no.	1
8	0	PAR_CAP_INF_TRIM	Indica si el periodo de captura de informes trimestrales esta habilitado o no.	1
9	1,2,3,4,5,6,7,8,9,10,11,12	PAR_MES_CAP_AVANCES	Indica los meses que se encuentran habilitados para la captura de avances del PAT	1
10	0	PAR_CAP_INF_ANIOS_ANT	Indica si es posible modificar la información reportada en años anteriores.	1
11	0	PAR_CAP_PROGRAMAS	Permite a las delegaciones capturar programas 	1
12	0	PAR_CAP_COMPONENTES	Permite a las delegaciones capturar componentes	1
13	0	PAR_CAP_ENTREGABLES	Permite a las delegaciones capturar entregables	1
14	0	PAR_CAP_AVANCES_DEL	Permite a las delegaciones capturar avances	1
\.


--
-- Data for Name: Periodicidad; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Periodicidad" ("iIdPeriodicidad", "vPeriodicidad", "iActivo") FROM stdin;
1	Diario	1
2	Semanal	1
3	Mensual	1
4	Bimestral	1
5	Trimestral	1
6	Cuatrimestral	1
7	Semestral	1
8	Anual	1
9	Trianual	1
10	Bianual	1
11	Quinquenal	1
12	Bienal	1
13	Ciclo escolar	1
14	Decenal	1
15	Otro	1
\.


--
-- Data for Name: Permiso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Permiso" ("iIdPermiso", "vIdentificador", "vPermiso", "vDescripcion", "iTipo", "vUrl", "iIdPermisoPadre", "vClass", "iOrden", "iActivo", "iInicial") FROM stdin;
4	  	Crear administradores	Permiso para poder crear usuarios de tipo administrador sectorial o general	2	#	0	 	0	1	0
9	  	Consultar todos los ejes	Permiso para consultar todos los sectores	2	#	0	 	0	1	0
10	  	Consultar todas las depencias	Permiso para consultar todas las dependencias del mismo sector al cual pertenece el usuario logueado	2	#	0	 	0	1	0
15	  	Entregables	Permiso para administrar el catálogo de entregables	1	index.php/C_entregables/	1	 	6	1	0
16	  	Permiso para municipalizar	Permiso para marcar/desmarcar la municipalización por metas	2	#	0	 	0	1	0
17	  	Captura de avances	Permiso para agregar avances a los entregables del PAT.	2	index.php/C_avances/	0	\N	0	1	0
18	  	Administrar compromisos	Permiso para modificar los datos generales de los compromisos (nombre, nombre corto,descripción,dependencia responsable y dependencia corresponsable)	2	#	0	 	0	1	0
19	  	Administrar componentes de compromisos	Permiso para poder agregar y modificar los componentes de un compromiso	2	#	0	 	0	1	0
22	  	Activar periodo revisión de compromisos	Permiso para activar o desactivar el periodo de revisión de compromisos	2	#	0	 	0	1	0
8	  	Dashboard	módulo de gráficas del sistema	1	index.php/C_dash/	0	mdi mdi-chart-pie	0	0	0
5	  	Actividades	Permiso para administrar del catálogo de actividades estratégicas	1	index.php/C_actividades/	1	 	5	1	0
25		Compromisos	Módulo de seguimiento a los compromisos de gobernador	1	index.php/C_compromisos/	0	mdi mdi-bookmark-check	3	1	1
26	  	Roles	Módulo de roles	1	index.php/C_roles/	1	 	6	1	0
13	  	Capturar PAT fuera de periodo	Permite capturar actividades y entregable fuera del periodo establecido	2	#	0	 	0	1	0
23	  	Capturar avances sin importar periodo	Permiso para capturar, modificar y eliminar avances sin importar el trimestre ni el año del entregable	2	#	0	 	0	1	0
21	  	Publicar compromisos	Permisos para publicar compromiosos en la página del observatorio	2	#	0	 	0	1	0
20	  	Revisar compromisos	Permiso para validar la información del compromiso (validar evidencia y marcar como revisado)	2	#	0	 	0	1	0
7	  	Informes trimestrales	Permiso para acceder al listado de reportes del sistema	1	#	6	 	1	1	0
1	  	Catálogos	Permiso para acceder al módulo de catálogos	1	#	0	mdi mdi-database-plus	1	1	0
27	 	Actividades estratégicas	Reporte de actividades estratégicas	1	 	6	  	2	1	0
6	  	Reportes	Permiso para acceder al módulo de reportes	1	#	0	mdi mdi-file-excel	7	1	0
24	 	Financiamiento	Fin	1	index.php/C_financiamientos/	1	mdi mdi-coin	0	1	0
3	  	Usuarios	Administración del Catálogo de Usuarios	1	index.php/C_usuarios/	1	 mdi mdi-account	2	1	0
12	  	Unidades Medida	Permiso para administrar el catálogo de Unidades de Medida	1	index.php/C_unidadesmedida/	1	mdi mdi-scale	4	1	0
28	 	Avance de compromisos	Reporte de avances de compromisos	1	  	6	 	3	1	0
11	  	UBPS	Permiso para administrar el catálogo de UBPS	1	index.php/C_ubps/	1	mdi mdi-file-document	3	1	0
2	  	Dependencias	Permiso para administrar el catalogo de dependencias y entidades	1	index.php/C_dependencias/	1	mdi mdi-hospital-building	1	1	0
29	 	Aprobar avances	Permiso para aprobar avances de los entregables	2	#	0	 	0	1	0
14	  	Plan Anual de Trabajo	Permiso para acceder al módulo de compromisos estatales	1	index.php/C_pat	0	mdi mdi-book-open-page-variant	4	1	0
\.


--
-- Data for Name: ProgramaPresupuestario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."ProgramaPresupuestario" ("iIdProgramaPresupuestario", "vProgramaPresupuestario", "iActivo", "iNumero") FROM stdin;
1	Mitigación	1	34
2	Adaptación a Eventos Meteorológicos Extremos	1	35
3	Calidad de la Educación Superior	1	75
4	Gestión Integral de los Residuos Sólidos	1	79
5	Calidad Ambiental	1	145
6	Administración de los Recursos Humanos, Materiales y Finanacieros de la SDS	1	183
7	Conservación de los Recursos Naturales	1	186
8	Fomento y Promoción de la Cultura y las Artes	1	63
9	Preservación, Fortalecimiento y Difusión del Patrimonio Cultural	1	66
10	Formación de Profesionales del Arte	1	77
11	Programa de Mejora Administrativa de la ESAY	1	231
12	Administración de Figarosy	1	213
13	Desarrollo y Mejoramiento de la Gestión Administrativa de la Sedeculta	1	211
14	Activación Física	1	60
15	Alto Rendimiento	1	61
16	Comunicación Social e Información	1	182
17	Operación de Unidades Deportivas	1	207
18	Eventos Recreativos	1	208
19	Eficiencia en los Recursos Humanos, Administrativos y Financieros IDEY	1	209
20	Fomento y Promoción del Hábito a la Lectura y la Producción Literaria y Editorial	1	64
21	Fomento a la Educación Artística	1	65
22	Preservación, Fortalecimiento y Difusión del Patrimonio Cultural	1	67
23	Administración de Recursos Humanos, Financieros, Tecnológicos y Materiales de la Secretaría de Fomento Económico	1	262
24	Desarrollo Artesanal	1	259
25	Administración de Recursos Humanos, Materiales y Operativos de la CAEY	1	261
26	Promoción y Comercialización Turística	1	107
27	Mantenimiento y Rehabilitación de las Unidades Turísticas del Estado de Yucatán	1	270
28	Administración de los Recursos Humanos, Materiales y de Servicios del Patronato CULTUR	1	272
29	Administración de los recursos humanos, materiales y financieros de la EPY	1	327
30	Administración del Patrimonio del Gobierno del Estado	1	159
31	Administración de los Recursos Materiales, Humanos y Financieros del Fideicomiso	1	336
32	Administración del Fideicomiso para el Desarrollo del Turismo de Reuniones en Yucatán (FIDETURE)	1	339
33	Capacitación para el trabajo	1	232
34	Administración de Recursos Humanos, Materiales y de Servicios del IPF	1	263
35	Administración de Recursos Humanos y Materiales del IYEM	1	264
36	Yucatán Emprende	1	318
37	Carencia por Acceso a la Alimentación	1	80
38	Desarrollo Agropecuario y Agroindustrial	1	100
39	Extensión e Innovación Productiva	1	101
40	Programa de Prevención, Sanidad e Inocuidad Agroalimentaria	1	102
41	Carreteras, Calles y Caminos	1	104
42	Planeación y Seguimiento de los Programas del Sector Rural	1	266
43	Programa de Apoyo a Procesos Administrativos de la Seder	1	267
44	Apoyos para el Crecimiento Empresarial	1	93
45	Fomento al Empleo	1	98
46	Fomento a la Innovación Empresarial	1	116
47	Inversiones para el Crecimiento Económico	1	94
48	Servicios Turísticos	1	108
49	Administración y Planeación Turística	1	273
50	Infraestructura Turística	1	109
51	Protección Social a Pescadores y sus Familias	1	92
52	Impulso a la Actividad  Acuícola y Pesquera	1	103
53	Atención en Salud a Personas Sujetas a Asistencia Social	1	90
54	Administración y Control de los Recursos Humanos, Financieros y Materiales de APBPY	1	205
55	Fortalecimiento de la Calidad Educativa en Educación Media Superior del CECYTEY	1	219
56	Administración de los Recursos Humanos, Materiales y Financieros del Cecytey	1	247
57	Trasplante de Órganos	1	118
58	Administración y Control de los Recursos Humanos, Financieros y Materiales del CEETRY	1	206
59	Atención de Alumnos del Nivel Medio Superior del Colegio de Bachilleres del Estado de Yucatán	1	220
60	Programa Administrativo del COBAY	1	248
61	Cobertura de los Servicios de Educación Profesional Técnica/CONALEP	1	218
62	Administración de Recursos Humanos, Materiales y Financieros del Colegio de Educación Profesional Técnica del Estado de Yucatán (Conalep Yucatán)	1	229
63	Prevención y Atención a Mujeres en situación de violencia	1	84
64	Cohesión Social	1	85
65	Sujetos en Condición de Vulnerabilidad	1	87
66	Atención a Personas con Discapacidad	1	88
67	Atención Integral al Menor en Desamparo	1	89
68	Atención al Desarrollo Infantil	1	91
69	Mejoramiento de la Administración del Dif Yucatán	1	254
70	Salud Infantil	1	53
71	Administración y Control de los Recursos Humanos, Financieros y Materiales del Hospital de la Amistad	1	201
72	Salud Reproductiva	1	52
73	Administración y Control de los Recursos Humanos, Financieros y Materiales del Hospital Comunitario de Peto	1	202
74	Administración y Control de los Recursos Humanos, Financieros y Materiales del Hospital Comunitario de Ticul	1	203
75	Atención Médica	1	315
76	Administración y Control de los Recursos Humanos, Financieros y Materiales del Hospital General de Tekax	1	325
77	Eficiencia Terminal en Educación Básica	1	70
78	Eficiencia Terminal en Educación Media Superior	1	73
79	Eficiencia Terminal en Educación Superior	1	76
80	Administración de Recursos Materiales, Humanos y Financieros del Instituto de Becas y Crédito del Estado de Yucatán	1	245
81	Mejoramiento del Desempeño Administrativo del IEAEY	1	244
82	Rezago Educativo	1	78
83	Población Maya	1	82
84	Medicina Tradicional Maya	1	83
85	Programa Administrativo del INDEMAYA	1	250
86	Eficiencia Terminal del Instituto Superior de Motul	1	227
87	Recursos Humanos, Materiales y Financieros del Instituto Tecnológico Superior de Motul	1	242
88	Vinculación del Instituto Tecnológico Superior de Motul	1	280
89	Fortalecimiento a la Calidad del Servicio Educativo del Instituto Tecnológico Superior Progreso	1	226
90	Administración de Recursos del Instituto Tecnológico Superior Progreso	1	241
91	Vinculación con el Sector Público, Social y Productivo del Estado- Instituto Tecnológico Superior Progreso	1	281
92	Fortalecimiento de la Calidad Educativa en la Educación Superior-ITSSY	1	225
93	Administración de los Recursos Humanos, Materiales y Financieros del Instituto Tecnológico Superior del Estado de Yucatán	1	240
94	Formación de Profesionistas Competitivos en Programas Educativos de Calidad ITS Valladolid	1	228
95	Administración Eficiente de los Recursos Humanos, Materiales y Financieros del Instituto Tecnológico Superior de Valladolid	1	300
96	Programa Administrativo de Recursos Humanos y Control Presupuestal Sedesol	1	253
97	Administración y Control de los Recursos Humanos, Financieros y Materiales del REPSSY	1	308
98	Seguro Popular	1	59
99	Construcción, Ampliación y Mejoramiento de Vivienda	1	43
100	Carencia por Acceso a Servicios Básicos en la Vivienda	1	44
101	Línea Mínima de Bienestar	1	86
102	Planeación y Concertación Sectorial de la Sedesol	1	252
103	Cobertura en Educación Superior	1	74
104	Gestión Escolar	1	215
105	Gestión Institucional	1	233
106	Gestión Pedagógica	1	234
107	Prevención Social del Delito	1	25
108	Cobertura con Equidad en Educación Básica	1	68
109	Cobertura en Educación Media Superior	1	71
110	Administración de recursos humanos, materiales y financieros de la Secretaría de Educación del Estado	1	236
111	Servicios de Salud a la Comunidad	1	45
112	Salud Mental	1	47
113	Fortalecimiento a la Atención Médica	1	48
114	Prevención y Atención de Accidentes	1	49
115	Sangre Segura	1	50
116	Salud de la Mujer	1	51
117	Enfermedades Crónico degenerativas	1	54
118	Envejecimiento	1	55
119	Programa Integral de Infraestructura Física en Salud para el Mantenimiento y Desarrollo Físico de las Unidades Médicas de los Servicios de Salud	1	56
120	Resolución Alterna de Conflictos del Acto Médico en Yucatán	1	57
121	Protección contra Riesgos Sanitarios	1	195
122	Vigilancia Epidemiológica	1	197
123	Calidad en el Servicio	1	199
124	Administración y Control de los Recursos Humanos, Financieros y Materiales de los SSY	1	200
125	Obesidad	1	298
126	Prevención y Control de Cólera	1	328
127	Prevención y Control de la Micobacteriosis	1	329
128	Prevención y Control de Enfermedades Transmitidas por Vector	1	330
129	Prevención y Control de VIH, SIDA e Infecciones de Transmisión Sexual	1	331
130	Prevención y Control de Enfermedades Zoonóticas	1	332
131	Calidad en Educación Superior de la Universidad Autónoma de Yucatán	1	129
132	Administración y Control de los Recursos Humanos, Financieros y Materiales de la Universidad Autónoma de Yucatán	1	169
133	Cobertura en Educación Superior de la Universidad Autónoma de Yucatán	1	175
134	Calidad en Educación Media Superior de la Universidad Autónoma de Yucatán	1	297
135	Recursos Humanos, Materiales y Financieros de la Universidad Oriente	1	237
136	Eficiencia Terminal de la Universidad de Oriente	1	277
137	Formación Especializada del Talento Humano de la Universidad Politécnica de Yucatán	1	323
138	Gastos Administrativos de la Universidad Politécnica de Yucatán	1	324
139	Atención de Alumnos de la Universidad Tecnológica del Centro - Izamal	1	230
140	Gastos Administrativos de la Universidad Tecnológica del Centro	1	243
141	Vinculación de la Universidad Tecnológica del Centro	1	279
142	Calidad de los Procesos Administrativos de la Universidad Tecnológica Metropolitana	1	222
143	Eficiencia Terminal de la Universidad Tecnológica Metropolitana	1	278
144	Ciencia, Tecnología e Innovación de la Universidad Tecnológica Metropolitana	1	283
145	Mejoramiento de la Eficiencia Terminal de la Universidad Tecnológica del Mayab	1	223
146	Administración de la Universidad Tecnológica del Mayab	1	239
147	Vinculación con el Sector Productivo y la Sociedad de la Universidad Tecnológica del Mayab	1	276
148	Atención a los Estudiantes de la Universidad Tecnológica del Poniente	1	224
149	Fortalecimiento de la Vinculación en la Universidad Tecnológica del Poniente	1	282
150	Administración de Recursos Humanos Financieros y Materiales de la Universidad Tecnológica del Poniente	1	294
151	Eficiencia Terminal de la Universidad Tecnológica Regional del Sur	1	221
152	Administración de los Recursos Materiales, Financieros y Humanos de la Universidad Tecnológica Regional del Sur	1	238
153	Vinculación, Promoción y Gestión con el Sector Productivo de la Universidad Tecnológica Regional del Sur	1	275
154	Atención Integral a las Víctimas del Delito	1	288
155	Administración de los Recursos Humanos, Financieros y Materiales de la Comisión Ejecutiva Estatal de Atención a Víctimas	1	334
156	Servicios Legislativos	1	290
157	Administración de Recursos Materiales, Humanos y Financieros del Congreso del Estado	1	291
158	Vigilancia y Evaluación de la ASEY	1	343
159	Asesoría y Defensa Jurídica del INDEPEY	1	14
160	Prestación de Servicios Registrales	1	29
161	Acceso a la Información Pública Gubernamental	1	32
162	Actualización del Marco Jurídico Estatal	1	147
163	Administración de Recursos Humanos, Materiales y Financieros de la Consejería Jurídica	1	149
164	Certeza Jurídica y Derechos Humanos	1	20
165	Administración de los Recursos Humanos, Financieros y Materiales de la Codhey	1	295
166	Justicia Civil, Mercantil y Familiar	1	3
167	Justicia Penal	1	4
168	Justicia para Adolescentes	1	5
169	Mediación	1	6
170	Administración de los Recursos Humanos, Financieros y Materiales del Poder Judicial	1	235
171	Aplicación de los Mecanismos Alternativos de Solución de Controversias	1	119
172	Fortalecimiento de la Confianza Ciudadana en la Procuración de Justicia	1	120
173	Sistema de Justicia Penal	1	121
174	Administración de Recursos Humanos, Financieros y Materiales de la Fiscalía General del Estado	1	122
175	Atención Integral a las Mujeres Víctimas de Violencia	1	289
176	Operación y Administración del IEPAC	1	305
177	Programa Institucional de Servicios Personales	1	309
178	Servicio Profesional Electoral Nacional	1	310
179	Marco Jurídico Institucional	1	314
180	Participación Ciudadana	1	320
181	Educación Cívica	1	321
182	Acceso a la información y sistema de administración de archivos y gestión documental	1	322
183	Certeza Catastral, Notarial, Registral de la Propiedad y del Comercio	1	30
184	Patrimonio Seguro	1	177
185	Administración y Soporte de las Actividades Registrales, Notariales y Catastrales en el estado de Yucatán	1	178
186	Justicia Laboral	1	7
187	Programa Integral de Aplicación de Medidas de Tratamiento para los Adolescentes	1	16
188	Programa Integral de Reinserción Social	1	17
189	Protección Civil	1	27
190	Apoyo a Adultos Liberados y Adolescentes Externados	1	124
191	Preservación de la Gobernabilidad y Atención a Derechos Humanos y Desarrollo de Gobierno	1	125
192	Administración y Control de los Recursos Humanos, Financieros y Materiales de la Secretaría General de Gobierno	1	128
193	Programa de Fortalecimiento Institucional Municipal y Desarrollo Regional	1	130
194	Gestión de los Recursos Humanos, Financieros y Materiales del INDERM	1	131
195	Planeación Demográfica	1	141
196	Gestión Jurídica de la Secretaría General del Estado	1	148
197	Gestionar, Organizar, Preservar y Proporcionar los Archivos Públicos del Gobierno del Estado	1	180
198	Asesoría y Gestión a Sujetos de Derechos Agrarios	1	181
199	Programa Integral Protégete	1	198
200	Vinculación con Organizaciones Sociales, Agrupaciones y Asociaciones Religiosas	1	214
201	Logística de Eventos y Giras	1	302
202	Profesionalización de los Elementos Policíacos del Estado	1	170
203	Prevención y Seguridad Vial	1	171
204	Prevención del Delito a través de Acciones Estructurales	1	172
205	Administración de Recursos Humanos, Financieros y Materiales de la Secretaría de Seguridad Pública	1	173
206	Impartición de Justicia Político Electoral	1	9
207	Programa Institucional para la transversalización de la perspectiva de género en las políticas públicas	1	251
208	Administración de los Recursos Humanos, Materiales y Financieros del Tribunal Electoral	1	306
209	Impartición de Justicia en Materia Fiscal y Administrativa	1	8
210	Administración de los Recursos Humanos, Financieros y Materiales del Tribunal de Justicia Administrativa	1	337
211	Formación de Capital Humano para la Economía del Conocimiento	1	110
212	Ciencia, Tecnología e Innovación	1	113
213	Gastos Administrativos de la Secretaría de Investigación, Innovación y Educación Superior	1	333
214	Administración de la Secretaría de las Mujeres	1	255
215	Planeación	1	153
216	Administración de los Recursos Materiales, Financieros y Económicos de la Agencia para el Desarrollo de Yucatán	1	338
217	Administración de Recursos Materiales, Humanos y Financieros de la Auditoría Superior del Estado	1	292
218	Auditoría Superior del Estado	1	293
219	Atención a Gestiones Ciudadanas e Institucionales	1	127
220	Oportunidades en el Ámbito Internacional	1	126
221	Administración de Recursos Materiales Humanos y Financieros del Despacho del Gobernador	1	168
222	Administración de Recursos Materiales, Humanos y Financieros del INAIP	1	303
223	Servicios y Prestaciones	1	249
224	Servicios Integrales y de Esparcimiento	1	257
225	Programa Administrativo del ISSTEY	1	258
226	Atención de Contribuyentes	1	23
227	Mejora Regulatoria	1	95
228	Programación, Presupuestación, Control y Seguimiento del Presupuesto de Egresos	1	156
229	Integración de la Cartera y Gestión de Recursos Federales para la Inversión Pública	1	157
230	Formulación y Emisión de la Información Financiera	1	158
231	Adquisiciones del Poder Ejecutivo	1	160
232	Mejora de la Gestión Pública	1	161
233	Administración de los Recursos Humanos del Poder Ejecutivo	1	162
234	Administración de Recursos Humanos, Materiales, Financieros y Tecnológicos de la SAF	1	164
235	Tecnologías de la Información	1	165
236	Gestión y Administración de Recursos Humanos, Materiales, Financieros y Tecnológicos de la AAFY	1	166
237	Administración de Recursos Financieros	1	167
238	Pago a Jubilados	1	284
239	Administración y Manejo de la Deuda	1	285
240	Distribución de Participaciones	1	286
241	Distribución de Aportaciones	1	287
242	Transferencia de Recursos Federales en Convenio	1	301
243	Evaluación y Seguimiento a las Auditorías y Otros Actos de Fiscalización	1	134
244	Procesos de Fiscalización Aplicado en las Entidades Paraestatales	1	135
245	Auditorías y Otros Actos de Fiscalización al Sector Centralizado	1	136
246	Integración y Certeza Jurídica en los Resultados de las Auditorías, Inspecciones e Investigaciones	1	137
247	Legalidad en Materia de Situación Patrimonial	1	138
248	Asesoría en Contraloría Social a Beneficiarios de Programas Sociales	1	139
249	Auditorías a Programas Federales	1	140
250	Supervisión y Auditoría de Obra Pública	1	142
251	Normatividad de Adquisiciones, Servicios y Obra Pública	1	143
252	Responsabilidades de los Servidores Públicos	1	144
253	Políticas Públicas en Materia de Prevención de Actos de Corrupción	1	146
254	Administración de Recursos Materiales, Humanos y Financieros de la Secogey	1	174
255	Sistema de Evaluación del Desempeño	1	132
256	Rendición de Cuentas de Políticas Públicas	1	133
257	Operación Administrativa de la SEPLAN	1	154
258	Seguimiento del Desempeño de la Gestión	1	155
259	Administración de los Recursos Materiales, Humanos y Financieros de la SESEAY	1	340
260	Modernización del Sistema de Transporte en la Zona Metropolitana	1	106
261	Gestión Integral para el Desarrollo Metropolitano	1	151
262	Administración de los Recursos Humanos, Financieros y Materiales de COMDUTMEY	1	152
263	Ordenamiento Territorial y Desarrollo Urbano Sustentable	1	188
264	Servicios y Ordenamiento del Transporte Público en el Estado	1	269
265	Administración de Recursos Humanos, Materiales y Financieros del Instituto para el Desarrollo y Certificación de la Infraestructura Física Educativa de Yucatán	1	246
266	Gastos de Administración del INCAY	1	268
267	Programa de Construcción y Conservación de la Obra Pública	1	189
268	Programa Administrativo del INCCOPY	1	191
269	Administración de Recursos Humanos, Materiales y Financieros del IVEY	1	194
270	Dotación de Agua Potable	1	38
271	Saneamiento de Aguas Residuales	1	117
272	Atención y Servicios a la Población	1	184
273	Administración de Recursos Humanos, Materiales y Financieros de la JAPAY	1	185
274	Programa de Infraestructura Indígena	1	150
275	Administración de los Recursos Materiales y Humanos de la JEDEY	1	193
276	Planeación y Seguimiento de la Obra Pública	1	190
277	Administración de Recursos Humanos, Materiales y Financieros de la SOP	1	192
\.


--
-- Data for Name: Region; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Region" ("iIdRegion", "vRegion", "iActivo", "iPoblacion") FROM stdin;
1	Poniente	1	107906
2	Noroeste	1	1126735
3	Centro	1	80804
4	Litoral centro	1	92294
5	Noreste	1	121810
6	Oriente	1	229974
7	Sur	1	196054
\.


--
-- Data for Name: Rol; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Rol" ("iIdRol", "vRol", "iActivo") FROM stdin;
1	Administrador	1
2	Enlace Operativo	1
3	Enlace Estretégico	1
4	Consultor	1
6	Rol de prueba	1
5	Rol de prueba	0
\.


--
-- Data for Name: RolPermiso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."RolPermiso" ("iIdRol", "iIdPermiso", "iTipoAcceso") FROM stdin;
1	1	2
1	2	2
1	3	2
1	4	2
1	5	2
1	6	2
1	7	2
1	8	2
1	9	2
1	10	2
1	11	2
1	12	2
1	13	2
1	14	2
1	15	2
1	16	2
1	17	2
1	18	2
1	19	2
1	20	2
1	21	2
1	22	2
1	23	2
1	24	2
1	25	2
1	26	2
6	1	2
6	24	2
6	2	2
6	3	2
1	27	2
1	28	2
\.


--
-- Data for Name: SujetoAfectado; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."SujetoAfectado" ("iIdSujetoAfectado", "vSujetoAfectado", "iActivo") FROM stdin;
1	Beneficiarios	1
2	Visitantes	1
3	Afiliados	1
4	Detenidos	1
5	Consignados	1
6	Promoventes	1
7	Usuarios	1
8	Internos	1
\.


--
-- Data for Name: TipoUBP; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."TipoUBP" ("iIdTipoUbp", "vTipoUbp", "iActivo") FROM stdin;
1	Actividad Programática	1
2	Actividad Institucional	1
3	Presupuesto Institucional de Servicios Personales	1
4	Gastos Administrativos	1
5	Obra	1
6	N/A	1
\.


--
-- Data for Name: UBP; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."UBP" ("iIdUbp", "vClave", "vUBP", "iAnio", "iActivo", "iIdTipoUbp", "iIdDependencia", "iIdProgramaPresupuestario") FROM stdin;
1	15839	Operación del Aeropuerto de Chichén Itzá del estado de Yucatán	2019	1	2	98	23
2	13752	Administración de los recursos financieros y materiales de la auditoría superior.	2019	1	6	84	217
3	14868	Titular de Unidad de Administración y Finanzas	2019	1	6	84	217
4	13742	Despacho del Auditor Superior	2019	1	6	84	218
5	13744	Realizar auditoría al desempeño en el estado de Yucatán 	2019	1	6	84	218
6	14852	Elaboración del plan estratégico y programas de capacitación de la auditoría superior del estado de Yucatán. 	2019	1	6	84	218
7	14854	Elaboración y seguimiento de los lineamientos técnicos y normativos de la auditoría superior. 	2019	1	6	84	218
8	14858	Asesoría en promoción de acciones jurídicas derivadas de la fiscalización de la Cuenta Pública	2019	1	6	84	218
9	14859	Realizar auditorías a las cuentas públicas de los poderes, organismos y municipios del estado, y auditorías por convenio con la Auditoría Superior de la Federación.	2019	1	6	84	218
10	14862	Director de Auditoría al Desempeño	2019	1	6	84	218
11	14863	Director Jurídico	2019	1	6	84	218
12	14864	Dirección de Normatividad y Evaluación	2019	1	6	84	218
13	14865	Director de Auditorías a Municipios	2019	1	6	84	218
14	14867	Director de Planeación Estratégica, Desarrollo Intitucional y Capacitación	2019	1	6	84	218
15	14869	Director de Auditoría a Entidades	2019	1	6	84	218
16	19633	Informe de resultados de la fiscalización de la cuenta pública de los poderes y municipios del estado de Yucatán.	2019	1	6	84	218
17	1649	Legislatura	2019	1	6	85	156
18	13734	Aprobación y/o derogación de leyes, acuerdos y decretos	2019	1	6	85	156
19	13908	Investigación, estudios y evaluacion de proyectos en todo los ámbitos del derecho que inciden en la normatividad vigente.	2019	1	6	85	156
20	13911	Junta de Gobierno y Coordinación Política	2019	1	6	85	156
21	13914	Instituto de Investigaciones Legislativas	2019	1	6	85	156
22	13912	Secretaría General del Poder Legislativo	2019	1	6	85	156
23	13904	Administrar los recursos humanos, materiales, técnicos y financieros del Poder Legislativo	2019	1	6	85	157
24	13913	Dirección de Administración y Finanzas	2019	1	6	85	157
25	19828	Vigilancia del Cumplimiento de la Normativa en la Generación de Información por parte de la ASEY	2019	1	6	85	158
26	19832	Dirección de Evaluación de Desempeño	2019	1	6	85	158
27	19833	Oficina de la Unidad de Vigilancia y Evaluación de la Auditoría	2019	1	6	85	158
28	19834	Dirección de Análisis de Fiscalización	2019	1	6	85	158
29	19835	Evaluación del Desempeño de la Auditoría Superior del Estado de Yucatán en el ejercicio de sus funciones 	2019	1	6	85	158
30	13748	Protección y Defensa de los Derechos Humanos en Yucatán	2019	1	6	86	164
31	13753	Promoción y Observancia de los Derechos Humanos en Yucatán	2019	1	6	86	164
32	844	Oficina del Presidente	2019	1	3	86	165
33	13745	Oficina de la Secretaría Ejecutiva	2019	1	6	86	165
34	13746	Centro de Investigación	2019	1	6	86	165
35	13747	Dirección de Recursos Humanos, Financieros y Materiales	2019	1	6	86	165
36	13755	Estudio y divulgación de los Derechos Humanos	2019	1	6	86	165
37	13756	Desarrollo Institucional	2019	1	6	86	165
38	17147	Realización y Promoción de los Eventos Académicos, Artísticos y Culturales de la Escuela Superior de Artes de Yucatán	2019	1	1	33	8
39	17156	Investigación y Rescate del Patrimonio Documental Histórico y Contemporáneo de las Artes en Yucatán	2019	1	1	33	9
40	17145	Impulso al  Desarrollo Educativo de la Escuela Superior de Artes de Yucatán	2019	1	2	33	10
41	17146	Fortalecimiento de la Vinculación y Extensión de la Escuela Superior de Artes de Yucatán	2019	1	1	33	10
42	17148	Profesionalización de la Formación y Educación en las Artes en la Escuela Superior de Artes de Yucatán	2019	1	1	33	10
43	17149	Formación de Profesionales del Arte en el Estado de Yucatán	2019	1	1	33	10
44	17150	Dirección General	2019	1	3	33	10
45	17154	Secretaría Académica	2019	1	3	33	10
46	17157	Dirección de Artes Musicales	2019	1	3	33	10
47	17158	Dirección de Artes Escénicas	2019	1	3	33	10
48	17159	Dirección de Educación Artística	2019	1	3	33	10
49	17163	Dirección de Artes Visuales	2019	1	3	33	10
50	17151	Gastos Administrativos de la  Escuela Superior de Artes de Yucatán	2019	1	4	33	11
51	17152	Administración de los recursos financieros y materiales de la Escuela Superior de Artes de Yucatán	2019	1	2	33	11
52	17155	Dirección de Administración y Finanzas	2019	1	3	33	11
53	12105	Presentaciones de la Orquesta Sinfónica de Yucatán (OSY)	2019	1	1	34	8
54	18842	Dirección de Producción y Operación Artística del Figarosy	2019	1	3	34	8
55	19558	Dirección Artística	2019	1	3	34	8
56	12100	Dirección de Asuntos y Servicios Jurídicos	2019	1	3	34	12
57	12101	Dirección General del Figarosy	2019	1	3	34	12
58	12102	Dirección de Comunicación y Medios	2019	1	3	34	12
59	12103	Dirección de Administración y Finanzas	2019	1	3	34	12
60	12108	Gastos Administrativos del Fideicomiso Garante de la Orquesta Sinfónica de Yucatán	2019	1	4	34	12
61	13936	Administración de Recursos Humanos del Fideicomiso Garante de la Orquesta Sinfónica de Yucatán	2019	1	2	34	12
62	13937	Administración de Recursos Financieros y Materiales del Fideicomiso Garante de la Orquesta Sinfónica de Yucatán (Figarosy)	2019	1	2	34	12
63	14983	Gasto Administrativo de la Comisión de Derechos Humanos del Estado de Yucatán	2019	1	6	86	165
64	433	Dirección General	2019	1	3	36	14
65	4845	Dirección de Promoción Deportiva	2019	1	3	36	14
66	11322	Apoyos en atención a instituciones sin fines de lucro y otros organismos	2019	1	1	36	14
67	11373	Programa de Activación Física	2019	1	1	36	14
68	11495	Promoción Deportiva en el Estado	2019	1	1	36	14
69	12677	Centros de Desarrollo del Deporte Regional y Municipal	2019	1	1	36	14
70	13944	Desarrollo y seguimiento de los proyectos y programas estratégicos del Instituto del Deporte del Estado de Yucatán	2019	1	1	36	14
71	4692	Dirección Juridica	2019	1	3	36	15
72	4746	Dirección de Alto Rendimiento	2019	1	3	36	15
73	11363	Programa de alto rendimiento (becas, estímulos, reconocimientos y premios)	2019	1	1	36	15
74	11418	Actualización y certificación deportiva en el Estado 	2019	1	1	36	15
75	11476	Operación del Centro de Alto Rendimiento Deportivo (CARD)	2019	1	1	36	15
76	11593	Olimpiada Nacional	2019	1	1	36	15
77	11597	Operación del Centro de Medicina y Ciencias Aplicadas al Deporte	2019	1	1	36	15
78	18278	Fideicomiso de Alto Rendimiento Deportivo (FARD)	2019	1	1	36	15
79	20263	Elaboración de Estudios para la Construcción del Centro de Alto Rendimiento Deportivo, en el Municipio de Mérida, Yucatán.	2019	1	5	36	15
80	20264	Elaboración de Estudios para la construcción de la Academia Yucateca de Beisbol en el municipio de Mérida, Yucatán	2019	1	5	36	15
81	20580	Elaboración de Estudios para la construcción del estadio de fútbol en el municipio de Mérida, Yucatán	2019	1	5	36	15
82	11334	Difusión y comunicación social de eventos deportivos y recreativos	2019	1	1	36	16
83	11	Complejo Deportivo Kukulcán	2019	1	3	36	17
84	17	Complejo Olímpico Deportivo Inalámbrica	2019	1	3	36	17
85	8560	Dirección de Vinculación y Unidades Deportivas	2019	1	3	36	17
86	11427	Operación de Unidades Deportivas a cargo del Instituto del Deporte del Estado de Yucatán	2019	1	1	36	17
87	14783	Dirección de Proyectos Estratégicos	2019	1	3	36	17
88	14914	Operación del Centro Deportivo Paralímpico a cargo del Instituto del Deporte del Estado de Yucatán	2019	1	1	36	17
89	20265	Elaboración de Estudios para la Modernización del Estadio General Salvador Alvarado en el Municipio de Mérida	2019	1	5	36	17
90	11406	Programa Escuelas de Verano	2019	1	1	36	18
91	4722	Dirección de Administración y Finanzas	2019	1	3	36	19
92	11068	Gastos Administrativos del Instituto del Deporte del Estado de Yucatán	2019	1	4	36	19
93	11094	Administración de Recursos Financieros y Materiales del Instituto del Deporte del Estado de Yucatán	2019	1	2	36	19
94	13946	Administración de Recursos Humanos del Instituto del Deporte del Estado de Yucatán	2019	1	2	36	19
95	13947	Seguimiento, control y evaluación de la gestión pública del Instituto del Deporte del Estado de Yucatán	2019	1	2	36	19
96	13948	Control y seguimiento normativo del Instituto del Deporte del Estado de Yucatán	2019	1	2	36	19
97	13949	Servicios y soporte técnico del Instituto del Deporte del Estado de Yucatán	2019	1	2	36	19
98	14820	Fondo Regional para la Cultura y las Artes de la Zona Sur (FORCAZS)	2019	1	1	31	8
99	14830	Despacho del Secretario	2019	1	3	31	8
100	14832	Dirección de Promoción y Difusión Cultural	2019	1	3	31	8
101	14834	Programa de Estímulo a la Creación y Desarrollo Artístico (PECDA) 	2019	1	1	31	8
102	14839	Dirección de Desarrollo Artístico y Gestión Cultural	2019	1	3	31	8
103	15332	Impulso y desarrollo de los procesos de gestión, creación y formación artística y cultural de los municipios de Yucatán.	2019	1	1	31	8
104	17896	Realización de actividades artísticas y culturales en el Estado de Yucatán	2019	1	6	31	8
105	20075	Desarrollo de actividades artísticas y culturales en los municipios de Yucatán   	2019	1	1	31	8
106	20126	De Iconos Estamos Hablando 2019 	2019	1	1	31	8
107	20306	Modernización de las Galerías del Teatro Peón Conteras	2019	1	5	31	8
108	20323	Modernización del Centro de Artes Visuales	2019	1	5	31	8
109	20329	Modernización de centros culturales del municipio de Mérida	2019	1	5	31	8
110	20336	Dirección General de Museos y Patrimonio	2019	1	3	31	8
111	20347	Dirección Técnica del Gran Museo del Mundo Maya de Mérida	2019	1	3	31	8
112	20349	Fortalecimiento y promoción de la Red de Museos del estado de Yucatán.	2019	1	1	31	8
113	20368	Realización de exposiciones, eventos y difusión de la Dirección Técnica del Gran Museo del Mundo Maya de Mérida.	2019	1	1	31	8
114	20376	Contraprestación del Proyecto para la Prestación de Servicios del Gran Museo del Mundo Maya de Mérida	2019	1	2	31	8
115	20386	Exposiciones, programas educativos y expresiones multidisciplinarias del Museo de Arte Contemporáneo Ateneo de Yucatán (MACAY)	2019	1	1	31	8
116	20388	Programas artísticos de música tradicional yucateca del Museo de la Canción Yucateca	2019	1	1	31	8
117	20391	Proyecto escolar de sensibilización y acercamiento a la música a las comunidades del interior del estado de Yucatán. 	2019	1	1	31	8
118	20394	Formación de Nuevos Creadores 	2019	1	1	31	8
119	14804	Programa Nacional de Salas de Lectura	2019	1	1	31	20
120	20301	Programa de Desarrollo Cultural Infantil (Alas y Raíces)	2019	1	1	31	21
121	14816	Programa de Desarrollo Cultural Maya (Prodemaya)	2019	1	1	31	9
122	14818	Programa de Apoyo a las Culturas Municipales y Comunitarias (PACMYC)	2019	1	1	31	22
123	14845	Programa para el Desarrollo Integral de las Culturas de los Pueblos y Comunidades Indígenas (Prodici)	2019	1	1	31	9
124	15368	Fortalecimiento y difusión de las culturas populares e indígenas	2019	1	1	31	9
125	20341	Dirección de Patrimonio	2019	1	3	31	9
126	20355	Fortalecimiento y promoción del patrimonio cultural tangible e intangible del estado de Yucatán.	2019	1	1	31	9
127	14831	Dirección de Administración y Finanzas	2019	1	3	31	13
128	14833	Dirección de Asuntos y Servicios Jurídicos	2019	1	3	31	13
129	14853	Gasto  Administrativo de la  Secretaría  de la  Cultura y las Artes	2019	1	4	31	13
130	14916	Administración de Recursos Financieros,  Materiales y Humanos de la Secretaría de la Cultura y las Artes.	2019	1	2	31	13
131	20148	Administración de Recursos Financieros, Materiales y Humanos del Palacio de la Música	2019	1	2	31	13
132	20389	Gasto administrativo de la Dirección General de Museos y Patrimonio	2019	1	4	31	13
133	20522	Direccion de Desarrollo Cultural	2019	1	3	31	13
134	14730	Juzgados de primera instancia del sistema tradicional y del nuevo sistema de Oralidad	2019	1	6	87	166
135	9357	Desarrollo Artesanal en el Estado de Yucatán	2019	1	1	32	24
136	9443	Eventos y Ferias de Promoción Artesanal	2019	1	1	32	24
137	9484	Dirección General de Casa de las Artesanías del Estado de Yucatán	2019	1	3	32	24
138	13986	Gestión de la Casa de las Artesanías del Estado de Yucatán.	2019	1	1	32	24
139	9481	Gastos de administración de la Casa de las Artesanías del Estado de Yucatán	2019	1	4	32	25
140	19232	Programa Bienestar Cultur	2019	1	1	11	8
141	18509	Programa de Apoyo a la Promoción Turística de Zonas Arqueológicas	2019	1	1	11	26
142	20243	Estudio de preinversión para la construcción del parador turístico playero en la localidad y municipio de Celestún	2019	1	5	11	27
143	20245	Estudio de preinversión para la construcción del parador turístico en la zona arqueológica de Kulubá, en el municipio de Tizimín	2019	1	5	11	27
144	20248	Estudio de preinversión para la construcción del parador turístico en las Coloradas, en el municipio de Río Lagartos	2019	1	5	11	27
145	20249	Estudio de preinversión para la construcción del parador turístico en la localidad y municipio de Izamal	2019	1	5	11	27
146	20251	Estudio de preinversión para la construcción del parador turístico en la zona arqueológica de Mayapán, en el municipio de Tecoh	2019	1	5	11	27
147	20252	Estudio de preinversión para la construcción del parador turístico y artesanal en zona de playa del puerto Progreso, Yucatán.	2019	1	5	11	27
148	20253	Estudio de preinversión para la construcción del parador turístico en la localidad de Sisal, municipio de Hunucmá	2019	1	5	11	27
149	20324	Programa de Apoyo para el Fortalecimiento de Actividades Turísticas	2019	1	1	11	27
150	11190	Gastos Administrativos del Patronato de las Unidades de Servicios Culturales y Turísticos del Estado de Yucatán	2019	1	4	11	28
151	11244	Dirección General del Patronato de las Unidades de Servicios Culturales y Turísticos del Estado de Yucatán	2019	1	3	11	28
152	12950	Administración de los recursos del Patronato Cultur	2019	1	2	11	28
153	14013	Dirección Operativa del Patronato de las Unidades de Servicios Culturales y Turísticos del Estado de Yucatán	2019	1	3	11	28
154	14016	Dirección Administrativa del Patronato de las Unidades de Servicios Culturales y Turísticos del Estado de Yucatán	2019	1	3	11	28
155	20577	Administración de los Recursos del Centro de Convenciones y Exposiciones Yucatán Siglo XXI	2019	1	2	11	28
156	20578	Dirección Jurídica del Patronato de las Unidades de Servicios Culturales y Turísticos del Estado de Yucatán	2019	1	3	11	28
157	19233	Gerencia General 	2019	1	3	12	29
158	19234	Dirección de Administración y Finanzas	2019	1	3	12	29
159	19236	Gastos Administrativos de la Empresa Portuaria Yucateca 	2019	1	4	12	29
160	19238	 Emisión, control y  ejecución de las políticas, actividades y negociaciones generales de la Empresa Portuaria Yucateca	2019	1	2	12	29
161	19239	 Administración de los recursos materiales y financieros de la Empresa Portuaria Yucateca 	2019	1	2	12	29
162	19612	Administración de la reserva territorial de Ucú	2019	1	2	75	30
163	19613	Fideicomiso Público para la Administración de la Reserva Territorial de Ucú	2019	1	3	75	31
164	19614	Gasto administrativo del Fideicomiso Público para la Administración de la Reserva Territorial de Ucú	2019	1	4	75	31
165	15369	Fomento al Turismo de Reuniones en Yucatán 2019	2019	1	1	7	26
166	18275	Estrategia de Comercialización del Centro Internacional de Congresos de Yucatán	2019	1	2	7	26
167	19704	Dirección Comercial	2019	1	3	7	26
168	19705	Dirección General	2019	1	3	7	26
169	11504	Dirección de Administración	2019	1	3	7	32
170	19702	Gastos de Administración del Fideicomiso para el Desarrollo del Turismo de Reuniones en Yucatán (FIDETURE)	2019	1	4	7	32
171	19703	Dirección de Operaciones	2019	1	3	7	32
172	20136	Operación y Mantenimiento del Centro Internacional de Congresos de Yucatán	2019	1	2	7	32
173	20338	Administración General del Fideicomiso Público para el Desarrollo del Turismo de Reuniones en Yucatán.	2019	1	2	7	32
174	19852	Servicios de Formación y Capacitación para y en el Trabajo	2019	1	1	8	33
175	19857	Funcionamiento del Instituto de Capacitación para el Trabajo del Estado de Yucatán	2019	1	2	8	33
176	19858	Instituto de Capacitación para el Trabajo del Estado de Yucatán (ICATEY)	2019	1	3	8	33
177	19859	Gastos Administrativos del Instituto de Capacitación para el Trabajo del Estado de Yucatán 	2019	1	4	8	33
178	13951	Dirección General del Instituto Promotor de Ferias de Yucatán.	2019	1	3	9	18
179	16828	Organización de la Feria Yucatán Xmatkuil 2019	2019	1	1	9	18
180	18492	Rehabilitación de la infraestructura del recinto ferial, en la localidad de Xmatkuil municipio de Mérida	2019	1	5	9	18
181	18818	Otorgamiento de servicios generales para la operación de parque recreativo Baxal Ja	2019	1	2	9	18
182	14935	Gastos administrativos del Instituto Promotor de Ferias de Yucatán	2019	1	4	9	34
183	16831	Servicios jurídicos del Instituto Promotor de Ferias de Yucatán.	2019	1	2	9	34
184	16854	Administración de los recursos financieros y materiales del Instituto Promotor de Ferias Yucatán.	2019	1	2	9	34
185	16969	Dirección de Administración del Instituto Promotor de Ferias de Yucatán.	2019	1	3	9	34
186	16971	Dirección Jurídica del Instituto Promotor de Ferias de Yucatán.	2019	1	3	9	34
187	16972	Dirección de Eventos del Instituto Promotor de Ferias de Yucatán.	2019	1	3	9	34
188	16984	Dirección de Operaciones del Instituto Promotor de Ferias de Yucatán.	2019	1	3	9	34
189	248	Operación del Instituto Yucateco de Emprendedores	2019	1	3	10	35
190	1029	Gastos administrativos del Instituto Yucateco de Emprendedores	2019	1	4	10	35
191	5044	Desarrollo y promoción de la cultura de la calidad y el emprendimiento en el estado	2019	1	1	10	36
192	5045	Premio Yucatán al Emprendedor	2019	1	1	10	36
193	5046	Capacitación para la calidad, competitividad y emprendimiento en el Estado	2019	1	1	10	36
194	18299	Programa de apoyo al emprendimiento rural	2019	1	1	10	36
195	18309	Programa para el Desarrollo de Intraemprendedores 	2019	1	1	10	36
196	18312	Operación de la Red de Apoyo al Emprendedor en el Estado de Yucatán	2019	1	1	10	36
197	18313	Fondo de apoyo al emprendedor y la economía social	2019	1	1	10	36
198	18321	Fondo de promoción social para la inversión de capital de riesgo para emprendedores en Yucatán	2019	1	1	10	36
199	18324	Incubación y Aceleración de empresas.	2019	1	1	10	36
200	17211	Programa Producción Pecuaria de Traspatio 	2019	1	1	1	37
201	18271	Dirección de Apoyo a la Mujer y Grupos Vulnerables	2019	1	3	1	37
202	694	Dirección de Infraestructura y Equipamiento Agroindustrial	2019	1	3	1	38
203	836	Dirección de Exportación y Comercialización	2019	1	3	1	38
204	885	Dirección de Ganadería	2019	1	3	1	38
205	1330	Dirección de Apoyo a la Productividad Agropecuaria en el Estado	2019	1	3	1	38
206	3363	Dirección de Agricultura	2019	1	3	1	38
207	14933	Programa de Apoyo a Pequeños Productores (Componente Infraestructura Productiva para el Aprovechamiento de Suelo y Agua)	2019	1	1	1	38
208	15374	Programa de Concurrencia con las Entidades Federativas (Componente Infraestructura, Equipamiento, Maquinaria y Material Biológico)	2019	1	1	1	38
209	15958	Programa de Apoyos a Pequeños Productores (Componente Proyecto Estratégico de Seguridad Alimentaria (PESA))	2019	1	1	1	38
210	16452	Programa para el Mejoramiento Genético y Repoblamiento Ganadero	2019	1	1	1	38
211	16460	Programa de Apoyo Directo al Desarrollo Rural (PADDER)	2019	1	1	1	38
212	16462	Programa Peso a Peso	2019	1	1	1	38
213	17299	Programa de Rehabilitación, Modernización, Tecnificación y Equipamiento de Unidades de Riego	2019	1	1	1	38
214	19540	Servicios para la perforación de pozos en el Estado de Yucatán	2019	1	1	1	38
215	20044	Programa Estratégico de Fomento Agropecuario del Estado de Yucatán	2019	1	1	1	38
216	20123	Construcción de un Centro Integral de Mejoramiento Genético Ganadero en el Municipio de Tizimín	2019	1	5	1	38
217	20342	Reducción de Costos Financieros para productores agropecuarios y agroindustriales de Yucatán	2019	1	1	1	38
218	14927	Programa de Apoyos a Pequeños Productores (Componente de Extensión)	2019	1	1	1	39
219	15559	Dirección de Desarrollo de Capacidades y Extensionismo Rural	2019	1	3	1	39
220	15667	Atención a Productores Rurales en las oficinas regionales del Gobierno del Estado	2019	1	6	1	39
221	11661	Programa de Apoyo a Pequeños Productores (Componente Atención a Siniestros Agropecuarios)	2019	1	1	1	40
222	12785	Contratación del Seguro Sanitario para la actividad Avícola de  Yucatán	2019	1	1	1	40
223	14930	Programa de Sanidad e Inocuidad Alimentaria	2019	1	1	1	40
224	20415	Construcción de Caminos Saca-Cosecha en los municipios del Estado de Yucatán	2019	1	5	1	41
225	16451	Programa de Desarrollo de Unidades Productivas Campesinas e Insumos Rurales Producir	2019	1	1	1	24
226	676	Dirección de Planeación, Financiamiento y Coordinación Sectorial	2019	1	3	1	42
227	886	Despacho del  Secretario de Desarrollo Rural	2019	1	3	1	42
228	3231	Subsecretaría de Desarrollo Rural	2019	1	3	1	42
229	18125	Participación en el Sistema Nacional de Información para el Desarrollo Rural Sustentable (Snidrus)	2019	1	2	1	42
230	882	Dirección de Administración y Finanzas	2019	1	3	1	43
231	11097	Administración de Recursos Financieros, Materiales y Servicios Generales de la Secretaría de Desarrollo Rural (SEDER)	2019	1	2	1	43
232	11638	Gastos Administrativos de la Secretaría de Desarrollo Rural	2019	1	4	1	43
233	12883	Dirección Jurídica	2019	1	3	1	43
234	484	Dirección de Comercio	2019	1	3	2	44
235	2695	Gestión de las actividades de la Oficina del Secretario de Fomento Económico y Trabajo	2019	1	2	2	44
236	10550	Impulso a la comercialización de productos del estado.	2019	1	1	2	44
237	20417	Establecimiento de la Capital de la Guayabera en el municipio de Tekit.	2019	1	2	2	44
238	20438	Subsecretaría de Energía	2019	1	3	2	44
239	20440	Gestión de asuntos energéticos	2019	1	2	2	44
240	20444	Subsecretaría de Planeación y Proyectos	2019	1	3	2	44
241	20445	Servicios de apoyo a Mujeres Empresarias	2019	1	1	2	44
242	20446	Operatividad de la Subsecretaría de Planeación y Proyectos	2019	1	2	2	44
243	20447	Dirección de Fortalecimiento Empresarial	2019	1	3	2	44
244	20449	Actividades de la Dirección de Fortalecimiento Empresarial	2019	1	1	2	44
245	20450	Dirección de Apoyo al Empresario Femenil	2019	1	3	2	44
246	20503	Programa Capacitar	2019	1	1	2	45
247	20504	Programa de Capacitación Laboral	2019	1	1	2	45
248	20506	Programa de Apoyo al Empleo Servicios de Vinculación Laboral	2019	1	1	2	45
249	20507	Programa de Apoyo al Empleo Estrategia Abriendo Espacios	2019	1	1	2	45
250	20520	Actividad de la Dirección de Capacitación del Trabajo	2019	1	1	2	45
251	20521	Operatividad de la Dirección de Capacitación del Trabajo	2019	1	2	2	45
252	20525	Programa de Apoyo al Autoempleo	2019	1	1	2	45
253	20455	Dirección de Prospectiva Económica	2019	1	3	2	46
254	554	Dirección de Administración y Finanzas	2019	1	3	2	23
255	1023	Gestión de la Dirección de Administración y Finanzas de la Secretaría de Fomento Económico y Trabajo	2019	1	2	2	23
256	9235	Dirección Jurídica de la Secretaría de Fomento Económico y Trabajo	2019	1	3	2	23
257	10608	Gestión de asuntos jurídicos de la Secretaría de Fomento Económico y Trabajo	2019	1	2	2	23
258	11150	Gastos Administrativos de la Secretaría de Fomento Económico y Trabajo	2019	1	4	2	23
259	19700	Aportación para el incremento de capital del Aeropuerto de Chichén Itzá del estado de Yucatán	2019	1	2	2	23
260	20456	Planeación y competitividad económica	2019	1	2	2	23
261	20451	Fondo Integral para el Desarrollo Económico de Yucatán (Fidey)	2019	1	1	2	44
262	20452	Administración y Gestión de Fondos de la Secretaría de Fomento Económico y Trabajo	2019	1	2	2	44
263	20453	Fondo de Promoción y Fomento a las Empresas en el Estado de Yucatán (Foprofey)	2019	1	1	2	44
264	20454	Programa de Apoyo al Desarrollo de Micro, Pequeñas y Medianas Empresas (MPYMES) del sector Tecnologías de la Información y Comunicaciones (TIC),  en Yucatán (PROTICS).	2019	1	1	2	44
265	20458	Dirección de Proyectos Especiales y de la Mujer Empresaria	2019	1	3	2	44
266	20459	Fondo Nacional Emprendedor	2019	1	1	2	44
267	20461	Semanas de Yucatán en México	2019	1	1	2	44
268	20573	Fondo para la mujer empresaria asociada del estado de Yucatán (FOMEA)	2019	1	1	2	44
269	488	Dirección de Promoción a la Inversión	2019	1	3	2	47
270	13529	Actividades de Promoción a la Inversión en el Estado	2019	1	6	2	47
271	20442	Subsecretaría de Inversión y Desarrollo Económico	2019	1	3	2	47
272	20443	Fomento a la Inversión y Comercio	2019	1	2	2	47
273	461	Oficina del Secretario de Fomento Económico y Trabajo	2019	1	3	2	45
274	20439	Despacho del Subsecretario del Trabajo	2019	1	3	2	45
275	20467	Operación del Despacho del Subsecretario del Trabajo	2019	1	2	2	45
276	20468	Dirección de Capacitación del Trabajo 	2019	1	3	2	45
277	20497	Dirección del Servicio Nacional de Empleo	2019	1	3	2	45
278	20498	Programa de Apoyo al Empleo, Subprograma  Bécate 	2019	1	1	2	45
279	20499	Fortalecimiento del Servicio Nacional de Empleo	2019	1	2	2	45
280	20500	 Programa de Apoyo al Empleo, Subprograma Fomento al Autoempleo  	2019	1	1	2	45
281	20103	Realización y Apoyo de Eventos en el Estado de Yucatán 	2019	1	1	3	26
282	20247	Producciones para la Promoción del Estado de Yucatán  	2019	1	1	3	26
283	20291	Atención a  Segmentos Especiales del Mercado Turístico	2019	1	2	3	26
284	760	Dirección de Vinculación y Fomento Empresarial Turístico.	2019	1	3	3	48
285	799	Subsecretaría de Desarrollo Turístico Sustentable	2019	1	3	3	48
286	10656	Fortalecimiento a la Infraestructura Turística Pública y Desarrollo Turístico	2019	1	2	3	48
287	10657	Acciones de Incentivo al Turismo de Naturaleza	2019	1	1	3	48
288	10667	Programa Integral de Capacitación y Competitividad Turística	2019	1	1	3	48
289	10677	Atención y Fortalecimiento del Turismo de Cruceros del Estado de Yucatán.	2019	1	2	3	48
290	14414	Acciones de Normatividad, Verificación y Atención Turística	2019	1	6	3	48
291	17027	Tianguis Turístico de México 2019	2019	1	1	3	26
292	17543	Operación del Observatorio Turístico de Yucatán (OTY)	2019	1	1	3	26
293	17559	Eventos para Fomentar la Gastronomía Yucateca 	2019	1	1	3	26
294	18176	Realización de Material Turístico Promocional e Impresiones del Estado de Yucatán para 2019	2019	1	1	3	26
295	20102	Integración de expedientes técnicos para el nombramiento de Patrimonios de la Humanidad o Distinciones Especiales en Yucatán.	2019	1	2	3	26
296	13496	Gastos de Administración de la Secretaría de Fomento Turístico del Estado. 	2019	1	4	3	49
297	14443	Fideicomiso de Administración e Inversión para la Promoción y Fomento al Desarrollo Turístico y Económico del Estado de Yucatán. 	2019	1	2	3	49
298	18290	Secretaría Técnica	2019	1	3	3	49
299	15387	Acciones de Vinculación y Fomento Empresarial Turístico	2019	1	1	3	48
300	20029	Estudio para la creación del distintivo Aldeas Mayas	2019	1	2	3	48
301	16899	Rehabilitación, construcción y restauración de infraestructura en el Centro Histórico y las plazas de los barrios de San José, Santiago y La Candelaria, en la localidad de Maní (Segunda Etapa).	2019	1	5	3	50
302	20021	Construcción Punto México y Mejoramiento integral de la imagen urbana en el municipio y localidad de Progreso, Yucatán (I Etapa)	2019	1	5	3	50
303	20022	Mejoramiento de la imagen urbana y conversión de la red eléctrica, aérea y subterránea de la calle 60, 62 y Centro Histórico de Mérida.	2019	1	5	3	50
304	791	Despacho del C. Secretario de Fomento de Turístico	2019	1	3	3	49
305	792	Dirección de Administración y Finanzas	2019	1	3	3	49
306	10632	Coordinación de los Procesos de Planeación, Evaluación y Seguimiento	2019	1	2	3	49
307	10659	Coordinación de la Política de Fomento Turístico del Estado de Yucatán	2019	1	2	3	49
308	13454	Administración General de la Secretaría de Fomento Turístico del Estado	2019	1	2	3	49
309	487	Subsecretaría de Inteligencia de Mercados	2019	1	3	3	26
310	10692	 Relaciones Públicas para el Mercado  Nacional e Internacional 	2019	1	1	3	26
311	15339	Participación de Yucatán en Ferias y Eventos Nacionales e Internacionales	2019	1	2	3	26
312	15366	Conectividad Aérea y Marítima 	2019	1	2	3	26
313	15370	Acciones de Desarrollo Regional y Mundo Maya	2019	1	2	3	26
314	20320	Gastos Administrativos de la Secretaria de Pesca y Acuacultura Sustentables del Estado de Yucatán	2019	1	4	4	43
315	20362	Dirección Jurídica	2019	1	3	4	51
316	20364	Dirección de Administración	2019	1	3	4	51
317	20367	Dirección de Acuacultura	2019	1	3	4	51
318	20369	Dirección de Fomento, Infraestructura y Apoyo Pesquero	2019	1	3	4	51
319	20372	Subsecretaría de Pesca y Acuacultura Sustentables	2019	1	3	4	51
320	20375	Dirección de Desarrollo Sustentable y Proyectos Estratégicos	2019	1	3	4	51
321	20377	Dirección de Inspección y Vigilancia	2019	1	3	4	51
322	20366	Despacho del Secretario de Pesca y Acuacultura Sustentables del Estado de Yucatán	2019	1	3	4	52
323	20374	Programa de Apoyo Directo al Desarrollo Pesquero y Acuícola (PADDEPA) 	2019	1	1	4	52
324	20262	Programa Seguro en el Mar	2019	1	1	4	51
325	20288	Inspección y vigilancia, de las embarcaciones, centro de acopio, plantas procesadoras, congeladoras, comercializadoras y transportes terres en el litoral del Estado de Yucatán.	2019	1	2	4	51
326	20305	Fortalecimiento de la capacidad de gestión de la población costera.	2019	1	1	4	51
327	20314	Acciones de Ordenamiento Pesquero en la Zona Costera del Estado de Yucatán	2019	1	2	4	51
328	20317	Coordinación del cumplimiento legal de todos los actos que lleve a cabo la Secretaría de Pesca y Acuacultura Sustentables del Estado de Yucatán. 	2019	1	2	4	51
329	20330	Reactivación de las unidades de producción acuícola de Yucatán	2019	1	1	4	51
330	20334	Administración de Recursos Financieros, Materiales y Servicios Generales de la Secretaria de Pesca y Acuacultura Sustentables del Estado de Yucatán	2019	1	2	4	51
331	20340	Programa Peso a Peso (Componente Pesca)	2019	1	1	4	51
332	20345	Planeación, programación y evaluación de la Secretaría de Pesca y Acuacultura Sustentables del Estado de Yucatán.	2019	1	2	4	51
333	20350	Programa de Concurrencia con las Entidades Federativas (Componente Pesquero y Acuícola) 	2019	1	1	4	51
334	20352	Programa de Fomento a la Productividad Pesquera y Acuícola (Componente de Impulso a la Capitalización Pesquera y Acuícola)	2019	1	1	4	51
335	20353	Programa de Fomento a la Productividad Pesquera y Acuícola (Componente de Desarrollo Estratégico de la Acuacultura)	2019	1	1	4	51
336	20354	Dirección de Planeación, Programación y Evaluación	2019	1	3	4	51
337	20358	Programa Respeto la Veda del Mero	2019	1	1	4	51
338	20359	Dirección de Ordenamiento Pesquero	2019	1	3	4	51
339	14735	Imparticion de Justicia en Materia Civil	2019	1	6	87	166
340	14736	Impartición de Justicia en materia Mercantil	2019	1	6	87	166
341	14737	Imparticion de Justicia en Materia Familiar	2019	1	6	87	166
342	13628	Apoyo para Atención Médica de Población Vulnerable en Yucatán.	2019	1	1	16	53
343	15052	Administración del Patrimonio de la Beneficencia Pública de Yucatán	2019	1	3	16	53
344	15053	Gastos Administrativos de la Administración del Patrimonio de la Beneficencia Pública de Yucatán.	2019	1	4	16	54
345	19129	Administración de recursos financieros, materiales y servicios personales de la Administración del Patrimonio de la Beneficencia Pública del Estado de Yucatán.	2019	1	2	16	54
346	5683	Atención educativa para alumnos en educación media superior del Colegio de Estudios Científicos y Tecnológicos del Estado de Yucatán	2019	1	1	20	55
347	13624	Colegio de Estudios Científicos y Tecnológicos del Estado de Yucatán	2019	1	3	20	55
348	15344	Gastos Administrativos del Colegio de Estudios Científicos y Tecnológicos del Estado de Yucatán.	2019	1	4	20	56
349	16311	Programa de Promoción de la Donación y Trasplante de Órganos del Estado de Yucatán	2019	1	1	17	57
350	16310	Gastos Administrativos del Centro Estatal de Trasplantes de Yucatán.	2019	1	4	17	58
351	19115	Administración de los recursos personales, materiales y financieros del Centro Estatal de Trasplantes de Yucatán	2019	1	2	17	58
352	15343	Atención de alumnos por los servicios educativos del Colegio de Bachilleres del Estado de Yucatán	2019	1	1	18	59
353	19199	Becas de Excelencia en el Idioma Inglés	2019	1	1	18	59
354	11225	Gastos Administrativos del Colegio de Bachilleres del Estado de Yucatán	2019	1	4	18	60
355	13625	Colegio de Bachilleres del Estado de Yucatán	2019	1	3	18	60
356	19077	Funcionamiento de las áreas administrativas del Colegio de Bachilleres del Estado de Yucatán	2019	1	2	18	60
357	5699	Formación de profesionales técnicos en los municipios de Mérida, Tizimín y Valladolid.	2019	1	1	19	61
358	13619	Colegio de Educación Profesional Técnica del Estado de Yucatán (CONALEP)	2019	1	3	19	61
359	14028	Gastos administrativos del Colegio de Educación Profesional Técnica del Estado de Yucatán.	2019	1	4	19	62
360	14739	Imparticion de  Justicia  en materia Mixta, Civil, Mercantil y Familiar	2019	1	6	87	166
361	14756	Impartición de Justicia en materia de oralidad mercantil de juicios ordinarios y los nuevos juicios ejecutivos por reforma federal.	2019	1	6	87	166
362	16857	Impartición de Justicia en materia de Oralidad Familiar	2019	1	6	87	166
363	14738	Imparticion de Justicia en Materia Penal	2019	1	6	87	167
364	14773	Impartición de Juscticia del nuevo sistema en Tribunales de Oralidad	2019	1	6	87	167
365	14777	Impartición de Justicia en Juzgados de Control	2019	1	6	87	167
366	14780	Impartición de Justicia en Juzgados de Ejecución de Sentencia	2019	1	6	87	167
367	16856	Impartición de Justicia para Adolescentes en el Sistema Acusatorio	2019	1	6	87	168
368	13795	Aplicación de los Mecanismos Alternativos de Solución de Controversias en el Estado de Yucatán	2019	1	6	87	169
369	14672	Centro Estatal de Solución de Controversias	2019	1	6	87	169
370	13768	Secretaria Ejecutiva	2019	1	6	87	170
371	14544	Desarrollo Institucional del Poder Judicial del Estado de Yucatán	2019	1	6	87	170
372	14550	Dirección de Adminsitración y Finanzas del Consejo de la Judicatura	2019	1	6	87	170
373	14552	Comunicado de Acuerdos del Pleno del Consejo de la Judicatura	2019	1	6	87	170
374	14561	Comision de Desarrollo Humano.	2019	1	6	87	170
375	14571	Gastos Administrativos de los Organos Jurisdiccionales y Organos Administrativos del Consejo de la  Judicatura y del nuevo edificio del CJOM.	2019	1	6	87	170
376	14582	Coordinar las Areas de Supervision y Vigilancia de la Disciplina del Consejo de la Judicatura	2019	1	6	87	170
377	14587	Coordinación de funciones o actividades de las áreas administrativas y jurisdiccionales del Consejo de la Judicatura	2019	1	6	87	170
378	14600	Procesos de Auditorias y proceso administrativo disciplinario del Consejo de la Judicatura	2019	1	6	87	170
379	14608	Escuela Judicial del Consejo de la Judicatura	2019	1	6	87	170
380	14668	Comisión de Desarrollo Institucional	2019	1	6	87	170
381	14677	Comisión de Administración del Consejo de la Judicatura	2019	1	6	87	170
382	14719	Contraloría Órgano Técnico del Consejo de la Judicatura	2019	1	6	87	170
383	14732	Comisión de Disciplina	2019	1	6	87	170
384	14748	Supervisión del Programa Anual de Desarrollo de Personal del Consejo de la Judicatura	2019	1	6	87	170
385	14797	Escuela Judicial del Consejo de la Judicatura	2019	1	6	87	170
386	19047	Recopilación, concentración y manejo de la información estadística relativa a la actividad jurisdiccional de primera instancia	2019	1	6	87	170
387	19048	Coordinación Técnica	2019	1	6	87	170
388	19050	Fortalecimiento de la planeación institucional del Poder Judicial del Estado de Yucatán	2019	1	6	87	170
389	19055	Programa de servicios de atención y prevención a la violencia de género del poder Judicial del Estado de Yucatán. 	2019	1	6	87	170
390	19061	Atención psicologica derivadas del proceso de impartición y administración de justicia del Poder Judicial del Estado	2019	1	6	87	170
391	19057	Atención a las solicitudes de acceso a la información pública del Consejo de la Judicatura	2019	1	6	87	170
392	19063	Recepción y registro de todo tipo de documentación en el area mercantil, civil, familiar y penal	2019	1	6	87	170
393	19065	Apoyo administrativo a los juzgados de primera instancia area mercantil, civil y familiar  relativo a funciones actuariales	2019	1	6	87	170
394	19067	Realización y ejecución de un programa de comunicación y vinculación social	2019	1	6	87	170
395	20563	Administración de los recursos humanos, materiales y financieros del Consejo de la Judicatura.	2019	1	6	87	170
396	11622	Atención a las solicitudes realizadas al Titular del Poder Ejecutivo.	2019	1	2	88	219
397	15968	Fortalecimiento de las relaciones públicas del Gobernador del Estado  con los sectores público y privado	2019	1	2	88	219
398	12230	Vinculación del Estado de Yucatán con el exterior	2019	1	2	88	220
399	7352	Hospital Comunitario de Peto.	2019	1	3	21	72
400	18267	Programa de Atención a la Salud Materna y Perinatal. Arranque Parejo en la Vida del Hospital Comunitario de Peto	2019	1	1	21	72
401	17558	Gastos Administrativos del Hospital Comunitario de Peto.	2019	1	4	21	73
402	17953	Administración de los Recursos Humanos, Financieros y Materiales del Hospital Comunitario de Peto	2019	1	2	21	73
403	7355	Hospital Comunitario de Ticul.	2019	1	3	22	72
404	18266	Programa de Atención a la Salud Materna y Perinatal. Arranque Parejo en la Vida del Hospital Comunitario de Ticul	2019	1	1	22	72
405	17857	Gastos Administrativos del Hospital Comunitario de Ticul	2019	1	4	22	74
406	17954	 Administración de los Recursos Humanos, Financieros y Materiales del Hospital Comunitario de Ticul	2019	1	2	22	74
407	19225	Atención Médica en el Hospital General de Tekax	2019	1	1	24	75
408	19228	Hospital General de Tekax	2019	1	3	24	75
409	19226	Administración de los Recursos Humanos, Financieros y Materiales del Hospital General de Tekax	2019	1	2	24	76
410	19227	Gastos Administrativos del Hospital General de Tekax	2019	1	4	24	76
411	13458	Programa de becas de apoyo a la educación de madres jóvenes y jóvenes embarazadas	2019	1	1	25	77
412	14415	Programa de becas a la excelencia académica, artística y deportiva.	2019	1	1	25	77
413	19083	Programa de Becas Económicas para Educación Básica	2019	1	1	25	77
414	19084	Programa de Becas Económicas para Educación Media Superior	2019	1	6	25	78
415	7471	Programa de Becas Económicas para Educación Superior	2019	1	6	25	79
416	13462	Programa de Becas de Manutención 	2019	1	1	25	79
417	15328	Crédito Educativo	2019	1	4	25	79
418	6882	Instituto de Becas y Crédito Educativo del Estado de Yucatán	2019	1	3	25	80
419	18435	Funcionamiento del Instituto de Becas y Crédito Educativo del Estado de Yucatán 	2019	1	2	25	80
420	14035	Gastos Administrativos del Instituto de Educación para Adultos del Estado de Yucatán (IEAEY)	2019	1	4	26	81
421	5688	Atención a población joven y adulta de 15 años en adelante, a través del Instituto de Educación para Adultos del Estado de Yucatán (IEAEY)	2019	1	1	26	82
422	13588	Instituto de Educación para Adultos del Estado de Yucatán (IEAEY)	2019	1	3	26	82
423	323	Jefatura del Despacho del Gobernador del Estado	2019	1	3	88	219
424	839	Secretaría Particular	2019	1	3	88	219
425	8228	Unidad de Gestión y Orientación Ciudadana	2019	1	3	88	219
426	10981	Impulso a Procesos de Desarrollo Comunitario	2019	1	1	27	83
427	10995	Apoyo a Grupos Productivos para la Población Maya del Estado de Yucatán	2019	1	1	27	83
428	15496	Fortalecimiento del acceso a la justicia y formas de organización interna del pueblo maya del estado	2019	1	1	27	83
429	15537	Atención en Materia Jurídica al Pueblo Maya del Estado de Yucatán	2019	1	1	27	83
430	15538	Programa Integral de Fortalecimiento y Reconocimiento de la Lengua y Cultura Maya del Estado de Yucatán	2019	1	1	27	83
431	16512	Fortalecimiento y Enriquecimiento a cerca de los Derechos Humanos, Políticos y Culturales a la Población Maya del Estado de Yucatán	2019	1	1	27	83
432	20400	Impulso y seguimiento al desarrollo  al de las comunidades mayas del estado 	2019	1	2	27	83
433	10860	Fortalecimiento y Preservación de la Medicina Tradicional Maya en el Estado de Yucatán	2019	1	1	27	84
434	6192	Proyectos Estratégicos para Migrantes	2019	1	1	27	65
435	15410	Ventanilla de Gestión y Trámite de Documentos Oficiales para Migrantes y sus Familias	2019	1	1	27	65
436	18801	Programa de reencuentro de personas migrantes con sus padres y madres	2019	1	1	27	65
437	15455	Difusión de los Programas Públicos y Estatales para el Pueblo Maya Yucateco.	2019	1	1	27	16
438	525	Dirección General	2019	1	3	27	85
439	1025	Gastos Administrativos del Instituto para el Desarrollo de la Cultura Maya del Estado de Yucatán	2019	1	4	27	85
440	18210	Planificación y administración de recursos humanos y materiales del INDEMAYA	2019	1	2	27	85
441	18819	Sistemas de Gestión del Instituto Tecnológico Superior de Motul	2019	1	2	44	3
442	11294	Atención de alumnos egresados de bachillerato y regulares por los servicios del Instituto Tecnológico Superior de Motul	2019	1	1	44	86
443	19520	 Programa Estímulos al Desempeño Académicos, Culturales y Deportivos del Instituto Tecnológico Superior de Motul	2019	1	1	44	86
444	14038	Gastos de administración del Instituto Tecnológico Superior de Motul	2019	1	4	44	87
445	17618	Vinculación del Instituto Tecnológico Superior de Motul con el sector productivo	2019	1	1	44	88
446	13621	Instituto Tecnológico Superior de Motul	2019	1	3	44	86
447	18975	Apoyo a docentes de tiempo completo para el estudio de doctorado	2019	1	2	45	3
891	138	Dirección de Comunicación Social	2019	1	3	61	174
448	5690	Atención de alumnos egresados de bachillerato y regulares por los servicios del Instituto Tecnológico Superior de Progreso	2019	1	1	45	89
449	13620	Instituto Tecnológico Superior de Progreso	2019	1	3	45	89
450	18973	Apoyos y Estímulos a Estudiantes del Instituto Tecnológico Superior Progreso	2019	1	1	45	89
451	18974	Beca de Inclusión de Mujeres Jóvenes en las Ingenierías	2019	1	1	45	89
452	14042	Gastos administrativos del Instituto Tecnológico Superior de Progreso	2019	1	4	45	90
453	17705	Vinculación con el sector público, social y productivo del Estado- Instituto Tecnológico Superior Progreso	2019	1	1	45	91
454	8410	Dirección de Relaciones Públicas	2019	1	3	88	219
455	11153	Elaboración de la agenda oficial del Titular del Ejecutivo Estatal	2019	1	2	88	219
456	11311	Apoyo al Titular del Poder Ejecutivo y al Jefe del Despacho del Gobernador	2019	1	2	88	219
457	18382	Coordinación General de Asesores	2019	1	3	88	219
458	16525	Gastos administrativos del Despacho del Gobernador	2019	1	4	88	221
459	16541	Administación de los recursos humanos, materiales y financieros	2019	1	2	88	221
460	2143	Programa de Atención al Menor de Cinco Años en Riesgo, No Escolarizado	2019	1	1	30	37
461	2149	Espacios de Alimentación, Encuentro y Desarrollo	2019	1	1	30	37
462	2758	Dirección de Desarrollo Comunitario y Alimentación	2019	1	3	30	37
463	15180	Fortalecimiento y fomento a las Organizaciones de la Sociedad Civil	2019	1	1	28	64
464	15182	Junta de Asistencia Privada del Estado de Yucatán	2019	1	3	28	64
465	19576	Constitución de las Organizaciones de la Sociedad Civil	2019	1	1	28	64
466	15179	Gastos administrativos de la Junta de Asistencia Privada del Estado de Yucatán	2019	1	4	28	96
467	18363	Administración de los recursos de la Junta de Asistencia Privada del Estado de Yucatán	2019	1	2	28	96
468	18252	Gastos administrativos del Régimen Estatal de Protección Social en Salud	2019	1	4	29	97
469	18344	Administración de recursos humanos, financieros y materiales del Régimen Estatal de Protección Social en Salud	2019	1	2	29	97
470	10832	Dirección del Régimen de Protección Social en Salud de Yucatán	2019	1	3	29	98
471	18531	Sistema de Protección Social en Salud (Operación)	2019	1	6	29	98
472	18941	Fortalecimiento a los Servicios de Salud del Estado por el Régimen Estatal de Protección Social en Salud de Yucatán	2019	1	2	29	98
473	19092	Vivienda Digna 	2019	1	1	13	99
474	17342	Estufas ecológicas 	2019	1	1	13	100
475	20492	Acciones de inclusion y formación social para los jóvenes del estado de Yucatán	2019	1	1	13	8
476	20490	Fortalecimiento del Servicio Social	2019	1	1	13	79
477	20047	Certificación Educativa Tutorial	2019	1	1	13	82
478	11336	Dirección de Infraestructura Social	2019	1	3	13	37
479	13647	Elaboración y seguimiento de proyectos encaminados a  abatir el rezago social en las localidades  del Estado	2019	1	2	13	37
480	20072	Cunicultura en tu hogar	2019	1	1	13	37
481	20491	Comedores Juveniles 	2019	1	1	13	37
482	20574	Huerto en tu Hogar	2019	1	1	13	37
483	789	Dirección de Promoción y Participación Social	2019	1	3	13	64
484	9064	Organización Social	2019	1	2	13	64
485	15211	Donativo a la Fundación del Empresariado Yucateco Mérida	2019	1	1	13	64
486	16102	Coparticipación Social 	2019	1	1	13	64
487	20351	Cordinación y seguimiento a los programas de la dirección	2019	1	2	13	64
488	20475	Despacho de la Subsecretaria de la Juventud	2019	1	3	13	64
489	20481	Programa de Radio y Televisión Poder Joven	2019	1	1	13	64
490	20485	Centros Poder Joven y Espacios Contacto Joven del Estado de Yucatán.	2019	1	1	13	64
491	20486	Salud Integral de los Jóvenes en el Estado de Yucatán	2019	1	1	13	64
492	20487	Apoyo y Consolidación de las Instancias Municipales de Juventud.	2019	1	1	13	64
493	20488	Talleres de Formación Integral para el Desarrollo Juvenil	2019	1	1	13	64
494	20572	Subsecretaría de Bienestar Social	2019	1	3	13	64
495	20575	Coordinación y seguimiento a los programas de combate al rezago social.	2019	1	2	13	64
496	778	Dirección de Impulso Económico Familiar	2019	1	3	13	101
497	817	Despacho del C. Secretario.	2019	1	3	13	101
498	7398	Dirección de Vinculación y Estrategia Territorial	2019	1	3	13	101
499	9350	Fortalecimiento de la gestión de la Dirección de Apoyo a la Economía Familiar	2019	1	2	13	101
500	13590	Impulso a servicios institucionales en comunidades de alta y muy alta marginación del Estado.	2019	1	2	13	101
501	15402	Impulso Escolar 	2019	1	1	13	101
502	15477	Crédito Social	2019	1	1	13	101
503	15492	Recicla por tu salud 	2019	1	1	13	101
504	18263	Dirección de Fortalecimiento Social	2019	1	3	13	101
505	11312	Estancia Temporal	2019	1	1	13	65
506	15043	Gestión Social 	2019	1	1	13	65
507	15596	Seguimiento a las solicitudes de gestión ciudadana 	2019	1	2	13	65
508	15682	Dirección de Gestión Ciudadana.	2019	1	3	13	65
509	15838	Donativo a la Cruz Roja	2019	1	1	13	65
510	18798	Fortalecimiento de la Dirección de Promoción Social	2019	1	2	13	65
511	20483	Atención a Jóvenes de 12 a 29 años del Estado de Yucatán.	2019	1	1	13	65
512	20576	Operación de oficinas regionales de la Secretaría de Desarrollo Social	2019	1	2	13	65
513	20516	Difusión e imagen de la Subsecretaría de la Juventud del Estado de Yucatán	2019	1	2	13	16
514	20001	Capacitación para el Trabajo	2019	1	1	13	33
515	720	Subsecretaría de Planeación, Economía e Infraestructura Social	2019	1	3	13	102
516	11617	Coordinación de programas de la Secretaría de Desarrollo Social	2019	1	2	13	102
517	12277	 Seguimiento a los programas y proyectos de desarrollo social en las regiones del Estado.	2019	1	2	13	102
518	20517	Planeación, evaluación y seguimiento de las acciones y políticas realizadas en materia de juventud en el estado de Yucatán	2019	1	2	13	102
519	824	Gastos administrativos de la Secretaría de Desarrollo Social.	2019	1	4	13	96
520	826	Dirección  de Administración y Finanzas.	2019	1	3	13	96
521	829	Dirección Jurídica.	2019	1	3	13	96
522	1365	Certeza y asesoría jurídica a la Secretaría de Desarrollo Social  en el Estado de Yucatán.	2019	1	2	13	96
523	1369	Control financiero y administrativo de la Secretaría de Desarrollo Social.	2019	1	2	13	96
524	12292	Soporte tecnológico a usuarios y equipo de cómputo de la Secretaría de Desarrollo Social.	2019	1	2	13	96
525	20604	Programa Médico a Domicilio	2019	1	6	13	75
526	20605	Programa Chequera de la Salud (componente cupón de la salud)	2019	1	6	13	75
527	20606	Programa Chequera de la Salud (componente Servicios médicos en los municipios)	2019	1	6	13	75
528	20489	Impulso al Autoempleo Juvenil 	2019	1	1	13	36
529	18544	Personal docente y de apoyo de las escuelas normales	2019	1	3	15	103
530	19139	Funcionamiento de la Universidad Pedagógica Nacional en el estado de Yucatán	2019	1	2	15	103
531	14425	Misiones Culturales	2019	1	1	15	82
532	17959	Unidad de Programas Estratégicos	2019	1	3	15	82
533	14431	Entrega de útiles escolares en escuelas de educación básica en el estado de Yucatán	2019	1	1	15	101
534	16992	Programa Escuelas de Verano. Componente deportivo	2019	1	1	15	18
535	18579	Programa Escuelas de Verano. Componente educativo	2019	1	1	15	18
536	14426	Programa de Escuelas de Tiempo Completo (PETC)	2019	1	1	15	104
537	16684	Programa Estatal de Fortalecimiento a la Autonomía de la Gestión Escolar (PEAGE)	2019	1	2	15	104
538	16839	Realización de servicios generales a las escuelas de educación básica en el Estado de Yucatán	2019	1	2	15	104
539	16995	Mantenimiento emergente a planteles de educación preescolar en el estado de Yucatán.	2019	1	5	15	104
540	16999	Mantenimiento emergente a planteles de educación primaria en el estado de Yucatán	2019	1	5	15	104
541	17087	Mantenimiento emergente a planteles de educación secundaria en el estado de Yucatán	2019	1	5	15	104
542	18463	Implementación de Consejos de Participación Social en el estado	2019	1	1	15	104
543	20286	Fortalecimiento del aprendizaje musical en escuelas de educación básica	2019	1	1	15	104
544	16876	Construcción y equipamiento de espacios educativos del Colegio de Estudios Científicos y Tecnológicos, plantel 02 Hunucmá	2019	1	5	15	55
545	19798	Equipamiento del taller de Soporte y mantenimiento de equipos de cómputo del Cecytey plantel 06 Emiliano Zapata, de Mérida (segunda etapa)	2019	1	5	15	55
546	19867	Construcción y equipamiento de un aula de tutorías en el Centro de Estudios Científicos y Tecnológicos, plantel 01 Espita	2019	1	5	15	55
547	20244	Equipamiento de biblioteca del Centro de Estudios Científicos y Tecnológicos, plantel 04 Hoctún	2019	1	5	15	55
548	19747	Construcción y equipamiento de espacios educativos en el Colegio de Bachilleres, plantel Tixkokob (segunda etapa)	2019	1	5	15	59
549	19851	Construcción y equipamiento de espacios educativos en el Colegio de Bachilleres, plantel Ticul	2019	1	5	15	59
550	19856	Construcción y equipamiento de espacios educativos en el Colegio de Bachilleres, plantel Kanasín	2019	1	5	15	59
551	15206	Otorgamiento de servicios administrativos y de apoyo a las escuelas de educación básica a través de los Centros de Desarrollo Educativo (CEDE) del Estado	2019	1	2	15	105
552	17244	Diseño y aplicación de evaluaciones a través del Centro de Evaluación Educativa del estado de Yucatán	2019	1	1	15	105
553	3110	Fortalecimiento del programa Inclusión y Equidad educativa en escuelas de educación básica	2019	1	2	15	106
554	16664	Promoción e implementación de estrategias de lectura y escritura en el estado 	2019	1	2	15	106
555	19201	Programa Nacional de Convivencia Escolar	2019	1	2	15	107
556	18567	Participación de la Delegación Estatal en los Juegos Deportivos Nacionales Escolares de Educación Básica	2019	1	1	15	14
557	18545	Participación en el marco de la Feria Internacional de la Lectura Yucatán (FILEY)	2019	1	1	15	20
558	408	Personal docente y de apoyo para escuelas de inicial y preescolar	2019	1	3	15	108
559	409	Personal docente y de apoyo para escuelas de primaria	2019	1	3	15	108
560	410	Personal docente y de apoyo para escuelas secundarias	2019	1	3	15	108
561	412	Personal de educación física en escuelas de educación básica	2019	1	3	15	108
562	414	Personal docente y de apoyo para escuelas de educación indígena	2019	1	3	15	108
563	415	Personal docente y de apoyo para escuelas de educación especial	2019	1	3	15	108
564	16717	Mantenimiento de la infraestructura física educativa en centros educativos de nivel preescolar en el Estado de Yucatán.	2019	1	5	15	108
565	16740	Mantenimiento de la infraestructura física educativa en centros educativos de nivel primaria en el Estado de Yucatán.	2019	1	5	15	108
566	16742	Mantenimiento de la infraestructura física educativa en centros educativos de nivel secundaria en el Estado de Yucatán.	2019	1	5	15	108
567	16745	Ampliación de espacios educativos en el nivel preescolar en el estado de Yucatán.	2019	1	5	15	108
568	16747	Ampliación de espacios educativos en el nivel de educación primaria en el estado de Yucatán.	2019	1	5	15	108
569	16750	Ampliación de espacios educativos en el nivel de educación secundaria en el estado de Yucatán.	2019	1	5	15	108
570	16965	Adquisición de mobiliario y equipo para escuelas de nivel preescolar en el estado de Yucatán.	2019	1	5	15	108
571	16967	Adquisición de mobiliario y equipo para escuelas de nivel primaria en el estado de Yucatán.	2019	1	5	15	108
572	16968	Adquisición de mobiliario y equipo para escuelas de nivel secundaria en el estado de Yucatán.	2019	1	5	15	108
573	5694	Programa de apoyo para organizaciones sin fines de lucro que brindan atención educativa	2019	1	1	15	77
574	18005	Programa Ver Bien para Aprender Mejor	2019	1	1	15	77
575	7559	Personal docente y de apoyo para escuelas preparatorias estatales	2019	1	3	15	109
576	15948	Personal docente y de apoyo para telebachilleratos	2019	1	3	15	109
577	17420	Fortalecimiento de la autonomía de la gestión escolar en el nivel medio superior en el Estado	2019	1	2	15	109
578	17902	Telebachillerato Comunitario Intercultural de Yucatán  (TCINY)	2019	1	1	15	109
579	18482	Personal docente y de apoyo de las escuelas normales federales	2019	1	3	15	103
580	18483	Funcionamiento de las escuelas normales federales en el estado de Yucatán	2019	1	2	15	103
581	16723	Programa Nacional de Inglés en Educación Básica	2019	1	1	15	106
582	17251	Programa de Fortalecimiento de la Calidad en Educación Básica	2019	1	2	15	106
583	19152	Profesionalización del servicio docente y fortalecimiento de competencias curriculares en el estado de Yucatán	2019	1	2	15	106
584	16683	Mantenimiento menor de edificios y oficinas administrativas de la Secretaría de Educación del Estado de Yucatán	2019	1	5	15	110
585	16785	Administración de los recursos humanos y materiales de la SEGEY 	2019	1	2	15	110
586	17004	Gastos de Administración de la Secretaría de Educación del estado de Yucatán	2019	1	4	15	110
587	17554	Personal de las Unidades Administrativas de la SEGEY	2019	1	3	15	110
588	20533	Dirección de Relaciones Interinstitucionales	2019	1	3	15	110
589	203	Atención a la salud bucal en Yucatán (Atención)	2019	1	1	14	111
590	272	Entornos y comunidades saludables	2019	1	1	14	111
591	13448	Programa Fortalecimiento y Preservación de la Medicina Tradicional Maya	2019	1	1	14	111
592	13553	Atención a la salud bucal en Yucatán (Prevención)	2019	1	1	14	111
593	14407	Promoción de la Salud Escolar 	2019	1	1	14	111
594	14408	Promoción de la salud: Una Nueva Cultura	2019	1	1	14	111
595	14409	Salud del Migrante. Vete Sano, Regresa Sano.	2019	1	1	14	111
596	16538	Programa de servicios comunitarios de atención a la salud en el estado de Yucatán	2019	1	1	14	111
597	10765	Programa de Atención al Trastorno por Déficit de Atención (TDA) (Prevención)	2019	1	1	14	112
598	10791	Programa de Atención a la Esquizofrenia (Prevención)	2019	1	1	14	112
599	10836	Programa de Atención  a la Depresión y Prevención del Suicidio (PDS) (Atención)	2019	1	1	14	112
600	10852	Programa de Atención a las Demencias (Atención)	2019	1	1	14	112
601	10958	Programa de Salud Mental para Comunidades Indígenas Mayas (SMCIM)	2019	1	1	14	112
602	13500	Programa de Atención a la Depresión y Prevención del Suicidio (PDS) (Prevención)	2019	1	1	14	112
603	13501	Programa de Atención al Trastorno por Déficit de Atención (TDA) (Atención)	2019	1	1	14	112
604	13502	Programa de Atención a la Esquizofrenia (Atención)	2019	1	1	14	112
605	13510	Programa de Atención a las Demencias (Prevención)	2019	1	1	14	112
606	13536	Programa de Prevención y Control de Adicciones (Atención)	2019	1	1	14	112
607	13548	Programa de Prevención y Control de Adicciones (Prevención)	2019	1	1	14	112
608	19874	Atención de trastornos mentales en las Villas de Transición de Yucatán	2019	1	1	14	112
609	10160	Programa Fortalecimiento a la Atención Médica	2019	1	1	14	113
610	204	Programa de Prevención de Accidentes y Seguridad Vial	2019	1	1	14	114
611	11074	Programa Estatal de Zoonosis (Atención de intoxicacion por mordedura de animales ponzoñosos)	2019	1	1	14	114
612	11103	Acciones para garantizar Sangre Segura en Yucatán	2019	1	1	14	115
613	8865	Prevención y Control del Cáncer Cérvicouterino (Prevención)	2019	1	1	14	116
614	13643	Prevención y control de Cáncer Cérvicouterino (Atención)	2019	1	1	14	116
615	14412	Prevención y Control del Cáncer de Mama (Prevención)	2019	1	1	14	116
616	14413	Prevención y Control del Cáncer de Mama (Atención)	2019	1	1	14	116
617	273	Planificación Familiar y Anticoncepción. Salud Reproductiva	2019	1	1	14	72
618	10719	Programa de Atención a la Salud Materna y Perinatal. Arranque Parejo en la Vida.	2019	1	1	14	72
619	274	Programa de Atención a la Salud de la Infancia y la Adolescencia	2019	1	1	14	70
620	5510	Programa de Combate a la Desnutrición Infantil en el Estado de Yucatán (Promoción de lactancia materna y alimentación complementaria).	2019	1	1	14	70
621	10865	Programa de Atención a Personas con Discapacidad (Prevención)	2019	1	1	14	70
622	13524	Programa de Atención a Personas con Discapacidad (Atención)	2019	1	1	14	70
623	13542	Programa de vacunación universal	2019	1	1	14	70
624	120	Programa de Salud del Adulto y el Anciano (Prevención de Diabetes Mellitus y Riesgo Cardiovascular)	2019	1	1	14	117
625	13497	Programa de Salud del Adulto y el Anciano (Atención a la Diabetes Mellitus y Riesgo Cardiovascular)	2019	1	1	14	117
626	8982	Programa de atención al envejecimiento (Prevención)	2019	1	1	14	118
627	14455	Programa de Atención al Envejecimiento (Atención)	2019	1	1	14	118
628	10828	Dirección de Planeación y Desarrollo	2019	1	3	14	119
629	18644	Programa de Mantenimiento para la Reacreditación de Unidades de Primer Nivel del Estado de Yucatán	2019	1	5	14	119
630	243	Resolución Alterna de Conflictos del Acto Médico en Yucatán.	2019	1	1	14	120
631	8690	Comisión de Arbitraje Médico del Estado de Yucatán (Codamedy)	2019	1	3	14	120
632	6512	Programa de prevención y atención de la violencia familiar y de género (Prevención)	2019	1	1	14	63
633	13687	Programa de prevención y atención de la violencia familiar y de género (Atención)	2019	1	1	14	63
634	13144	Programa de Cirugía Extramuros	2019	1	1	14	53
635	8870	Regulación de insumos y servicios de salud en Yucatán.	2019	1	2	14	121
636	8871	Regulación sanitaria de bienes y servicios en Yucatán.	2019	1	2	14	121
637	10839	Dirección de Protección Contra Riesgos Sanitarios	2019	1	3	14	121
638	12304	Vigilancia del agua para consumo humano y uso recreativo.	2019	1	2	14	121
639	13449	Vigilancia, regulación y control sanitario internacional.	2019	1	2	14	121
640	13466	Protección a la salud de la población ocupacional y expuesta contra riesgos químicos.	2019	1	2	14	121
641	14448	Programa de Tabaco de los Servicios de Salud de Yucatán	2019	1	2	14	121
642	14938	Cultura del agua.	2019	1	1	14	121
643	16557	Agua limpia.	2019	1	2	14	121
644	16685	Dirección del Laboratorio Estatal de Salud Pública	2019	1	3	14	121
645	16724	Programa Estatal para la Red de laboratorios clínicos en el primer y segundo  nivel de atención en el estado de Yucatán.	2019	1	2	14	121
646	17578	Programa de Cambio climático en el Estado de Yucatán.	2019	1	2	14	121
647	8863	Operación del Sistema Nacional de Vigilancia Epidemiológica (Sinave)	2019	1	2	14	122
648	13540	Atención de urgencias epidemiológicas y desastres	2019	1	2	14	122
649	19952	Prevención y control de enfermedades respiratorias (Vigilancia epidemiológica)	2019	1	1	14	122
650	285	Sistema Integral de Calidad en Salud (SICALIDAD)	2019	1	2	14	123
651	10829	Dirección General de los Servicios de Salud de Yucatán	2019	1	3	14	123
652	16551	Fortalecimiento del sistema de seguimiento de la productividad médica con la hoja diaria de consulta.	2019	1	2	14	123
653	18242	Vigilancia normativa y técnica de la atención médica en las unidades médicas de los Servicios de Salud de Yucatán	2019	1	2	14	123
654	19927	Desarrollo del Software para el Sistema Único de Información de los Servicios de Salud de Yucatán	2019	1	2	14	123
655	19983	Operación del sistema de referencia y contrarreferencia de los Servicios de Salud de Yucatán	2019	1	2	14	123
656	7629	Investigación en salud desarrollado por Funsalud capítulo peninsular en el Hospital O'Horán	2019	1	2	14	124
657	9450	Dirección de Administración y Finanzas.	2019	1	3	14	124
658	9460	Gastos administrativos de los Servicios de Salud de Yucatán	2019	1	4	14	124
659	10800	Apoyo jurídico a los Servicios de Salud de Yucatán	2019	1	2	14	124
660	10887	Dirección de Asuntos Jurídicos	2019	1	3	14	124
661	13893	Fortalecimiento para la Red de Voz y Datos de los Servicios de Salud de Yucatán.	2019	1	2	14	124
662	14023	Administración de recursos financieros y materiales de los Servicios de Salud de Yucatán.	2019	1	2	14	124
663	14034	Administración de recursos personales de los Servicios de Salud de Yucatán.	2019	1	2	14	124
664	19953	Operación del Instituto de Salud Mental del Estado de Yucatán	2019	1	2	14	124
665	13264	Programa de Fortalecimiento de Promoción y Acciones en Nutrición y Actividad Física	2019	1	1	14	125
666	13555	Programa Integral de Atención a la Obesidad del Estado de Yucatán (Prevención y promoción)	2019	1	1	14	125
667	14449	Activación Física para la Salud en Yucatán	2019	1	1	14	125
668	14980	Dirección de Nutrición.	2019	1	3	14	125
669	18215	Programa de Actividad Física Preventiva y Terapeútica en Yucatán	2019	1	1	14	125
670	11525	Dirección de Prevención y Protección de la Salud	2019	1	3	14	75
671	18272	Atención médica en unidades de consulta externa de los SSY	2019	1	1	14	75
672	18277	Atención médica en unidades de hospitalización de los SSY	2019	1	1	14	75
673	18788	Centro Regulador de Urgencias Médicas de Yucatán	2019	1	1	14	75
674	19378	Coordinación de voluntades anticipadas del estado de Yucatán	2019	1	1	14	75
675	19384	 Operación del Hospital de Tekax	2019	1	2	14	75
676	19921	Programa Médico a Domicilio 	2019	1	1	14	75
677	19951	Programa Chequera de la Salud (componente cupón de la salud) 	2019	1	1	14	75
678	20289	Programa Chequera de la Salud (componente Servicios médicos en los municipios)	2019	1	1	14	75
679	281	Programa de prevención y control del Cólera	2019	1	1	14	126
680	205	Micobacteriosis. Tuberculosis y Lepra (Prevención)	2019	1	1	14	127
681	13543	Micobacteriosis. Tuberculosis y Lepra (Atención)	2019	1	1	14	127
682	114	Programa de Prevención y Control de Enfermedades Transmitidas por Vector (Dengue-Atención)	2019	1	1	14	128
683	13485	Programa de Prevención y Control de Enfermedades Transmitidas por Vector (Dengue-Prevención)	2019	1	1	14	128
684	16564	Programa de Prevención y Control de Enfermedades Transmitidas por Vector (Chagas y otras ETV's-Prevención)	2019	1	1	14	128
685	16569	Programa de Prevención y Control de Enfermedades Transmitidas por Vector (Chagas y otras ETV-Atención)	2019	1	1	14	128
686	16588	Programa de Prevención y Control de Enfermedades Transmitidas por Vector (Paludismo-Atención)	2019	1	1	14	128
687	16672	Programa de Prevención y Control de Enfermedades Transmitidas por Vector (Prevención de Paludismo)	2019	1	1	14	128
688	92	Programa Estatal para la Prevención y Control del VIH/SIDA e Infecciones de Transmisión Sexual (Atención)	2019	1	1	14	129
689	13556	Programa Estatal para la prevención y control del VIH/SIDA e Infecciones de Transmisión Sexual (Prevención)	2019	1	1	14	129
690	282	Programa Estatal de Zoonosis (Prevención de rabia)	2019	1	1	14	130
691	8860	Programa Estatal de Zoonosis (Control epidemiológico de Brucelosis)	2019	1	1	14	130
692	18216	Programa Estatal de Zoonosis (Prevención de Rickettsiosis)	2019	1	1	14	130
693	2792	Programa Desayunos Escolares	2019	1	1	30	37
694	4854	Programa de asistencia alimentaria a sujetos vulnerables	2019	1	1	30	37
695	381	Procuraduría de la Defensa del Menor y la Familia	2019	1	3	30	63
696	2228	Atención a personas con problemas familiares en el estado de Yucatán	2019	1	1	30	63
697	2672	Promoción y difusión de los derechos de las niñas, niños y adolescentes (Participación Infantil).	2019	1	1	30	63
698	2733	Dirección para la Atención de la Infancia y la Familia	2019	1	3	30	63
699	6818	Programa integral de Atención a la Infancia y la Familia	2019	1	1	30	63
700	5130	Programa de Desarrollo Comunitario (Comunidad Diferentte)	2019	1	1	30	64
701	5124	Capacitación en oficios manuales, actividades artísticas y recreativas a población en vulnerabilidad en el estado de Yucatán	2019	1	1	30	65
702	7445	Asistencia a la comunidad en vulnerabilidad y discapacidad del Estado de Yucatán.	2019	1	1	30	65
703	15534	Apoyo económico a Organizaciones de la Sociedad Civil que tienen por objeto la Asistencia Social	2019	1	1	30	65
704	320	Centro Regional de Órtesis, Prótesis y Ayudas Funcionales de Yucatán.	2019	1	3	30	66
705	542	Dirección del Centro de Rehabilitación y Educación Especial	2019	1	3	30	66
706	2560	Programa de atención a personas con discapacidad. 	2019	1	1	30	66
707	10400	Registro de personas con discapacidad en el Estado de Yucatán.	2019	1	1	30	66
708	10861	Atención a personas con algún tipo de discapacidad motora en el Estado de Yucatán.	2019	1	1	30	66
709	15966	Fondo para la accesibilidad en el transporte público para las personas con discapacidad	2019	1	1	30	66
710	347	Centro de Atención Integral al Menor en Desamparo (CAIMEDE)	2019	1	3	30	67
711	2222	Atención a Niñas, Niños y Adolescentes Albergados en el Centro de Atención Integral al Menor en Desamparo (Caimede)	2019	1	1	30	67
712	1095	Atención médica y odontológica a población en vulnerabilidad del Estado de Yucatán.	2019	1	1	30	53
713	535	Subdirección Operativa	2019	1	3	30	68
714	2251	Educación Inicial  a niñas y niños de los Centros Asistenciales de Desarrollo Infantil de los municipios de Mérida y Conkal.	2019	1	1	30	68
715	299	Despacho de la Presidenta del Patronato del Sistema DIF Yucatán	2019	1	3	30	69
716	300	Subdirección Administrativa	2019	1	3	30	69
717	541	Dirección General del Sistema DIF Yucatán	2019	1	3	30	69
718	733	Administración de recursos del Sistema para el Desarrollo Integral de la Familia en Yucatán.	2019	1	2	30	69
719	973	Planeación, seguimiento, evaluación y control normativo  de los programas del Sistema para el Desarrollo Integral de la Familia en Yucatán.	2019	1	2	30	69
720	1125	Promoción de la Asistencia Social en el Estado de Yucatán a través del Despacho de la Presidenta	2019	1	2	30	69
721	4965	Mantenimiento preventivo y correctivo a equipos de cómputo.	2019	1	2	30	69
722	13892	Sistema para el Desarrollo Integral de la Familia en Yucatán	2019	1	4	30	69
723	13895	Administración de Recursos Humanos del Sistema DIF Yucatán	2019	1	2	30	69
724	14012	Acciones de desarrollo institucional y profesionalización del Sistema DIF Yucatán	2019	1	2	30	69
725	20624	Gasto Administrativo del Fideicomiso Público para la administración del Palacio de la Música	2019	1	4	35	13
726	5126	Hospital de la Amistad Corea México.	2019	1	3	23	70
727	18217	Servicios de atención pediátrica del Hospital de la Amistad	2019	1	1	23	70
728	12311	Administración de los recursos financieros y materiales del Hospital de la Amistad.	2019	1	2	23	71
729	13940	Gastos Administrativos del Hospital de la Amistad Corea México	2019	1	4	23	71
730	14050	Gastos de administración de la Universidad de Oriente	2019	1	4	48	135
731	11299	Atención de alumnos en la Universidad de Oriente (UNO)	2019	1	1	48	136
732	13618	Universidad de Oriente 	2019	1	3	48	136
733	16991	Ampliación y equipamiento de espacios educativos de la Universidad de Oriente tercera etapa.	2019	1	5	48	136
734	18596	Atención Educativa de Alumnos de la Universidad Politécnica de Yucatán	2019	1	1	49	137
735	18597	Universidad Politécnica de Yucatán	2019	1	3	49	137
736	18433	Construcción y equipamiento de la quinta etapa de la Universidad Politécnica de Yucatán.	2019	1	5	49	138
737	18598	Gastos de Administración de la Universidad Politécnica de Yucatán	2019	1	4	49	138
738	14342	Equipamiento especializado para laboratorios de la Universidad Tecnológica del Centro (segunda etapa)	2019	1	5	50	139
739	14483	Universidad Tecnológica del Centro	2019	1	3	50	139
740	14491	Atención educativa a los estudiantes de la Universidad Tecnológica del Centro	2019	1	1	50	139
741	19200	Villas Universitarias de la Universidad Tecnológica del Centro	2019	1	1	50	139
742	14485	Gastos de administración de la Universidad Tecnológica del Centro	2019	1	4	50	140
743	17567	Vinculación, promoción y gestión con el sector productivo de la Universidad Tecnológica del Centro Izamal	2019	1	1	50	141
744	14047	Gastos de Administración de la Universidad Tecnológica Metropolitana 	2019	1	4	53	142
745	5680	Atención Educativa de Alumnos en la Universidad Tecnológica Metropolitana en el estado de Yucatán.	2019	1	1	53	143
746	13617	Universidad Tecnológica Metropolitana	2019	1	3	53	143
747	17832	Mantenimiento y Equipamiento de la infraestructura física de la Universidad Tecnológica Metropolitana (Etapa 2)	2019	1	5	53	143
748	17623	Vinculación, promoción y gestión con el sector productivo, empresarial y social de la Universidad Tecnológica Metropolitana en el estado de Yucatán.	2019	1	1	53	144
749	13147	Financiamiento Público para Actividades Ordinarias, Especifícas de los Partidos Políticos	2019	1	6	89	176
750	13941	Gastos Administrativos del Instituto Electoral y de Participación Ciudadana de Yucatán	2019	1	6	89	176
751	19634	Administración de Recursos Materiales, Físicos y Financieros del Instituto Electoral y de Partipación Ciudadana de Yucatán	2019	1	6	89	176
752	13193	Secretaría Ejecutiva del IEPAC	2019	1	6	89	177
753	18253	Consejeros del Instituto Electoral y de Participación Ciudadana de Yucatán.	2019	1	6	89	177
754	14368	Construcción y equipamiento de la Universidad Tecnológica del Poniente (primera etapa)	2019	1	5	52	148
755	14482	Universidad Tecnológica del Poniente	2019	1	3	52	148
756	14490	Atención de alumnos en la Universidad Tecnológica del Poniente	2019	1	1	52	148
757	17707	Vinculación con el sector productivo de la Universidad Tecnológica del Poniente	2019	1	1	52	149
758	14484	Gastos de administración de la Universidad Tecnológica del Poniente	2019	1	4	52	150
759	18254	Dirección Ejecutiva de Administración y Prerrogativas del IEPAC	2019	1	6	89	177
760	18255	Dirección Ejecutiva de Capacitación Electoral del IEPAC	2019	1	6	89	177
761	18259	Dirección Ejecutiva de Procedimientos Electorales del IEPAC	2019	1	6	89	177
762	18261	Contraloría General y Unidad de Fiscalización del IEPAC	2019	1	6	89	177
763	19085	Comisión Ejecutiva Estatal de Atención a Víctimas	2019	1	3	65	154
764	19086	 Asesoramiento jurídico a víctimas del delito de la Comisión Ejecutiva Estatal de Atención a Víctimas	2019	1	1	65	154
765	19087	Fondo Estatal de Ayuda, Asistencia y Reparación Integral	2019	1	1	65	154
766	19531	Atención Psicológica a víctimas del delito de la Comisión Ejecutiva Estatal de Atención a Víctimas	2019	1	1	65	154
767	19532	Otorgamiento de servicios de trabajo social para la reparación del daño de la Comisión Ejecutiva Estatal de Atención a Víctimas 	2019	1	1	65	154
892	12515	Elaboración de informes de las resoluciones jurídicas	2019	1	2	61	174
768	19565	Gastos para servicios básicos de la Comisión Ejecutiva Estatal de Atención a Víctimas	2019	1	4	65	155
769	19566	Administración y operación de los recursos de la Comisión Ejecutiva Estatal de Atención a Víctimas	2019	1	2	65	155
770	18262	Presidencia del Instituto Electoral y de Participación Ciudadana de Yucatán	2019	1	6	89	177
771	18264	Oficina de Representación Partidista del IEPAC	2019	1	6	89	177
772	19632	Personal Eventual Oficina de Representación Partidista	2019	1	6	89	177
773	18220	Servicio Profesional Electoral Nacional	2019	1	6	89	178
774	18224	Marco Jurídico Institucional	2019	1	6	89	179
775	9536	Participación Ciudadana	2019	1	6	89	180
776	19031	Educación Cívica	2019	1	6	89	181
777	19023	Acceso a la información y sistema de administración de archivos y gestión documental	2019	1	6	89	182
778	20598	Instituto para la Inclusión de las Personas con Discapacidad del Estado de Yucatán.	2019	1	3	41	66
779	20599	Gastos administrativos del Instituto para la Inclusión de las Personas con Discapacidad del Estado de Yucatán.	2019	1	4	41	66
780	20600	Inclusión de las Personas con Discapacidad	2019	1	2	41	66
781	13877	Promover en las instituciones de educación superior la difusión, investigación y docencia sobre el derecho de acceso a la información pública y la protección de datos personales en posesión de entes públicos.	2019	1	6	90	161
782	13854	Proveer los servicios electrónicos a los sujetos obligados para facilitar el acceso a la información pública y protección de datos personales.	2019	1	6	90	161
783	331	Instituto de Defensa Pública 	2019	1	3	64	159
784	2217	Asesoría y asistencia jurídica	2019	1	1	64	159
785	13629	Capacitación del personal del Instituto de Defensa Pública del Estado de Yucatán	2019	1	2	64	159
786	2668	Servicios brindados por las Oficialías y oficina central de la Dirección del Registro Civil.	2019	1	1	64	160
787	5185	Modernización integral del Registro Civil	2019	1	2	64	160
788	10728	Formaliza tu Unión	2019	1	1	64	160
789	11188	Dirección del Registro Civil 	2019	1	3	64	160
790	14440	Ser Yucateco es un Orgullo	2019	1	6	64	160
791	14441	Mi Historia Registral	2019	1	6	64	160
792	20235	Modernización del Registro Civil en la localidad y municipio de Mérida.	2019	1	5	64	160
793	20254	Coordinación General de Transparencia  y Acceso a la Información Pública del Poder Ejecutivo	2019	1	3	64	161
794	20256	Asesoramiento y capacitación en materia de transparencia a los servidores públicos del Poder Ejecutivo y a la ciudadania en general	2019	1	2	64	161
795	90	Diario Oficial del Gobierno del Estado 	2019	1	3	64	162
796	8542	Elaboración y revisión de documentos Legales, Contratos, Licitaciones y Procedimientos	2019	1	1	64	162
797	8546	Dirección de Vinculación Institucional 	2019	1	3	64	162
798	8547	Dirección de Contratos, Licitaciones y Procedimientos 	2019	1	3	64	162
799	8548	Revisión o elaboración de proyectos normativos del estado de Yucatán	2019	1	2	64	162
800	8549	Dirección General  de Legislación y Normatividad	2019	1	3	64	162
801	8554	Apoyar técnica y juridicamente al gobernador del Estado y a las direcciones adscritas a la Consejería Jurídica	2019	1	2	64	162
802	8557	Despacho del Consejero	2019	1	3	64	162
803	9665	Dirección General de Servicios Legales y Vinculación Institucional 	2019	1	3	64	162
804	10662	Atención a Fedatarios	2019	1	2	64	162
805	10817	Consolidar la reforma en materia de seguridad y de justicia	2019	1	1	64	162
806	11209	Edición y publicación del Diario Oficial del Gobierno del estado de Yucatán	2019	1	1	64	162
807	11263	Vinculación institucional con las áreas jurídicas de la Administración Pública Estatal	2019	1	2	64	162
808	12490	Secretaria Ejecutiva	2019	1	3	64	162
809	19420	Dirección de Proyectos y Estudios Normativos	2019	1	3	64	162
810	8550	Administrar los recursos humanos, materiales y financieros de la Consejería Jurídica	2019	1	2	64	163
811	8551	Dirección de Administración y Finanzas 	2019	1	3	64	163
812	8559	Gastos de administración de la Consejería Jurídica	2019	1	4	64	163
813	13859	Promover en la sociedad el conocimiento, uso y aprovechamiento de la información pública y la protección de datos personales en posesión de entes públicos.	2019	1	6	90	161
814	13864	Garantizar los derechos de acceso a la información pública y proteccion de datos personales en el estado de Yucatán.	2019	1	6	90	161
815	13867	Vigilar el cumplimiento de la ley de Acceso a la Información Pública para el estado y los municipios de Yucatán.	2019	1	6	90	161
816	13869	Capacitar y Actualizar a los Servidores Públicos y Personal de los Sujetos Obligados en Materia de acceso a la Información Pública y de Protección de Datos Personales.	2019	1	6	90	161
817	13872	Implementar los Contenidos del Derecho de Acceso a la Información  Pública y Protección de Datos Personales en las Instituciones Educativas.	2019	1	6	90	161
818	13894	Ampliar el Conocimiento de la Población en General Sobre los Derechos de Acceso a la Información Pública y Protección de Datos Personales Previstos en la Ley de la Materia.	2019	1	6	90	161
819	1833	Presupuesto Institucional de Servicios Personales de la Dirección General Ejecutiva	2019	1	6	90	222
820	13856	Administrar y asignar los recursos a las unidades administrativas del INAIP.	2019	1	6	90	222
821	13900	Administrar los recursos para el funcionamiento del INAIP	2019	1	6	90	222
822	14982	Presupuesto Institucional de Servicios Personales del Pleno.	2019	1	6	90	222
823	9695	c por los servicios del Instituto Tecnológico Superior del Sur del Estado de Yucatán	2019	1	1	47	92
824	13623	Instituto Tecnológico Superior del Sur del Estado de Yucatán	2019	1	3	47	92
825	14046	Gastos de administración del Instituto Tecnológico Superior del Sur del Estado de Yucatán	2019	1	4	47	93
826	5691	Atención de alumnos egresados de bachillerato y regulares por los servicios del Instituto Tecnológico Superior de Valladolid	2019	1	1	46	94
827	13622	Instituto Tecnológico Superior de Valladolid	2019	1	3	46	94
828	18971	Apoyos y estímulos a estudiantes del Instituto Tecnológico Superior de Valladolid 	2019	1	1	46	94
829	18972	Apoyos de superación académica del personal del Instituto Tecnológico Superior de Valladolid	2019	1	2	46	94
830	14044	Gastos de Administración del Instituto Tecnológico Superior de Valladolid	2019	1	4	46	95
831	19503	Administración de los recursos materiales y financieros del Instituto Tecnológico Superior de Valladolid.	2019	1	2	46	95
832	14363	Ampliación de red eléctrica en media y baja tensión en la localidad de San Luis Dzununcán municipio de Mérida.	2019	1	5	91	274
833	16959	Ampliación de red eléctrica en media y baja tensión en la localidad de Kopte, municipio de Motul.	2019	1	5	91	274
834	16961	Ampliación de red eléctrica en media y baja tensión en la localidad y municipio de Yobaín.	2019	1	5	91	274
835	18992	Ampliación de red eléctrica en media y baja tensión en la localidad de San Agustín (Salvador Alvarado) municipio de Tekax.	2019	1	5	91	274
836	18993	Ampliación de red eléctrica en media y baja tensión en la localidad de Xohuayán municipio de Oxkutzcab.	2019	1	5	91	274
837	18995	Ampliación de red eléctrica en media y baja tensión en la localidad de Cheumán municipio de Mérida.	2019	1	5	91	274
838	18996	Ampliación de red eléctrica en media y baja tensión en la localidad de Yaxché de Peón municipio de Ucú.	2019	1	5	91	274
839	18997	Ampliación de red eléctrica en media y baja tensión en la localidad de Chalmuch municipio de Mérida.	2019	1	5	91	274
840	18998	Ampliación de red eléctrica en media y baja tensión en la localidad de Dzidzilché municipio de Mérida.	2019	1	5	91	274
841	18999	Ampliación de red eléctrica en media y baja tensión en la localidad de Kikteil municipio de Mérida.	2019	1	5	91	274
842	19010	Ampliación de red eléctrica en media y baja tensión en la localidad de Chan Chocholá (Santa Eduviges Chan Chocholá) municipio de Maxcanú.	2019	1	5	91	274
843	1653	Dirección General de la Junta de Electrificación de Yucatán.	2019	1	3	91	275
844	5103	Unidad técnica de construcción de la Junta de Electrificación de Yucatán.	2019	1	3	91	275
845	10734	Área jurídica de la Junta de Electrificación de Yucatán	2019	1	3	91	275
846	13897	Unidad administrativa de la Junta de Electrificación de Yucatán.	2019	1	3	91	275
847	17545	Administración de los recursos materiales de la Junta de Electrificación de Yucatán.	2019	1	2	91	275
848	17550	Gastos Administrativos de la Junta de Electrificación de Yucatán.	2019	1	4	91	275
849	14746	Segunda Instancia	2019	1	6	92	166
850	15999	Impartición de justicia en segunda instancia en materia civil, familiar, mercantil y mixta	2019	1	6	92	166
851	14631	Impartición de justicia en segunda instancia en materia penal	2019	1	6	92	167
852	16000	Impartición de justicia en segunda instancia en materia de adolescentes	2019	1	6	92	168
853	14592	Administración y control de los recursos del Tribunal Superior de Justicia del Poder Judicial del Estado	2019	1	6	92	170
854	14745	Presidencia	2019	1	6	92	170
855	14747	Unidad de Administración	2019	1	6	92	170
856	15992	Representación del Poder Judicial del Estado	2019	1	6	92	170
857	15993	Comunicar, seguir y dar fe a los acuerdos y resoluciones del Tribunal Superior de Justicia	2019	1	6	92	170
858	15994	Validación, integración y actualización de la normatividad interna y asesoría legal del Tribunal Superior de Justcia	2019	1	6	92	170
859	15995	Administración e integración de la información pública del Tribunal Superior de Justicia	2019	1	6	92	170
860	15996	Implementación de acciones de capacitación y profesionalización para los servidores públicos del Poder Judicial del Estado	2019	1	6	92	170
861	15997	Control e inspección del funcionamiento del Tribunal Superior de Justicia	2019	1	6	92	170
862	14452	Programas psicosociales de prevención del delito	2019	1	1	61	107
863	139	Vice Fiscalía de Prevención del Delito, de Justicia Restaurativa y Atención a Víctimas	2019	1	3	61	171
864	141	Aplicación de medios alternativos de justicia para la solución de controversias	2019	1	1	61	171
865	13899	Dirección de Justicia Alternativa.	2019	1	3	61	171
866	123	Visitaduría General	2019	1	3	61	172
867	142	Dirección de Capacitación y Servicio Profesional de Carrera	2019	1	3	61	172
868	146	Aplicación de evaluaciones técnico-jurídicas a las áreas sustantivas	2019	1	2	61	172
869	12526	Capacitación para la profesionalización de servidores públicos	2019	1	2	61	172
870	13857	Dirección de Prevención del Delito	2019	1	3	61	172
871	15361	Operación del Servicio Profesional de Carrera de la FGE	2019	1	2	61	172
872	19561	Ampliación de la Unidad Especializada en el Combate al Secuestro de la Fiscalía Genral del Estado, en Mérida Yucatán. 	2019	1	5	61	172
873	19720	Prevención e investigación de delitos en materia de corrupción	2019	1	1	61	172
874	19723	Vice Fiscalía Especializada en Combate a la Corrupción	2019	1	3	61	172
875	21	Despacho del C.Fiscal General del Estado	2019	1	3	61	173
876	132	Dirección de Control de Procesos	2019	1	3	61	173
877	143	Integración de las carpetas de investigación y seguimiento de los procesos ante las autoridades judiciales especializadas en Justicia para Adolescentes.	2019	1	1	61	173
878	147	Dirección General del Instituto de Ciencias Forenses 	2019	1	3	61	173
879	7099	Vice Fiscalía Especializada en Delitos Electorales y Contra el Medio Ambiente	2019	1	3	61	173
880	7324	Vice Fiscalía Especializada en Justicia para Adolescentes	2019	1	3	61	173
881	10489	Integración de las carpetas de investigación y conclusión de los procesos ante las autoridades judiciales	2019	1	1	61	173
882	13860	Vice Fiscalía de Investigación y Procesos	2019	1	3	61	173
883	13862	Dirección de Investigación y Atención Temprana	2019	1	3	61	173
884	15381	Dirección de Bienes Asegurados	2019	1	3	61	173
885	18706	Dirección General del Instituto de Ciencias Forenses 	2019	1	3	61	173
886	18707	Dirección del Servicio Médico Forense	2019	1	3	61	173
887	18708	Dirección de Química y Genética Forense	2019	1	3	61	173
888	41	Dirección de Administración	2019	1	3	61	174
889	117	Dirección de Informática y Estadística	2019	1	3	61	174
890	118	Dirección Jurídica	2019	1	3	61	174
893	12527	Elaboración del registro del sistema estadístico y soporte técnico de bienes informáticos	2019	1	2	61	174
894	13888	Administración de recursos humanos	2019	1	2	61	174
895	13889	Planeación, presupuestación y evaluación de proyectos	2019	1	2	61	174
896	13890	Administración de recursos materiales, servicios generales y control de bienes	2019	1	2	61	174
897	15317	Gastos de administración de la Fiscalía General del Estado	2019	1	4	61	174
898	12525	Difusión de acciones institucionales y programas preventivos de la Fiscalía General del Estado	2019	1	1	61	16
899	10492	Operación del Centro de Justicia para las Mujeres	2019	1	1	61	175
900	14504	Dirección del Centro de Justicia para las Mujeres	2019	1	3	61	175
901	15998	Administración de la imagen visual del Tribunal Superior de Justicia	2019	1	6	92	170
902	16002	Gastos Administrativos del Tribunal Superior de Justicia	2019	1	6	92	170
903	19606	Alerta de violencia de género contra las mujeres	2019	1	6	92	170
904	14121	Control del cobro de obligaciones fiscales a contribuyentes omisos del Estado de Yucatán	2019	1	2	70	226
905	15891	Fiscalización a contribuyentes del Estado de Yucatán	2019	1	2	70	226
906	15892	Dirección de Recaudación	2019	1	3	70	226
907	15897	Dirección de Auditoría Fiscal	2019	1	3	70	226
908	15902	Dirección de Servicios al Contribuyente	2019	1	3	70	226
909	15905	Dirección General de la Agencia de Administración Fiscal de Yucatán	2019	1	3	70	226
910	15906	Seguimiento de la Administración Tributaria en el Estado de Yucatán.	2019	1	2	70	226
911	16531	Recaudación de los ingresos del Estado de Yucatán	2019	1	2	70	226
912	16534	Operación de módulos para cobro de impuestos y derechos vehiculares 2019	2019	1	1	70	226
913	16537	Atención y servicios al contribuyente	2019	1	1	70	226
914	16548	Recuperación de créditos fiscales federales mediante la facultad económica coactiva de la Agencia de Administración Fiscal de Yucatán	2019	1	2	70	226
915	16593	Modernización de las cajas recaudadoras de paradores turísticos en sitios arqueológicos del Estado de Yucatán.	2019	1	2	70	226
916	17333	Mi Conta: Tu Amigo en el Gobierno	2019	1	1	70	226
917	17474	Diversificación de medios de pago para el cumplimiento de obligaciones fiscales en el Estado de Yucatán.	2019	1	1	70	226
918	15114	Gestión de las actividades catastrales, registrales y notariales del  Insejupy	2019	1	1	67	183
919	15115	Dirección del Catastro del Estado	2019	1	3	67	183
920	15116	Dirección del Archivo Notarial	2019	1	3	67	183
921	15119	Resguardo de los documentos jurídicos expedidos por Escribanos y Notarios Públicos del estado de Yucatán	2019	1	1	67	183
922	15121	 Padrón de la propiedad inmobiliaria del estado de Yucatán	2019	1	1	67	183
923	15123	Dirección Jurídica	2019	1	3	67	183
924	15126	Dirección del Registro Público de la Propiedad y del Comercio	2019	1	3	67	183
925	15127	Publicidad de los actos jurídicos del registro de los bienes inmuebles de tipo propiedad y del comercio del estado de Yucatán	2019	1	1	67	183
926	15131	Dirección General del Insejupy	2019	1	3	67	183
927	15311	Asesoría Jurídica a las direcciones sustantivas del  Insejupy	2019	1	2	67	183
928	18203	Modernización y Vinculación Registral y Catastral para el Ordenamiento Territorial del Estado de Yucatán  (2a etapa)	2019	1	2	67	183
929	20189	Fortalecimiento de la Actividad Catastral para la atención de los Proyectos Estratégicos del Estado	2019	1	1	67	183
930	16879	Asegurando Raíces	2019	1	1	67	184
931	15122	Dirección de Administración y Finanzas	2019	1	3	67	185
932	15125	Administración de los recursos  financieros, humanos y materiales del  Instituto de Seguridad Jurídica Patrimonial de Yucatán	2019	1	2	67	185
933	15129	Dirección de Planeación y Modernización	2019	1	3	67	185
934	15378	Gastos de Administración del Instituto de Seguridad Jurídica Patrimonial de Yucatán	2019	1	4	67	185
935	17477	Gestión de la calidad y soporte de la plataforma tecnológica del Insejupy	2019	1	2	67	185
936	17491	Planeación Estratégica del Instituto de Seguridad Jurídica Patrimonial de Yucatán	2019	1	2	67	185
937	18172	Contratación de recursos humanos y adquisición de recursos materiales previos al programa de Reemplacamiento 2020	2019	1	1	70	226
938	19017	Transferencia al Convenio de Colaboración: Chichén Itzá, Noches de Kukulkán.	2019	1	2	70	226
939	19901	Subdirección General	2019	1	3	70	226
940	19993	Modernización de las oficinas recaudadoras y creación de los módulos de servicios  de la Agencia de Administración Fiscal de Yucatán en Zona Metropolitana e Interior del Estado.	2019	1	2	70	226
941	14805	Implementación y seguimiento de las herramientas de Mejora Regulatoria	2019	1	2	70	227
942	8643	Otorgamiento de apoyo a Sindicato de Trabajadores al Servicio del Poder Ejecutivo e Instituciones Descentralizadas de Yucatán	2019	1	1	70	219
943	812	Subsecretaría de Presupuesto y Control del Gasto 	2019	1	3	70	228
944	2778	Cumplimiento de las atribuciones de la Secretaría de Administración y Finanzas	2019	1	2	70	228
945	11233	Seguimiento y control del presupuesto del Gobierno del Estado	2019	1	2	70	228
946	14383	Elaboración del Anteproyecto de Presupuesto de Egresos 	2019	1	2	70	228
947	15856	Despacho de la Secretaria de Administración y Finanzas	2019	1	3	70	228
948	15882	Implementación del Presupuesto basado en  Resultados	2019	1	2	70	228
949	19300	Seguimiento y control del ejercicio del gasto público	2019	1	2	70	228
950	20335	Implementación de la transparencia presupuestal del Gobierno del Estado de Yucatán 	2019	1	2	70	228
951	9682	Unidad de Gestión de la Inversión	2019	1	3	70	229
952	11088	Integración de la cartera de inversión del Gobierno del Estado	2019	1	2	70	229
953	20420	Junta Local de Conciliación  y Arbitraje	2019	1	3	63	186
954	20424	Impartición de justicia laboral entre trabajadores, empleadores y sindicatos a través de la Junta Local de Conciliación y Arbitraje	2019	1	1	63	186
955	20428	Procuraduría de la Defensa de los Trabajadores al Servicio del Estado y Municipios	2019	1	3	63	186
956	20429	Procuración de Justicia de los Trabajadores al Servicio del Estado y Municipios	2019	1	1	63	186
957	20431	Procuraduría Local de la Defensa del Trabajo	2019	1	3	63	186
958	20434	Procuración de Justicia Laboral Local	2019	1	1	63	186
959	7447	Programa Integral de Aplicación de Medidas de Tratamiento para Reinserción Social de Adolescentes.	2019	1	1	63	187
960	9654	Centro Especializado en la Aplicación de Medidas para Adolescentes.	2019	1	3	63	187
961	98	Dirección del Centro de Reinserción Social de Valladolid	2019	1	3	63	188
962	99	Dirección del Centro de Reinserción Social de Tekax	2019	1	3	63	188
963	100	Dirección del Centro de Reinserción Social de Mérida	2019	1	3	63	188
964	394	Dirección de Ejecución 	2019	1	3	63	188
965	2284	Programa Reinserción Social	2019	1	1	63	188
966	5887	Centro de Reinserción Social Femenil del Estado de Yucatán	2019	1	3	63	188
967	13957	Programa de Autoempleo de la Maquiladora	2019	1	1	63	188
968	8406	Coordinación y atención en materia de prevención y reinserción social en el Estado.	2019	1	2	63	107
969	8407	Subsecretaría de Prevención y Reinserción Social	2019	1	3	63	107
970	15951	Programa de Prevención Social del Delito	2019	1	1	63	107
971	16071	Centro Estatal de Prevención Social del Delito y Participación Ciudadana 	2019	1	3	63	107
972	110	Coordinación Estatal de Protección Civil	2019	1	3	63	189
973	2471	Atención y capacitación integral en protección civil en el Estado	2019	1	1	63	189
974	5318	Programa para la Atención y Prevención de Incendios en el Estado	2019	1	1	63	189
975	6399	Fondo para Atención de Contingencias por Desastres Naturales	2019	1	1	63	189
976	16324	Dirección de Servicios Postpenales	2019	1	3	63	190
977	16335	Apoyo a las personas liberadas, externadas y a sus familiares	2019	1	1	63	190
978	81	Despacho del Secretario General de Gobierno	2019	1	3	63	191
979	250	Subsecretaria de Gobierno y Desarrollo Político	2019	1	3	63	191
980	2092	Coordinación y seguimiento en asuntos de tipo político y social en el Estado	2019	1	2	63	191
981	9727	Atención y conducción de acciones de política interna del Gobierno del Estado	2019	1	1	63	191
982	19737	Centro para Prevenir y Eliminar la Discriminación en el Estado de Yucatán	2019	1	3	63	191
983	19738	Prevención y eliminación de la discriminación de las personas en el Estado	2019	1	1	63	191
984	104	Dirección de Administración	2019	1	3	63	192
985	1071	Gastos de administración de la Secretaría General de Gobierno	2019	1	4	63	192
986	2114	Administración y control de los recursos de la Secretaría General de Gobierno	2019	1	2	63	192
987	17202	Ampliación de capacidades institucionales para actividades operativas y de atención de la Secretaría General de Gobierno	2019	1	2	63	192
988	126	Instrumentación de la Agenda para el Desarrollo Municipal y Agenda 2030	2019	1	2	63	193
989	927	Vinculación estratégica y coordinación para el desarrollo regional	2019	1	2	63	193
990	950	Seguimiento de gacetas, procesos y convenios municipales	2019	1	2	63	193
991	12951	Asesoría para la vinculación y promoción de la participación social	2019	1	2	63	193
992	12952	Asesoría y seguimiento a la aplicación de recursos federales y estatales de los municipios	2019	1	2	63	193
993	13694	Fortalecimiento del marco normativo municipal 	2019	1	2	63	193
994	15448	Capacitación para servidores públicos municipales	2019	1	2	63	193
995	339	Instituto de Desarrollo Regional y Municipal	2019	1	3	63	194
996	879	Dirección de Infraestructura Social Básica	2019	1	3	63	194
997	14021	Administración de recursos del Instituto de Desarrollo Regional y Municipal.	2019	1	2	63	194
998	83	Consejo Estatal de Población	2019	1	3	63	195
999	2325	Conducción y gestión institucional de la política poblacional en el estado de Yucatán.	2019	1	1	63	195
1000	16015	Dirección Jurídica	2019	1	3	63	196
1001	16016	Atención en consultoría legal	2019	1	2	63	196
1002	122	Dirección del Archivo General del Estado	2019	1	3	63	197
1003	2359	 Conservar y preservar el patrimonio documental del Estado	2019	1	2	63	197
1004	307	Dirección de Asuntos Agrarios	2019	1	3	63	198
1005	2139	Asesoría jurídica y técnica topográfica en materia agraria a los sujetos de derecho agrario del Estado	2019	1	1	63	198
1006	16539	Programa Integral Protégete 	2019	1	1	63	199
1007	8398	Subsecretaría de Desarrollo Social y Asuntos Religiosos	2019	1	3	63	200
1008	12291	Atención a las Asociaciones Religiosas, Agrupaciones y Organizaciones de la Sociedad Civil del Estado	2019	1	1	63	200
1009	16005	Dirección de Asuntos Religiosos	2019	1	3	63	200
1010	311	Representación del Gobierno del Estado de Yucatán en la ciudad de México.	2019	1	3	63	201
1011	2158	Representar al Ejecutivo Estatal en la Ciudad de México	2019	1	1	63	201
1012	15532	Policía vecinal y participación ciudadana	2019	1	1	62	107
1013	17372	Investigación especializada en el lugar donde se cometió un delito en el estado de Yucatán	2019	1	2	62	173
1014	17373	Evaluación de Medidas Cautelares en el estado de Yucatán	2019	1	2	62	173
1015	18618	Investigación de presuntos hechos delictuosos para su posible canalización hacia la representación social	2019	1	2	62	173
1016	460	Dirección del Instituto de Capacitación de las Corporaciones de Seguridad Pública	2019	1	3	62	202
1017	2630	Profesionalización de los elementos policiales del Estado	2019	1	2	62	202
1018	18829	Profesionalización de elementos para la seguridad pública (FORTASEG) 2019	2019	1	2	62	202
1019	19841	Centro Estatal de Evaluación y Control de Confianza	2019	1	3	62	202
1020	19842	Mecanismos de Control y Evaluación a las Instituciones de Seguridad Pública del Estado	2019	1	2	62	202
1021	450	Subsecretaría de Servicios Viales	2019	1	3	62	203
1022	451	Dirección de Siniestros y Rescates	2019	1	3	62	203
1023	452	Dirección de Servicios Viales	2019	1	3	62	203
1024	456	Dirección de Operativos Viales	2019	1	3	62	203
1092	18412	Fortalecimiento de la Calidad Educativa	2019	1	2	42	3
1025	2430	Registro del Control Vehicular en el Estado de Yucatán	2019	1	1	62	203
1026	2510	Atención de Siniestros y Rescates en el Estado	2019	1	2	62	203
1027	2600	Atención de la Vialidad en el Estado	2019	1	1	62	203
1028	430	Oficina del Secretario de Seguridad Pública	2019	1	3	62	204
1029	438	Dirección del Sector Norte	2019	1	3	62	204
1030	446	Subsecretaría de Seguridad Ciudadana	2019	1	3	62	204
1031	447	Dirección Operativa	2019	1	3	62	204
1032	457	Dirección del Sector Oriente	2019	1	3	62	204
1033	2411	Coordinación de la Seguridad en el Estado	2019	1	2	62	204
1034	2444	Atención de Casos de Emergencia	2019	1	1	62	204
1035	2480	Dirección del Sector Sur	2019	1	3	62	204
1036	2497	Desarrollo de Grupos y Operativos Especiales del Estado	2019	1	2	62	204
1037	8800	Dirección del Sector Poniente	2019	1	3	62	204
1038	8807	Subsecretaría de Policía Estatal de Caminos Peninsular	2019	1	3	62	204
1039	8816	Dirección de Operaciones del CISP Oriente	2019	1	3	62	204
1040	8817	Dirección de Operaciones del CISP Poniente	2019	1	3	62	204
1041	8835	Vigilancia en los Sectores de la Ciudad de Mérida	2019	1	1	62	204
1042	8845	Coordinación de los Centros Integrales de Seguridad Pública Regionales	2019	1	2	62	204
1043	15970	Dirección de Seguridad y Giras	2019	1	3	62	204
1044	17115	Construcción del centro de profesionalización y adiestramiento del estado de Yucatán.	2019	1	5	62	204
1045	17369	Unidad Especializada en la Escena del Crimen	2019	1	3	62	204
1046	17371	Centro Estatal de Medidas Cautelares	2019	1	3	62	204
1047	18617	Subsecretaría de la Policía Estatal de Investigación	2019	1	3	62	204
1048	18828	Equipamiento para la seguridad pública (FORTASEG) 2019	2019	1	5	62	204
1049	19838	Secretariado Ejecutivo del Sistema Estatal de Seguridad Pública	2019	1	3	62	204
1050	19839	Administración y ejecución del Fondo Estatal y Federal para la Seguridad Pública del Estado de Yucatán	2019	1	2	62	204
1051	19840	Operación y seguimiento de las áreas operativas y administrativas del Secretariado Ejecutivo del Sistema Estatal de Seguridad Pública	2019	1	2	62	204
1052	19843	Sistema Nacional de Información.	2019	1	2	62	204
1053	19873	Remodelación del comedor del edificio central de la Secretaría de Seguridad Pública del estado de Yucatán	2019	1	5	62	204
1054	481	Dirección General de Administración	2019	1	3	62	205
1055	563	Gastos de Administración de la Secretaría de Seguridad Pública	2019	1	4	62	205
1056	2626	Administración de Recursos de la Secretaría de Seguridad Pública	2019	1	2	62	205
1057	12457	Dirección Jurídica	2019	1	3	62	205
1058	15385	Actualización del Marco Legal en Materia de Seguridad Pública	2019	1	2	62	205
1059	15969	Coordinación de Giras del Titular del Poder Ejecutivo de Yucatán	2019	1	2	62	201
1060	16688	Gestión de recursos federales para la inversión pública en el Estado de Yucatán	2019	1	2	70	229
1061	16703	Fortalecimiento de las capacidades técnicas para la formulación y evaluación social de proyectos en el Sistema Estatal de Inversión Pública de Yucatán	2019	1	2	70	229
1062	17161	Aportación para el Fideicomiso para el Desarrollo Regional del Sur-Sureste	2019	1	2	70	229
1063	18946	Evaluación socioeconómica de proyectos de inversión pública	2019	1	2	70	229
1064	15886	Dirección de Contabilidad Gubernamental	2019	1	3	70	230
1065	15888	Generación de Balances y Estados Financieros del Estado De Yucatán.	2019	1	2	70	230
1066	16614	Elaboración de la Cuenta Pública 2018	2019	1	1	70	230
1067	17536	Publicación del informe trimestral sobre la situación económica, las finanzas públicas y la deuda pública en Yucatán.	2019	1	1	70	230
1068	17538	Generación la información de transparencia y difusión de acuerdo con la Ley General de Contabilidad Gubernamental	2019	1	1	70	230
1069	17724	Funcionamiento del Consejo de Armonización Contable del Estado de Yucatán	2019	1	2	70	230
1070	19994	Control y seguimiento de la fiscalización a la Secretaría de Administración y Finanzas.	2019	1	2	70	230
1071	20411	Asesoría técnica a la Secretaría de Administración y Finanzas	2019	1	2	70	230
1072	20412	Unidad de Asesores	2019	1	3	70	230
1073	17624	Administración del Patrimonio del Gobierno del Estado	2019	1	2	70	30
1074	19281	Dirección de Control Patrimonial, Inmobiliario y Almacenes	2019	1	3	70	30
1075	11146	Seguimiento del programa del arrendamiento de vehículos al servicio del Poder Ejecutivo	2019	1	2	70	231
1076	15857	Subsecretaria de Adquisiciones	2019	1	3	70	231
1077	15877	Vigilancia de las Adquisiciones del Poder Ejecutivo	2019	1	2	70	231
1078	19649	Adquisición de combustibles para vehículos oficiales y pólizas de seguros del Poder Ejecutivo. 	2019	1	2	70	231
1079	15860	Subsecretaría de Innovación, Mejora Regulatoria y Eficiencia Institucional 	2019	1	3	70	232
1080	17606	Implementación de metodologías y sistemas de calidad para la innovación y eficiencia institucional	2019	1	2	70	232
1081	8633	Administración de Recursos Humanos del Poder Ejecutivo	2019	1	2	70	233
1082	16004	Administracion de Asignación de Plazas Vacantes	2019	1	3	70	233
1083	2815	Administración de los Recursos Materiales y Financieros la Secretaría de Administración y Finanzas	2019	1	2	70	234
1084	4346	Administración de los recursos humanos de la Secretaría de Administración y Finanzas	2019	1	2	70	234
1085	14903	Gastos administrativos de la Secretaría de Administración y Finanzas	2019	1	4	70	234
1086	15865	Dirección Jurídica	2019	1	3	70	234
1087	17571	Prestación de servicios jurídicos en la esfera de competencia de la Secretaría de Administración y Finanzas	2019	1	2	70	234
1088	17596	Pago de compromisos de las unidades administrativas de la Secretaría de Administración y Finanzas	2019	1	2	70	234
1089	18413	Atención del Centro Estatal de Capacitación Investigación y Difusión Humanística de Yucatán	2019	1	1	42	9
1090	18418	Despacho del Secretario	2019	1	3	42	103
1091	19021	Construcción y equipamiento de la Escuela Superior de Artes de Yucatán	2019	1	5	42	103
1093	19518	Servicios a la calidad de la Educación Superior	2019	1	2	42	3
1094	14430	Beca de Apoyo a la Práctica Intensiva y al Servicio Social (BAPISS)	2019	1	6	42	79
1095	16896	Formación de Recursos Humanos de Alto Nivel en Programas de Posgrado de Calidad en el Extranjero. Becas Conacyt - Gobierno del Estado de Yucatán	2019	1	1	42	211
1096	18415	Programa de divulgación y extensión de la Secretaría de Investigación, Innovación y Educación Superior	2019	1	1	42	211
1097	18421	Aportación de recursos económicos para el impulso a la formación de recursos humanos en el extranjero	2019	1	1	42	211
1098	18432	Formación Temprana de Científicos (FTC)	2019	1	1	42	211
1099	18481	Dirección General de Investigación e Innovación	2019	1	3	42	211
1100	18548	Incubación de Empresas de Tecnologías de la Información y Comunicación (Incuba TIC)	2019	1	1	42	211
1101	18720	Incorporación de maestros y doctores a la industria para fomentar la competitividad y la innovación.	2019	1	1	42	211
1102	18848	Aportación de recursos económicos para la vinculación con institutos de educación superior internacionales	2019	1	1	42	211
1103	18951	Jornadas de innovación Yucatán	2019	1	1	42	211
1104	18124	Fondo Mixto de Fomento a la Investigación Científica y Tecnológica Conacyt-Gobierno del Estado de Yucatán (Fomix-Yucatán)	2019	1	1	42	212
1105	18374	Transferencia de recursos económicos para la operación del Parque Científico y Tecnológico de Yucatán	2019	1	2	42	212
1106	18423	Red Digital de Yucatán	2019	1	6	42	212
1107	18537	Transferencia de recursos económicos para el fortalecimiento de la infraestructura para el desarrollo científico y equipamiento tecnológico en el estado	2019	1	2	42	212
1108	18820	Redes de gestión de conocimiento	2019	1	1	42	212
1109	18952	Impulso a la Innovación	2019	1	1	42	212
1110	19126	Impulso a la Investigación e Innovación del Estado de Yucatán	2019	1	2	42	212
1111	19974	Programa de investigación científica y desarrollo tecnológico del Sistema de Investigación, Innovación y Desarrollo Tecnológico del Estado de Yucatán (SIIDETEY).	2019	1	1	42	212
1112	18410	Fondo Yucatán a la Innovación	2019	1	1	42	46
1113	18414	Fondo para Emprendedores del Estado de Yucatán (FONDEY) 	2019	1	1	42	46
1114	18416	Gastos de Administración de la Secretaría de Investigación, Innovación y Educación Superior	2019	1	4	42	213
1115	18533	Administración de recursos humanos, materiales y financieros de la Secretaría de Investigación, Innovación y Educación Superior.	2019	1	2	42	213
1116	18867	Dirección de Administración	2019	1	3	42	213
1117	19292	Organización del archivo institucional de la Secretaría de Administración y Finanzas.	2019	1	2	70	234
1118	19293	Dirección de Transparencia y Coordinación de Archivos	2019	1	3	70	234
1119	19536	Gestión de los procesos  en materia de acceso a la información pública y protección de datos personales de la Secretaría de Administración y Finanzas	2019	1	2	70	234
1120	20407	Subsecretaria de Administración y Recursos Humanos	2019	1	3	70	234
1121	11675	Modernización de las tecnologías de la información del Poder Ejecutivo del Estado de Yucatán	2019	1	2	70	235
1122	15861	Subsecretaría de Tecnologías de la Información y Comunicaciones	2019	1	3	70	235
1123	16618	Actualización del marco normativo de la Subsecretaría de la Información y Comunicaciones	2019	1	2	70	235
1124	20373	Renovación de las pólizas de soporte, mantenimiento y licenciamiento de la infraestructura tecnologíca del Gobierno del Estado de Yucatán	2019	1	2	70	235
1125	20379	Mantenimiento de licencias de software de la Subsecretaría de Tecnologías de la Información y Comunicaciones del Gobierno del Estado de Yucatán	2019	1	2	70	235
1126	20380	Atención a usuarios de Plataformas Institucionales de Gobierno	2019	1	2	70	235
1127	20381	Gestión y Homologación de la información a través de la estrategia de datos	2019	1	2	70	235
1128	20382	Estrategias de transformación hacia el entorno digital	2019	1	2	70	235
1129	20413	Generación de Red estatal de conectividad multiservicios en el Estado de Yucatán para los 106 municipios	2019	1	2	70	235
1130	20414	Internet público y gratuito en los 106 municipios del Gobierno del Estado de Yucatán	2019	1	2	70	235
1131	360	Gestión y administración de los recursos humanos, materiales, financieros y tecnológicos de la Agencia de Administración Fiscal de Yucatán	2019	1	2	70	236
1132	6020	Gastos administrativos de la Agencia de Administración Fiscal de Yucatán.	2019	1	4	70	236
1133	15887	Dirección Jurídica	2019	1	3	70	236
1134	15889	Seguridad jurídica de la Agencia de Adminstración Fiscal de Yucatán.	2019	1	2	70	236
1135	15890	Dirección de Administración y Recursos	2019	1	3	70	236
1136	15893	Dirección de Tecnologías de la Información	2019	1	3	70	236
1137	15904	Administración de tecnologías de la información de la Agencia de Administración Fiscal de Yucatán	2019	1	2	70	236
1138	19900	Dirección de Inteligencia Fiscal	2019	1	3	70	236
1139	15872	Dirección de Egresos	2019	1	3	70	237
1140	15874	Programación de los recursos públicos del Estado para el pago de bienes y servicios	2019	1	2	70	237
1141	15876	Tesorería General del Estado	2019	1	3	70	237
1142	15880	Dirección de Ingresos	2019	1	3	70	237
1143	17800	Pago de los compromisos contraídos por el Gobierno del Estado 	2019	1	2	70	237
1144	19680	Dirección General	2019	1	3	6	215
1145	19682	Coordinación, seguimiento y consolidación de los proyectos estratégicos para el desarrollo del Estado	2019	1	2	6	215
1146	19683	Dirección de Proyectos Sociales	2019	1	3	6	215
1147	19684	Seguimiento y vinculación de proyectos sociales	2019	1	2	6	215
1148	19820	 Seguimiento y vinculación del proyecto Zona Económica Especial	2019	1	2	6	215
1149	19825	 Dirección de Proyectos 	2019	1	3	6	215
1150	19814	 Administración de los recursos humanos, materiales y financieros de la Agencia para el Desarrollo de Yucatán	2019	1	2	6	216
1151	19824	 Dirección de Administración	2019	1	3	6	216
1152	19826	Gastos Administrativos para la operación de la Agencia de Desarrollo de Yucatán	2019	1	2	6	216
1153	17836	Gestión de la deuda pública 	2019	1	2	70	237
1154	17851	Administración y control de la recaudación de los ingresos federales y estatales del Estado de Yucatán	2019	1	2	70	237
1155	17856	Control y seguimiento financiero de los recursos federales	2019	1	2	70	237
1156	20402	Transmisión de programas en la  estación radiodifusora  XHYUC 92.9 FM	2019	1	1	70	16
1157	20403	Programa radiofónico el Columnista Radio 	2019	1	1	70	16
1158	20404	Elaboración de estrategias integrales de comunicación para la difusión de programas institucionales y campañas publicitarias del Gobierno del Estado	2019	1	2	70	16
1159	20405	Difusión de obras y acciones de gobierno	2019	1	1	70	16
1160	20406	Dirección General de Comunicación Social	2019	1	3	70	16
1161	6395	Atención a los prejubilados de la zona henequenera, jubilados y pensionados del Gobierno del Estado	2019	1	2	70	238
1162	17752	Pago del crédito del Fondo de Apoyo para la Infraestructura y Seguridad (Profise) destinado a la elaboración de proyectos de inversión	2019	1	2	70	239
1163	17998	Pago del crédito de recursos provenientes del Banco Interamericano de Desarrollo destinado a proyectos de inversión	2019	1	2	70	239
1164	17999	Pago del crédito para el refinanciamiento y reestructuración de pasivos	2019	1	2	70	239
1165	18564	Pago del crédito para el financiamiento de la estrategia Escudo Yucatán	2019	1	2	70	239
1166	19556	Pago del financiamiento para la inversión pública productiva denominada Centro Internacional de Congresos	2019	1	2	70	239
1167	20300	Pago del crédito contratado con una institución financiera autorizada	2019	1	2	70	239
1168	1501	Distribución de ingresos estatales y federales a los municipios	2019	1	2	70	240
1169	1507	Distribución de las aportaciones federales para el fortalecimiento e infraestructura	2019	1	2	70	241
1170	17760	 Transferencia de recursos federales provenientes de  convenios	2019	1	6	70	242
1171	20608	Transferencia de recursos al municipio de Hunucmá Yucatán	2019	1	6	70	242
1172	20421	Cobertura de Eventos de la Agenda del Ejecutivo	2019	1	2	70	201
1173	20427	Direccion de la Coordinacion de Actividades Protocolarias	2019	1	3	70	201
1174	20518	Implementación de políticas públicas para la reducción de emisiones de gases de efecto invernadero	2019	1	2	37	1
1175	15525	Oficina del C. Subsecretario	2019	1	3	37	2
1176	20423	Oficina del director de planeación y cambio climático	2019	1	3	37	2
1177	20435	Implementación de sistema Bypass para el trasvase de arena en la escollera de Puerto de Abrigo de Telchac Puerto, Yucatán	2019	1	5	37	2
1178	20479	Seguimiento de los resultados de los proyectos para la conservación de la franja costera del estado de Yucatán	2019	1	2	37	2
1179	20513	Implementación de políticas para el fortalecimiento de la resiliencia local ante el cambio climático asociadas a la conservación de las selvas	2019	1	2	37	2
1180	20515	Implementación de la Red de Universidades Sustentables en el Estado de Yucatán	2019	1	1	37	3
1181	20419	Gestión y manejo integral de los residuos sólidos para su aprovechamiento sustentable	2019	1	2	37	4
1182	20422	Dictaminar los planes de manejo de residuos sólidos y de manejo especial	2019	1	1	37	4
1183	20480	Proyecto regional e integral para el manejo de residuos sólidos urbanos en la Zona Metropolitana de Mérida.	2019	1	5	37	4
1184	448	 Despacho del C. Director de Apoyo Jurídico	2019	1	3	37	5
1185	562	Despacho del Director de Gestión y Conservación Ambiental  de Cuencas	2019	1	3	37	5
1186	11477	Apoyo jurídico para la sostenibilidad	2019	1	2	37	5
1187	587	Despacho del C. Director de administración	2019	1	3	37	6
1188	1428	Gastos de administración de la Secretaría de Desarrollo Sustentable	2019	1	4	37	6
1189	13977	Administración de recursos financieros y materiales de la Secretaría de Desarrollo Sustentable	2019	1	2	37	6
1190	14462	Administración de recursos humanos de la Secretaría de Desarrollo Sustentable.	2019	1	2	37	6
1191	20523	Gestión de tecnologías de la información y soporte técnico informático a los usuarios de la Secretaría de Desarrollo Sustentable	2019	1	2	37	6
1192	17746	Difusión de la Estrategia Institucional del ISSTEY	2019	1	2	74	16
1193	4681	Organismo Auxiliar de Extensión Educativa y Servicios a la Primera Infancia	2019	1	3	74	223
1194	9302	Organismo Auxiliar de Prestaciones al Consumo	2019	1	3	74	223
1195	11117	Dirección General	2019	1	3	74	223
1196	11424	Subdirección de Pensiones y Gestión Financiera	2019	1	3	74	223
1197	17665	Otorgamiento de prestaciones económicas y de seguridad social a los derechohabientes del ISSTEY	2019	1	2	74	223
1198	17667	Otorgamiento de créditos hipotecarios a los derechohabientes afiliados al ISSTEY	2019	1	2	74	223
1199	17668	Pago de Seguros de cesantía por separación del cargo y por jubilación o pensión a los servidores públicos afiliados al ISSTEY	2019	1	2	74	223
1200	17669	Otorgamiento de Seguros de fallecimiento, jubilaciones y pensiones a los derechohabientes del ISSTEY.	2019	1	2	74	223
1201	17689	Proporcionar servicio de guardería a hijos de derechohabientes en los Centros de Desarrollo Infantil	2019	1	2	74	223
1202	17694	Apoyo Terapéutico en el  Centro de Educación Especial  del ISSTEY	2019	1	2	74	223
1203	17773	Venta de productos de consumo en los Centros Comerciales del ISSTEY	2019	1	2	74	223
1204	17670	Impartición de talleres recreativos, culturales y deportivos en el Departamento de Desarrollo, Cultura y Actividad Física de Jubilados y Pensionados del ISSTEY	2019	1	2	74	224
1205	17696	Preparar a los estudiantes en la carrera de Auxiliar de Enfermería del ISSTEY	2019	1	2	74	224
1206	17704	Preparar a los estudiantes en la carrera de Asistente Educativo	2019	1	2	74	224
1207	17727	Servicio de esparcimiento en el Centro Vacacional Costa Club ISSTEY	2019	1	2	74	224
1208	17738	Realización de eventos y actividades culturales y deportivas del ISSTEY	2019	1	2	74	224
1209	17741	Organismo Auxiliar de Prestaciones Recreativas y de Hospedaje	2019	1	3	74	224
1210	4947	Fortalecimiento de los Recursos Financieros del ISSTEY	2019	1	2	74	225
1211	11041	Subdirección de Administración	2019	1	3	74	225
1212	11046	Gastos Administrativos del Instituto de Seguridad Social de los Trabajadores del Estado de Yucatán	2019	1	4	74	225
1213	12783	Ejecución de Actividades Administrativas para la Operación del Instituto de Seguridad Social de los Trabajadores del Estado de Yucatán	2019	1	2	74	225
1214	16601	Subdirección Jurídica	2019	1	3	74	225
1215	17660	Asesoría jurídica a los procesos administrativos del Instituto de Seguridad Social de los Trabajadores del Estado de Yucatán.	2019	1	2	74	225
1216	17666	Administración de los recursos financieros del ISSTEY	2019	1	2	74	225
1217	18319	Ejecución del Sistema de Control Interno en el ISSTEY	2019	1	2	74	225
1218	443	Despacho del C. Secretario	2019	1	3	37	7
1219	11594	Elaboración de políticas públicas en el sector ambiental en el estado de Yucatán	2019	1	2	37	7
1220	17600	Programa para la Conservación del Patrimonio Natural y Cultural del Estado de Yucatán (Programa de Educación Ambiental del Parque Yumtsil	2019	1	1	37	7
1221	17781	Fortalecimiento  de las capacidades de planeación y gestión al Organismo Público Descentralizado Intermunicipal de la Reserva Estatal del Puuc	2019	1	2	37	7
1222	18986	Programa para la conservación de la agrobiodiversidad en el estado de Yucatán	2019	1	1	37	7
1223	20425	Fideicomiso Ambiental del Estado de Yucatán	2019	1	2	37	7
1224	20426	Producción de plantas nativas con fines de reforestación social. 	2019	1	1	37	7
1225	20430	Administración para el aprovechamiento sustentable de Áreas Naturales Protegidas (ANPs) Estatales y sitios prioritarios para la conservación en el estado de Yucatán	2019	1	1	37	7
1226	20432	Diseño de Sistemas de Información Geográfica para la elaboración de proyectos estratégicos de gestión ambiental sustentable	2019	1	2	37	7
1227	20433	Aprovechamiento sustentable de los Cenotes y Grutas del estado de Yucatán	2019	1	1	37	7
1228	20441	Fortalecimiento de la Gerencia Operativa para la gestión integrada de los recursos hídricos en el ámbito del Consejo de Cuenca de la Península de Yucatán	2019	1	2	37	7
1229	20462	Festival de aves migratorias en la localidad de Sisal, Hunucmá.	2019	1	1	37	7
1230	20463	Manejo sustentable para la conservación de especies prioritarias y vida silvestre de la costa Yucateca	2019	1	1	37	7
1231	20511	Fomento a la participación social sustentable en el estado de Yucatán	2019	1	1	37	7
1232	20512	Coordinación de instrumentos de planeación y evaluación de iniciativas de inversión	2019	1	2	37	7
1233	20514	Capacitación a los docentes de nivel básico de los municipios pertenecientes a la Reserva Estatal Biocultural del Puuc y  de la Reserva Geohidrológica Estatal del Anillo de Cenotes.  (Comunidad Educativa Verde)	2019	1	1	37	7
1234	20524	Desarrollar la Estrategia Hídrica estatal 2050 Agua limpia para Yucatán	2019	1	2	37	7
1235	20437	Regulación de fuentes fijas industriales y móviles (Automotores) en el Estado	2019	1	1	37	5
1236	20466	Recepción de trámites en materia ambiental en el estado de Yucatán. (Ventanilla única)	2019	1	1	37	5
1237	20246	Despacho de la Secretaria	2019	1	3	40	63
1238	20266	Subsecretaría para el acceso a los derechos de las mujeres	2019	1	3	40	63
1239	20267	Dirección de Políticas Interculturales para la Prevención y Atención de la Violencia	2019	1	3	40	63
1240	20268	Dirección de Autonomía y Empoderamiento de las Mujeres	2019	1	3	40	63
1241	20269	Dirección de Seguimiento a la Alerta de Género de la Secretaría de las Mujeres	2019	1	3	40	63
1242	20270	Dirección de difusión para la igualdad y una vida libre de violencia de la Secretaría de las Mujeres	2019	1	3	40	63
1243	20287	Monitoreo de la alerta de violencia de género contra las mujeres en el Estado de Yucatán.  	2019	1	2	40	63
1244	20293	Difusión de actividades para la igualdad y una vida libre de violencia	2019	1	1	40	63
1245	20295	Coordinación, y evaluación de las Políticas Públicas para el  acceso de las Mujeres  a una Vida Libre de Violencia y la Transversalización de la Perspectiva de Género. 	2019	1	2	40	63
1246	20327	Atención Especializada a la Violencia de Género contra las Mujeres en el Estado	2019	1	1	40	63
1247	20337	Programa de Participación Comunitaria para la Prevención de la Violencia de Género contra las Mujeres	2019	1	1	40	63
1248	20356	Promoción de la autonomía y el empoderamiento de las mujeres en Yucatán	2019	1	1	40	63
1249	20365	Contención emocional, profesionalización y capacitación de las y los profesionistas de la Secretaría de las Mujeres 	2019	1	2	40	63
1250	20370	Apoyo económico en la renta de vivienda segura a mujeres en situación de violencia, vulnerabilidad y/o marginación extrema	2019	1	1	40	63
1251	20271	Subsecretaría de Planeación	2019	1	3	40	207
1252	20272	Dirección de Planeación con Enfoque de Género	2019	1	3	40	207
1253	20273	Dirección de Políticas para la Igualdad entre Mujeres y Hombres de la Secretaría de las Mujeres 	2019	1	3	40	207
1254	20274	Dirección de Asuntos Jurídicos de la Secretaría de las Mujeres 	2019	1	3	40	207
1255	20290	Implementación de las acciones de carácter jurídico para el fortalecimiento institucional de la Secretaría de las Mujeres	2019	1	2	40	207
1256	20296	Implementación de Estrategias Transversales para la Igualdad entre Mujeres y Hombres 	2019	1	1	40	207
1257	20297	Fortalecimiento e Institucionalización de la Perspectiva de Género en los Municipios del Estado de Yucatán	2019	1	2	40	207
1258	20298	Implementación de Estrategias Transversales para la Igualdad entre Mujeres y Hombres en las dependencias y entidades de la Administración Pública Estatal	2019	1	2	40	207
1259	20360	Fortalecimiento al Centro Felipa Poot	2019	1	1	40	207
1260	20363	Planeación de políticas de género de la Secretaría de las Mujeres	2019	1	2	40	207
1261	20277	Dirección de Administración y Finanzas de la Secretaría de las Mujeres 	2019	1	3	40	214
1262	20302	 Mejoramiento de la gestión administrativa de la Secretaría de las mujeres	2019	1	2	40	214
1263	20303	Gastos administrativos de la Secretaría de las Mujeres 	2019	1	4	40	214
1264	515	Oficina del C. Secretario	2019	1	3	79	276
1265	5934	Planear y programar con eficiencia y transparencia las obras públicas a ejecutar en el Estado.	2019	1	6	79	276
1266	13014	Representación de asuntos jurídicos relativos a obra pública y administrativos de la Secretaría de Obras Públicas.	2019	1	2	79	276
1267	13015	Atención a las necesidades de  infraestructura pública en el Estado.	2019	1	2	79	276
1268	13018	Dirección Jurídica	2019	1	3	79	276
1269	13019	Dirección de Enlace y Vinculación	2019	1	3	79	276
1270	15469	Dirección Técnica	2019	1	3	79	276
1271	15470	Implementación  del  sistema  de calidad en las áreas administrativas y operativas de la Secretaría de Obras Públicas así como las Entidades que integran el sector de Infraestructura Pública.	2019	1	2	79	276
1272	13013	Gastos administrativos Secretaria de Obras Públicas.	2019	1	4	79	277
1273	13017	Dirección Administrativa	2019	1	3	79	277
1274	17969	Administración de los recursos financieros y materiales asignados a la Secretaría de Obras Públicas	2019	1	2	79	277
1275	15843	Transmitir Programas en el Sistema Tele Yucatán, Canal Trece	2019	1	1	93	16
1276	15844	Sistema Tele Yucatán 	2019	1	3	93	16
1277	19650	Gastos Administrativos del Sistema Tele Yucatán, Canal Trece	2019	1	4	93	16
1278	17822	Impartición de Justicia Electoral	2019	1	6	94	206
1279	17931	Capacitación, Investigación y Desarrollo Institucional	2019	1	6	94	206
1280	17934	Dirección de estudios, investigación, capacitación y desarrollo institucional	2019	1	6	94	206
1281	17935	Dirección de Proyectistas	2019	1	6	94	206
1282	17936	Magistrado 1	2019	1	6	94	206
1283	17937	Magistrado Presidente	2019	1	6	94	206
1284	17938	Magistrado 2	2019	1	6	94	206
1285	17939	Secretario de acuerdos	2019	1	6	94	206
1286	18273	Transparencia	2019	1	6	94	206
1287	18274	Unidad de Transparencia	2019	1	6	94	206
1288	19019	Órgano de Control Interno	2019	1	6	94	206
1289	19020	Oficina de Equidad de Género	2019	1	6	94	206
1290	19036	Colaboración con el Observatorio de Participación Política de las Mujeres en Yucatán	2019	1	6	94	207
1291	17932	Administración de los recursos  Humanos, Materiales y Financieros del Tribunal Electoral del Estado de Yucatán	2019	1	6	94	208
1292	17933	Dirección de Administración	2019	1	6	94	208
1293	14298	Oficina del Magistrado Presidente del Tribunal de Justicia Administrativa del Estado de Yucatán. 	2019	1	6	95	209
1294	19595	 Impartición de justicia en materia contenciosa administrativa y en materia de responsabilidades administrativas en el Estado de Yucatán. 	2019	1	6	95	209
1295	19596	Realizar las funciones correspondientes al Secretario de Acuerdos en la Impartición de justicia en materia contenciosa administrativa y en materia de responsabilidades administrativas en el Estado de Yucatán. 	2019	1	6	95	209
1296	19599	Oficina del Secretario de Acuerdos del Tribunal de Justicia Administrativa del Estado de Yucatán. 	2019	1	6	95	209
1297	19608	Resolver sobre las responsabilidades de los servidores públicos en términos de la legislación aplicable en materia administrativa.	2019	1	6	95	209
1298	19610	Oficina del Titular del Órgano de Control Interno del Tribunal de Justicia Administrativa del Estado de Yucatán. 	2019	1	6	95	209
1299	20395	Oficina del Director de Proyectistas del Tribunal de Justicia Administrativa del Estado de Yucatán	2019	1	6	95	209
1300	20396	Imparticion de justicia contenciosa administrativa y de responsabilidades administrativas en el Estado de Yucatán	2019	1	6	95	209
1301	19597	Administración de recursos humanos, materiales y financieros del Tribunal de Justicia Administrativa del Estado de Yucatán	2019	1	6	95	210
1302	19604	Oficina del Director de Administración del Tribunal de Justicia Administrativa del Estado de Yucatán. 	2019	1	6	95	210
1303	19637	Gastos Administrativos del Tribunal de Justicia Administrativa del Estado de Yucatán	2019	1	6	95	210
1304	14296	Impartición de justicia laboral	2019	1	6	96	186
1305	14297	Tribunal de los Trabajadores al Servicio del Estado y de los Municipios	2019	1	6	96	186
1306	19094	Gastos administrativos del Tribunal de los Trabajadores al Servicio del Estado y Municipios	2019	1	6	96	170
1307	13990	Facultad de Enfermería	2019	1	3	97	131
1308	13991	Facultad de Ciencias Antropológicas	2019	1	3	97	131
1309	13992	Atender con servicios de  educación superior a alumnos del estado Yucatán	2019	1	1	97	131
1310	13993	Facultad de Contaduría y Administración	2019	1	3	97	131
1311	13995	Facultad de Matemáticas	2019	1	3	97	131
1312	13996	Facultad de Economía	2019	1	3	97	131
1313	13997	Promover la investigación en los procesos educativos de la UADY	2019	1	1	97	131
1314	13998	Facultad de Medicina Veterinaria y Zootecnia	2019	1	3	97	131
1315	13999	Facultad de Medicina	2019	1	3	97	131
1316	14000	Facultad de Ingeniería	2019	1	3	97	131
1317	14001	Facultad de Derecho	2019	1	3	97	131
1318	14002	Extensión universitaria con los diversos sectores productivos y sociales	2019	1	1	97	131
1319	14004	Facultad de Química	2019	1	3	97	131
1320	14005	Facultad de Odontología	2019	1	3	97	131
1321	14006	Facultad de Psicología	2019	1	3	97	131
1322	14007	Facultad de Arquitectura	2019	1	3	97	131
1323	14008	Facultad de Educación	2019	1	3	97	131
1324	14009	Facultad de Ingeniería Química	2019	1	3	97	131
1325	900	Oficina del Secretario de la Contraloría General del Estado	2019	1	3	71	243
1326	903	Subsecretaría del  Sector Estatal y Paraestatal	2019	1	3	71	243
1327	2081	Coordinación del control sobre los recursos Estatales ejercidos por las dependencias y entidades del Gobierno del Estado.	2019	1	2	71	243
1328	2358	Autorización de actos de fiscalización en las dependencias y entidades.	2019	1	2	71	243
1329	14416	Unidad de Control y Auditoría de Gestión	2019	1	3	71	243
1330	18055	Realización de procesos de fiscalización con recursos provenientes del 5 al millar estatal.	2019	1	6	71	243
1331	18774	Verificación y seguimiento a los actos de fiscalización realizados por las direcciones de auditoría al sector centralizado y paraestatal y seguimiento al programa de trabajo de control interno.	2019	1	2	71	243
1332	913	Dirección de Auditoría al Sector Paraestatal	2019	1	3	71	244
1333	2191	Realización de procesos de fiscalización en las entidades del sector paraestatal	2019	1	2	71	244
1334	477	Dirección de Auditoría al Sector Centralizado	2019	1	3	71	245
1506	20228	Rehabilitación del malecón en la localidad y municipio de Dzilám de Bravo	2019	1	5	82	267
1335	2427	Realización de actividades para la fiscalización en las Dependencias del Sector Centralizado.	2019	1	2	71	245
1336	9439	Emisión de opiniones jurídicas en materia de auditorías, inspecciones, revisiones  e integración de expedientes de investigación de la Secretaría de la Contraloría General	2019	1	2	71	246
1337	5117	 Control, registro e investigaciones en materia de  situación patrimonial y de interés de los servidores públicos de la Administración Pública Estatal	2019	1	2	71	247
1338	20319	Asesoramiento en contraloría social 	2019	1	2	71	248
1339	17870	Vigilancia y control del ejercicio de los recursos Federales asignados al Poder Ejecutivo	2019	1	2	71	249
1340	20312	Supervisión y auditoría a la aplicación de recursos federales con recursos provenientes del 5 al millar federal en las dependencias y entidades de la Administración Pública Estatal.	2019	1	6	71	249
1341	20315	Oficina del Subsecretario de Programas Federales	2019	1	3	71	249
1342	20316	Dirección de Programas Federales	2019	1	3	71	249
1343	20318	Realización de auditorías a la aplicación de recursos federales en las dependencias y entidades del Gobierno del Estado.	2019	1	2	71	249
1344	20321	Seguimiento a la fiscalización de recursos federales	2019	1	2	71	249
1345	906	Dirección de Inspección de Obra Pública	2019	1	3	71	250
1346	9893	Realización de auditorías, supervisíon y control de obra pública	2019	1	2	71	250
1347	909	Dirección de Responsabilidades y Normatividad	2019	1	3	71	251
1348	2306	Verificación de acciones normativas e inconformidades en materia de adquisiciones, arrendamientos, servicios y obra pública	2019	1	2	71	251
1349	17786	Determinación de responsabilidades administrativas de los servidores públicos	2019	1	2	71	252
1350	9609	Instituto Estatal para el Combate a la Corrupción	2019	1	3	71	253
1351	9611	Seguimiento a las denuncias ciudadanas recibidas en el Instituto Estatal para el Combate a la Corrupción	2019	1	2	71	253
1352	13558	Implementación de acciones de prevención y combate a la corrupción	2019	1	2	71	253
1353	704	Gastos de administrativos de la Secretaría de la Contraloría General 	2019	1	4	71	254
1354	938	Dirección de Administración	2019	1	3	71	254
1355	2315	Realización de acciones de soporte técnico y protección a bienes informáticos	2019	1	6	71	254
1356	2376	Administración de recursos para la operatividad de la Secretaría de la Contraloría	2019	1	2	71	254
1357	5042	Dirección de Asuntos Jurídicos y Situación Patrimonial del Sector Estatal y Paraestatal	2019	1	3	71	246
1358	17840	Sistema de Evaluación del Desempeño	2019	1	1	73	255
1359	15855	Dirección de Información y Evaluación	2019	1	3	73	256
1360	15927	Fortalecimiento del Sistema de Información Estadística y Geográfica de Yucatán	2019	1	1	73	256
1361	16160	Observatorio de Compromisos	2019	1	1	73	256
1362	18424	Realización de diálogos con el Gobernador	2019	1	2	73	256
1363	15854	Secretaría Técnica de Planeación y Evaluación	2019	1	3	73	215
1364	15868	Dirección de Planeación y Seguimiento	2019	1	3	73	215
1365	18425	Vinculación Intergubernamental	2019	1	2	73	215
1366	18427	Operación del Consejo de Planeación y Evaluación del Estado de Yucatán	2019	1	2	73	215
1367	19553	Gestión de Proyectos Estratégicos	2019	1	2	73	215
1368	20236	Elaboración del Plan Estatal de Desarrollo 	2019	1	2	73	215
1369	15936	Gastos Administrativos de la Secretaría Técnica de Planeación y Evaluación	2019	1	4	73	257
1370	15950	Operación Administrativa	2019	1	2	73	257
1371	18478	Dirección de Administración y Finanzas	2019	1	3	73	257
1372	15932	Operación del Sistema de Seguimiento y Gabinete Sectorizado	2019	1	2	73	258
1373	15934	Integración del Informe de Gobierno	2019	1	1	73	258
1374	19807	Secretaría Ejecutiva del Sistema Estatal Anticorrupción	2019	1	6	66	253
1375	19809	Dirección Jurídica	2019	1	6	66	253
1376	19810	Dirección de Análisis, Prevención y Políticas Públicas	2019	1	6	66	253
1377	19812	Dirección de Vinculación Interinstitucional	2019	1	6	66	253
1378	19815	Dirigir y representar legalmente a la SESEAY así como proporcionar asistencia técnica al Comité de Participación Ciudadana.	2019	1	6	66	253
1379	19846	Coordinación con los diferentes entes Estatales, Municipales, Organismos Civiles y Académicos	2019	1	6	66	253
1380	20346	Proporcionar y mantener  en óptimas condiciones y a la vanguardia la tecnología, plataformas digitales y comunicación institucional de la SESEAY	2019	1	6	66	253
1381	20587	Secretaría Ejecutiva del Sistema Estatal Anticorrupción 2019	2019	1	2	66	253
1382	19808	Dirección de Administración y Finanzas	2019	1	6	66	259
1383	19811	Administración de los Recursos Humanos, Materiales, Financieros y Tecnológicos de la Secretaría Ejecutiva del Sistema Estatal Anticorrupción	2019	1	6	66	259
1384	19816	Gastos Administrativos de la Secretaría Ejecutiva del Sistema Estatal Anticorrupción	2019	1	6	66	259
1385	20552	Identificación de Zonas vulnerables y de riesgo en las regiones Poniente, Noroeste, Litoral Centro, Noreste y Sur 	2019	1	2	38	2
1386	20547	Programa de Modernización del Sistema de Transporte Público para la ciudad de Mérida y su Zona Metropolitana (Credenciales Inteligentes)	2019	1	1	38	260
1387	10284	Dirección General	2019	1	3	38	261
1388	11446	Aplicación de los recursos para el financiamiento de las obras, estudios y acciones de la Zona Metropolitana de Mérida	2019	1	5	38	261
1389	13071	Fortalecimiento al desarrollo de la Zona Metropolitana de Mérida 	2019	1	2	38	261
1390	15244	Dirección de Desarrollo Metropolitano 	2019	1	3	38	261
1391	16651	Gestión y vinculación para el desarrollo integral de la Zona Metropolitana de Mérida	2019	1	2	38	261
1392	18279	Funcionamiento  del Parque Lineal Metropolitano Paseo Verde 	2019	1	1	38	261
1393	18294	Funcionamiento del Parque Lineal Metropolitano de Francisco de Montejo 	2019	1	1	38	261
1394	20196	Promoción del ordenamiento territorial y desarrollo urbano en los municipios del interior del Estado de Yucatán	2019	1	2	38	261
1395	20224	Estudios técnicos como soporte de la planeación, gestión e instrumentación de acciones en materia urbanística, asociada al Proyecto Regional del Tren Maya en Yucatán	2019	1	2	38	261
1396	20232	Promoción de proyectos urbano-regionales asociados a la riqueza patrimonial y paisajística de Yucatán	2019	1	2	38	261
1397	20240	Estudios de movilidad urbana sostenible en el área de influencia de la Zona Económica Especial de Progreso	2019	1	5	38	261
1398	20294	Desarrollo teritorial, urbano y metropolitano en el área de Influencia de la Zona Económica Especial de Progreso	2019	1	5	38	261
1399	20309	Estudios de actualización del Plan Maestro La Plancha en el municipio de Mérida 	2019	1	5	38	261
1400	20557	Direccion de Movilidad	2019	1	3	38	261
1401	20559	Oficina de la Dirección Juridica 	2019	1	3	38	261
1402	11535	Gastos de administración de lnstituto de Movilidad y Desarrollo Urbano Territorial 	2019	1	4	38	262
1403	13070	Administración, soporte y seguimiento del Fondo Metropolitano de Mérida  	2019	1	2	38	262
1404	15243	Dirección de Administración, Soporte y Seguimiento.	2019	1	3	38	262
1405	20548	Oficina del Director de Desarrollo Territorial, Urbano y Movilidad	2019	1	3	38	263
1406	20550	Elaboracion de cartas urbanas en las regiones noroeste, oriente y litoral centro del estado	2019	1	2	38	263
1407	20553	Protección del patrimonio cultural arquitectónico estatal	2019	1	2	38	263
1408	20554	Promoción y gestión urbana en el Estado 	2019	1	2	38	263
1409	20551	Proyectos y trámites vehiculares del transporte público.	2019	1	1	38	264
1410	20555	Servicio y ordenamiento del transporte público en el Estado	2019	1	2	38	264
1411	20556	Inspección y vigilancia del transporte público en el estado	2019	1	1	38	264
1412	20561	Dirección de Transporte 	2019	1	3	38	264
1413	18030	Ampliación de espacios educativos en el nivel de preescolar  en el estado de Yucatán	2019	1	6	81	108
1414	18031	Ampliación de espacios educativos en el nivel de primaria en el estado de Yucatán.	2019	1	6	81	108
1415	18032	Ampliación de espacios educativos en el nivel de secundaria en el estado de Yucatán.	2019	1	6	81	108
1416	20609	Mantenimiento de la infraestructura física educativa en centros educativos de nivel preescolar en el Estado de Yucatán.	2019	1	6	81	108
1417	20610	Mantenimiento de la infraestructura física educativa en centros educativos de nivel primaria en el Estado de Yucatán.	2019	1	6	81	108
1418	20611	Mantenimiento de la infraestructura física educativa en centros educativos de nivel secundaria en el Estado de Yucatán.	2019	1	6	81	108
1419	20594	Mantenimiento emergente a planteles de educación preescolar en el estado de Yucatán.	2019	1	6	81	104
1420	20595	Mantenimiento emergente a planteles de educación primaria en el estado de Yucatán	2019	1	6	81	104
1421	20596	Mantenimiento emergente a planteles de educación secundaria en el estado de Yucatán	2019	1	6	81	104
1422	319	Dirección General del Instituto para el Desarrollo y  Certificación  de la Infraestructura Física Educativa de Yucatán	2019	1	3	81	265
1423	4584	Dirección de administración del Instituto para el Desarrollo y Certificación de la Infraestructura Física Educativa de Yucatán	2019	1	3	81	265
1424	4606	Dirección de construcción del Instituto para el Desarrollo y Certificación de la Infraestructura Física Educativa de Yucatán	2019	1	3	81	265
1425	4623	Dirección de proyectos del Instituto para el Desarrollo y Certificación de la Infraestructura Física Educativa de Yucatán	2019	1	3	81	265
1426	4638	Dirección de control y normatividad del Instituto para el Desarrollo y Certificación de la Infraestructura Física Educativa de Yucatán	2019	1	3	81	265
1427	4642	 Administración  y distribución de los recursos humanos,  financieros, materiales  y tecnológicos del Idefey	2019	1	2	81	265
1428	67	Dirección de Construcción	2019	1	3	80	41
1429	5047	Control de ejecución de obras.	2019	1	2	80	41
1430	12631	Pago de alumbrado público en vialidades de los municipios de Mérida, Umán y Progreso.	2019	1	6	80	41
1431	18060	Construcción de la Avenida de acceso a Caucel Norte y Construcción del paso superior vehicular de Chenkú km 37+250 del periférico de Mérida	2019	1	5	80	41
1432	18888	Conservación de la carretera E.C. (Valladolid- Río Lagartos) - Las Coloradas, tramo: 0+000-21+200, subtramo: 0+000-6+000 en el municipio de Río Lagartos.	2019	1	5	80	41
1433	18953	Conservación del libramiento de Tizimín, tramo: 0+000-12+000, en el municipio de Tizimín	2019	1	5	80	41
1434	19477	Estudio de preinversión para la construcción de la carretera Teabo - Chicán en los municipios de Teabo y Tixméhuac	2019	1	5	80	41
1435	19478	Estudio para la construcción de la carretera Tiholop-Chikindzonot en los municipios de Yaxcabá y Chikindzonot	2019	1	5	80	41
1436	19895	Reconstrucción de la carretera E. C. (Muna-Peto)- Alfonso Caso -Becanchén, tramo: 15+347-26+000, en el municipio de Tekax.	2019	1	5	80	41
1437	19904	Estudio de preinversión para la construcción de la carretera Bolón-Poxilá, tramo: 0+000-4+100, en el municipio de Umán 	2019	1	5	80	41
1438	19905	Estudio de preinversión para la modernización de la carretera San Isidro Ochil-Tekit, tramo 0+000-12+063, en los municipios de Homún y Tekit.	2019	1	5	80	41
1439	19909	Reconstrucción de calles en la localidad y municipio de Kanasín	2019	1	5	80	41
1440	19916	Conservación de la carretera Nohuayún - Tetiz, tramo: 0+000-3+790, en el municipio de Tetiz	2019	1	5	80	41
1441	19918	Conservación de la carretera Tixpéhual -Sahé, tramo: 0+000-6+650, en el municipio de Tixpéhual	2019	1	5	80	41
1442	19970	Conservación de la carretera E. C. (Valladolid -Cancún)- Limite del Estado, tramo: 0+000-24+315, en el municipio de Chemax	2019	1	5	80	41
1443	19990	Estudio de preinversión para la construcción de la carretera Dzitox-Villahermosa, tramo: 0+000-13+222, en el municipio de Chichimilá	2019	1	5	80	41
1444	20064	Conservación de la Carretera Samaría-San Pedro Bacab, tramo: 0+000-10+700, en el municipio de Tizimín.	2019	1	5	80	41
1445	20069	Conservación de la Carretera Telchac Pueblo-Telchac Puerto, tramo: 0+000-15+496, en los municipios de Telchac Pueblo y Telchac Puerto.	2019	1	5	80	41
1446	20078	Conservación de la Carretera Telchac Pueblo-Dzidzantún, tramo: 0+000-24+410, en los municipios de Telchac Pueblo, Sinanché, Yobaín y Dzidzantún.	2019	1	5	80	41
1447	20080	Conservación de la Carretera Telchac Puerto-Dzilam de Bravo, tramo: 0+000-39+315, en los municipios de Telchac Puerto, Sinanché, Yobaín y Dzidzantún	2019	1	5	80	41
1565	14011	Unidad Tizimín	2019	1	3	97	131
1448	20093	Construcción de la carretera San Isidro Yaxché-E.C. (Xul-Huntochac), tramo: 0+000-7+324, en el municipio de Tekax.	2019	1	5	80	41
1449	20110	Estudio de preinversión para la Construcción del PSV Periférico-Complejo de Seguridad	2019	1	5	80	41
1450	20111	Estudio de preinversión para la Construcción del PSV del Fracc. Juan Pablo km 43+605 del Periférico de la Ciudad de Mérida.	2019	1	5	80	41
1451	20112	Estudio de preinversión para la Construcción del PSV de Tixcacal km 46+740 del Periférico de la Ciudad de Mérida.	2019	1	5	80	41
1452	20124	Construcción de obras de protección a ductos de PEMEX en el PSV de Anikabil	2019	1	5	80	41
1453	20125	Construcción de obras de protección a ductos de PEMEX en el acceso a la Zona Económica Especial de Progreso	2019	1	5	80	41
1454	20133	Reconstrucción del camino Kinil - Chicán, tramo: 0+000-2+185, en las localidades de Kinil y Chicán de los municipios de Tekax y Tixmehuac	2019	1	6	80	41
1455	20476	Dirección Técnica	2019	1	3	80	41
1456	20612	Reconstrucción del camino E.C (Mérida -Tetiz) -Texán de Palomeque-Dzibikak, tramo: 0+000-10+509, en las localidades de Texán de Palomeque y Dzibikak, de los municipios de Hunucmá y Umán	2019	1	6	80	41
1457	20613	Reconstrucción de calles en la localidad y municipio de Tixkokob	2019	1	6	80	41
1458	20615	Reconstrucción de calles en la localidad y municipio de Maxcanú	2019	1	6	80	41
1459	61	Dirección General	2019	1	3	80	266
1460	63	Dirección  Administrativa.	2019	1	3	80	266
1461	1664	Adquisición de materiales y suministros necesarios para la ejecución de obras por administración directa.	2019	1	2	80	266
1462	1665	Pago de percepciones al personal operativo del Instituto de Infraestructura Carretera de Yucatán	2019	1	2	80	266
1463	5035	Administración de recursos materiales y financieros del Instituto de Infraestructura Carretera de Yucatán.	2019	1	2	80	266
1464	5037	Planeación y ejecución de obras de infraestructura carretera.	2019	1	2	80	266
1465	13021	Dirección Jurídica	2019	1	3	80	266
1466	13022	Atención de asuntos legales del Instituto de Infaestructura Carretera de Yucatán	2019	1	2	80	266
1467	13933	Gastos Administrativos del Instituto de Infraestructura Carretera de Yucatán	2019	1	4	80	266
1468	20331	Pasivos contingentes INCAY	2019	1	2	80	266
1469	533	Prestación de asuntos jurídicos del Instituto para la Construcción y Conservación de Obra Pública en Yucatán	2019	1	2	82	267
1470	5652	Oficina del C. Director General de Obra Pública	2019	1	3	82	267
1471	5654	Oficina del C. Director de Construcción	2019	1	3	82	267
1472	5655	Oficina del C. Director Técnico	2019	1	3	82	267
1473	5656	Oficina del C. Director de Servicios Integrados para la Conservación del Estado de Yucatán	2019	1	3	82	267
1474	5657	 Planeación y programación de la ejecución de infraestructura pública  en el estado de Yucatán.	2019	1	2	82	267
1475	7474	Oficina del C. Director de  Planeación y Estudios de Preinversión	2019	1	3	82	267
1476	7476	Elaboración de estudios de preinversión para obra pública	2019	1	2	82	267
1477	9325	Oficina del C. Director jurídico	2019	1	3	82	267
1478	13478	Integración del compendio de la obra programada a ejecutar por el  Instituto para la Construcción  y Conservación de  Obra Pública en Yucatán	2019	1	2	82	267
1479	13526	Supervisión, evaluación y aprobación de  los proyectos ejecutivos,  arquitectónicos y técnicos   de obra pública	2019	1	2	82	267
1480	13702	Programas de mantenimiento de áreas verdes, reforestación y mantenimiento de áreas en  escuelas y espacios públicos en el estado de Yucatán.	2019	1	2	82	267
1481	17734	Mantenimiento y limpieza de áreas verdes en el estado de Yucatán	2019	1	5	82	267
1482	17735	Rehabilitación de cunetas recolectoras de agua pluvial en los derechos de vía en 30 tramos carreteros en el Estado 	2019	1	5	82	267
1483	17736	Mantenimiento  del sistema de alumbrado público en tramos carreteros y periférico de la ciudad de Mérida	2019	1	5	82	267
1484	19922	Rehabilitación de la iglesia San Pedro y San Pablo en la localidad y municipio de Samahil.	2019	1	5	82	267
1485	19959	Construcción de mercado en la localidad de Chabihau municipio de Yobaín.	2019	1	5	82	267
1486	19960	Construcción de gradas y baños en campo deportivo en localidad de Chabihau municipio de Yobaín	2019	1	5	82	267
1487	19961	Construcción de mercado en la localidad y municipio de Muxupip	2019	1	5	82	267
1488	20170	Rehabilitación del mercado en la localidad y municipio de Telchac Pueblo	2019	1	5	82	267
1489	20172	Rehabilitación del mercado de la localidad y municipio de Progreso	2019	1	5	82	267
1490	20181	Construccion de campo deportivo en la localidad de xkanchakan municipio de Tecoh	2019	1	5	82	267
1491	20184	Construccion campo deportivo en la localidad de Telchaquillo, municipio de Tecoh	2019	1	5	82	267
1492	20185	Construccion de parque en la localidad y municipio de Rio Lagartos	2019	1	5	82	267
1493	20186	Rehabilitación del centro de salud  en la localidad y municipio de Hoctún	2019	1	5	82	267
1494	20187	Mantenimiento de imagen urbana en la coloradas y municipio de Rio lagartos	2019	1	5	82	267
1495	20195	Construcción del centro de salud en la localidad y municipio de Baca	2019	1	5	82	267
1496	20198	Construcción de campo deportivo en la localidad de Sotuta de Peón, municipio de Tecoh	2019	1	5	82	267
1497	20201	Rehabilitación del mercado en la localidad y municipio de Dzidzantún	2019	1	5	82	267
1498	20205	Rehabilitación del mercado en la localidad y municipio de Oxkutzcab	2019	1	5	82	267
1499	20206	Construccion de cubierta de cancha de usos multiples en la localidad y municipio de Mama.	2019	1	5	82	267
1500	20217	Rehabilitación del centro de salud en la localidad y municipio de Panabá	2019	1	5	82	267
1501	20219	Construccion de la Casa de la Cultura en la localidad y municipio de Chapab	2019	1	5	82	267
1502	20220	Rehabilitación de parque infantil en la localidad y municipio de Chapab	2019	1	5	82	267
1503	20222	Construcción de centro de salud en la localidad y municipio de Chapab	2019	1	5	82	267
1504	20225	Mantenimiento del edificio que alberga el Palacio de Gobierno del estado de Yucatán en la localidad y municipio de Mérida	2019	1	5	82	267
1505	20226	Construcción de cancha de usos múltiples en la localidad y municipio de Maxcanu.	2019	1	5	82	267
1507	20233	Construcción del centro del adulto mayor en la localidad y municipio de Tekax.	2019	1	5	82	267
1508	20234	Construcción del centro de autismo en la localidad y municipio de Tekax.	2019	1	5	82	267
1509	20241	Construccion de la Casa de la Cultura en la localidad y municipio de Dzan	2019	1	5	82	267
1510	20357	Estudios para la remodelación de la imagen urbana en la localidad y municipio de Progreso	2019	1	5	82	267
1511	5653	Oficina del C. Director de Administración	2019	1	3	82	268
1512	5658	Administración de los recursos financieros  y materiales asignados al Instituto para la Construcción y Conservación de Obra Pública en Yucatán	2019	1	2	82	268
1513	15382	Gastos administrativos del Instituto para  la Construcción y Conservación de Obra Pública en Yucatán	2019	1	4	82	268
1514	12607	Dirección Técnica	2019	1	3	83	99
1515	12611	Actualización de avalúos de los terrenos pertenecientes a la reserva territorial del Instituto de Vivienda del Estado de Yucatán.	2019	1	2	83	99
1516	12665	Dirección de Regularización de Suelo	2019	1	3	83	99
1517	12713	Dirección de Planeación Territorial	2019	1	3	83	99
1518	12769	Dirección de Vivienda	2019	1	3	83	99
1519	12834	Dirección General	2019	1	3	83	99
1520	12840	Adquisición de Reservas Territoriales en el Estado de Yucatán	2019	1	2	83	99
1521	13605	Elaboración de escrituras privadas de bienes inmuebles.	2019	1	1	83	99
1522	14711	Elaboración del Programa Estatal de Vivienda	2019	1	2	83	99
1523	14729	Casa Digna	2019	1	1	83	99
1524	15666	Administración de la Reserva Territorial del Instituto de Vivienda del Estado de Yucatán	2019	1	2	83	99
1525	16149	Construcción de recámaras adicionales en viviendas del estado de Yucatán.	2019	1	1	83	99
1526	18840	Programa de Entrega de Paquetes de Materiales de Construcción, para mejoramiento de vivienda.	2019	1	1	83	99
1527	18843	Programa de mejoramiento de fachadas	2019	1	1	83	99
1528	19975	Actualización del Plan Maestro Ucú	2019	1	2	83	99
1529	19976	Elaboración del diagnóstico de vivienda en la Ciénega de la Zona Costera de Yucatán	2019	1	2	83	99
1530	20007	Recuperación de la cartera vencida del IVEY	2019	1	2	83	99
1531	20275	Construcción de baños ecológicos en viviendas del estado de Yucatán	2019	1	1	83	100
1532	12591	Dirección Administrativa	2019	1	3	83	269
1533	12599	Administración de los recursos humanos, materiales y financieros del Instituto de Vivienda del Estado de Yucatán.	2019	1	2	83	269
1534	12606	Dirección Jurídica	2019	1	3	83	269
1535	13589	Actualización de los manuales de organización y cursos de implementación norma ISO 9001:2015	2019	1	2	83	269
1536	13593	Difusión de actividades y programas del IVEY en el Estado de Yucatán	2019	1	2	83	269
1537	13923	Gastos de administración del Instituto de Vivienda del Estado de Yucatán.	2019	1	4	83	269
1538	19989	Remodelación y equipamiento de Edificios del Instituto de Vivienda del Estado de Yucatán	2019	1	2	83	269
1539	6303	Implementación del sistema de información geográfica de infraestructura hidráulica y sanitaria del municipio de Mérida	2019	1	2	39	270
1540	7536	Operación de sistemas de agua potable en la Ciudad de Mérida.	2019	1	2	39	270
1541	10273	Distribución de desinfectantes e hipocloradores a municipios del estado de Yucatán (AGUA LIMPIA)	2019	1	2	39	270
1542	13513	Gestión de usuarios para la ampliación de redes de agua potable en colonias de la ciudad de Mérida y su zona conurbada.	2019	1	2	39	270
1543	13552	Autorización, supervisión y recepción de infraestructura hidráulica y sanitaria construida por promotores de vivienda en nuevos desarrollos de vivienda en la ciudad de Mérida y su zona conurbada.	2019	1	2	39	270
1544	15754	Construcción de redes hidrométricas para cierre de circuitos, cajas de operación, válvulas y tomas domiciliarias del sector hidráulico 14, de la localidad de Mérida, Yucatán.	2019	1	5	39	270
1545	15776	Construcción de redes hidrométricas para cierre de circuitos, cajas de operación, válvulas y tomas domiciliarias del sector hidráulico 7 de la ciudad de Mérida, Yucatán.	2019	1	5	39	270
1546	19785	Ampliación de redes de distribución agua potable de diversas colonias de la localidad de Mérida.	2019	1	5	39	270
1547	19796	Ampliación y mejoramiento del sistema de agua potable de diversos municipios del Estado de Yucatán.	2019	1	5	39	270
1548	20101	Mejoramiento de eficiencia de las fuentes de captación, línea de conducción y estaciones de rebombeo del sistema de agua potable de la localidad y municipio de Progreso, Yucatán.	2019	1	5	39	270
1549	12790	Programa de Construcción de Sanitarios con Biodigestor	2019	1	5	39	100
1550	16125	Suministro e instalación del sistema de generación de energía fotovoltaica de la planta de tratamiento de aguas residuales Alemán, en Mérida.	2019	1	5	39	271
1551	18588	Conclusión de la Planta de Tratamiento de Aguas Residuales de 80 LPS de Caucel II de la localidad de Mérida.	2019	1	5	39	271
1552	20083	Mantenimiento general del sistema fotovoltaico en 3 plantas de tratamiento de aguas residuales de la localidad de Mérida Yucatán.	2019	1	5	39	271
1553	17602	Atención a Usuarios de la Junta de Agua Potable y Alcantarillado de Yucatán en el Municipio de Mérida.	2019	1	1	39	272
1554	17615	Regularización de Adeudos de Usuarios de la Junta de Agua Potable y Alcantarillado de Yucatán.	2019	1	1	39	272
1555	12383	Aplicación del Sistema de Gestión de Calidad basado en la norma ISO 9001:2008 en los Procesos de Atención a Usuarios y Pago del Servicio	2019	1	2	39	273
1556	12435	Soporte tecnológico e informático a la administración y operación de la Junta de Agua Potable y Alcantarillado de Yucatán.	2019	1	2	39	273
1557	13596	Subdirección de Administración y Finanzas	2019	1	3	39	273
1558	13597	Subdirección Técnica	2019	1	3	39	273
1559	13598	Subdirección Comercial	2019	1	3	39	273
1560	13683	Dirección General	2019	1	3	39	273
1561	15735	Gasto Administrativo de la Junta de Agua Potable y Alcantarillado de Yucatán	2019	1	4	39	273
1562	15751	Administración de los recursos materiales y suministros de la Junta de Agua Potable y Alcantarillado de Yucatán.	2019	1	2	39	273
1563	15760	Gestión de Bienes Muebles e Inmuebles	2019	1	2	39	273
1564	14010	Centro de Investigaciones Regionales Dr. Hideyo Noguchi	2019	1	3	97	131
1566	20526	Tercera etapa de la Biblioteca del campus de Ciencias Sociales, Económico Administrativas y Humanidades	2019	1	5	97	131
1567	20527	Construcción de edificio de laboratorios y cubículos para profesores de la Facultad de Ingeniería Química	2019	1	5	97	131
1568	20528	Construcción de la Segunda etapa de remodelación y ampliación de la Facultad de Enfermería.	2019	1	5	97	131
1569	13967	Oficina de la Rectoría	2019	1	3	97	132
1570	13968	Oficina de la Secretaría General	2019	1	3	97	132
1571	13971	Oficina de la Dirección General de Desarrollo Académico	2019	1	3	97	132
1572	13973	Oficina de la Dirección General de Finanzas y Administración	2019	1	3	97	132
1573	13978	Oficina del Abogado General	2019	1	3	97	132
1574	13994	Promover la gestión responsable como apoyo a las funciones sustantivas de la UADY	2019	1	2	97	132
1575	16195	Estímulo al desempeño profesional de los docentes de la UADY	2019	1	2	97	132
1576	18214	Oficina de la Dirección General de Planeación y Efectividad Institucional	2019	1	3	97	132
1577	19586	Gastos de administración de la Universidad Autónoma de Yucatán	2019	1	4	97	132
1578	14083	Ampliación de la Matrícula en Programas Educativos de Calidad de la UADY	2019	1	1	97	133
1579	13980	Atención de la educación media superior en el estado de Yucatán	2019	1	1	97	134
1580	14014	Escuela Preparatoria Uno	2019	1	3	97	134
1581	14015	Escuela Preparatoria Dos	2019	1	3	97	134
1582	14017	Unidad Comunitaria de Interacción Social	2019	1	3	97	134
1583	15326	Atención a alumnos de la Universidad Tecnológica del Mayab Peto	2019	1	1	51	145
1584	15515	Universidad Tecnológica del Mayab 	2019	1	3	51	145
1585	15757	Continuidad de la Universidad Tecnológica del Mayab (octava etapa)	2019	1	5	51	145
1586	15335	Gastos de administración de la Universidad Tecnológica del Mayab 	2019	1	4	51	146
1587	17643	Vinculación con el sector productivo y público de la Universidad Tecnológica del Mayab	2019	1	1	51	147
1588	5681	Atención de alumnos en la Universidad Tecnológica Regional del Sur (Tekax)	2019	1	1	54	151
1589	13594	Universidad Tecnológica Regional del Sur	2019	1	3	54	151
1590	14049	Gastos de administración de la Universidad Tecnológica Regional del Sur	2019	1	4	54	152
1591	17562	Vinculación, promoción y gestión con el sector productivo de la Universidad Tecnológica Regional del Sur	2019	1	1	54	153
1592	20420	Junta Local de Conciliación  y Arbitraje	2019	1	3	69	186
1593	20424	Impartición de justicia laboral entre trabajadores, empleadores y sindicatos a través de la Junta Local de Conciliación y Arbitraje	2019	1	1	69	186
1594	20428	Procuraduría de la Defensa de los Trabajadores al Servicio del Estado y Municipios	2019	1	3	69	186
1595	20429	Procuración de Justicia de los Trabajadores al Servicio del Estado y Municipios	2019	1	1	69	186
1596	20431	Procuraduría Local de la Defensa del Trabajo	2019	1	3	69	186
1597	20434	Procuración de Justicia Laboral Local	2019	1	1	69	186
1598	7447	Programa Integral de Aplicación de Medidas de Tratamiento para Reinserción Social de Adolescentes.	2019	1	1	69	187
1599	9654	Centro Especializado en la Aplicación de Medidas para Adolescentes.	2019	1	3	69	187
1600	98	Dirección del Centro de Reinserción Social de Valladolid	2019	1	3	69	188
1601	99	Dirección del Centro de Reinserción Social de Tekax	2019	1	3	69	188
1602	100	Dirección del Centro de Reinserción Social de Mérida	2019	1	3	69	188
1603	394	Dirección de Ejecución 	2019	1	3	69	188
1604	2284	Programa Reinserción Social	2019	1	1	69	188
1605	5887	Centro de Reinserción Social Femenil del Estado de Yucatán	2019	1	3	69	188
1606	13957	Programa de Autoempleo de la Maquiladora	2019	1	1	69	188
1607	8406	Coordinación y atención en materia de prevención y reinserción social en el Estado.	2019	1	2	69	107
1608	8407	Subsecretaría de Prevención y Reinserción Social	2019	1	3	69	107
1609	15951	Programa de Prevención Social del Delito	2019	1	1	69	107
1610	16071	Centro Estatal de Prevención Social del Delito y Participación Ciudadana 	2019	1	3	69	107
1611	110	Coordinación Estatal de Protección Civil	2019	1	3	69	189
1612	2471	Atención y capacitación integral en protección civil en el Estado	2019	1	1	69	189
1613	5318	Programa para la Atención y Prevención de Incendios en el Estado	2019	1	1	69	189
1614	6399	Fondo para Atención de Contingencias por Desastres Naturales	2019	1	1	69	189
1615	16324	Dirección de Servicios Postpenales	2019	1	3	69	190
1616	16335	Apoyo a las personas liberadas, externadas y a sus familiares	2019	1	1	69	190
1617	81	Despacho del Secretario General de Gobierno	2019	1	3	69	191
1618	250	Subsecretaria de Gobierno y Desarrollo Político	2019	1	3	69	191
1619	2092	Coordinación y seguimiento en asuntos de tipo político y social en el Estado	2019	1	2	69	191
1620	9727	Atención y conducción de acciones de política interna del Gobierno del Estado	2019	1	1	69	191
1621	19737	Centro para Prevenir y Eliminar la Discriminación en el Estado de Yucatán	2019	1	3	69	191
1622	19738	Prevención y eliminación de la discriminación de las personas en el Estado	2019	1	1	69	191
1623	104	Dirección de Administración	2019	1	3	69	192
1624	1071	Gastos de administración de la Secretaría General de Gobierno	2019	1	4	69	192
1625	2114	Administración y control de los recursos de la Secretaría General de Gobierno	2019	1	2	69	192
1626	17202	Ampliación de capacidades institucionales para actividades operativas y de atención de la Secretaría General de Gobierno	2019	1	2	69	192
1627	126	Instrumentación de la Agenda para el Desarrollo Municipal y Agenda 2030	2019	1	2	69	193
1628	927	Vinculación estratégica y coordinación para el desarrollo regional	2019	1	2	69	193
1629	950	Seguimiento de gacetas, procesos y convenios municipales	2019	1	2	69	193
1630	12951	Asesoría para la vinculación y promoción de la participación social	2019	1	2	69	193
1631	12952	Asesoría y seguimiento a la aplicación de recursos federales y estatales de los municipios	2019	1	2	69	193
1632	13694	Fortalecimiento del marco normativo municipal 	2019	1	2	69	193
1633	15448	Capacitación para servidores públicos municipales	2019	1	2	69	193
1634	339	Instituto de Desarrollo Regional y Municipal	2019	1	3	69	194
1635	879	Dirección de Infraestructura Social Básica	2019	1	3	69	194
1636	14021	Administración de recursos del Instituto de Desarrollo Regional y Municipal.	2019	1	2	69	194
1637	83	Consejo Estatal de Población	2019	1	3	69	195
1638	2325	Conducción y gestión institucional de la política poblacional en el estado de Yucatán.	2019	1	1	69	195
1639	16015	Dirección Jurídica	2019	1	3	69	196
1640	16016	Atención en consultoría legal	2019	1	2	69	196
1641	122	Dirección del Archivo General del Estado	2019	1	3	69	197
1642	2359	 Conservar y preservar el patrimonio documental del Estado	2019	1	2	69	197
1643	307	Dirección de Asuntos Agrarios	2019	1	3	69	198
1644	2139	Asesoría jurídica y técnica topográfica en materia agraria a los sujetos de derecho agrario del Estado	2019	1	1	69	198
1645	16539	Programa Integral Protégete 	2019	1	1	69	199
1646	8398	Subsecretaría de Desarrollo Social y Asuntos Religiosos	2019	1	3	69	200
1647	12291	Atención a las Asociaciones Religiosas, Agrupaciones y Organizaciones de la Sociedad Civil del Estado	2019	1	1	69	200
1648	16005	Dirección de Asuntos Religiosos	2019	1	3	69	200
1649	311	Representación del Gobierno del Estado de Yucatán en la ciudad de México.	2019	1	3	69	201
1650	2158	Representar al Ejecutivo Estatal en la Ciudad de México	2019	1	1	69	201
1651	20420	Junta Local de Conciliación  y Arbitraje	2019	1	3	68	186
1652	20424	Impartición de justicia laboral entre trabajadores, empleadores y sindicatos a través de la Junta Local de Conciliación y Arbitraje	2019	1	1	68	186
1653	20428	Procuraduría de la Defensa de los Trabajadores al Servicio del Estado y Municipios	2019	1	3	68	186
1654	20429	Procuración de Justicia de los Trabajadores al Servicio del Estado y Municipios	2019	1	1	68	186
1655	20431	Procuraduría Local de la Defensa del Trabajo	2019	1	3	68	186
1656	20434	Procuración de Justicia Laboral Local	2019	1	1	68	186
1657	7447	Programa Integral de Aplicación de Medidas de Tratamiento para Reinserción Social de Adolescentes.	2019	1	1	68	187
1658	9654	Centro Especializado en la Aplicación de Medidas para Adolescentes.	2019	1	3	68	187
1659	98	Dirección del Centro de Reinserción Social de Valladolid	2019	1	3	68	188
1660	99	Dirección del Centro de Reinserción Social de Tekax	2019	1	3	68	188
1661	100	Dirección del Centro de Reinserción Social de Mérida	2019	1	3	68	188
1662	394	Dirección de Ejecución 	2019	1	3	68	188
1663	2284	Programa Reinserción Social	2019	1	1	68	188
1664	5887	Centro de Reinserción Social Femenil del Estado de Yucatán	2019	1	3	68	188
1665	13957	Programa de Autoempleo de la Maquiladora	2019	1	1	68	188
1666	8406	Coordinación y atención en materia de prevención y reinserción social en el Estado.	2019	1	2	68	107
1667	8407	Subsecretaría de Prevención y Reinserción Social	2019	1	3	68	107
1668	15951	Programa de Prevención Social del Delito	2019	1	1	68	107
1669	16071	Centro Estatal de Prevención Social del Delito y Participación Ciudadana 	2019	1	3	68	107
1670	110	Coordinación Estatal de Protección Civil	2019	1	3	68	189
1671	2471	Atención y capacitación integral en protección civil en el Estado	2019	1	1	68	189
1672	5318	Programa para la Atención y Prevención de Incendios en el Estado	2019	1	1	68	189
1673	6399	Fondo para Atención de Contingencias por Desastres Naturales	2019	1	1	68	189
1674	16324	Dirección de Servicios Postpenales	2019	1	3	68	190
1675	16335	Apoyo a las personas liberadas, externadas y a sus familiares	2019	1	1	68	190
1676	81	Despacho del Secretario General de Gobierno	2019	1	3	68	191
1677	250	Subsecretaria de Gobierno y Desarrollo Político	2019	1	3	68	191
1678	2092	Coordinación y seguimiento en asuntos de tipo político y social en el Estado	2019	1	2	68	191
1679	9727	Atención y conducción de acciones de política interna del Gobierno del Estado	2019	1	1	68	191
1680	19737	Centro para Prevenir y Eliminar la Discriminación en el Estado de Yucatán	2019	1	3	68	191
1681	19738	Prevención y eliminación de la discriminación de las personas en el Estado	2019	1	1	68	191
1682	104	Dirección de Administración	2019	1	3	68	192
1683	1071	Gastos de administración de la Secretaría General de Gobierno	2019	1	4	68	192
1684	2114	Administración y control de los recursos de la Secretaría General de Gobierno	2019	1	2	68	192
1685	17202	Ampliación de capacidades institucionales para actividades operativas y de atención de la Secretaría General de Gobierno	2019	1	2	68	192
1686	126	Instrumentación de la Agenda para el Desarrollo Municipal y Agenda 2030	2019	1	2	68	193
1687	927	Vinculación estratégica y coordinación para el desarrollo regional	2019	1	2	68	193
1688	950	Seguimiento de gacetas, procesos y convenios municipales	2019	1	2	68	193
1689	12951	Asesoría para la vinculación y promoción de la participación social	2019	1	2	68	193
1690	12952	Asesoría y seguimiento a la aplicación de recursos federales y estatales de los municipios	2019	1	2	68	193
1691	13694	Fortalecimiento del marco normativo municipal 	2019	1	2	68	193
1692	15448	Capacitación para servidores públicos municipales	2019	1	2	68	193
1693	339	Instituto de Desarrollo Regional y Municipal	2019	1	3	68	194
1694	879	Dirección de Infraestructura Social Básica	2019	1	3	68	194
1695	14021	Administración de recursos del Instituto de Desarrollo Regional y Municipal.	2019	1	2	68	194
1696	83	Consejo Estatal de Población	2019	1	3	68	195
1697	2325	Conducción y gestión institucional de la política poblacional en el estado de Yucatán.	2019	1	1	68	195
1698	16015	Dirección Jurídica	2019	1	3	68	196
1699	16016	Atención en consultoría legal	2019	1	2	68	196
1700	122	Dirección del Archivo General del Estado	2019	1	3	68	197
1701	2359	 Conservar y preservar el patrimonio documental del Estado	2019	1	2	68	197
1702	307	Dirección de Asuntos Agrarios	2019	1	3	68	198
1703	2139	Asesoría jurídica y técnica topográfica en materia agraria a los sujetos de derecho agrario del Estado	2019	1	1	68	198
1704	16539	Programa Integral Protégete 	2019	1	1	68	199
1705	8398	Subsecretaría de Desarrollo Social y Asuntos Religiosos	2019	1	3	68	200
1706	12291	Atención a las Asociaciones Religiosas, Agrupaciones y Organizaciones de la Sociedad Civil del Estado	2019	1	1	68	200
1707	16005	Dirección de Asuntos Religiosos	2019	1	3	68	200
1708	311	Representación del Gobierno del Estado de Yucatán en la ciudad de México.	2019	1	3	68	201
1709	2158	Representar al Ejecutivo Estatal en la Ciudad de México	2019	1	1	68	201
1710	18544	Personal docente y de apoyo de las escuelas normales	2019	1	3	59	103
1711	18544	Personal docente y de apoyo de las escuelas normales	2019	1	3	58	103
1712	18544	Personal docente y de apoyo de las escuelas normales	2019	1	3	57	103
1713	18544	Personal docente y de apoyo de las escuelas normales	2019	1	3	56	103
1714	18544	Personal docente y de apoyo de las escuelas normales	2019	1	3	55	103
1715	18544	Personal docente y de apoyo de las escuelas normales	2019	1	3	60	103
1716	18413	Atención del Centro Estatal de Capacitación Investigación y Difusión Humanística de Yucatán	2019	1	1	99	9
1717	19139	Funcionamiento de la Universidad Pedagógica Nacional en el estado de Yucatán	2019	1	2	100	103
1718	14121	Control del cobro de obligaciones fiscales a contribuyentes omisos del Estado de Yucatán	2019	1	2	101	226
1719	15891	Fiscalización a contribuyentes del Estado de Yucatán	2019	1	2	101	226
1720	15892	Dirección de Recaudación	2019	1	3	101	226
1721	15897	Dirección de Auditoría Fiscal	2019	1	3	101	226
1722	15902	Dirección de Servicios al Contribuyente	2019	1	3	101	226
1723	15905	Dirección General de la Agencia de Administración Fiscal de Yucatán	2019	1	3	101	226
1724	15906	Seguimiento de la Administración Tributaria en el Estado de Yucatán.	2019	1	2	101	226
1725	16531	Recaudación de los ingresos del Estado de Yucatán	2019	1	2	101	226
1726	16534	Operación de módulos para cobro de impuestos y derechos vehiculares 2019	2019	1	1	101	226
1727	16537	Atención y servicios al contribuyente	2019	1	1	101	226
1728	16548	Recuperación de créditos fiscales federales mediante la facultad económica coactiva de la Agencia de Administración Fiscal de Yucatán	2019	1	2	101	226
1729	16593	Modernización de las cajas recaudadoras de paradores turísticos en sitios arqueológicos del Estado de Yucatán.	2019	1	2	101	226
1730	17333	Mi Conta: Tu Amigo en el Gobierno	2019	1	1	101	226
1731	17474	Diversificación de medios de pago para el cumplimiento de obligaciones fiscales en el Estado de Yucatán.	2019	1	1	101	226
1732	18172	Contratación de recursos humanos y adquisición de recursos materiales previos al programa de Reemplacamiento 2020	2019	1	1	101	226
1733	19017	Transferencia al Convenio de Colaboración: Chichén Itzá, Noches de Kukulkán.	2019	1	2	101	226
1734	19901	Subdirección General	2019	1	3	101	226
1735	19993	Modernización de las oficinas recaudadoras y creación de los módulos de servicios  de la Agencia de Administración Fiscal de Yucatán en Zona Metropolitana e Interior del Estado.	2019	1	2	101	226
1736	14805	Implementación y seguimiento de las herramientas de Mejora Regulatoria	2019	1	2	101	227
1737	8643	Otorgamiento de apoyo a Sindicato de Trabajadores al Servicio del Poder Ejecutivo e Instituciones Descentralizadas de Yucatán	2019	1	1	101	219
1738	812	Subsecretaría de Presupuesto y Control del Gasto 	2019	1	3	101	228
1739	2778	Cumplimiento de las atribuciones de la Secretaría de Administración y Finanzas	2019	1	2	101	228
1740	11233	Seguimiento y control del presupuesto del Gobierno del Estado	2019	1	2	101	228
1741	14383	Elaboración del Anteproyecto de Presupuesto de Egresos 	2019	1	2	101	228
1742	15856	Despacho de la Secretaria de Administración y Finanzas	2019	1	3	101	228
1743	15882	Implementación del Presupuesto basado en  Resultados	2019	1	2	101	228
1744	19300	Seguimiento y control del ejercicio del gasto público	2019	1	2	101	228
1745	20335	Implementación de la transparencia presupuestal del Gobierno del Estado de Yucatán 	2019	1	2	101	228
1746	9682	Unidad de Gestión de la Inversión	2019	1	3	101	229
1747	11088	Integración de la cartera de inversión del Gobierno del Estado	2019	1	2	101	229
1748	16688	Gestión de recursos federales para la inversión pública en el Estado de Yucatán	2019	1	2	101	229
1749	16703	Fortalecimiento de las capacidades técnicas para la formulación y evaluación social de proyectos en el Sistema Estatal de Inversión Pública de Yucatán	2019	1	2	101	229
1750	17161	Aportación para el Fideicomiso para el Desarrollo Regional del Sur-Sureste	2019	1	2	101	229
1751	18946	Evaluación socioeconómica de proyectos de inversión pública	2019	1	2	101	229
1752	15886	Dirección de Contabilidad Gubernamental	2019	1	3	101	230
1753	15888	Generación de Balances y Estados Financieros del Estado De Yucatán.	2019	1	2	101	230
1754	16614	Elaboración de la Cuenta Pública 2018	2019	1	1	101	230
1755	17536	Publicación del informe trimestral sobre la situación económica, las finanzas públicas y la deuda pública en Yucatán.	2019	1	1	101	230
1756	17538	Generación la información de transparencia y difusión de acuerdo con la Ley General de Contabilidad Gubernamental	2019	1	1	101	230
1757	17724	Funcionamiento del Consejo de Armonización Contable del Estado de Yucatán	2019	1	2	101	230
1758	19994	Control y seguimiento de la fiscalización a la Secretaría de Administración y Finanzas.	2019	1	2	101	230
1759	20411	Asesoría técnica a la Secretaría de Administración y Finanzas	2019	1	2	101	230
1760	20412	Unidad de Asesores	2019	1	3	101	230
1761	17624	Administración del Patrimonio del Gobierno del Estado	2019	1	2	101	30
1762	19281	Dirección de Control Patrimonial, Inmobiliario y Almacenes	2019	1	3	101	30
1763	11146	Seguimiento del programa del arrendamiento de vehículos al servicio del Poder Ejecutivo	2019	1	2	101	231
1764	15857	Subsecretaria de Adquisiciones	2019	1	3	101	231
1765	15877	Vigilancia de las Adquisiciones del Poder Ejecutivo	2019	1	2	101	231
1826	20653	Dirección General	2019	1	3	65	0
1766	19649	Adquisición de combustibles para vehículos oficiales y pólizas de seguros del Poder Ejecutivo. 	2019	1	2	101	231
1767	15860	Subsecretaría de Innovación, Mejora Regulatoria y Eficiencia Institucional 	2019	1	3	101	232
1768	17606	Implementación de metodologías y sistemas de calidad para la innovación y eficiencia institucional	2019	1	2	101	232
1769	8633	Administración de Recursos Humanos del Poder Ejecutivo	2019	1	2	101	233
1770	16004	Administracion de Asignación de Plazas Vacantes	2019	1	3	101	233
1771	2815	Administración de los Recursos Materiales y Financieros la Secretaría de Administración y Finanzas	2019	1	2	101	234
1772	4346	Administración de los recursos humanos de la Secretaría de Administración y Finanzas	2019	1	2	101	234
1773	14903	Gastos administrativos de la Secretaría de Administración y Finanzas	2019	1	4	101	234
1774	15865	Dirección Jurídica	2019	1	3	101	234
1775	17571	Prestación de servicios jurídicos en la esfera de competencia de la Secretaría de Administración y Finanzas	2019	1	2	101	234
1776	17596	Pago de compromisos de las unidades administrativas de la Secretaría de Administración y Finanzas	2019	1	2	101	234
1777	19292	Organización del archivo institucional de la Secretaría de Administración y Finanzas.	2019	1	2	101	234
1778	19293	Dirección de Transparencia y Coordinación de Archivos	2019	1	3	101	234
1779	19536	Gestión de los procesos  en materia de acceso a la información pública y protección de datos personales de la Secretaría de Administración y Finanzas	2019	1	2	101	234
1780	20407	Subsecretaria de Administración y Recursos Humanos	2019	1	3	101	234
1781	11675	Modernización de las tecnologías de la información del Poder Ejecutivo del Estado de Yucatán	2019	1	2	101	235
1782	15861	Subsecretaría de Tecnologías de la Información y Comunicaciones	2019	1	3	101	235
1783	16618	Actualización del marco normativo de la Subsecretaría de la Información y Comunicaciones	2019	1	2	101	235
1784	20373	Renovación de las pólizas de soporte, mantenimiento y licenciamiento de la infraestructura tecnologíca del Gobierno del Estado de Yucatán	2019	1	2	101	235
1785	20379	Mantenimiento de licencias de software de la Subsecretaría de Tecnologías de la Información y Comunicaciones del Gobierno del Estado de Yucatán	2019	1	2	101	235
1786	20380	Atención a usuarios de Plataformas Institucionales de Gobierno	2019	1	2	101	235
1787	20381	Gestión y Homologación de la información a través de la estrategia de datos	2019	1	2	101	235
1788	20382	Estrategias de transformación hacia el entorno digital	2019	1	2	101	235
1789	20413	Generación de Red estatal de conectividad multiservicios en el Estado de Yucatán para los 106 municipios	2019	1	2	101	235
1790	20414	Internet público y gratuito en los 106 municipios del Gobierno del Estado de Yucatán	2019	1	2	101	235
1791	360	Gestión y administración de los recursos humanos, materiales, financieros y tecnológicos de la Agencia de Administración Fiscal de Yucatán	2019	1	2	101	236
1792	6020	Gastos administrativos de la Agencia de Administración Fiscal de Yucatán.	2019	1	4	101	236
1793	15887	Dirección Jurídica	2019	1	3	101	236
1794	15889	Seguridad jurídica de la Agencia de Adminstración Fiscal de Yucatán.	2019	1	2	101	236
1795	15890	Dirección de Administración y Recursos	2019	1	3	101	236
1796	15893	Dirección de Tecnologías de la Información	2019	1	3	101	236
1797	15904	Administración de tecnologías de la información de la Agencia de Administración Fiscal de Yucatán	2019	1	2	101	236
1798	19900	Dirección de Inteligencia Fiscal	2019	1	3	101	236
1799	15872	Dirección de Egresos	2019	1	3	101	237
1800	15874	Programación de los recursos públicos del Estado para el pago de bienes y servicios	2019	1	2	101	237
1801	15876	Tesorería General del Estado	2019	1	3	101	237
1802	15880	Dirección de Ingresos	2019	1	3	101	237
1803	17800	Pago de los compromisos contraídos por el Gobierno del Estado 	2019	1	2	101	237
1804	17836	Gestión de la deuda pública 	2019	1	2	101	237
1805	17851	Administración y control de la recaudación de los ingresos federales y estatales del Estado de Yucatán	2019	1	2	101	237
1806	17856	Control y seguimiento financiero de los recursos federales	2019	1	2	101	237
1807	20402	Transmisión de programas en la  estación radiodifusora  XHYUC 92.9 FM	2019	1	1	101	16
1808	20403	Programa radiofónico el Columnista Radio 	2019	1	1	101	16
1809	20404	Elaboración de estrategias integrales de comunicación para la difusión de programas institucionales y campañas publicitarias del Gobierno del Estado	2019	1	2	101	16
1810	20405	Difusión de obras y acciones de gobierno	2019	1	1	101	16
1811	20406	Dirección General de Comunicación Social	2019	1	3	101	16
1812	6395	Atención a los prejubilados de la zona henequenera, jubilados y pensionados del Gobierno del Estado	2019	1	2	101	238
1813	17752	Pago del crédito del Fondo de Apoyo para la Infraestructura y Seguridad (Profise) destinado a la elaboración de proyectos de inversión	2019	1	2	101	239
1814	17998	Pago del crédito de recursos provenientes del Banco Interamericano de Desarrollo destinado a proyectos de inversión	2019	1	2	101	239
1815	17999	Pago del crédito para el refinanciamiento y reestructuración de pasivos	2019	1	2	101	239
1816	18564	Pago del crédito para el financiamiento de la estrategia Escudo Yucatán	2019	1	2	101	239
1817	19556	Pago del financiamiento para la inversión pública productiva denominada Centro Internacional de Congresos	2019	1	2	101	239
1818	20300	Pago del crédito contratado con una institución financiera autorizada	2019	1	2	101	239
1819	1501	Distribución de ingresos estatales y federales a los municipios	2019	1	2	101	240
1820	1507	Distribución de las aportaciones federales para el fortalecimiento e infraestructura	2019	1	2	101	241
1821	17760	 Transferencia de recursos federales provenientes de  convenios	2019	1	6	101	242
1822	20608	Transferencia de recursos al municipio de Hunucmá Yucatán	2019	1	6	101	242
1823	20421	Cobertura de Eventos de la Agenda del Ejecutivo	2019	1	2	101	201
1824	20427	Direccion de la Coordinacion de Actividades Protocolarias	2019	1	3	101	201
1825	20173	Análisis y planeación integral de la Zona Metropolitana de Mérida	2019	1	2	65	0
1827	20654	Dirección General	2019	1	3	65	0
1828	20681	Fondo para la Accesibilidad en el Transporte Público para Personas con Discapacidad (FOTRADIS)	2019	1	5	65	0
1829	19498	Profesionalización de elementos con el Subsidio a los municipios y demarcaciones territoriales del Distrito Federal y, en su caso, a las entidades federativas que ejerzan de manera directa o coordinada la función de seguridad pública (FORTASEG) 2019	2019	1	1	62	0
1830	19676	Incrementar la plantilla operativa de la Secretaría de Seguridad Pública	2019	1	2	62	0
1831	1900	kjlj	2019	1	1	1	1
1832	RA123	Ubp de prueba	2018	0	3	1	3
1833	RA123	Ubp de prueba	2018	0	1	73	4
1834	RA123	Ubp de prueba	2017	1	2	16	0
\.


--
-- Data for Name: UnidadMedida; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."UnidadMedida" ("iIdUnidadMedida", "vUnidadMedida", "iActivo") FROM stdin;
2	ACOMETIDA	1
3	ACTA	1
4	ACTA CISCUNSTANCIADA	1
5	ACTA DE CIERRE	1
6	ACUERDO	1
7	ADULTO	1
8	ALBERGUE	1
9	ALMACÉN	1
10	ALUMNO	1
12	ANÁLISIS	1
13	ANEXO	1
14	ANUNCIO	1
15	APARTARAYO	1
16	APOYO	1
17	APOYO ECONÓMICO	1
18	APOYO MÉDICO	1
19	ÁRBOL	1
20	ÁREA	1
21	ÁREA NATURAL	1
22	ARRECIFE	1
23	ASESORÍA	1
24	ASIENTO	1
25	ASISTENCIA TÉCNICA	1
26	AUDIENCIA	1
27	AUDITORÍA	1
28	AULA	1
29	AUTOBUS	1
30	AVE	1
31	AVERIGUACIÓN PREVIA	1
32	BANCO DE CAPACITORES	1
33	BANCO DE DATOS	1
34	BANCO DE PROYECTO	1
35	BAÑO	1
36	BARDA	1
37	BASE DE DATOS	1
38	BEBEDERO	1
39	BECA	1
40	BENEFICIARIO	1
41	BIBLIOTECA	1
42	BIBLIOTECA EN LÍNEA	1
43	BITÁCORA	1
44	BODEGA	1
45	BOLETÍN	1
46	BOLETO	1
47	BOMBA	1
48	BONO	1
49	BORDO PERIMETRAL	1
50	BOTIQUIN	1
51	BROTE	1
52	CABEZA	1
53	CABEZA SACRIFICADA	1
54	CALLE	1
55	CAMA	1
56	CAMPAÑA	1
57	CANALETA	1
58	CANCHA	1
59	CARTA DE LIBERACIÓN	1
60	CARTA URBANA	1
61	CARTILLA	1
62	CASA	1
63	CASA SOMBRA	1
64	CASETA	1
65	CASILLA	1
66	CASO	1
67	CATÁLOGO.	1
68	CÉDULA	1
69	CENOTE	1
70	CENSO	1
71	CENTRO	1
72	CENTRO EDUCATIVO	1
73	CEPA	1
74	CERTIFICADO	1
75	CHAMARRA	1
76	CIRUGÍA	1
77	CLÍNICA	1
78	COBERTOR	1
79	COCINA	1
80	COLMENA	1
81	COLONIA	1
82	COMITÉ	1
83	COMPUTADORA	1
84	CONCESIÓN	1
85	CONCIERTO	1
86	CONCILIACIÓN	1
87	CONDUCTOR	1
88	CONFERENCIA	1
89	CONSEJO	1
90	CONSEJOS COMUNITARIOS	1
91	CONSULTA	1
92	CONSULTORIO	1
93	CONTRATO	1
94	CONVENIO	1
95	CONVOCATORIA	1
96	CORRAL	1
97	CORTACIRCUITO	1
98	CORTOMETRAJE	1
99	COTIZACIÓN	1
100	CREDENCIAL	1
101	CRÉDITO	1
102	CUARTO	1
103	CUCHILLA DE OPERACIÓN	1
104	CUENTA POR PAGAR	1
105	CUENTA PÚBLICA	1
106	CURACIÓN	1
107	CURSO	1
108	DECRETO	1
109	DEFUNCIÓN	1
110	DEMANDA	1
111	DENUNCIA	1
112	DEPENDENCIA	1
113	DEPORTISTA	1
114	DERECHOHABIENTE	1
115	DESFIBRADORA	1
116	DESPENSA	1
117	DIAGNÓSTICO	1
118	DICTAMEN	1
119	DIPLOMADO	1
120	DISPARADOR	1
121	DISPOSITIVO	1
122	DOCENTE	1
123	DOCTORADO	1
124	DOCUMENTAL	1
125	DOCUMENTO	1
126	DOCUMENTO VALOR	1
127	DONATIVO	1
128	DÓSIS	1
129	EDICIÓN	1
130	EDIFICIO	1
131	EGRESADO	1
132	EGRESO HOSPITALARIO	1
133	EJEMPLAR	1
134	ELEMENTOS POLICÍACOS	1
135	EMBARCACIÓN	1
136	EMBARCACIÓN MAYOR	1
137	EMBARCACIÓN MENOR	1
138	EMBARCACIÓN RIBEREÑA	1
139	EMPLEO	1
140	ENCUESTA	1
141	ENTRENADOR	1
142	ENTRENAMIENTO	1
143	EQUIPO	1
144	EQUIPO DEPORTIVO	1
145	EQUIPO ELECTRÓNICO	1
146	EQUIPO PARA DISCAPACITADOS	1
147	ESCOLLERA	1
148	ESCRITURA	1
149	ESCUELA	1
150	ESPACIO	1
151	ESPACIO EDUCATIVO	1
152	ESPECIE	1
153	ESTABLECIMIENTO	1
154	ESTADO FINANCIERO	1
155	ESTANQUE	1
156	ESTIMACIÓN	1
157	ESTIMULO	1
158	ESTUDIO	1
159	ESTUFA ECOLÓGICA	1
160	EVENTO	1
161	EXAMEN	1
162	EXPEDIENTE	1
163	EXPOSICIÓN	1
164	FACTURA	1
165	FAMILIA	1
166	FASE	1
167	FERIA	1
168	FINANCIAMIENTO	1
169	FOLLETO	1
170	FORMATO	1
11	AMPARO	1
171	FORO	1
172	FOSA	1
173	FOTOGRAFÍA	1
174	FUGA	1
175	FUNCIÓN	1
176	GASTO FUNERARIO	1
177	GASTO MÉDICO	1
178	GIGAWATT	1
179	GIGAWATT/HORA	1
180	GRUPO	1
181	GUARDERÍA	1
182	GUÍA	1
183	HECTÁREA	1
184	HORA/ CAPACITACIÓN	1
185	HORA/CLASE	1
186	HORA/HOMBRE	1
187	HORA/ INVESTIGACIÓN	1
188	HORA/MAQUINA	1
189	HORA/RADIO	1
190	HORA/TELEVISIÓN	1
191	HORA/VUELO	1
192	HOSPITAL	1
193	HUERTO	1
194	INCENTIVO	1
195	INFORME	1
196	INJERTO	1
197	INMUEBLE	1
198	INSPECCIÓN	1
199	INSTANCIA	1
200	INSTRUMENTO	1
201	INTERCAMBIO ACADÉMICO	1
202	INTERCONEXIÓN	1
203	INTERFAZ	1
204	INTERNO	1
205	INTERPRETACIÓN	1
206	INVENTARIO	1
207	INVERNADERO	1
208	INVESTIGACIÓN	1
209	JARDÍN BOTÁNICO	1
210	JORNAL	1
211	JUEGO	1
212	JUICIO	1
213	KILOGRAMO	1
214	KILÓMETRO	1
215	KILÓMETRO CUADRADO	1
216	KILOWATT	1
217	LABORATORIO	1
218	LÁMINA	1
219	LÁMPARA	1
220	LAUDO	1
221	LECHE	1
222	LENTES	1
223	LETRINA	1
224	LEY	1
225	LIBRO	1
226	LICENCIA	1
227	LICITACIÓN	1
228	LÍNEA TELEFÓNICA	1
229	LINEAMIENTO	1
230	LITRO	1
231	LITRO POR SEGUNDO TRATADO	1
232	LITRO/DÍA	1
233	LOCAL	1
234	LOCALIDAD	1
235	LOTE	1
236	LUMINARIA	1
237	MACHETE	1
238	MAESTRÍA	1
239	MANGUERA	1
240	MANTENIMIENTO	1
241	MANUAL	1
242	MAPA	1
243	MATERIAL	1
244	MEDALLA	1
245	MEDICAMENTO	1
246	MEDIDOR	1
247	MEGAVOLT/AMPERE	1
248	MEGAWATT	1
249	MEGAWATT/HORA	1
250	MENÚ	1
251	MERCADO	1
252	METRO CUADRADO	1
253	METRO CÚBICO	1
254	METRO CÚBICO/DÍA	1
255	METRO CÚBICO/SEGUNDO	1
256	METRO LINEAL	1
257	MILLA NÁUTICA	1
258	MILLONES DE PESOS	1
259	MILLONES DE PIES	1
260	MINUTOS	1
261	MOBILIARIO	1
262	MOCHILA	1
263	MÓDULO	1
264	MONITOREO	1
265	MONTAJE	1
266	MONUMENTO	1
267	MORETE	1
268	MOTOBOMBA(S)	1
269	MOTOGENERADOR	1
270	MOTOR MARINO ESTACIONARIO	1
271	MOTOR MARINO FUERA DE BORDA	1
272	MOTOSIERRA(S)	1
273	MUESTRA	1
274	MUNICIPIO	1
275	MUSEO	1
276	NA	1
277	NODO	1
278	NÓMINA	1
279	NORMA	1
280	OBRA	1
281	OBRA DE TEATRO	1
282	OBRA EXTERIOR	1
283	OBRADOR	1
284	OFICINA	1
285	OFICIO	1
286	ONZA	1
287	ONZA TROY	1
288	OPERACIÓN	1
289	OPERATIVO	1
290	ORDEN DE APREHENSIÓN	1
291	ORDEN DE SERVICIO	1
292	PABELLÓN ARTESANAL	1
293	PACA	1
294	PACIENTE	1
295	PAGO	1
296	PALA	1
297	PAÑAL	1
298	PAQUETE	1
299	PAQUETE LEGISLATIVO	1
300	PAQUETE TECNOLÓGICO	1
301	PARADERO	1
302	PARCELA	1
303	PARTIDA	1
304	PARTO	1
305	PASO DE FAUNA	1
306	PELÍCULA	1
307	PERITAJE	1
308	PERMISO	1
309	PERMISO DE PESCA COMERCIAL	1
310	PERMISO DE PESCA DEPORTIVO	1
311	PERSONA	1
312	PESOS	1
313	PIE CÚBICO	1
314	PIE DE CASA	1
315	PIE TABLA	1
316	PIEZA	1
317	PISO	1
318	PLACA	1
319	PLAN	1
320	PLANO	1
321	PLANTA	1
322	PLANTEL	1
323	PLATAFORMA	1
324	PLÁTICA	1
325	PLAZA	1
326	PÓLIZA	1
327	POSTE	1
328	POZO	1
329	PREMIO	1
330	PRESENTACIÓN	1
331	PROCESO	1
332	PRODUCTO	1
333	PRODUCTOR	1
334	PROGRAMA	1
335	PROMOCIONAL	1
336	PROPUESTA	1
337	PRÓTESIS	1
338	PROTOCOLO	1
339	PROTOTIPO	1
340	PROYECTO	1
341	PRUEBA	1
342	PUBLICACIÓN	1
343	PUENTE	1
344	QUINTAL	1
345	RACIÓN	1
346	RADAR	1
347	RADIO MÓVIL	1
348	RADIO PORTÁTIL	1
349	RECIBO	1
350	RECITAL	1
351	RECURSO	1
352	RED	1
353	REFUGIO	1
354	REGISTRO	1
355	REGLAMENTO	1
356	RELLENO SANITARIO	1
357	REPORTAJE	1
358	REPORTE	1
359	REPRESENTACIÓN	1
360	REQUISICIÓN	1
361	RESOLUCIÓN	1
362	RETENIDA	1
363	REUNIÓN	1
364	REVISTA	1
365	SALA DE LECTURA	1
366	SANCIÓN	1
367	SEGURO	1
368	SEMÁFORO	1
369	SEMINARIO	1
370	SENTENCIA	1
371	SEÑAL	1
372	SERVICIO	1
373	SERVIDOR PÚBLICO	1
374	SESIÓN	1
375	SIMULACRO	1
376	SISTEMA	1
377	SITIO	1
378	SITIOS WEB	1
379	SOFTWARE	1
380	SPOT	1
381	SUBCOMITÉ	1
382	SUBSIDIO	1
383	SUPERVISIÓN	1
384	SUPLEMENTO ALIMENTICIO	1
385	TALLER	1
386	TANQUE	1
387	TARJETA	1
388	TECHO	1
389	TERAPIA	1
390	TERRENO	1
391	TESTAMENTO	1
392	TIEMPO	1
393	TIENDA	1
394	TIERRA FÍSICA	1
395	TINACO	1
396	TITULO	1
397	TOMA DOMICILIARIA	1
398	TOMO	1
399	TONELADA	1
400	TORRETA	1
401	TRÁMITE	1
402	TRANSFERENCIA	1
403	TRANSFORMADOR	1
404	TRANSMISIÓN	1
405	TRATAMIENTO	1
406	TROFEO	1
407	UNIDAD	1
408	UNIDAD DE RIEGO	1
409	UNIDAD DE	1
410	UNIDAD MÉDICA	1
411	UNIDAD MÓVIL	1
412	UNIDAD RESPONSABLE	1
413	UNIFORME	1
414	VACUNA	1
415	VEHÍCULO	1
416	VENTILADOR	1
417	VIAJES	1
418	VIDEO	1
419	VIENTRE BOVINO	1
420	VISITA	1
421	VIVERO	1
422	VIVIENDA	1
423	VIVIENDA MEJORADA	1
424	VIVIENDA NUEVA	1
425	ZAPATOS	1
426	ZONA ARQUEOLÓGICA	1
427	LLAMADAS	1
428	DETENIDOS	1
429	CHALECOS ANTIBALAS	1
430	CÁMARAS	1
431	EVALUACIONES	1
432	ARMAS	1
1	ACERVO	1
\.


--
-- Data for Name: Usuario; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."Usuario" ("iIdUsuario", "vNombre", "vPrimerApellido", "vSegundoApellido", "vPassword", "vCorreo", "dFechaNacimiento", "vToken", "vTelefono", "vCelular", "iIdDependencia", "vUsuario", "iActivo", "iIdRol", "vCargo", "vCorreoPersonal", "dFechaRegistro", "iIdMaxNivelAcademico", "iIdFormacionAcademica") FROM stdin;
1	Jorge Emilio	Estrella	Zavala	36e618512a68721f032470bb0891adef3362cfa9	jorge.estrella@yucatan.gob.mx	1989-08-07	  	(999) 945-1092	(999) 183-2725	73	admin	1	1	Coordinador	jorge.estrella@yucatan.gob.mx	2019-07-23	2	1
2	Dididier	Kantún	Quintal	36e618512a68721f032470bb0891adef3362cfa9	diddier.kantun@gmail.com	1996-07-31	\N	(999) 945-1092	(999) 999-9999	53	diddier.kantun	1	6	Auxiliar	diddier.kantun@gmail.com	2019-07-23	2	1
\.


--
-- Data for Name: UsuarioPermiso; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."UsuarioPermiso" ("iIdUsuario", "iIdPermiso", "iTipoAcceso") FROM stdin;
1	22	1
1	23	1
\.


--
-- Name: ComponentePag_iIdComponente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."ComponentePag_iIdComponente_seq"', 1, false);


--
-- Name: Componente_iIdComponente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Componente_iIdComponente_seq"', 1, false);


--
-- Name: CompromisoPag_iIdCompromiso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."CompromisoPag_iIdCompromiso_seq"', 1, false);


--
-- Name: Compromiso_iIdCompromiso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Compromiso_iIdCompromiso_seq"', 1, false);


--
-- Name: EntregableComponente_iIdComponente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."EntregableComponente_iIdComponente_seq"', 1, false);


--
-- Name: EntregableComponente_iIdEntregable_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."EntregableComponente_iIdEntregable_seq"', 1, false);


--
-- Name: Estatus_iIdEstatus_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Estatus_iIdEstatus_seq"', 7, true);


--
-- Name: EvidenciaPag_iIdEvidencia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."EvidenciaPag_iIdEvidencia_seq"', 1, false);


--
-- Name: Evidencia_iIdEvidencia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Evidencia_iIdEvidencia_seq"', 1, false);


--
-- Name: FormacionAcademica_iIdFormacionAcademica_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."FormacionAcademica_iIdFormacionAcademica_seq"', 2, true);


--
-- Name: MaxNivelAcademico_iIdMaxNivelAcademico_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."MaxNivelAcademico_iIdMaxNivelAcademico_seq"', 4, true);


--
-- Name: Parametro_iIdParametro_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."Parametro_iIdParametro_seq"', 1, false);


--
-- Name: id_actividad_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_actividad_seq', 6, true);


--
-- Name: id_avance_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_avance_seq', 1, false);


--
-- Name: id_dependencia_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_dependencia_seq', 104, true);


--
-- Name: id_det_act_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_det_act_seq', 5, true);


--
-- Name: id_det_ent_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_det_ent_seq', 1, false);


--
-- Name: id_entregable_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_entregable_seq', 3, true);


--
-- Name: id_financiamiento_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_financiamiento_seq', 148, true);


--
-- Name: id_municipio_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_municipio_seq', 1, false);


--
-- Name: id_permiso_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_permiso_seq', 30, true);


--
-- Name: id_rol_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_rol_seq', 6, true);


--
-- Name: id_sujeto_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_sujeto_seq', 8, true);


--
-- Name: id_ubp_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_ubp_seq', 1834, true);


--
-- Name: id_usuario_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.id_usuario_seq', 2, true);


--
-- Name: ActividadLineaAccion ActividadLineaAccion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ActividadLineaAccion"
    ADD CONSTRAINT "ActividadLineaAccion_pkey" PRIMARY KEY ("iIdActividad", "iIdLineaAccion");


--
-- Name: Actividad Actividad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Actividad"
    ADD CONSTRAINT "Actividad_pkey" PRIMARY KEY ("iIdActividad");


--
-- Name: Avance Avance_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Avance"
    ADD CONSTRAINT "Avance_pkey" PRIMARY KEY ("iIdAvance");


--
-- Name: ComponentePag ComponentePag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ComponentePag"
    ADD CONSTRAINT "ComponentePag_pkey" PRIMARY KEY ("iIdComponente");


--
-- Name: ComponenteUBP ComponenteUBP_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ComponenteUBP"
    ADD CONSTRAINT "ComponenteUBP_pkey" PRIMARY KEY ("iIdComponente", "iIdUbp");


--
-- Name: Componente Componente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Componente"
    ADD CONSTRAINT "Componente_pkey" PRIMARY KEY ("iIdComponente");


--
-- Name: CompromisoCorresponsablePag CompromisoCorresponsablePag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CompromisoCorresponsablePag"
    ADD CONSTRAINT "CompromisoCorresponsablePag_pkey" PRIMARY KEY ("iIdCompromiso", "iIdDependencia");


--
-- Name: CompromisoCorresponsable CompromisoCorresponsable_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CompromisoCorresponsable"
    ADD CONSTRAINT "CompromisoCorresponsable_pkey" PRIMARY KEY ("iIdCompromiso", "iIdDependencia");


--
-- Name: CompromisoPag CompromisoPag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CompromisoPag"
    ADD CONSTRAINT "CompromisoPag_pkey" PRIMARY KEY ("iIdCompromiso");


--
-- Name: Compromiso Compromiso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Compromiso"
    ADD CONSTRAINT "Compromiso_pkey" PRIMARY KEY ("iIdCompromiso");


--
-- Name: DependenciaEje DependenciaEje_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DependenciaEje"
    ADD CONSTRAINT "DependenciaEje_pkey" PRIMARY KEY ("iIdDependencia");


--
-- Name: Dependencia Dependencia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Dependencia"
    ADD CONSTRAINT "Dependencia_pkey" PRIMARY KEY ("iIdDependencia");


--
-- Name: DetalleActividadFinanciamiento DetalleActividadFinanciamiento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DetalleActividadFinanciamiento"
    ADD CONSTRAINT "DetalleActividadFinanciamiento_pkey" PRIMARY KEY ("iIdDetalleActividad", "iIdFinanciamiento");


--
-- Name: DetalleActividadUBP DetalleActividadUBP_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DetalleActividadUBP"
    ADD CONSTRAINT "DetalleActividadUBP_pkey" PRIMARY KEY ("iIdDetalleActividad", "iIdUbp");


--
-- Name: DetalleActividad DetalleActividad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DetalleActividad"
    ADD CONSTRAINT "DetalleActividad_pkey" PRIMARY KEY ("iIdDetalleActividad");


--
-- Name: DetalleEntregableMetaMunicipio DetalleEntregableMetaMunicipio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DetalleEntregableMetaMunicipio"
    ADD CONSTRAINT "DetalleEntregableMetaMunicipio_pkey" PRIMARY KEY ("iIdDetalleEntregable", "iIdMunicipio");


--
-- Name: DetalleEntregable DetalleEntregable_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DetalleEntregable"
    ADD CONSTRAINT "DetalleEntregable_pkey" PRIMARY KEY ("iIdDetalleEntregable");


--
-- Name: EntregableComponente EntregableComponente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EntregableComponente"
    ADD CONSTRAINT "EntregableComponente_pkey" PRIMARY KEY ("iIdEntregable", "iIdComponente");


--
-- Name: Entregable Entregable_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Entregable"
    ADD CONSTRAINT "Entregable_pkey" PRIMARY KEY ("iIdEntregable");


--
-- Name: Estatus Estatus_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Estatus"
    ADD CONSTRAINT "Estatus_pkey" PRIMARY KEY ("iIdEstatus");


--
-- Name: EvidenciaPag EvidenciaPag_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EvidenciaPag"
    ADD CONSTRAINT "EvidenciaPag_pkey" PRIMARY KEY ("iIdEvidencia");


--
-- Name: Evidencia Evidencia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Evidencia"
    ADD CONSTRAINT "Evidencia_pkey" PRIMARY KEY ("iIdEvidencia");


--
-- Name: Financiamiento Financiamiento_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Financiamiento"
    ADD CONSTRAINT "Financiamiento_pkey" PRIMARY KEY ("iIdFinanciamiento");


--
-- Name: FormacionAcademica FormacionAcademica_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."FormacionAcademica"
    ADD CONSTRAINT "FormacionAcademica_pkey" PRIMARY KEY ("iIdFormacionAcademica");


--
-- Name: MaxNivelAcademico MaxNivelAcademico_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."MaxNivelAcademico"
    ADD CONSTRAINT "MaxNivelAcademico_pkey" PRIMARY KEY ("iIdMaxNivelAcademico");


--
-- Name: Municipio Municipio_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Municipio"
    ADD CONSTRAINT "Municipio_pkey" PRIMARY KEY ("iIdMunicipio");


--
-- Name: ODS ODS_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ODS"
    ADD CONSTRAINT "ODS_pkey" PRIMARY KEY ("iIdOds");


--
-- Name: PED2019Eje PED2019Eje_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PED2019Eje"
    ADD CONSTRAINT "PED2019Eje_pkey" PRIMARY KEY ("iIdEje");


--
-- Name: PED2019Estrategia PED2019Estrategia_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PED2019Estrategia"
    ADD CONSTRAINT "PED2019Estrategia_pkey" PRIMARY KEY ("iIdEstrategia");


--
-- Name: PED2019LineaAccion PED2019LineaAccion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PED2019LineaAccion"
    ADD CONSTRAINT "PED2019LineaAccion_pkey" PRIMARY KEY ("iIdLineaAccion");


--
-- Name: PED2019Objetivo PED2019Objetivo_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PED2019Objetivo"
    ADD CONSTRAINT "PED2019Objetivo_pkey" PRIMARY KEY ("iIdObjetivo");


--
-- Name: PED2019Tema PED2019Tema_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PED2019Tema"
    ADD CONSTRAINT "PED2019Tema_pkey" PRIMARY KEY ("iIdTema");


--
-- Name: Parametro Parametro_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Parametro"
    ADD CONSTRAINT "Parametro_pkey" PRIMARY KEY ("iIdParametro");


--
-- Name: Periodicidad Periodicidad_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Periodicidad"
    ADD CONSTRAINT "Periodicidad_pkey" PRIMARY KEY ("iIdPeriodicidad");


--
-- Name: Permiso Permiso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Permiso"
    ADD CONSTRAINT "Permiso_pkey" PRIMARY KEY ("iIdPermiso");


--
-- Name: ProgramaPresupuestario ProgramaPresupuestario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ProgramaPresupuestario"
    ADD CONSTRAINT "ProgramaPresupuestario_pkey" PRIMARY KEY ("iIdProgramaPresupuestario");


--
-- Name: Region Region_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Region"
    ADD CONSTRAINT "Region_pkey" PRIMARY KEY ("iIdRegion");


--
-- Name: RolPermiso RolPermiso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RolPermiso"
    ADD CONSTRAINT "RolPermiso_pkey" PRIMARY KEY ("iIdRol", "iIdPermiso");


--
-- Name: Rol Rol_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Rol"
    ADD CONSTRAINT "Rol_pkey" PRIMARY KEY ("iIdRol");


--
-- Name: SujetoAfectado SujetoAfectado_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."SujetoAfectado"
    ADD CONSTRAINT "SujetoAfectado_pkey" PRIMARY KEY ("iIdSujetoAfectado");


--
-- Name: TipoUBP TipoUBP_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."TipoUBP"
    ADD CONSTRAINT "TipoUBP_pkey" PRIMARY KEY ("iIdTipoUbp");


--
-- Name: UBP UBP_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UBP"
    ADD CONSTRAINT "UBP_pkey" PRIMARY KEY ("iIdUbp");


--
-- Name: UnidadMedida UnidadMedida_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UnidadMedida"
    ADD CONSTRAINT "UnidadMedida_pkey" PRIMARY KEY ("iIdUnidadMedida");


--
-- Name: UsuarioPermiso UsuarioPermiso_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UsuarioPermiso"
    ADD CONSTRAINT "UsuarioPermiso_pkey" PRIMARY KEY ("iIdUsuario", "iIdPermiso");


--
-- Name: Usuario Usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "Usuario_pkey" PRIMARY KEY ("iIdUsuario");


--
-- Name: PED2019Estrategia FK_2019Estra_Obj; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PED2019Estrategia"
    ADD CONSTRAINT "FK_2019Estra_Obj" FOREIGN KEY ("iIdObjetivo") REFERENCES public."PED2019Objetivo"("iIdObjetivo");


--
-- Name: PED2019LineaAccion FK_2019LineaA_Estra; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PED2019LineaAccion"
    ADD CONSTRAINT "FK_2019LineaA_Estra" FOREIGN KEY ("iIdEstrategia") REFERENCES public."PED2019Estrategia"("iIdEstrategia");


--
-- Name: PED2019Objetivo FK_2019Objetivo_Tema; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PED2019Objetivo"
    ADD CONSTRAINT "FK_2019Objetivo_Tema" FOREIGN KEY ("iIdTema") REFERENCES public."PED2019Tema"("iIdTema");


--
-- Name: PED2019Tema FK_2019Tema_Eje; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."PED2019Tema"
    ADD CONSTRAINT "FK_2019Tema_Eje" FOREIGN KEY ("iIdEje") REFERENCES public."PED2019Eje"("iIdEje");


--
-- Name: ActividadLineaAccion FK_ActividadLA_Actividad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ActividadLineaAccion"
    ADD CONSTRAINT "FK_ActividadLA_Actividad" FOREIGN KEY ("iIdLineaAccion") REFERENCES public."PED2019LineaAccion"("iIdLineaAccion");


--
-- Name: ActividadLineaAccion FK_ActividadLA_LineaAc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ActividadLineaAccion"
    ADD CONSTRAINT "FK_ActividadLA_LineaAc" FOREIGN KEY ("iIdActividad") REFERENCES public."Actividad"("iIdActividad");


--
-- Name: Actividad FK_Actividad_Dep; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Actividad"
    ADD CONSTRAINT "FK_Actividad_Dep" FOREIGN KEY ("iIdDependencia") REFERENCES public."Dependencia"("iIdDependencia");


--
-- Name: Avance FK_Avance_DetEnt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Avance"
    ADD CONSTRAINT "FK_Avance_DetEnt" FOREIGN KEY ("iIdDetalleEntregable") REFERENCES public."DetalleEntregable"("iIdDetalleEntregable");


--
-- Name: ComponenteUBP FK_CompUbp_Componente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ComponenteUBP"
    ADD CONSTRAINT "FK_CompUbp_Componente" FOREIGN KEY ("iIdComponente") REFERENCES public."Componente"("iIdComponente");


--
-- Name: ComponenteUBP FK_CompUbp_UBP; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ComponenteUBP"
    ADD CONSTRAINT "FK_CompUbp_UBP" FOREIGN KEY ("iIdUbp") REFERENCES public."UBP"("iIdUbp");


--
-- Name: ComponentePag FK_ComponentePag_Compromiso; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ComponentePag"
    ADD CONSTRAINT "FK_ComponentePag_Compromiso" FOREIGN KEY ("iIdCompromiso") REFERENCES public."CompromisoPag"("iIdCompromiso");


--
-- Name: ComponentePag FK_ComponentePag_UnidadMedida; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."ComponentePag"
    ADD CONSTRAINT "FK_ComponentePag_UnidadMedida" FOREIGN KEY ("iIdUnidadMedida") REFERENCES public."UnidadMedida"("iIdUnidadMedida");


--
-- Name: Componente FK_Componente_Compromiso; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Componente"
    ADD CONSTRAINT "FK_Componente_Compromiso" FOREIGN KEY ("iIdCompromiso") REFERENCES public."Compromiso"("iIdCompromiso");


--
-- Name: Componente FK_Componente_UnidadMedida; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Componente"
    ADD CONSTRAINT "FK_Componente_UnidadMedida" FOREIGN KEY ("iIdUnidadMedida") REFERENCES public."UnidadMedida"("iIdUnidadMedida");


--
-- Name: CompromisoCorresponsablePag FK_CompromisoCoPag_Compromiso; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CompromisoCorresponsablePag"
    ADD CONSTRAINT "FK_CompromisoCoPag_Compromiso" FOREIGN KEY ("iIdCompromiso") REFERENCES public."CompromisoPag"("iIdCompromiso");


--
-- Name: CompromisoCorresponsablePag FK_CompromisoCoPag_Dependencia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CompromisoCorresponsablePag"
    ADD CONSTRAINT "FK_CompromisoCoPag_Dependencia" FOREIGN KEY ("iIdDependencia") REFERENCES public."Dependencia"("iIdDependencia");


--
-- Name: CompromisoCorresponsable FK_CompromisoCo_Compromiso; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CompromisoCorresponsable"
    ADD CONSTRAINT "FK_CompromisoCo_Compromiso" FOREIGN KEY ("iIdCompromiso") REFERENCES public."Compromiso"("iIdCompromiso");


--
-- Name: CompromisoCorresponsable FK_CompromisoCo_Dependencia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CompromisoCorresponsable"
    ADD CONSTRAINT "FK_CompromisoCo_Dependencia" FOREIGN KEY ("iIdDependencia") REFERENCES public."Dependencia"("iIdDependencia");


--
-- Name: CompromisoPag FK_CompromisoPag_Dependencia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CompromisoPag"
    ADD CONSTRAINT "FK_CompromisoPag_Dependencia" FOREIGN KEY ("iIdDependencia") REFERENCES public."Dependencia"("iIdDependencia");


--
-- Name: CompromisoPag FK_CompromisoPag_Tema; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."CompromisoPag"
    ADD CONSTRAINT "FK_CompromisoPag_Tema" FOREIGN KEY ("iIdTema") REFERENCES public."PED2019Tema"("iIdTema");


--
-- Name: Compromiso FK_Compromiso_Dependencia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Compromiso"
    ADD CONSTRAINT "FK_Compromiso_Dependencia" FOREIGN KEY ("iIdDependencia") REFERENCES public."Dependencia"("iIdDependencia");


--
-- Name: Compromiso FK_Compromiso_Tema; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Compromiso"
    ADD CONSTRAINT "FK_Compromiso_Tema" FOREIGN KEY ("iIdTema") REFERENCES public."PED2019Tema"("iIdTema");


--
-- Name: DependenciaEje FK_DepEje_Dep; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DependenciaEje"
    ADD CONSTRAINT "FK_DepEje_Dep" FOREIGN KEY ("iIdDependencia") REFERENCES public."Dependencia"("iIdDependencia");


--
-- Name: DependenciaEje FK_DepEje_Eje; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DependenciaEje"
    ADD CONSTRAINT "FK_DepEje_Eje" FOREIGN KEY ("iIdEje") REFERENCES public."PED2019Eje"("iIdEje");


--
-- Name: DetalleActividadUBP FK_DetActUBP_DetAct; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DetalleActividadUBP"
    ADD CONSTRAINT "FK_DetActUBP_DetAct" FOREIGN KEY ("iIdDetalleActividad") REFERENCES public."DetalleActividad"("iIdDetalleActividad");


--
-- Name: DetalleActividadUBP FK_DetActUBP_UBP; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DetalleActividadUBP"
    ADD CONSTRAINT "FK_DetActUBP_UBP" FOREIGN KEY ("iIdUbp") REFERENCES public."UBP"("iIdUbp");


--
-- Name: DetalleActividad FK_DetAct_Act; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DetalleActividad"
    ADD CONSTRAINT "FK_DetAct_Act" FOREIGN KEY ("iIdActividad") REFERENCES public."Actividad"("iIdActividad");


--
-- Name: DetalleActividadFinanciamiento FK_DetActivFinan_Actividad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DetalleActividadFinanciamiento"
    ADD CONSTRAINT "FK_DetActivFinan_Actividad" FOREIGN KEY ("iIdDetalleActividad") REFERENCES public."DetalleActividad"("iIdDetalleActividad");


--
-- Name: DetalleActividadFinanciamiento FK_DetActivFinan_Financiamiento; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DetalleActividadFinanciamiento"
    ADD CONSTRAINT "FK_DetActivFinan_Financiamiento" FOREIGN KEY ("iIdFinanciamiento") REFERENCES public."Financiamiento"("iIdFinanciamiento");


--
-- Name: DetalleEntregableMetaMunicipio FK_DetEntMun_DetEnt; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DetalleEntregableMetaMunicipio"
    ADD CONSTRAINT "FK_DetEntMun_DetEnt" FOREIGN KEY ("iIdDetalleEntregable") REFERENCES public."DetalleEntregable"("iIdDetalleEntregable");


--
-- Name: DetalleEntregableMetaMunicipio FK_DetEntMun_Municipio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DetalleEntregableMetaMunicipio"
    ADD CONSTRAINT "FK_DetEntMun_Municipio" FOREIGN KEY ("iIdMunicipio") REFERENCES public."Municipio"("iIdMunicipio");


--
-- Name: DetalleEntregable FK_DetEnt_DetAct; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DetalleEntregable"
    ADD CONSTRAINT "FK_DetEnt_DetAct" FOREIGN KEY ("iIdDetalleActividad") REFERENCES public."DetalleActividad"("iIdDetalleActividad");


--
-- Name: DetalleEntregable FK_DetEnt_Entregable; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."DetalleEntregable"
    ADD CONSTRAINT "FK_DetEnt_Entregable" FOREIGN KEY ("iIdEntregable") REFERENCES public."Entregable"("iIdEntregable");


--
-- Name: EntregableComponente FK_EntregableComp_Comp; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EntregableComponente"
    ADD CONSTRAINT "FK_EntregableComp_Comp" FOREIGN KEY ("iIdComponente") REFERENCES public."Componente"("iIdComponente");


--
-- Name: EntregableComponente FK_EntregableComp_Entregable; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EntregableComponente"
    ADD CONSTRAINT "FK_EntregableComp_Entregable" FOREIGN KEY ("iIdEntregable") REFERENCES public."Entregable"("iIdEntregable");


--
-- Name: Entregable FK_Entregable_Dependencia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Entregable"
    ADD CONSTRAINT "FK_Entregable_Dependencia" FOREIGN KEY ("iIdDependencia") REFERENCES public."Dependencia"("iIdDependencia");


--
-- Name: Entregable FK_Entregable_Periodicidad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Entregable"
    ADD CONSTRAINT "FK_Entregable_Periodicidad" FOREIGN KEY ("iIdPeriodicidad") REFERENCES public."Periodicidad"("iIdPeriodicidad");


--
-- Name: Entregable FK_Entregable_Sujeto; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Entregable"
    ADD CONSTRAINT "FK_Entregable_Sujeto" FOREIGN KEY ("iIdSujetoAfectado") REFERENCES public."SujetoAfectado"("iIdSujetoAfectado");


--
-- Name: Entregable FK_Entregable_Unidad; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Entregable"
    ADD CONSTRAINT "FK_Entregable_Unidad" FOREIGN KEY ("iIdUnidadMedida") REFERENCES public."UnidadMedida"("iIdUnidadMedida");


--
-- Name: EvidenciaPag FK_EvidenciaPag_Componente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."EvidenciaPag"
    ADD CONSTRAINT "FK_EvidenciaPag_Componente" FOREIGN KEY ("iIdComponente") REFERENCES public."ComponentePag"("iIdComponente");


--
-- Name: Evidencia FK_Evidencia_Componente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Evidencia"
    ADD CONSTRAINT "FK_Evidencia_Componente" FOREIGN KEY ("iIdComponente") REFERENCES public."Componente"("iIdComponente");


--
-- Name: Municipio FK_Municipio_Region; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Municipio"
    ADD CONSTRAINT "FK_Municipio_Region" FOREIGN KEY ("iIdRegion") REFERENCES public."Region"("iIdRegion");


--
-- Name: RolPermiso FK_RolP_Permiso; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RolPermiso"
    ADD CONSTRAINT "FK_RolP_Permiso" FOREIGN KEY ("iIdPermiso") REFERENCES public."Permiso"("iIdPermiso");


--
-- Name: RolPermiso FK_RolP_Rol; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."RolPermiso"
    ADD CONSTRAINT "FK_RolP_Rol" FOREIGN KEY ("iIdRol") REFERENCES public."Rol"("iIdRol");


--
-- Name: UBP FK_Ubp_Dependencia; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UBP"
    ADD CONSTRAINT "FK_Ubp_Dependencia" FOREIGN KEY ("iIdDependencia") REFERENCES public."Dependencia"("iIdDependencia");


--
-- Name: UBP FK_Ubp_Tipo; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UBP"
    ADD CONSTRAINT "FK_Ubp_Tipo" FOREIGN KEY ("iIdTipoUbp") REFERENCES public."TipoUBP"("iIdTipoUbp");


--
-- Name: UsuarioPermiso FK_UsuarioP_Permiso; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UsuarioPermiso"
    ADD CONSTRAINT "FK_UsuarioP_Permiso" FOREIGN KEY ("iIdPermiso") REFERENCES public."Permiso"("iIdPermiso");


--
-- Name: UsuarioPermiso FK_UsuarioP_Usuario; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."UsuarioPermiso"
    ADD CONSTRAINT "FK_UsuarioP_Usuario" FOREIGN KEY ("iIdUsuario") REFERENCES public."Usuario"("iIdUsuario");


--
-- Name: Usuario FK_Usuario_Dep; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "FK_Usuario_Dep" FOREIGN KEY ("iIdDependencia") REFERENCES public."Dependencia"("iIdDependencia");


--
-- Name: Usuario FK_Usuario_FormAca; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "FK_Usuario_FormAca" FOREIGN KEY ("iIdFormacionAcademica") REFERENCES public."FormacionAcademica"("iIdFormacionAcademica");


--
-- Name: Usuario FK_Usuario_MaxNivelAca; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "FK_Usuario_MaxNivelAca" FOREIGN KEY ("iIdMaxNivelAcademico") REFERENCES public."MaxNivelAcademico"("iIdMaxNivelAcademico");


--
-- Name: Usuario FK_Usuario_Rol; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Usuario"
    ADD CONSTRAINT "FK_Usuario_Rol" FOREIGN KEY ("iIdRol") REFERENCES public."Rol"("iIdRol");


--
-- PostgreSQL database dump complete
--

