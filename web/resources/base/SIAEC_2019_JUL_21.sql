--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.14
-- Dumped by pg_dump version 9.6.14

-- Started on 2019-07-21 20:13:50 CST

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- TOC entry 1 (class 3079 OID 12393)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2536 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 185 (class 1259 OID 41319)
-- Name: bitacora; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bitacora (
    bitacora_id integer NOT NULL,
    bitacora_fecha_hora timestamp without time zone,
    bitacora_usuario character varying(50),
    bitacora_transaccion character varying(100)
);


ALTER TABLE public.bitacora OWNER TO postgres;

--
-- TOC entry 186 (class 1259 OID 41322)
-- Name: bitacora_bitacora_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bitacora_bitacora_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bitacora_bitacora_id_seq OWNER TO postgres;

--
-- TOC entry 2537 (class 0 OID 0)
-- Dependencies: 186
-- Name: bitacora_bitacora_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bitacora_bitacora_id_seq OWNED BY public.bitacora.bitacora_id;


--
-- TOC entry 187 (class 1259 OID 41324)
-- Name: citas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.citas (
    cita_id integer NOT NULL,
    clinica_id integer NOT NULL,
    medico_id integer,
    usuario_usuario character varying(50),
    cita_fecha date,
    cita_hora time without time zone,
    cita_motivo character varying(250),
    cita_fecha_creacion date,
    cita_hora_creacion time without time zone,
    cita_estado integer,
    cita_usuario_creacion character varying(50),
    cita_fecha_modificacion date,
    cita_usuario_modificacion character varying(50),
    cita_ensala boolean,
    paciente_id integer
);


ALTER TABLE public.citas OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 41327)
-- Name: citas_cita_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.citas_cita_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.citas_cita_id_seq OWNER TO postgres;

--
-- TOC entry 2538 (class 0 OID 0)
-- Dependencies: 188
-- Name: citas_cita_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.citas_cita_id_seq OWNED BY public.citas.cita_id;


--
-- TOC entry 189 (class 1259 OID 41329)
-- Name: clinicas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clinicas (
    clinica_id integer NOT NULL,
    clinica_nombre character varying(50),
    clinica_correo character varying(50),
    clinica_telefono_fijo character varying(10),
    clinica_telefono_movil character varying(10),
    clinica_modulo integer,
    clinica_horario_apertura time without time zone,
    clinica_horario_cierre time without time zone,
    clinica_estado boolean,
    clinica_fecha_creacion date,
    clinica_usuario_creacion character varying(50),
    clinica_fecha_modificacion date,
    clinica_usuario_modificacion character varying(50)
);


ALTER TABLE public.clinicas OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 41332)
-- Name: clinicas_clinica_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clinicas_clinica_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clinicas_clinica_id_seq OWNER TO postgres;

--
-- TOC entry 2539 (class 0 OID 0)
-- Dependencies: 190
-- Name: clinicas_clinica_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clinicas_clinica_id_seq OWNED BY public.clinicas.clinica_id;


--
-- TOC entry 191 (class 1259 OID 41334)
-- Name: configuraciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.configuraciones (
    configuracion_id integer NOT NULL,
    configuracion_tiempo_sesion integer,
    configuracion_correo_host character varying(75),
    configuracion_correo_port integer,
    configuracion_correo_requerido boolean,
    configuracion_correo_encryptacion character varying(30),
    configuracion_correo_cuenta character varying(128),
    configuracion_correo_contrasenya character varying(256),
    configuracion_correo_ilimitada boolean,
    configuracion_correo_mes integer,
    configuracion_correo_dia integer,
    configuracion_correo_enviado_mes integer,
    configuracion_correo_enviado_dia integer,
    configuracion_correo_activo boolean,
    configuracion_titulo character varying(50),
    configuracion_mensaje character varying(1000),
    configuracion_imagen_superior character varying(300),
    configuracion_imagen_inferior character varying(300),
    configuracion_imagen_login character varying(300),
    configuracion_promocion_cumpleanyos boolean,
    configuracion_promocion_general boolean
);


ALTER TABLE public.configuraciones OWNER TO postgres;

--
-- TOC entry 192 (class 1259 OID 41340)
-- Name: configuraciones_configuracion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.configuraciones_configuracion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.configuraciones_configuracion_id_seq OWNER TO postgres;

--
-- TOC entry 2540 (class 0 OID 0)
-- Dependencies: 192
-- Name: configuraciones_configuracion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.configuraciones_configuracion_id_seq OWNED BY public.configuraciones.configuracion_id;


--
-- TOC entry 193 (class 1259 OID 41342)
-- Name: consultas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.consultas (
    consulta_id integer NOT NULL,
    promocion_id integer,
    paciente_id integer NOT NULL,
    medico_id integer NOT NULL,
    consulta_motivo character varying(200),
    consulta_diagnostico character varying(1000),
    consulta_receta character varying(500),
    consulta_nota character varying(1000),
    consulta_fecha_creacion date,
    consulta_usuario_creacion character varying(50),
    consulta_fecha_modificacion date,
    consulta_usuario_modificacion character varying(50)
);


ALTER TABLE public.consultas OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 41348)
-- Name: consultas_consulta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.consultas_consulta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.consultas_consulta_id_seq OWNER TO postgres;

--
-- TOC entry 2541 (class 0 OID 0)
-- Dependencies: 194
-- Name: consultas_consulta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.consultas_consulta_id_seq OWNED BY public.consultas.consulta_id;


--
-- TOC entry 195 (class 1259 OID 41350)
-- Name: dashboard_dashboard_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dashboard_dashboard_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dashboard_dashboard_id_seq OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 41352)
-- Name: dashboard; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dashboard (
    dashboard_id integer DEFAULT nextval('public.dashboard_dashboard_id_seq'::regclass) NOT NULL,
    dashboard_nombre character varying(50),
    dashboard_descripcion character varying(100),
    dashboard_url character varying(100),
    dashboard_imagen character varying(150)
);


ALTER TABLE public.dashboard OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 41356)
-- Name: departamentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departamentos (
    departamento_id integer NOT NULL,
    departamento_nombre character varying(25)
);


ALTER TABLE public.departamentos OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 41359)
-- Name: departamentos_departamento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.departamentos_departamento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.departamentos_departamento_id_seq OWNER TO postgres;

--
-- TOC entry 2542 (class 0 OID 0)
-- Dependencies: 198
-- Name: departamentos_departamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.departamentos_departamento_id_seq OWNED BY public.departamentos.departamento_id;


--
-- TOC entry 199 (class 1259 OID 41361)
-- Name: detalles_consultas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.detalles_consultas (
    detalleconsulta_id integer NOT NULL,
    tratamiento_id integer,
    paciente_id integer,
    detalleconsulta_pieza character varying(200),
    detalleconsulta_tratamiento character varying(1000),
    detalleconsulta_cargo double precision,
    detalleconsulta_abono double precision,
    detalleconsulta_fecha_creacion date,
    detalleconsulta_usuario_creacio character varying(50)
);


ALTER TABLE public.detalles_consultas OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 41367)
-- Name: detalles_consultas_detalleconsulta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.detalles_consultas_detalleconsulta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.detalles_consultas_detalleconsulta_id_seq OWNER TO postgres;

--
-- TOC entry 2543 (class 0 OID 0)
-- Dependencies: 200
-- Name: detalles_consultas_detalleconsulta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.detalles_consultas_detalleconsulta_id_seq OWNED BY public.detalles_consultas.detalleconsulta_id;


--
-- TOC entry 201 (class 1259 OID 41369)
-- Name: direcciones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.direcciones (
    direccion_id integer NOT NULL,
    paciente_id integer,
    medico_id integer,
    clinica_id integer,
    municipio_id integer NOT NULL,
    direccion_colonia character varying(50),
    direccion_calle character varying(50),
    direccion_casa character varying(10),
    direccion_pasaje character varying(50),
    direccion_poligono character varying(50),
    direccion_apartamento character varying(50)
);


ALTER TABLE public.direcciones OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 41372)
-- Name: direcciones_direccion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.direcciones_direccion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.direcciones_direccion_id_seq OWNER TO postgres;

--
-- TOC entry 2544 (class 0 OID 0)
-- Dependencies: 202
-- Name: direcciones_direccion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.direcciones_direccion_id_seq OWNED BY public.direcciones.direccion_id;


--
-- TOC entry 203 (class 1259 OID 41374)
-- Name: existencias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.existencias (
    existencia_id integer NOT NULL,
    insumo_id integer NOT NULL,
    clinica_id integer NOT NULL,
    existencia_cantidad double precision
);


ALTER TABLE public.existencias OWNER TO postgres;

--
-- TOC entry 204 (class 1259 OID 41377)
-- Name: existencias_existencia_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.existencias_existencia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.existencias_existencia_id_seq OWNER TO postgres;

--
-- TOC entry 2545 (class 0 OID 0)
-- Dependencies: 204
-- Name: existencias_existencia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.existencias_existencia_id_seq OWNED BY public.existencias.existencia_id;


--
-- TOC entry 205 (class 1259 OID 41379)
-- Name: imagenes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.imagenes (
    imagen_id integer NOT NULL,
    paciente_id integer NOT NULL,
    imagen_nombre character varying(75),
    imagen_anotacion character varying(250),
    imagen_imagen bytea,
    imagen_url character varying(300),
    imagen_fecha_creacion date,
    imagen_usuario_creacion character varying(50)
);


ALTER TABLE public.imagenes OWNER TO postgres;

--
-- TOC entry 206 (class 1259 OID 41385)
-- Name: imagenes_imagen_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.imagenes_imagen_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.imagenes_imagen_id_seq OWNER TO postgres;

--
-- TOC entry 2546 (class 0 OID 0)
-- Dependencies: 206
-- Name: imagenes_imagen_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.imagenes_imagen_id_seq OWNED BY public.imagenes.imagen_id;


--
-- TOC entry 207 (class 1259 OID 41387)
-- Name: insumos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.insumos (
    insumo_id integer NOT NULL,
    tipoinsumo_id integer NOT NULL,
    unidadmedida_id integer NOT NULL,
    insumo_nombre character varying(50),
    insumo_descripcion character varying(250),
    insumo_minimo integer,
    insumo_estado boolean,
    insumo_fecha_creacion date,
    insumo_usuario_creacion character varying(50),
    insumo_fecha_modificacion date,
    insumo_usuario_modificacion character varying(50)
);


ALTER TABLE public.insumos OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 41390)
-- Name: insumos_insumo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.insumos_insumo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.insumos_insumo_id_seq OWNER TO postgres;

--
-- TOC entry 2547 (class 0 OID 0)
-- Dependencies: 208
-- Name: insumos_insumo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.insumos_insumo_id_seq OWNED BY public.insumos.insumo_id;


--
-- TOC entry 209 (class 1259 OID 41392)
-- Name: medicos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.medicos (
    medico_id integer NOT NULL,
    medico_primer_nombre character varying(25),
    medico_segundo_nombre character varying(50),
    medico_primer_apellido character varying(25),
    medico_segundo_apellido character varying(25),
    medico_fecha_nacimiento date,
    medico_sexo boolean,
    medico_correo character varying(50),
    medico_especialidad character varying(100),
    medico_telefono_casa character varying(10),
    medico_telefono_movil character varying(10),
    medico_numero_acreditacion character varying(10),
    medico_estado boolean,
    medico_usuario character varying(50),
    medico_fecha_creacion date,
    medico_usuario_creacion character varying(50),
    medico_fecha_modificacion date,
    medico_usuario_modificacion character varying(50)
);


ALTER TABLE public.medicos OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 41395)
-- Name: medicos_medico_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.medicos_medico_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.medicos_medico_id_seq OWNER TO postgres;

--
-- TOC entry 2548 (class 0 OID 0)
-- Dependencies: 210
-- Name: medicos_medico_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.medicos_medico_id_seq OWNED BY public.medicos.medico_id;


--
-- TOC entry 211 (class 1259 OID 41397)
-- Name: menus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menus (
    menu_id integer NOT NULL,
    menu_nombre character varying(50)
);


ALTER TABLE public.menus OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 41400)
-- Name: menus_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.menus_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menus_menu_id_seq OWNER TO postgres;

--
-- TOC entry 2549 (class 0 OID 0)
-- Dependencies: 212
-- Name: menus_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menus_menu_id_seq OWNED BY public.menus.menu_id;


--
-- TOC entry 213 (class 1259 OID 41402)
-- Name: menus_por_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menus_por_roles (
    rol_id integer NOT NULL,
    menu_id integer NOT NULL
);


ALTER TABLE public.menus_por_roles OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 41405)
-- Name: movimientos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.movimientos (
    movimiento_id integer NOT NULL,
    existencia_id integer NOT NULL,
    movimiento_cantidad double precision,
    movimiento_tipo boolean,
    movimiento_fecha_creacion date,
    movimiento_usuario_creacion character varying(50)
);


ALTER TABLE public.movimientos OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 41408)
-- Name: movimientos_movimiento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.movimientos_movimiento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movimientos_movimiento_id_seq OWNER TO postgres;

--
-- TOC entry 2550 (class 0 OID 0)
-- Dependencies: 215
-- Name: movimientos_movimiento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.movimientos_movimiento_id_seq OWNED BY public.movimientos.movimiento_id;


--
-- TOC entry 216 (class 1259 OID 41410)
-- Name: municipios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.municipios (
    municipio_id integer NOT NULL,
    departamento_id integer NOT NULL,
    municipio_nombre character varying(50)
);


ALTER TABLE public.municipios OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 41413)
-- Name: municipios_municipio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.municipios_municipio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.municipios_municipio_id_seq OWNER TO postgres;

--
-- TOC entry 2551 (class 0 OID 0)
-- Dependencies: 217
-- Name: municipios_municipio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.municipios_municipio_id_seq OWNED BY public.municipios.municipio_id;


--
-- TOC entry 218 (class 1259 OID 41415)
-- Name: odontogramas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.odontogramas (
    odontograma_id integer NOT NULL,
    paciente_id integer NOT NULL,
    odontograma_pieza character varying(5),
    odontograma_cuadrante integer,
    odontograma_oclusal integer,
    odontograma_vestibular integer,
    odontograma_mesial integer,
    odontograma_distal integer,
    odontograma_lingual integer,
    odontograma_palatina integer,
    odontograma_extraccion boolean,
    odontograma_ausente boolean,
    odontograma_fractura boolean,
    odontograma_protesis boolean,
    odontograma_implante boolean,
    odontograma_endodoncia boolean,
    odontograma_raiz boolean,
    odontograma_general integer,
    odontograma_endodoncia_reincide boolean,
    odontograma_protesis_reincide boolean
);


ALTER TABLE public.odontogramas OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 41418)
-- Name: odontogramas_odontograma_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.odontogramas_odontograma_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.odontogramas_odontograma_id_seq OWNER TO postgres;

--
-- TOC entry 2552 (class 0 OID 0)
-- Dependencies: 219
-- Name: odontogramas_odontograma_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.odontogramas_odontograma_id_seq OWNED BY public.odontogramas.odontograma_id;


--
-- TOC entry 220 (class 1259 OID 41420)
-- Name: pacientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.pacientes (
    paciente_id integer NOT NULL,
    paciente_expediente character varying(15),
    paciente_primer_nombre character varying(25),
    paciente_segundo_nombre character varying(25),
    paciente_primer_apellido character varying(25),
    paciente_segundo_apellido character varying(25),
    paciente_fecha_nacimiento date,
    paciente_sexo boolean,
    paciente_correo character varying(50),
    paciente_trabajo character varying(50),
    paciente_telefono_casa character varying(10),
    paciente_telefono_movil character varying(10),
    paciente_telefono_oficina character varying(10),
    paciente_whatsapp boolean,
    paciente_estado boolean,
    paciente_antecedentes character varying(250),
    paciente_recordatorio boolean,
    paciente_fecha_seguimiento date,
    paciente_responsable character varying(75),
    paciente_fecha_creacion date,
    paciente_usuario_creacion character varying(50),
    paciente_fecha_modificacion date,
    paciente_usuario_modificacion character varying(50),
    paciente_notificar_correo boolean,
    paciente_codigo integer,
    paciente_usuario_usuario character varying(50),
    paciente_promocion_cumpleanyos boolean,
    paciente_promocion_general boolean
);


ALTER TABLE public.pacientes OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 41426)
-- Name: pacientes_paciente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.pacientes_paciente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pacientes_paciente_id_seq OWNER TO postgres;

--
-- TOC entry 2553 (class 0 OID 0)
-- Dependencies: 221
-- Name: pacientes_paciente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pacientes_paciente_id_seq OWNED BY public.pacientes.paciente_id;


--
-- TOC entry 222 (class 1259 OID 41428)
-- Name: patologias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.patologias (
    patologia_id integer NOT NULL,
    patologia_nombre character varying(50),
    patologia_estado boolean,
    patologia_fecha_creacion date,
    patologia_usuario_creacion character varying(50),
    patologia_fecha_modificacion date,
    patologia_usuario_modificacio character varying(50)
);


ALTER TABLE public.patologias OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 41431)
-- Name: patologias_patologia_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.patologias_patologia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.patologias_patologia_id_seq OWNER TO postgres;

--
-- TOC entry 2554 (class 0 OID 0)
-- Dependencies: 223
-- Name: patologias_patologia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.patologias_patologia_id_seq OWNED BY public.patologias.patologia_id;


--
-- TOC entry 224 (class 1259 OID 41433)
-- Name: patologias_por_pacientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.patologias_por_pacientes (
    paciente_id integer NOT NULL,
    patologia_id integer NOT NULL
);


ALTER TABLE public.patologias_por_pacientes OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 41436)
-- Name: privilegios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.privilegios (
    privilegio_id integer NOT NULL,
    submenu_id integer NOT NULL,
    privilegio_accion character varying(50)
);


ALTER TABLE public.privilegios OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 41439)
-- Name: privilegios_por_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.privilegios_por_roles (
    privilegios_id integer NOT NULL,
    submenu_id integer NOT NULL,
    roles_id integer NOT NULL
);


ALTER TABLE public.privilegios_por_roles OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 41442)
-- Name: promociones; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.promociones (
    promocion_id integer NOT NULL,
    promocion_nombre character varying(50),
    promocion_descripcion character varying(250),
    promocion_inicio date,
    promocion_fin date,
    promocion_estado boolean,
    promocion_tipo integer,
    promocion_imagen bytea,
    promocion_imagen_nombre character varying(75),
    promocion_imagen_url character varying(300),
    promocion_mensaje character varying(1000),
    promocion_activa boolean,
    promocion_fecha_creacion date,
    promocion_usuario_creacion character varying(50),
    promocion_fecha_modificacion date,
    promocion_usuario_modificacion character varying(50),
    promocion_correo_limitado_espera integer
);


ALTER TABLE public.promociones OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 41448)
-- Name: promociones_promocion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.promociones_promocion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.promociones_promocion_id_seq OWNER TO postgres;

--
-- TOC entry 2555 (class 0 OID 0)
-- Dependencies: 228
-- Name: promociones_promocion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.promociones_promocion_id_seq OWNED BY public.promociones.promocion_id;


--
-- TOC entry 229 (class 1259 OID 41450)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.roles (
    rol_id integer NOT NULL,
    rol_nombre character varying(50),
    rol_descripcion character varying(250),
    rol_fecha_creacion date,
    rol_usuario_creacion character varying(50),
    rol_fecha_modificacion date,
    rol_usuario_modificacion character varying(50),
    dashboard_id integer,
    rol_alerta boolean,
    rol_notificacion boolean
);


ALTER TABLE public.roles OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 41453)
-- Name: roles_rol_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.roles_rol_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_rol_id_seq OWNER TO postgres;

--
-- TOC entry 2556 (class 0 OID 0)
-- Dependencies: 230
-- Name: roles_rol_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_rol_id_seq OWNED BY public.roles.rol_id;


--
-- TOC entry 231 (class 1259 OID 41455)
-- Name: sub_menus_por_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sub_menus_por_roles (
    rol_id integer NOT NULL,
    submenu_id integer NOT NULL
);


ALTER TABLE public.sub_menus_por_roles OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 41458)
-- Name: submenus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.submenus (
    submenu_id integer NOT NULL,
    sumbenu_nombre character varying(50),
    menu_id integer,
    submenu_descripcion character varying(250),
    submenu_url character varying(100)
);


ALTER TABLE public.submenus OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 41461)
-- Name: submenus_submenu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.submenus_submenu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.submenus_submenu_id_seq OWNER TO postgres;

--
-- TOC entry 2557 (class 0 OID 0)
-- Dependencies: 233
-- Name: submenus_submenu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.submenus_submenu_id_seq OWNED BY public.submenus.submenu_id;


--
-- TOC entry 234 (class 1259 OID 41463)
-- Name: tipos_insumos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tipos_insumos (
    tipoinsumo_id integer NOT NULL,
    tipoinsumo_nombre character varying(50),
    tipoinsumo_descripcion character varying(250),
    tipoinsumo_estado boolean
);


ALTER TABLE public.tipos_insumos OWNER TO postgres;

--
-- TOC entry 235 (class 1259 OID 41466)
-- Name: tipos_insumos_tipoinsumo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tipos_insumos_tipoinsumo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipos_insumos_tipoinsumo_id_seq OWNER TO postgres;

--
-- TOC entry 2558 (class 0 OID 0)
-- Dependencies: 235
-- Name: tipos_insumos_tipoinsumo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipos_insumos_tipoinsumo_id_seq OWNED BY public.tipos_insumos.tipoinsumo_id;


--
-- TOC entry 236 (class 1259 OID 41468)
-- Name: tratamientos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tratamientos (
    tratamiento_id integer NOT NULL,
    tratamiento_nombre character varying(100),
    tratamiento_descripcion character varying(250),
    tratamiento_estado boolean,
    tratamiento_fecha_creacion date,
    tratamiento_usuario_creacion character varying(50),
    tratamiento_fecha_modificacion date,
    tratamiento_usuario_modificacio character varying(50)
);


ALTER TABLE public.tratamientos OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 41471)
-- Name: tratamientos_tratamiento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tratamientos_tratamiento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tratamientos_tratamiento_id_seq OWNER TO postgres;

--
-- TOC entry 2559 (class 0 OID 0)
-- Dependencies: 237
-- Name: tratamientos_tratamiento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tratamientos_tratamiento_id_seq OWNED BY public.tratamientos.tratamiento_id;


--
-- TOC entry 238 (class 1259 OID 41473)
-- Name: unidades_medidas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.unidades_medidas (
    unidadmedida_id integer NOT NULL,
    unidadmedida_nombre character varying(50),
    unidadmedida_abreviatura character varying(10),
    unidadmedida_estado boolean
);


ALTER TABLE public.unidades_medidas OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 41476)
-- Name: unidades_medidas_unidadmedida_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.unidades_medidas_unidadmedida_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unidades_medidas_unidadmedida_id_seq OWNER TO postgres;

--
-- TOC entry 2560 (class 0 OID 0)
-- Dependencies: 239
-- Name: unidades_medidas_unidadmedida_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.unidades_medidas_unidadmedida_id_seq OWNED BY public.unidades_medidas.unidadmedida_id;


--
-- TOC entry 240 (class 1259 OID 41478)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    usuario_usuario character varying(50) NOT NULL,
    rol_id integer NOT NULL,
    usuario_correo character varying(50),
    usuario_telefono character varying(10),
    usuario_contrasenia character varying(50),
    usuario_estado boolean,
    usuario_fecha_creacion date,
    usuario_fecha_modificacion date,
    usuario_bloqueado boolean,
    usuario_intento_fallido integer,
    usuario_primer_nombre character varying(25),
    usuario_segundo_nombre character varying(25),
    usuario_primer_apellido character varying(25),
    usuario_segundo_apellido character varying(25),
    usuario_nombre character varying(50),
    usuario_apellido character varying(50),
    usuario_codigo integer,
    usuario_activacion boolean,
    medico_id integer,
    paciente_id integer
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 2179 (class 2604 OID 41481)
-- Name: bitacora bitacora_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bitacora ALTER COLUMN bitacora_id SET DEFAULT nextval('public.bitacora_bitacora_id_seq'::regclass);


--
-- TOC entry 2180 (class 2604 OID 41482)
-- Name: citas cita_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.citas ALTER COLUMN cita_id SET DEFAULT nextval('public.citas_cita_id_seq'::regclass);


--
-- TOC entry 2181 (class 2604 OID 41483)
-- Name: clinicas clinica_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clinicas ALTER COLUMN clinica_id SET DEFAULT nextval('public.clinicas_clinica_id_seq'::regclass);


--
-- TOC entry 2182 (class 2604 OID 41484)
-- Name: configuraciones configuracion_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configuraciones ALTER COLUMN configuracion_id SET DEFAULT nextval('public.configuraciones_configuracion_id_seq'::regclass);


--
-- TOC entry 2183 (class 2604 OID 41485)
-- Name: consultas consulta_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consultas ALTER COLUMN consulta_id SET DEFAULT nextval('public.consultas_consulta_id_seq'::regclass);


--
-- TOC entry 2185 (class 2604 OID 41486)
-- Name: departamentos departamento_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamentos ALTER COLUMN departamento_id SET DEFAULT nextval('public.departamentos_departamento_id_seq'::regclass);


--
-- TOC entry 2186 (class 2604 OID 41487)
-- Name: detalles_consultas detalleconsulta_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalles_consultas ALTER COLUMN detalleconsulta_id SET DEFAULT nextval('public.detalles_consultas_detalleconsulta_id_seq'::regclass);


--
-- TOC entry 2187 (class 2604 OID 41488)
-- Name: direcciones direccion_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.direcciones ALTER COLUMN direccion_id SET DEFAULT nextval('public.direcciones_direccion_id_seq'::regclass);


--
-- TOC entry 2188 (class 2604 OID 41489)
-- Name: existencias existencia_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.existencias ALTER COLUMN existencia_id SET DEFAULT nextval('public.existencias_existencia_id_seq'::regclass);


--
-- TOC entry 2189 (class 2604 OID 41490)
-- Name: imagenes imagen_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagenes ALTER COLUMN imagen_id SET DEFAULT nextval('public.imagenes_imagen_id_seq'::regclass);


--
-- TOC entry 2190 (class 2604 OID 41491)
-- Name: insumos insumo_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insumos ALTER COLUMN insumo_id SET DEFAULT nextval('public.insumos_insumo_id_seq'::regclass);


--
-- TOC entry 2191 (class 2604 OID 41492)
-- Name: medicos medico_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicos ALTER COLUMN medico_id SET DEFAULT nextval('public.medicos_medico_id_seq'::regclass);


--
-- TOC entry 2192 (class 2604 OID 41493)
-- Name: menus menu_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menus ALTER COLUMN menu_id SET DEFAULT nextval('public.menus_menu_id_seq'::regclass);


--
-- TOC entry 2193 (class 2604 OID 41494)
-- Name: movimientos movimiento_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movimientos ALTER COLUMN movimiento_id SET DEFAULT nextval('public.movimientos_movimiento_id_seq'::regclass);


--
-- TOC entry 2194 (class 2604 OID 41495)
-- Name: municipios municipio_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.municipios ALTER COLUMN municipio_id SET DEFAULT nextval('public.municipios_municipio_id_seq'::regclass);


--
-- TOC entry 2195 (class 2604 OID 41496)
-- Name: odontogramas odontograma_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.odontogramas ALTER COLUMN odontograma_id SET DEFAULT nextval('public.odontogramas_odontograma_id_seq'::regclass);


--
-- TOC entry 2196 (class 2604 OID 41497)
-- Name: pacientes paciente_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pacientes ALTER COLUMN paciente_id SET DEFAULT nextval('public.pacientes_paciente_id_seq'::regclass);


--
-- TOC entry 2197 (class 2604 OID 41498)
-- Name: patologias patologia_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patologias ALTER COLUMN patologia_id SET DEFAULT nextval('public.patologias_patologia_id_seq'::regclass);


--
-- TOC entry 2198 (class 2604 OID 41499)
-- Name: promociones promocion_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promociones ALTER COLUMN promocion_id SET DEFAULT nextval('public.promociones_promocion_id_seq'::regclass);


--
-- TOC entry 2199 (class 2604 OID 41500)
-- Name: roles rol_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN rol_id SET DEFAULT nextval('public.roles_rol_id_seq'::regclass);


--
-- TOC entry 2200 (class 2604 OID 41501)
-- Name: submenus submenu_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.submenus ALTER COLUMN submenu_id SET DEFAULT nextval('public.submenus_submenu_id_seq'::regclass);


--
-- TOC entry 2201 (class 2604 OID 41502)
-- Name: tipos_insumos tipoinsumo_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipos_insumos ALTER COLUMN tipoinsumo_id SET DEFAULT nextval('public.tipos_insumos_tipoinsumo_id_seq'::regclass);


--
-- TOC entry 2202 (class 2604 OID 41503)
-- Name: tratamientos tratamiento_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tratamientos ALTER COLUMN tratamiento_id SET DEFAULT nextval('public.tratamientos_tratamiento_id_seq'::regclass);


--
-- TOC entry 2203 (class 2604 OID 41504)
-- Name: unidades_medidas unidadmedida_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unidades_medidas ALTER COLUMN unidadmedida_id SET DEFAULT nextval('public.unidades_medidas_unidadmedida_id_seq'::regclass);


--
-- TOC entry 2473 (class 0 OID 41319)
-- Dependencies: 185
-- Data for Name: bitacora; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bitacora (bitacora_id, bitacora_fecha_hora, bitacora_usuario, bitacora_transaccion) FROM stdin;
1	2019-07-18 00:00:00	Aldana	Inicio sesion.
2	2019-07-18 00:00:00	Aldana	Inicio sesion.
3	2019-07-18 00:00:00	Aldana	Inicio sesion.
4	2019-07-18 00:00:00	Aldana	Inicio sesion.
5	2019-07-18 00:00:00	Aldana	Inicio sesion.
6	2019-07-18 00:00:00	Erick	Inicio sesion.
7	2019-07-18 00:00:00	Erick	Retiró existencias de insumo (Aguja de anestesia).
8	2019-07-18 00:00:00	Aldana	Inicio sesion.
9	2019-07-18 00:00:00	Erick	Inicio sesion.
10	2019-07-18 00:00:00	Aldana	Inicio sesion.
11	2019-07-18 00:00:00	Erick	Inicio sesion.
12	2019-07-18 00:00:00	Erick	Eliminó un usuario (Diana).
13	2019-07-19 12:11:12.346	Erick	Inicio sesion.
14	2019-07-19 12:27:55.768	Aldana	Inicio sesion.
15	2019-07-19 14:12:55.491	Wilfredo	Inicio sesion.
16	2019-07-19 14:14:21.259	Diana	Inicio sesion.
17	2019-07-19 14:15:37.384	Wilfredo	Inicio sesion.
18	2019-07-19 14:18:24.273	Valeria	Inicio sesion.
19	2019-07-19 14:19:45.575	Valeria	Inicio sesion.
20	2019-07-19 14:24:20.32	Wilfredo	Inicio sesion.
21	2019-07-19 14:25:13.079	Valeria	Inicio sesion.
22	2019-07-19 14:36:31.342	Valeria	Registró una consulta a paciente (null null).
23	2019-07-19 14:39:04.427	Valeria	Editó odontograma de paciente (Marvin Pinto).
24	2019-07-19 14:46:37.873	Wilfredo	Inicio sesion.
25	2019-07-19 15:00:21.664	Wilfredo	Retiró existencias de insumo (Cemento).
26	2019-07-19 15:36:04.547	Aldana	Inicio sesion.
27	2019-07-19 15:54:19.666	Erick	Inicio sesion.
28	2019-07-19 17:06:48.203	Erick	Inicio sesion.
29	2019-07-19 17:07:15.774	Aldana	Inicio sesion.
30	2019-07-19 17:07:40.818	Wilfredo	Inicio sesion.
31	2019-07-19 17:08:25.195	Diana	Inicio sesion.
32	2019-07-19 17:49:23.975	Aldana	Inicio sesion.
33	2019-07-21 15:39:33.894	Aldana	Inicio sesion.
34	2019-07-21 15:39:47.012	Aldana	Inicio sesion.
35	2019-07-21 15:52:49.48	Aldana	Inicio sesion.
36	2019-07-21 16:13:46.169	Aldana	Inicio sesion.
37	2019-07-21 16:16:53.381	Erick	Inicio sesion.
38	2019-07-21 16:25:59.561	Aldana	Inicio sesion.
39	2019-07-21 16:26:52.832	Diana	Inicio sesion.
40	2019-07-21 16:27:02.865	Wilfredo	Inicio sesion.
41	2019-07-21 16:27:13.553	Aldana	Inicio sesion.
42	2019-07-21 16:43:27.014	Erick	Inicio sesion.
43	2019-07-21 16:44:15.432	Valeria	Inicio sesion.
44	2019-07-21 16:44:37.103	Wilfredo	Inicio sesion.
45	2019-07-21 16:45:17.451	Erick	Inicio sesion.
46	2019-07-21 16:53:01.352	Erick	Inicio sesion.
47	2019-07-21 16:53:09.235	Erick	Inicio sesion.
\.


--
-- TOC entry 2561 (class 0 OID 0)
-- Dependencies: 186
-- Name: bitacora_bitacora_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bitacora_bitacora_id_seq', 47, true);


--
-- TOC entry 2475 (class 0 OID 41324)
-- Dependencies: 187
-- Data for Name: citas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.citas (cita_id, clinica_id, medico_id, usuario_usuario, cita_fecha, cita_hora, cita_motivo, cita_fecha_creacion, cita_hora_creacion, cita_estado, cita_usuario_creacion, cita_fecha_modificacion, cita_usuario_modificacion, cita_ensala, paciente_id) FROM stdin;
5	2	\N	juanfran.aldana@gmail.com	2019-02-13	08:00:00		2019-02-13	13:53:29	4	juanfran.aldana@gmail.com	2019-02-13	juanfran.aldana@gmail.com	\N	\N
6	2	1	juanfran.aldana@gmail.com	2019-02-13	08:00:00		2019-02-13	15:52:40	1	juanfran.aldana@gmail.com	\N	\N	\N	\N
4	1	1	Diana	2019-02-13	09:00:00	Dolor en muela	2019-02-13	13:52:15	4	Diana	2019-02-13	Diana	t	\N
7	1	2	\N	2019-04-30	08:00:00	klasdfjals	2019-04-29	11:41:50	2	\N	\N	\N	\N	2
8	1	2	\N	2019-04-29	08:00:00	aksjdfjasdfjas	2019-04-29	11:43:13	2	\N	\N	\N	\N	3
9	1	2	Diana	2019-04-30	16:00:00		2019-04-29	16:06:53	2	Diana	2019-04-29	\N	\N	\N
10	1	1	Diana	2019-05-08	16:00:00		2019-05-07	10:40:19	4	Diana	2019-05-07	Diana	\N	\N
11	2	1	turh.alvarado@gmail.com	2019-05-07	09:00:00		2019-05-07	10:48:20	2	turh.alvarado@gmail.com	2019-05-07	\N	\N	\N
12	2	1	Diana	2019-05-07	16:00:00		2019-05-07	11:17:29	4	Diana	2019-05-07	Diana	\N	\N
13	1	1	Diana	2019-05-08	08:00:00		2019-05-08	17:09:41	4	Diana	2019-05-08	Diana	\N	\N
14	1	1	Diana	2019-05-08	08:00:00		2019-05-08	17:56:46	4	Diana	2019-05-08	Diana	f	4
15	1	1	Diana	2019-05-08	16:00:00		2019-05-08	21:33:48	2	Diana	2019-05-08	\N	f	4
16	2	1	Diana	2019-05-09	08:00:00		2019-05-09	12:30:48	2	Diana	2019-05-09	\N	f	4
17	1	1	\N	2019-05-09	09:00:00		2019-05-09	13:37:12	2	\N	\N	\N	\N	2
18	1	1	\N	2019-06-09	08:00:00	Motivo	2019-06-08	00:21:35	2	\N	\N	\N	\N	1
19	1	1	\N	2019-07-08	08:00:00		2019-07-07	17:52:30	2	\N	\N	\N	\N	6
20	1	1	\N	2019-07-08	09:00:00		2019-07-07	17:53:01	2	\N	\N	\N	\N	8
22	1	1	\N	2019-07-08	11:00:00		2019-07-07	17:54:09	2	\N	\N	\N	\N	10
23	2	1	\N	2019-07-08	13:00:00		2019-07-07	17:54:36	2	\N	\N	\N	\N	11
24	2	1	\N	2019-07-08	14:00:00		2019-07-07	17:55:01	2	\N	\N	\N	\N	12
25	2	1	\N	2019-07-08	15:00:00		2019-07-07	17:55:40	2	\N	\N	\N	\N	1
21	1	1	\N	2019-07-08	10:00:00		2019-07-07	17:53:41	4	\N	2019-07-07	\N	\N	9
26	1	1	JuanCarlos	2019-07-08	12:00:00		2019-07-07	17:58:57	2	JuanCarlos	2019-07-07	\N	f	\N
27	2	1	HugoJavier	2019-07-08	10:00:00		2019-07-07	18:02:44	2	HugoJavier	2019-07-07	\N	f	\N
3	1	2	Diana	2019-01-25	09:00:00	Motivo	2019-01-23	15:43:58	1	\N	\N	\N	\N	\N
28	1	1	Diana	2019-07-19	08:00:00	Dolor de muela	2019-07-19	14:15:23	3	Diana	2019-07-19	\N	t	4
\.


--
-- TOC entry 2562 (class 0 OID 0)
-- Dependencies: 188
-- Name: citas_cita_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.citas_cita_id_seq', 28, true);


--
-- TOC entry 2477 (class 0 OID 41329)
-- Dependencies: 189
-- Data for Name: clinicas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clinicas (clinica_id, clinica_nombre, clinica_correo, clinica_telefono_fijo, clinica_telefono_movil, clinica_modulo, clinica_horario_apertura, clinica_horario_cierre, clinica_estado, clinica_fecha_creacion, clinica_usuario_creacion, clinica_fecha_modificacion, clinica_usuario_modificacion) FROM stdin;
1	Smiling San Salvador	smiling.sansalvador@gmail.com	2211-4477	7845-1454	2	08:00:00	17:00:00	t	2018-10-27	Nombre de usuario	\N	\N
2	Smiling Antigua Cuscatlán	smiling.antiguocuscatlan@gmail.com	2214-7845	7485-9654	1	08:00:00	18:00:00	t	2018-10-27	Nombre de usuario	2019-04-29	Erick
\.


--
-- TOC entry 2563 (class 0 OID 0)
-- Dependencies: 190
-- Name: clinicas_clinica_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clinicas_clinica_id_seq', 2, true);


--
-- TOC entry 2479 (class 0 OID 41334)
-- Dependencies: 191
-- Data for Name: configuraciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.configuraciones (configuracion_id, configuracion_tiempo_sesion, configuracion_correo_host, configuracion_correo_port, configuracion_correo_requerido, configuracion_correo_encryptacion, configuracion_correo_cuenta, configuracion_correo_contrasenya, configuracion_correo_ilimitada, configuracion_correo_mes, configuracion_correo_dia, configuracion_correo_enviado_mes, configuracion_correo_enviado_dia, configuracion_correo_activo, configuracion_titulo, configuracion_mensaje, configuracion_imagen_superior, configuracion_imagen_inferior, configuracion_imagen_login, configuracion_promocion_cumpleanyos, configuracion_promocion_general) FROM stdin;
1	30	smtp.gmail.com	465	t	ssl	pruebascampos.er@gmail.com	ncgduudwfamaowik	f	2000	20	0	0	t	VISIÓN	Posicionarse como la mejor red de clínicas dentales en El Salvador que permita mejorar los niveles de salud bucal de nuestra sociedad. En donde se destaque la atención por su calidad, enfoque estático, responsabilidad, respeto, ética profesional, para de esta forma ir generando una relación odontólogo-paciente de confianza.	bannerfinal.png	direcciones.png	fondo.png	f	f
\.


--
-- TOC entry 2564 (class 0 OID 0)
-- Dependencies: 192
-- Name: configuraciones_configuracion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.configuraciones_configuracion_id_seq', 1, true);


--
-- TOC entry 2481 (class 0 OID 41342)
-- Dependencies: 193
-- Data for Name: consultas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.consultas (consulta_id, promocion_id, paciente_id, medico_id, consulta_motivo, consulta_diagnostico, consulta_receta, consulta_nota, consulta_fecha_creacion, consulta_usuario_creacion, consulta_fecha_modificacion, consulta_usuario_modificacion) FROM stdin;
10	5	1	2	Muela fracturada.	Paciente presenta muela fracturada debido a múltiples caries.	Se recomienda al paciente guardar reposo durante una semana y si presenta dolor deberá tomar lo siguientes analgésicos:\r\n\r\n- Acetaminofen 500mg, 2 cada 6 horas.\r\n- Ibuprofeno 600mg, 1 cada 8 horas.\r\n	Se extraera la muela y se colocara un implante dental.	2019-01-04	\N	\N	\N
9	5	1	2	Retiro de puntos debido a extracción de muela.	Se retiran los puntos de manera satisfactoria, el paciente no presento complicaciones.		Se dejara una cita agendada para poder colocarle el implante dental en lugar de la muela ausente.	2018-11-11	\N	\N	\N
8	1	1	2	Colocación de implante dental.	Se colocara un implante dental en lugar de la muela retirada en la primera consulta.		Implante se coloca sin complicaciones.	2018-11-09	\N	\N	\N
7	\N	1	1	Carié detectada en una de las muelas superiores.	Se detecta una carié la cual esta provocando dolor al paciente al ingerir alimentos, se procederá a realizar una endodoncia.	Se le recomienda al paciente si presenta dolor ingerir los siguientes analgésicos:\r\n\r\n- Acetaminofen 500mg, 2 cada 8 horas.\r\n- Ibuprofeno 600mg, 1 cada 6 horas.	La endodoncia se realiza de forma satisfactoria.	2018-11-05	\N	\N	\N
6	1	1	4	Paciente asiste por una limpieza dental.	Se realiza limpieza dental al paciente.		La limpieza se realiza de forma satisfactoria.	2018-11-04	\N	\N	\N
1	\N	1	2	Paciente asiste por una limpieza dental.	Se realiza limpieza dental al paciente.			2018-10-31	\N	\N	\N
3	\N	1	3	Carié detectada en una de las muelas inferiores.	Se detecta una carié la cual esta provocando dolor al paciente al ingerir alimentos, se procederá a realizar una endodoncia.	Se le recomienda al paciente si presenta dolor ingerir los siguientes analgésicos:\r\n\r\n- Acetaminofen 500mg, 2 cada 8 horas.\r\n- Ibuprofeno 600mg, 1 cada 6 horas.	La endodoncia se realiza de forma satisfactoria.	2018-11-04	\N	\N	\N
17	\N	3	1	Retiro de puntos debido a extracción de muela.	Se retiran los puntos de manera satisfactoria, el paciente no presento complicaciones.		Se dejara una cita agendada para poder colocarle el implante dental en lugar de la muela ausente.	2019-07-01	\N	\N	\N
4	1	1	1	Extracción de muelas cordales	Se realizara una cirugía maxilofacial para lograr extraer las cuatro muelas cordales.	Se recomienda al paciente guardar reposo durante una semana y si presenta dolor deberá tomar lo siguientes analgésicos:\r\n\r\n- Acetaminofen 500mg, 2 cada 6 horas.\r\n- Ibuprofeno 600mg, 1 cada 8 horas.	Se realiza con éxito la cirugía se cita al paciente la siguiente semana para retirar puntos de sutura.	2018-11-04	\N	\N	\N
2	1	1	2	Retiro de puntos debido a extracción de muela.	Se retiran los puntos de manera satisfactoria, el paciente no presento complicaciones.		Se dejara una cita agendada para poder colocarle el implante dental en lugar de la muela ausente.	2018-11-01	\N	\N	\N
11	\N	2	1	Carié detectada en una de las muelas superiores.	Se detecta una carié la cual esta provocando dolor al paciente al ingerir alimentos, se procederá a realizar una endodoncia.	Se le recomienda al paciente si presenta dolor ingerir los siguientes analgésicos:\r\n\r\n- Acetaminofen 500mg, 2 cada 8 horas.\r\n- Ibuprofeno 600mg, 1 cada 6 horas.	La endodoncia se realiza de forma satisfactoria.\r\n	2019-07-01	\N	\N	\N
12	1	2	1	Paciente asiste por una limpieza dental.	Se realiza limpieza dental al paciente.		La limpieza se realiza de forma satisfactoria.	2019-07-01	\N	\N	\N
13	\N	2	1	Muela fracturada.	Paciente presenta muela fracturada debido a múltiples caries.	Se recomienda al paciente guardar reposo durante una semana y si presenta dolor deberá tomar lo siguientes analgésicos:\r\n\r\n- Acetaminofen 500mg, 2 cada 6 horas.\r\n- Ibuprofeno 600mg, 1 cada 8 horas.	Se extrajo la muela de forma satisfactoria, paciente indica que pensara si prefiere una corona o un implante dental para suplantar la muela ausente.	2019-07-01	\N	\N	\N
14	\N	2	1	Retiro de puntos debido a extracción de muela.	Se retiran los puntos de manera satisfactoria.		Se dejara una cita agendada para poder colocarle el implante dental en lugar de la muela ausente.	2019-07-01	\N	\N	\N
15	1	3	1	Paciente asiste por una limpieza dental.	Se realiza limpieza dental al paciente.		La limpieza se realiza de forma satisfactoria.	2019-07-01	\N	\N	\N
5	1	3	1	Carié detectada en una de las muelas superiores.	Se detecta una carié la cual esta provocando dolor al paciente al ingerir alimentos, se procederá a realizar una endodoncia.	Se le recomienda al paciente si presenta dolor ingerir los siguientes analgésicos:\r\n\r\n- Acetaminofen 500mg, 2 cada 8 horas.\r\n- Ibuprofeno 600mg, 1 cada 6 horas.	La endodoncia se realiza de forma satisfactoria.	2018-11-04	\N	\N	\N
16	\N	3	1	Muela fracturada.	Paciente presenta muela fracturada debido a múltiples caries.	Se recomienda al paciente guardar reposo durante una semana y si presenta dolor deberá tomar lo siguientes analgésicos:\r\n\r\n- Acetaminofen 500mg, 2 cada 10 horas.\r\n- Ibuprofeno 600mg, 1 cada 8 horas.\r\n	Se extraera la muela y se colocara un implante dental.	2019-07-01	\N	\N	\N
18	\N	4	1	Carié detectada en una de las muelas superiores.	Se detecta una carié la cual esta provocando dolor al paciente al ingerir alimentos, se procederá a realizar una endodoncia.	Se le recomienda al paciente si presenta dolor ingerir los siguientes analgésicos:\r\n\r\n- Acetaminofen 500mg, 2 cada 8 horas.\r\n- Ibuprofeno 600mg, 1 cada 6 horas.	La endodoncia se realiza de forma satisfactoria.	2019-07-01	\N	\N	\N
19	\N	4	1	Paciente asiste por una limpieza dental.	Se realiza limpieza dental al paciente.		La limpieza se realiza de forma satisfactoria.	2019-07-01	\N	\N	\N
20	\N	4	1	Muela fracturada.	Paciente presenta muela fracturada debido a múltiples caries.	Se recomienda al paciente guardar reposo durante una semana y si presenta dolor deberá tomar lo siguientes analgésicos:\r\n\r\n- Acetaminofen 500mg, 2 cada 6 horas.\r\n- Ibuprofeno 600mg, 1 cada 8 horas.	Se extraera la muela y se colocara un implante dental.	2019-07-01	\N	\N	\N
21	\N	4	1	Retiro de puntos debido a extracción de muela.\r\n	Se retiran los puntos de manera satisfactoria, el paciente no presento complicaciones.		Se dejara una cita agendada para poder colocarle el implante dental en lugar de la muela ausente.	2019-07-01	\N	\N	\N
22	\N	4	1	Paciente presenta dolor de muela	Muela fracturada	Ibuprofeno. Tomar cada 6 horas por 4 dias	Se requiere extraccion	2019-07-19	\N	\N	\N
\.


--
-- TOC entry 2565 (class 0 OID 0)
-- Dependencies: 194
-- Name: consultas_consulta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.consultas_consulta_id_seq', 22, true);


--
-- TOC entry 2484 (class 0 OID 41352)
-- Dependencies: 196
-- Data for Name: dashboard; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dashboard (dashboard_id, dashboard_nombre, dashboard_descripcion, dashboard_url, dashboard_imagen) FROM stdin;
1	Básico	Muestra un mensaje de Bienvenida	/templates/dashboard/basico.xhtml	/templates/dashboard/basico.png
2	Estadistica	Muestra estadisticas general de la clínica	/templates/dashboard/estadisticas.xhtml	/templates/dashboard/estadisticas.png
3	Médicos	Muestra citas o compromisos del médico	/templates/dashboard/medico.xhtml	/templates/dashboard/medico.png
4	Paciente	Registro rápido de citas y citas reservadas	/templates/dashboard/paciente.xhtml	/templates/dashboard/paciente.png
5	Administración	Muestra los la cantidad de registro del SIAEC	/templates/dashboard/administracion.xhtml	/templates/dashboard/administracion.png
6	Asistente	Muestras las citas del día.	/templates/dashboard/asistente.xhtml	/templates/dashboard/asistente.png
7	Vacio	Muestra una pantalla en blanco	/templates/dashboard/vacio.xhtml	/templates/dashboard/vacio.png
\.


--
-- TOC entry 2566 (class 0 OID 0)
-- Dependencies: 195
-- Name: dashboard_dashboard_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dashboard_dashboard_id_seq', 1, true);


--
-- TOC entry 2485 (class 0 OID 41356)
-- Dependencies: 197
-- Data for Name: departamentos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.departamentos (departamento_id, departamento_nombre) FROM stdin;
1	Ahuachapán
2	Cabañas
3	Chalatenango
4	Cuscatlán
5	La Libertad
6	La Paz
7	La Unión
8	Morazán
9	San Miguel
10	San Salvador
11	San Vicente
12	Santa Ana
13	Sonsonate
14	Usulután
\.


--
-- TOC entry 2567 (class 0 OID 0)
-- Dependencies: 198
-- Name: departamentos_departamento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departamentos_departamento_id_seq', 1, false);


--
-- TOC entry 2487 (class 0 OID 41361)
-- Dependencies: 199
-- Data for Name: detalles_consultas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detalles_consultas (detalleconsulta_id, tratamiento_id, paciente_id, detalleconsulta_pieza, detalleconsulta_tratamiento, detalleconsulta_cargo, detalleconsulta_abono, detalleconsulta_fecha_creacion, detalleconsulta_usuario_creacio) FROM stdin;
1	3	1	28	\N	30	30	2018-11-03	Nombre Usuario
2	4	1	38	\N	50	45	2018-11-03	Nombre Usuario
3	6	1	18	\N	20	20	2018-11-04	Nombre Usuario
6	1	1	25	\N	50	25	2018-11-05	Nombre Usuario
7	5	1	22	\N	50	45	2018-11-05	Nombre Usuario
8	7	1	55	\N	80	70	2018-11-05	Nombre Usuario
9	3	1	22	\N	90	80	2018-11-05	Nombre Usuario
10	1	1	44	\N	50	50	2018-11-05	Nombre Usuario
11	5	1	55	\N	10	10	2018-11-05	Nombre Usuario
12	6	1	65	\N	60	60	2018-11-05	Nombre Usuario
13	2	1	12	\N	10	10	2018-11-05	Nombre Usuario
21	1	2	32	\N	50	30	2018-11-06	Nombre Usuario
22	3	5	35	\N	40	30	2018-11-11	Nombre Usuario
4	4	1	19	\N	10	10	2018-11-05	Nombre Usuario
5	2	1	27	\N	10	10	2018-11-05	Nombre Usuario
23	3	2	45	\N	50	50	2019-07-01	Nombre Usuario
24	3	3	35	\N	50	50	2019-07-01	Nombre Usuario
17	1	3	15	\N	50	50	2018-11-05	Nombre Usuario
14	3	4	45	\N	50	50	2018-11-05	Nombre Usuario
20	1	4	28	\N	40	40	2018-11-05	Nombre Usuario
\.


--
-- TOC entry 2568 (class 0 OID 0)
-- Dependencies: 200
-- Name: detalles_consultas_detalleconsulta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.detalles_consultas_detalleconsulta_id_seq', 25, true);


--
-- TOC entry 2489 (class 0 OID 41369)
-- Dependencies: 201
-- Data for Name: direcciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.direcciones (direccion_id, paciente_id, medico_id, clinica_id, municipio_id, direccion_colonia, direccion_calle, direccion_casa, direccion_pasaje, direccion_poligono, direccion_apartamento) FROM stdin;
1	\N	1	\N	114	Los Naranjos	Principal	49	A	4	Libertad
2	\N	2	\N	114	Las Jacarandas	Dua	22	B	2	Cruz Roja
3	\N	3	\N	183	Buena Vista	Metropolitana	25	A	5	Futura
4	\N	4	\N	21	Futura	La Mascota	12	El Trebol	C	la Luz
5	\N	\N	1	193	Médica	El Matasano	12	Cruz Roja	C	Médico
6	\N	\N	2	71	Libertad	La Paz	11	A	B	La Torre
8	2	\N	\N	191	10 de Octubre	Metralla	4	C	A	Casino
9	3	\N	\N	193	San Luis	San Antonio Abad	1	Pradera|	C	A
10	4	\N	\N	193	Escalón	Primavera	89	A	4	El Roble
11	5	\N	\N	180	Madre Tierra	Principal	2	A	20	La Ceiba
12	6	\N	\N	180	Los Limones	Principal	48	A	B	El Trebol
13	7	\N	\N	1	IVU	Avenida Morazán	14			
14	8	\N	\N	182	Magaña		87	Apaneca		
15	9	\N	\N	71	San Juan de Dios	Avenida Duran	3-24			
16	10	\N	\N	214	Girasoles	Principal	18			
17	11	\N	\N	71	Jardines de Guadalupe	Calle del Egeo	17			
18	12	\N	\N	27	La Labor	Principal	3-24			
19	13	\N	\N	183	El Progreso	Principal	24			
20	14	\N	\N	193	Barrio Universitario	Calle Los Lirios y Avenida Las Violetas	40			
21	15	\N	\N	175	Barrio El Calvario	Avenida Francisco Menendez	33			
22	16	\N	\N	56	Colonia el Barro		19	San Juan		
23	17	\N	\N	193	La Cima	Calle el Mirador	18			
24	18	\N	\N	73	Barrio El Amate	Avenida La Revolución	3-14			
25	19	\N	\N	193	Colonia Las Cumbres	Calle El Pedregal	43			
26	20	\N	\N	80	Arcos de San Francisco		24	La Asunción		
27	21	\N	\N	74	Las Flores	Calle El Amanecer	34			
28	22	\N	\N	193	Colonia Moserat		12	Amatepec		
29	23	\N	\N	193	Colonia San Luis	Calle Los Lirios	24			
30	24	\N	\N	114	Colonia Constitución		32	Pasaje Juarez		
31	25	\N	\N	193	Barrio El Saulito	Calle El Mirador	88			
32	26	\N	\N	193	Colonia Olimpica	Calle El Torogoz	45			
33	27	\N	\N	1	Colonia IVU	Avenida Morazán	25			
34	28	\N	\N	58	Colonia La Rosa			Las Gardenias		
35	29	\N	\N	193	Colonia San Luis	Calle El Torogoz	76			
36	30	\N	\N	193	Colonia Satelite	Calle Atlacat	14			
37	31	\N	\N	193	Colonia San Gabirel		23	Pasaje San Juan		
38	32	\N	\N	81	Colonia Los Lirios		35	Pasaje B		
39	33	\N	\N	191	Colonia Verapaz	Calle La Mascota	27			
40	34	\N	\N	25	Colonia Maquilishuat	Calle Los Rosales	8			
41	35	\N	\N	193	Colonia La Paz		21	Pasaje Monserat		
42	36	\N	\N	193	Colonia Roma	Avenida Morazán	34			
43	37	\N	\N	26	Colonia Las Rosales		43	Pasaje Israel		
44	38	\N	\N	214	Colonia Moserat		32	Pasaje Fonseca		
45	39	\N	\N	81	Colonia Israel		5	Pasaje Las Gardenias		
46	40	\N	\N	225	Colonia Los Italia			Pasaje Milan		
47	41	\N	\N	193	Colonia España		19	Pasaje Madrid		
48	42	\N	\N	193	Colonia Holanda		15	Pasaje Amsterdam		
49	43	\N	\N	193	Colonia La Cima		27	Pasaje Flores		
50	44	\N	\N	205	Colonia Don Bosco		11	Pasaje San Juan		
51	45	\N	\N	191	Colonia Los Planes		115	Pasaje Olocuilta		
52	46	\N	\N	193	Colonia Universitaria	Calle La Revolución	17			
53	47	\N	\N	181	Colonia Los Angeles		32	Pasaje Los Claveles		
54	48	\N	\N	83	Colonia La Libertad		25	Pasaje San Lucas		
55	49	\N	\N	66	Colonia San Lazaro		124	Pasaje Industrial		
56	50	\N	\N	193	Colonia España		43	Pasaje Barcelona		
57	51	\N	\N	193	Colonia Roma	Calle Olimpica	20			
58	52	\N	\N	193	Colonia La Gloria		23	Pasaje B		
7	1	\N	\N	193	Colonia Miralvalle	Calle Principal	1	Pasaje Barcelona	A	
\.


--
-- TOC entry 2569 (class 0 OID 0)
-- Dependencies: 202
-- Name: direcciones_direccion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.direcciones_direccion_id_seq', 58, true);


--
-- TOC entry 2491 (class 0 OID 41374)
-- Dependencies: 203
-- Data for Name: existencias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.existencias (existencia_id, insumo_id, clinica_id, existencia_cantidad) FROM stdin;
3	2	1	2000
12	6	2	10
19	10	1	5
20	10	2	5
7	4	1	10
8	4	2	8
9	5	1	40
10	5	2	50
5	3	1	600
6	3	2	900
13	7	1	10
14	7	2	12
15	8	1	5
16	8	2	10
4	2	2	1100
2	1	2	7000
1	1	1	6500
18	9	2	104
17	9	1	100
11	6	1	5
\.


--
-- TOC entry 2570 (class 0 OID 0)
-- Dependencies: 204
-- Name: existencias_existencia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.existencias_existencia_id_seq', 20, true);


--
-- TOC entry 2493 (class 0 OID 41379)
-- Dependencies: 205
-- Data for Name: imagenes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.imagenes (imagen_id, paciente_id, imagen_nombre, imagen_anotacion, imagen_imagen, imagen_url, imagen_fecha_creacion, imagen_usuario_creacion) FROM stdin;
13	3	Diente1.jpg	Esta es una anotación de la imagen tomada al paciente en la consulta.	\N	c://Users/Fam. Gomez Aldana/Documents/NetBeansProjects/siaec/web/images/pacientes/3/Diente1.jpg	2018-11-04	Nombre Usuario
14	3	Diente2.jpg	Esta es una anotación de la imagen tomada al paciente en la consulta.	\N	c://Users/Fam. Gomez Aldana/Documents/NetBeansProjects/siaec/web/images/pacientes/3/Diente2.jpg	2018-11-04	Nombre Usuario
15	3	Diente3.jpg	Esta es una anotación de la imagen tomada al paciente en la consulta.	\N	c://Users/Fam. Gomez Aldana/Documents/NetBeansProjects/siaec/web/images/pacientes/3/Diente3.jpg	2018-11-04	Nombre Usuario
16	4	Diente1.jpg	Esta es una anotación de la imagen tomada al paciente en la consulta.	\N	c://Users/Fam. Gomez Aldana/Documents/NetBeansProjects/siaec/web/images/pacientes/4/Diente1.jpg	2018-11-04	Nombre Usuario
17	4	Diente2.jpg	Esta es una anotación de la imagen tomada al paciente en la consulta.	\N	c://Users/Fam. Gomez Aldana/Documents/NetBeansProjects/siaec/web/images/pacientes/4/Diente2.jpg	2018-11-04	Nombre Usuario
18	4	Diente3.jpg	Esta es una anotación de la imagen tomada al paciente en la consulta.	\N	c://Users/Fam. Gomez Aldana/Documents/NetBeansProjects/siaec/web/images/pacientes/4/Diente3.jpg	2018-11-04	Nombre Usuario
20	4	Diente5.jpg	Esta es una anotación de la imagen tomada al paciente en la consulta.	\N	c://Users/Fam. Gomez Aldana/Documents/NetBeansProjects/siaec/web/images/pacientes/4/Diente5.jpg	2018-11-04	Nombre Usuario
21	3	Diente4.jpg	Esta es una anotación de la imagen tomada al paciente en la consulta.	\N	c://Users/Fam. Gomez Aldana/Documents/NetBeansProjects/siaec/web/images/pacientes/3/Diente4.jpg	2018-11-04	Nombre Usuario
22	3	Diente5.jpg	Esta es una anotación de la imagen tomada al paciente en la consulta.	\N	c://Users/Fam. Gomez Aldana/Documents/NetBeansProjects/siaec/web/images/pacientes/3/Diente5.jpg	2018-11-04	Nombre Usuario
19	4	Diente4.jpg	Esta es una anotación de la imagen tomada al paciente en la consulta.	\N	c://Users/Fam. Gomez Aldana/Documents/NetBeansProjects/siaec/web/images/pacientes/4/Diente4.jpg	2018-11-04	Nombre Usuario
23	3	Diente6.jpg	Esta es una anotación de la imagen tomada al paciente en la consulta.	\N	c://Users/Fam. Gomez Aldana/Documents/NetBeansProjects/siaec/web/images/pacientes/3/Diente6.jpg	2018-11-04	Nombre Usuario
4	1	Diente2.jpg	Esta es una anotación de la imagen tomada al paciente en la consulta.	\N	c://Users/Fam. Gomez Aldana/Documents/NetBeansProjects/siaec/web/images/pacientes/1/Diente2.jpg	2018-10-29	Nombre Usuario
5	1	Diente3.jpg	Esta es una anotación de la imagen tomada al paciente en la consulta.	\N	c://Users/Fam. Gomez Aldana/Documents/NetBeansProjects/siaec/web/images/pacientes/1/Diente3.jpg	2018-10-29	Nombre Usuario
6	2	Diente1.jpg	Esta es una anotación de la imagen tomada al paciente en la consulta.	\N	c://Users/Fam. Gomez Aldana/Documents/NetBeansProjects/siaec/web/images/pacientes/2/Diente1.jpg	2018-10-29	Nombre Usuario
25	4	Diente6.jpg	Esta es una anotación de la imagen tomada al paciente en la consulta.	\N	c://Users/Fam. Gomez Aldana/Documents/NetBeansProjects/siaec/web/images/pacientes/4/Diente6.jpg	2018-11-04	Nombre Usuario
26	3	Diente7.jpg	Esta es una anotación de la imagen tomada al paciente en la consulta.	\N	c://Users/Fam. Gomez Aldana/Documents/NetBeansProjects/siaec/web/images/pacientes/3/Diente7.jpg	2018-11-05	Nombre Usuario
27	2	Diente5.jpg	Esta es una anotación de la imagen tomada al paciente en la consulta.	\N	c://Users/Fam. Gomez Aldana/Documents/NetBeansProjects/siaec/web/images/pacientes/2/Diente5.jpg	2018-11-06	Nombre Usuario
32	5	11 Noviembre 2018.jpg	Imagen de prueba2	\N	C:\\Users\\Fam. Gomez Aldana\\Documents\\NetBeansProjects\\siaec\\build\\web\\images\\pacientes/5/11 Noviembre 2018.jpg	2018-12-10	Nombre Usuario
36	1	09 Septiembre 2018.jpg	Esta es una anotación de la imagen tomada al paciente en la consulta.	\N	C:\\Users\\Fam. Gomez Aldana\\Documents\\NetBeansProjects\\siaec\\build\\web\\images\\pacientes/1/09 Septiembre 2018.jpg	2018-12-14	Nombre Usuario
1	1	Diente7.jpg	Esta es una anotación de la imagen tomada al paciente en la consulta.	\N	c://Users/Fam. Gomez Aldana/Documents/NetBeansProjects/siaec/web/images/pacientes/1/Diente7.jpg	2018-10-29	Nombre Usuario
2	1	Diente6.jpg	Esta es una anotación de la imagen tomada al paciente en la consulta.	\N	c://Users/Fam. Gomez Aldana/Documents/NetBeansProjects/siaec/web/images/pacientes/1/Diente6.jpg	2018-10-29	Nombre Usuario
3	1	Diente1.jpg	Esta es una anotación de la imagen tomada al paciente en la consulta.	\N	c://Users/Fam. Gomez Aldana/Documents/NetBeansProjects/siaec/web/images/pacientes/1/Diente1.jpg	2018-10-29	Nombre Usuario
7	1	Diente4.jpg	Esta es una anotación de la imagen tomada al paciente en la consulta.	\N	c://Users/Fam. Gomez Aldana/Documents/NetBeansProjects/siaec/web/images/pacientes/1/Diente4.jpg	2018-10-29	Nombre Usuario
8	1	Diente5.jpg	Esta es una anotación de la imagen tomada al paciente en la consulta.	\N	c://Users/Fam. Gomez Aldana/Documents/NetBeansProjects/siaec/web/images/pacientes/1/Diente5.jpg	2018-10-29	Nombre Usuario
9	2	Diente2.jpg	Esta es una anotación de la imagen tomada al paciente en la consulta.	\N	c://Users/Fam. Gomez Aldana/Documents/NetBeansProjects/siaec/web/images/pacientes/2/Diente2.jpg	2018-10-29	Nombre Usuario
10	1	Diente8.jpg	Esta es una anotación de la imagen tomada al paciente en la consulta.	\N	c://Users/Fam. Gomez Aldana/Documents/NetBeansProjects/siaec/web/images/pacientes/1/Diente8.jpg	2018-11-04	Nombre Usuario
11	2	Diente3.jpg	Esta es una anotación de la imagen tomada al paciente en la consulta.	\N	c://Users/Fam. Gomez Aldana/Documents/NetBeansProjects/siaec/web/images/pacientes/2/Diente3.jpg	2018-11-04	Nombre Usuario
12	2	Diente4.jpg	Esta es una anotación de la imagen tomada al paciente en la consulta.	\N	c://Users/Fam. Gomez Aldana/Documents/NetBeansProjects/siaec/web/images/pacientes/2/Diente4.jpg	2018-11-04	Nombre Usuario
37	1	03 Marzo a Julio 2018.jpg	Esta es una anotación de la imagen tomada al paciente en la consulta.	\N	C:\\Users\\Fam. Gomez Aldana\\Documents\\NetBeansProjects\\siaec\\build\\web\\images\\pacientes/1/03 Marzo a Julio 2018.jpg	2018-12-14	Nombre Usuario
\.


--
-- TOC entry 2571 (class 0 OID 0)
-- Dependencies: 206
-- Name: imagenes_imagen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.imagenes_imagen_id_seq', 37, true);


--
-- TOC entry 2495 (class 0 OID 41387)
-- Dependencies: 207
-- Data for Name: insumos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.insumos (insumo_id, tipoinsumo_id, unidadmedida_id, insumo_nombre, insumo_descripcion, insumo_minimo, insumo_estado, insumo_fecha_creacion, insumo_usuario_creacion, insumo_fecha_modificacion, insumo_usuario_modificacion) FROM stdin;
1	1	2	Algodón	Esta es una descripción de insumo	5000	t	2018-10-28	Nombre de usuario	\N	\N
3	1	2	Sellante	Esta es una descripción de insumo	500	t	2018-10-28	Nombre de usuario	\N	\N
4	1	6	Guantes	Esta es una descripción de insumo	3	t	2018-10-28	Nombre de usuario	\N	\N
6	1	5	Cemento	Esta es una descripción de insumo	5	t	2018-10-28	Nombre de usuario	\N	\N
5	1	10	Jeringa	Esta es una descripción de insumo	30	t	2018-10-28	Nombre de usuario	2018-10-28	Nombre de usuario
7	2	6	Servilleta facial	Esta es una descripción de insumo	4	t	2018-10-28	Nombre de usuario	\N	\N
8	2	6	Tapaboca	Esta es una descripción de insumo	2	t	2018-10-28	Nombre de usuario	\N	\N
9	2	6	Aguja de anestesia	Esta es una descripción de insumo	4	t	2018-10-28	Nombre de usuario	\N	\N
10	2	6	Grapa de aislamiento	Esta es una descripción de insumo	3	t	2018-10-28	Nombre de usuario	\N	\N
2	1	7	Anestesia	Esta es una descripción de insumo	1000	t	2018-10-28	Nombre de usuario	2018-11-09	Nombre de usuario
\.


--
-- TOC entry 2572 (class 0 OID 0)
-- Dependencies: 208
-- Name: insumos_insumo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.insumos_insumo_id_seq', 10, true);


--
-- TOC entry 2497 (class 0 OID 41392)
-- Dependencies: 209
-- Data for Name: medicos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medicos (medico_id, medico_primer_nombre, medico_segundo_nombre, medico_primer_apellido, medico_segundo_apellido, medico_fecha_nacimiento, medico_sexo, medico_correo, medico_especialidad, medico_telefono_casa, medico_telefono_movil, medico_numero_acreditacion, medico_estado, medico_usuario, medico_fecha_creacion, medico_usuario_creacion, medico_fecha_modificacion, medico_usuario_modificacion) FROM stdin;
3	Jacqueline	Yessenia	Nieto	Palacios	1986-12-27	f	jacqueline.nieto@yahoo.es	Periodoncia	2233-5656	7412-5478	9123	t	\N	2018-10-27	Nombre de usuario	\N	\N
4	Johana	Beatriz	Guzmán	Flores	1990-05-27	f	johana.guzman@gmail.com	Prostodoncia	2356-8974	7412-5896	4567	t	\N	2018-10-27	Nombre de usuario	\N	\N
1	Valeria	Guadalupe	Campos	Gomez	1990-09-20	f	jessica.rivas@gmail.com	Odontología general	2255-4488	7788-5544	1234	t	Valeria	2018-10-27	Nombre de usuario	2019-07-01	Erick
2	Erick	Eduardo	Campos	Rivas	1993-12-16	f	erick.campos@hotmail.com	Ortodoncia	2514-2536	7845-1245	5678	t	\N	2018-10-27	Nombre de usuario	2018-10-27	Nombre de usuario
\.


--
-- TOC entry 2573 (class 0 OID 0)
-- Dependencies: 210
-- Name: medicos_medico_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.medicos_medico_id_seq', 4, true);


--
-- TOC entry 2499 (class 0 OID 41397)
-- Dependencies: 211
-- Data for Name: menus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menus (menu_id, menu_nombre) FROM stdin;
1	Agenda
2	Pacientes
3	Insumos
4	Promociones
5	Reportes
6	Administración
7	Configuración
8	Ayuda
9	Perfil
\.


--
-- TOC entry 2574 (class 0 OID 0)
-- Dependencies: 212
-- Name: menus_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menus_menu_id_seq', 1, false);


--
-- TOC entry 2501 (class 0 OID 41402)
-- Dependencies: 213
-- Data for Name: menus_por_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.menus_por_roles (rol_id, menu_id) FROM stdin;
1	6
1	7
1	8
2	1
2	2
2	3
2	4
2	5
2	6
2	7
2	8
3	2
3	4
3	5
3	8
4	1
4	2
4	3
4	4
4	5
4	8
5	1
5	8
\.


--
-- TOC entry 2502 (class 0 OID 41405)
-- Dependencies: 214
-- Data for Name: movimientos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.movimientos (movimiento_id, existencia_id, movimiento_cantidad, movimiento_tipo, movimiento_fecha_creacion, movimiento_usuario_creacion) FROM stdin;
1	17	500	t	2018-10-29	Nombre Usuario
2	1	5000	t	2018-11-09	Nombre Usuario
3	17	100	f	2018-11-09	Nombre Usuario
4	17	100	f	2018-11-10	Nombre Usuario
5	18	10	t	2018-11-11	Nombre Usuario
6	2	10000	t	2018-11-11	Nombre Usuario
7	3	2000	t	2018-11-11	Nombre Usuario
8	4	1500	t	2018-11-11	Nombre Usuario
9	11	7	t	2018-11-11	Nombre Usuario
10	12	10	t	2018-11-11	Nombre Usuario
11	19	5	t	2018-11-11	Nombre Usuario
12	20	5	t	2018-11-11	Nombre Usuario
13	7	10	t	2018-11-11	Nombre Usuario
14	8	8	t	2018-11-11	Nombre Usuario
15	9	40	t	2018-11-11	Nombre Usuario
16	10	50	t	2018-11-11	Nombre Usuario
17	5	600	t	2018-11-11	Nombre Usuario
18	6	900	t	2018-11-11	Nombre Usuario
19	13	10	t	2018-11-11	Nombre Usuario
20	14	12	t	2018-11-11	Nombre Usuario
21	15	5	t	2018-11-11	Nombre Usuario
22	16	1	t	2018-11-11	Nombre Usuario
23	16	10	t	2018-11-11	Nombre Usuario
24	16	11	f	2018-11-11	Nombre Usuario
25	16	10	t	2018-11-11	Nombre Usuario
26	4	600	f	2018-11-11	Nombre Usuario
27	4	900	f	2018-11-11	Nombre Usuario
28	4	2000	t	2018-11-11	Nombre Usuario
29	4	1100	f	2018-11-11	Nombre Usuario
30	4	900	f	2018-11-11	Nombre Usuario
31	4	2000	t	2018-11-11	Nombre Usuario
32	4	1100	f	2018-11-11	Nombre Usuario
33	1	5000	f	2018-11-13	Nombre Usuario
34	1	6000	t	2018-11-13	Nombre Usuario
35	4	200	t	2018-11-13	Nombre Usuario
36	18	5	t	2019-01-11	Nombre Usuario
37	17	100	f	2019-01-11	Nombre Usuario
38	2	3000	f	2019-01-11	Nombre Usuario
39	1	1000	t	2019-01-11	Nombre Usuario
40	1	500	f	2019-01-11	Nombre Usuario
41	18	11	f	2019-01-11	Nombre Usuario
42	17	200	f	2019-01-11	Nombre Usuario
43	18	100	\N	2019-07-07	Nombre Usuario
44	17	200	\N	2019-07-07	Nombre Usuario
45	17	100	f	2019-07-18	Nombre Usuario
46	11	2	f	2019-07-19	Nombre Usuario
\.


--
-- TOC entry 2575 (class 0 OID 0)
-- Dependencies: 215
-- Name: movimientos_movimiento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.movimientos_movimiento_id_seq', 46, true);


--
-- TOC entry 2504 (class 0 OID 41410)
-- Dependencies: 216
-- Data for Name: municipios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.municipios (municipio_id, departamento_id, municipio_nombre) FROM stdin;
1	1	Ahuachapán
2	1	Apaneca
3	1	Atiquizaya
4	1	Concepción de Ataco
5	1	El Refugio
6	1	Guaymango
7	1	Jujutla
8	1	San Francisco Menéndez
9	1	San Lorenzo
10	1	San Pedro Puxtla
11	1	Tacuba
12	1	Turín
13	2	Cinquera
14	2	Dolores
15	2	Guacotecti
16	2	Ilobasco
17	2	Jutiapa
18	2	San Isidro
19	2	Sensuntepeque
20	2	Tejutepeque
21	2	Victoria
22	3	Agua Caliente
23	3	Arcatao
24	3	Azacualpa
25	3	Chalatenango
26	3	Comalapa
27	3	Citalá
28	3	Concepción Quezaltepeque
29	3	Dulce Nombre de María
30	3	El Carrizal
31	3	El Paraíso
32	3	La Laguna
33	3	La Palma
34	3	La Reina
35	3	Las Vueltas
36	3	Nueva Concepción
37	3	Nueva Trinidad
38	3	Nombre de Jesús
39	3	Ojos de Agua
40	3	Potonico
41	3	San Antonio de la Cruz
42	3	San Antonio Los Ranchos
43	3	San Fernando
44	3	San Francisco Lempa
45	3	San Francisco Morazán
46	3	San Ignacio
47	3	San Isidro Labrador
48	3	San José Cancasque
49	3	San José Las Flores
50	3	San Luis del Carmen
51	3	San Miguel de Mercedes
52	3	San Rafael
53	3	Santa Rita
54	3	Tejutla
55	4	Candelaria
56	4	Cojutepeque
57	4	El Carmen
58	4	El Rosario
59	4	Monte San Juan
60	4	Oratorio de Concepción
61	4	San Bartolomé Perulapía
62	4	San Cristóbal
63	4	San José Guayabal
64	4	San Pedro Perulapán
65	4	San Rafael Cedros
66	4	San Ramón
67	4	Santa Cruz Analquito
68	4	Santa Cruz Michapa
69	4	Suchitoto
70	4	Tenancingo
71	5	Antiguo Cuscatlán
72	5	Chiltiupán
73	5	Ciudad Arce
74	5	Colón
75	5	Comasagua
76	5	Huizúcar
77	5	Jayaque
78	5	Jicalapa
79	5	La Libertad
80	5	Santa Tecla
81	5	Nuevo Cuscatlán
82	5	San Juan Opico
83	5	Quezaltepeque
84	5	Sacacoyo
85	5	San José Villanueva
86	5	San Matías
87	5	San Pablo Tacachico
88	5	Talnique
89	5	Tamanique
90	5	Teotepeque
91	5	Tepecoyo
92	5	Zaragoza
93	6	Cuyultitán
94	6	El Rosario
95	6	Jerusalén
96	6	Mercedes La Ceiba
97	6	Olocuilta
98	6	Paraíso de Osorio
99	6	San Antonio Masahuat
100	6	San Emigdio
101	6	San Francisco Chinameca
102	6	San Juan Nonualco
103	6	San Juan Talpa
104	6	San Juan Tepezontes
105	6	San Luis Talpa
106	6	San Luis La Herradura
107	6	San Miguel Tepezontes
108	6	San Pedro Masahuat
109	6	San Pedro Nonualco
110	6	San Rafael Obrajuelo
111	6	Santa María Ostuma
112	6	Santiago Nonualco
113	6	Tapalhuaca
114	6	Zacatecoluca
115	7	Anamorós
116	7	Bolivar
117	7	Concepción de Oriente
118	7	Conchagua
119	7	El Carmen
120	7	El Sauce
121	7	Intipucá
122	7	La Unión
123	7	Lislique
124	7	Meanguera del Golfo
125	7	Nueva Esparta
126	7	Pasaquina
127	7	Polorós
128	7	San Alejo
129	7	San José
130	7	Santa Rosa de Lima
131	7	Yayantique
132	7	Yucuaiquín
133	8	Arambala
134	8	Cacaopera
135	8	Chilanga
136	8	Corinto
137	8	Delicias de Concepción
138	8	El Divisadero
139	8	El Rosario
140	8	Gualococti
141	8	Guatajiagua
142	8	Joateca
143	8	Jocoaitique
144	8	Jocoro
145	8	Lolotiquillo
146	8	Meanguera
147	8	Osicala
148	8	Perquín
149	8	San Carlos
150	8	San Fernando
151	8	San Francisco Gotera
152	8	San Isidro
153	8	San Simón
154	8	Sensembra
155	8	Sociedad
156	8	Torola
157	8	Yamabal
158	8	Yoloaiquín
159	9	Carolina
160	9	Chapeltique
161	9	Chinameca
162	9	Chirilagua
163	9	Ciudad Barrios
164	9	Comacarán
165	9	El Tránsito
166	9	Lolotique
167	9	Moncagua
168	9	Nueva Guadalupe
169	9	Nuevo Edén de San Juan
170	9	Quelepa
171	9	San Antonio del Mosco
172	9	San Gerardo
173	9	San Jorge
174	9	San Luis de la Reina
175	9	San Miguel
176	9	San Rafael Oriente
177	9	Sesori
178	9	Uluazapa
179	10	Aguilares
180	10	Apopa
181	10	Ayutuxtepeque
182	10	Cuscatancingo
183	10	Ciudad Delgado
184	10	El Paisnal
185	10	Guazapa
186	10	Ilopango
187	10	Mejicanos
188	10	Nejapa
189	10	Panchimalco
190	10	Rosario de Mora
191	10	San Marcos
192	10	San Martín
193	10	San Salvador
194	10	Santiago Texacuangos
195	10	Santo Tomás
196	10	Soyapango
197	10	Tonacatepeque
198	11	Apastepeque
199	11	Guadalupe
200	11	San Cayetano Istepeque
201	11	San Esteban Catarina
202	11	San Ildefonso
203	11	San Lorenzo
204	11	San Sebastián
205	11	San Vicente
206	11	Santa Clara
207	11	Santo Domingo
208	11	Tecoluca
209	11	Tepetitán
210	11	Verapaz
211	12	Candelaria de la Frontera
212	12	Chalchuapa
213	12	Coatepeque
214	12	El Congo
215	12	El Porvenir
216	12	Masahuat
217	12	Metapán
218	12	San Antonio Pajonal
219	12	San Sebastián Salitrillo
220	12	Santa Ana
221	12	Santa Rosa
222	12	Guachipilín Santiago de la Frontera
223	12	Texistepeque
224	13	Acajutla
225	13	Armenia
226	13	Caluco
227	13	Cuisnahuat
228	13	Izalco
229	13	Juayúa
230	13	Nahuizalco
231	13	Nahulingo
232	13	Salcoatitán
233	13	San Antonio del Monte
234	13	San Julián
235	13	Santa Catarina Masahuat
236	13	Santa Isabel Ishuatán
237	13	Santo Domingo Guzmán
238	13	Sonsonate
239	13	Sonzacate
240	14	Alegría
241	14	Berlín
242	14	California
243	14	Concepción Batres
244	14	El Triunfo
245	14	Ereguayquín
246	14	Estanzuelas
247	14	Jiquilisco
248	14	Jucuapa
249	14	Jucuarán
250	14	Mercedes Umaña
251	14	Nueva Granada
252	14	Ozatlán
253	14	Puerto El Triunfo
254	14	San Agustín
255	14	San Buenaventura
256	14	San Dionisio
257	14	San Francisco Javier
258	14	Santa Elena
259	14	Santa María
260	14	Santiago de María
261	14	Tecapán
262	14	Usulután
\.


--
-- TOC entry 2576 (class 0 OID 0)
-- Dependencies: 217
-- Name: municipios_municipio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.municipios_municipio_id_seq', 1, false);


--
-- TOC entry 2506 (class 0 OID 41415)
-- Dependencies: 218
-- Data for Name: odontogramas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.odontogramas (odontograma_id, paciente_id, odontograma_pieza, odontograma_cuadrante, odontograma_oclusal, odontograma_vestibular, odontograma_mesial, odontograma_distal, odontograma_lingual, odontograma_palatina, odontograma_extraccion, odontograma_ausente, odontograma_fractura, odontograma_protesis, odontograma_implante, odontograma_endodoncia, odontograma_raiz, odontograma_general, odontograma_endodoncia_reincide, odontograma_protesis_reincide) FROM stdin;
10	1	22	2	0	0	0	0	0	0	f	f	f	f	t	f	f	0	f	f
2	1	12	1	3	0	0	0	0	3	f	f	f	f	f	f	f	0	f	f
264	6	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
265	6	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
266	6	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
267	6	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
268	6	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
269	6	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
270	6	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
271	6	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
272	6	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
273	6	22	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
274	6	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
275	6	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
276	6	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
277	6	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
278	6	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
279	6	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
280	6	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
281	6	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
282	6	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
283	6	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
284	6	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
285	6	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
286	6	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
287	6	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
288	6	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
289	6	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
290	6	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
291	6	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
292	6	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
293	6	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
294	6	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
295	6	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
296	6	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
297	6	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
298	6	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
299	6	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
300	6	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
301	6	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
302	6	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
303	6	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
304	6	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
305	6	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
306	6	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
307	6	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
308	6	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
309	6	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
310	6	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
311	6	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
312	6	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
313	6	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
314	6	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
315	6	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
165	4	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
98	2	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
11	1	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	t
12	1	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	t	f
13	1	25	2	0	0	0	0	0	0	t	f	f	f	f	f	f	0	f	f
14	1	26	2	0	0	0	0	0	0	f	t	f	f	f	f	f	0	f	f
15	1	27	2	0	0	0	0	0	0	f	f	t	f	f	f	f	0	f	f
16	1	28	2	0	0	0	0	0	0	f	f	f	t	f	f	f	0	f	f
3	1	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
4	1	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
5	1	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
6	1	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
7	1	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
8	1	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
17	1	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
18	1	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
19	1	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
20	1	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
21	1	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
22	1	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
23	1	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
24	1	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
25	1	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
26	1	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
27	1	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
28	1	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
29	1	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
30	1	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
31	1	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
32	1	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
195	4	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
33	1	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
34	1	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
35	1	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
36	1	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
37	1	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
38	1	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
39	1	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
40	1	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
41	1	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
42	1	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
43	1	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
44	1	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
45	1	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
46	1	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
47	1	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
48	1	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
49	1	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
50	1	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
51	1	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
52	1	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
53	2	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
54	2	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
55	2	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
56	2	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
57	2	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
58	2	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
59	2	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
60	2	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
61	2	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
62	2	22	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
63	2	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
64	2	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
66	2	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
67	2	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
68	2	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
69	2	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
71	2	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
72	2	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
73	2	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
74	2	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
75	2	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
76	2	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
77	2	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
78	2	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
79	2	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
80	2	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
82	2	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
83	2	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
84	2	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
85	2	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
86	2	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
87	2	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
88	2	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
89	2	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
90	2	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
91	2	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
92	2	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
93	2	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
94	2	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
95	2	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
96	2	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
97	2	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
9	1	21	2	0	0	0	0	0	0	f	f	f	f	f	t	f	0	f	f
99	2	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
100	2	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
101	2	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
102	2	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
103	2	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
104	2	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
105	3	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
106	3	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
107	3	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
108	3	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
110	3	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
111	3	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
112	3	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
113	3	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
114	3	22	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
115	3	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
116	3	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
117	3	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
118	3	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
119	3	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
120	3	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
121	3	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
122	3	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
123	3	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
124	3	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
126	3	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
127	3	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
128	3	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
129	3	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
130	3	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
131	3	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
132	3	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
133	3	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
134	3	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
135	3	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
136	3	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
137	3	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
138	3	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
139	3	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
140	3	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
141	3	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
65	2	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	t	f
81	2	45	4	0	0	0	0	0	0	f	f	t	f	f	f	f	0	f	f
125	3	35	3	0	0	0	0	0	0	f	f	t	f	f	f	f	0	f	f
109	3	15	1	0	0	0	0	0	0	f	f	f	f	f	t	f	0	f	f
142	3	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
143	3	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
144	3	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
145	3	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
146	3	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
147	3	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
148	3	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
149	3	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
150	3	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
151	3	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
152	3	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
153	3	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
154	3	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
155	3	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
156	3	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
157	4	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
158	4	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
159	4	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
160	4	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
161	4	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
162	4	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
163	4	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
164	4	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
166	4	22	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
167	4	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
168	4	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
169	4	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
170	4	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
171	4	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
173	4	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
174	4	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
175	4	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
176	4	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
177	4	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
178	4	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
179	4	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
181	4	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
182	4	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
183	4	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
184	4	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
186	4	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
187	4	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
188	4	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
189	4	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
190	4	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
191	4	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
192	4	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
193	4	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
194	4	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
196	4	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
197	4	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
198	4	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
199	4	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
200	4	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
201	4	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
202	4	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
203	4	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
204	4	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
205	4	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
206	4	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
207	4	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
208	4	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1	1	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
212	5	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
213	5	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
214	5	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
215	5	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
216	5	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
217	5	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
218	5	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
219	5	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
220	5	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
222	5	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
223	5	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
224	5	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
225	5	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
226	5	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
227	5	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
228	5	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
221	5	22	2	0	0	0	0	0	0	f	t	f	f	f	f	f	0	f	f
229	5	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
230	5	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
231	5	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
232	5	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
233	5	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
234	5	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
235	5	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
236	5	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
237	5	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
238	5	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
239	5	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
240	5	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
241	5	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
242	5	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
185	4	45	4	0	0	0	0	0	0	f	f	t	f	f	f	f	0	f	f
180	4	38	3	0	0	0	0	0	0	t	f	f	f	f	f	f	0	f	f
243	5	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
244	5	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
245	5	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
246	5	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
247	5	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
248	5	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
249	5	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
250	5	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
251	5	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
252	5	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
253	5	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
254	5	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
255	5	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
256	5	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
257	5	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
258	5	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
259	5	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
260	5	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
261	5	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
262	5	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
263	5	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
316	7	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
317	7	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
318	7	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
319	7	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
320	7	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
321	7	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
322	7	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
323	7	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
324	7	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
325	7	22	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
326	7	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
327	7	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
328	7	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
329	7	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
330	7	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
331	7	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
332	7	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
333	7	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
334	7	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
335	7	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
336	7	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
337	7	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
338	7	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
339	7	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
340	7	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
341	7	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
342	7	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
343	7	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
344	7	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
345	7	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
346	7	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
347	7	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
348	7	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
349	7	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
350	7	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
351	7	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
352	7	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
353	7	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
354	7	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
355	7	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
356	7	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
357	7	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
358	7	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
359	7	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
360	7	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
361	7	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
362	7	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
363	7	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
364	7	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
365	7	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
366	7	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
367	7	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
368	8	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
369	8	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
370	8	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
371	8	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
372	8	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
373	8	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
374	8	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
375	8	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
376	8	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
377	8	22	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
378	8	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
379	8	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
380	8	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
381	8	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
382	8	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
383	8	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
384	8	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
385	8	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
386	8	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
387	8	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
388	8	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
389	8	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
390	8	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
391	8	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
392	8	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
393	8	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
394	8	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
395	8	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
396	8	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
397	8	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
398	8	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
399	8	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
400	8	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
401	8	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
402	8	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
403	8	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
404	8	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
405	8	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
406	8	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
407	8	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
408	8	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
409	8	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
410	8	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
411	8	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
412	8	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
413	8	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
414	8	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
415	8	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
416	8	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
417	8	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
418	8	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
419	8	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
420	9	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
421	9	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
422	9	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
423	9	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
424	9	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
425	9	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
426	9	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
427	9	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
428	9	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
429	9	22	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
430	9	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
431	9	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
432	9	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
433	9	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
434	9	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
435	9	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
436	9	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
437	9	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
438	9	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
439	9	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
440	9	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
441	9	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
442	9	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
443	9	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
444	9	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
445	9	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
446	9	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
447	9	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
448	9	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
449	9	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
450	9	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
451	9	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
452	9	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
453	9	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
454	9	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
455	9	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
456	9	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
457	9	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
458	9	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
459	9	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
460	9	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
461	9	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
462	9	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
463	9	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
464	9	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
465	9	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
466	9	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
467	9	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
468	9	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
469	9	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
470	9	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
471	9	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
472	10	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
473	10	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
474	10	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
475	10	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
476	10	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
477	10	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
478	10	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
479	10	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
480	10	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
481	10	22	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
482	10	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
483	10	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
484	10	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
485	10	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
486	10	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
487	10	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
488	10	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
489	10	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
490	10	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
491	10	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
492	10	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
493	10	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
494	10	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
495	10	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
496	10	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
497	10	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
498	10	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
499	10	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
500	10	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
501	10	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
502	10	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
503	10	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
504	10	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
505	10	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
506	10	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
507	10	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
508	10	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
509	10	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
510	10	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
511	10	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
512	10	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
513	10	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
514	10	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
515	10	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
516	10	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
517	10	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
518	10	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
519	10	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
520	10	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
521	10	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
522	10	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
523	10	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
524	11	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
525	11	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
526	11	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
527	11	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
528	11	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
529	11	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
530	11	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
531	11	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
532	11	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
533	11	22	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
534	11	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
535	11	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
536	11	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
537	11	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
538	11	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
539	11	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
540	11	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
541	11	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
542	11	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
543	11	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
544	11	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
545	11	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
546	11	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
547	11	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
548	11	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
549	11	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
550	11	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
551	11	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
552	11	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
553	11	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
554	11	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
555	11	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
556	11	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
557	11	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
558	11	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
559	11	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
560	11	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
561	11	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
562	11	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
563	11	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
564	11	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
565	11	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
566	11	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
567	11	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
568	11	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
569	11	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
570	11	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
571	11	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
572	11	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
573	11	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
574	11	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
575	11	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
576	12	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
577	12	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
578	12	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
579	12	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
580	12	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
581	12	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
582	12	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
583	12	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
584	12	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
585	12	22	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
586	12	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
587	12	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
588	12	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
589	12	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
590	12	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
591	12	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
592	12	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
593	12	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
594	12	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
595	12	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
596	12	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
597	12	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
598	12	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
599	12	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
600	12	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
601	12	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
602	12	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
603	12	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
604	12	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
605	12	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
606	12	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
607	12	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
608	12	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
609	12	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
610	12	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
611	12	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
612	12	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
613	12	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
614	12	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
615	12	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
616	12	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
617	12	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
618	12	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
619	12	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
620	12	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
621	12	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
622	12	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
623	12	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
624	12	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
625	12	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
626	12	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
627	12	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
628	13	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
629	13	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
630	13	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
631	13	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
632	13	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
633	13	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
634	13	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
635	13	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
636	13	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
637	13	22	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
638	13	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
639	13	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
640	13	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
641	13	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
642	13	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
643	13	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
644	13	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
645	13	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
646	13	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
647	13	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
648	13	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
649	13	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
650	13	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
651	13	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
652	13	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
653	13	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
654	13	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
655	13	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
656	13	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
657	13	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
658	13	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
659	13	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
660	13	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
661	13	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
662	13	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
663	13	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
664	13	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
665	13	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
666	13	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
667	13	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
668	13	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
669	13	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
670	13	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
671	13	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
672	13	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
673	13	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
674	13	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
675	13	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
676	13	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
677	13	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
678	13	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
679	13	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
680	14	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
681	14	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
682	14	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
683	14	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
684	14	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
685	14	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
686	14	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
687	14	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
688	14	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
689	14	22	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
690	14	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
691	14	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
692	14	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
693	14	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
694	14	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
695	14	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
696	14	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
697	14	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
698	14	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
699	14	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
700	14	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
701	14	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
702	14	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
703	14	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
704	14	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
705	14	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
706	14	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
707	14	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
708	14	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
709	14	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
710	14	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
711	14	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
712	14	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
713	14	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
714	14	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
715	14	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
716	14	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
717	14	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
718	14	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
719	14	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
720	14	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
721	14	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
722	14	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
723	14	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
724	14	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
725	14	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
726	14	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
727	14	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
728	14	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
729	14	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
730	14	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
731	14	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
732	15	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
733	15	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
734	15	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
735	15	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
736	15	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
737	15	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
738	15	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
739	15	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
740	15	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
741	15	22	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
742	15	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
743	15	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
744	15	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
745	15	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
746	15	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
747	15	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
748	15	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
749	15	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
750	15	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
751	15	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
752	15	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
753	15	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
754	15	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
755	15	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
756	15	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
757	15	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
758	15	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
759	15	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
760	15	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
761	15	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
762	15	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
763	15	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
764	15	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
765	15	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
766	15	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
767	15	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
768	15	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
769	15	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
770	15	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
771	15	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
772	15	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
773	15	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
774	15	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
775	15	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
776	15	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
777	15	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
778	15	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
779	15	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
780	15	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
781	15	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
782	15	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
783	15	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
784	16	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
785	16	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
786	16	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
787	16	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
788	16	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
789	16	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
790	16	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
791	16	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
792	16	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
793	16	22	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
794	16	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
795	16	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
796	16	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
797	16	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
798	16	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
799	16	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
800	16	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
801	16	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
802	16	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
803	16	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
804	16	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
805	16	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
806	16	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
807	16	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
808	16	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
809	16	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
810	16	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
811	16	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
812	16	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
813	16	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
814	16	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
815	16	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
816	16	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
817	16	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
818	16	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
819	16	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
820	16	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
821	16	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
822	16	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
823	16	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
824	16	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
825	16	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
826	16	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
827	16	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
828	16	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
829	16	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
830	16	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
831	16	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
832	16	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
833	16	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
834	16	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
835	16	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
836	17	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
837	17	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
838	17	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
839	17	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
840	17	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
841	17	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
842	17	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
843	17	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
844	17	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
845	17	22	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
846	17	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
847	17	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
848	17	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
849	17	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
850	17	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
851	17	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
852	17	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
853	17	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
854	17	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
855	17	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
856	17	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
857	17	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
858	17	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
859	17	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
860	17	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
861	17	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
862	17	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
863	17	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
864	17	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
865	17	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
866	17	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
867	17	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
868	17	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
869	17	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
870	17	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
871	17	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
872	17	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
873	17	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
874	17	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
875	17	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
876	17	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
877	17	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
878	17	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
879	17	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
880	17	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
881	17	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
882	17	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
883	17	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
884	17	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
885	17	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
886	17	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
887	17	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
888	18	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
889	18	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
890	18	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
891	18	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
892	18	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
893	18	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
894	18	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
895	18	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
896	18	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
897	18	22	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
898	18	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
899	18	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
900	18	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
901	18	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
902	18	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
903	18	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
904	18	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
905	18	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
906	18	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
907	18	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
908	18	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
909	18	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
910	18	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
911	18	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
912	18	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
913	18	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
914	18	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
915	18	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
916	18	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
917	18	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
918	18	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
919	18	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
920	18	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
921	18	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
922	18	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
923	18	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
924	18	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
925	18	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
926	18	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
927	18	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
928	18	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
929	18	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
930	18	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
931	18	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
932	18	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
933	18	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
934	18	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
935	18	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
936	18	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
937	18	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
938	18	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
939	18	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
940	19	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
941	19	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
942	19	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
943	19	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
944	19	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
945	19	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
946	19	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
947	19	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
948	19	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
949	19	22	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
950	19	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
951	19	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
952	19	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
953	19	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
954	19	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
955	19	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
956	19	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
957	19	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
958	19	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
959	19	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
960	19	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
961	19	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
962	19	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
963	19	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
964	19	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
965	19	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
966	19	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
967	19	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
968	19	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
969	19	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
970	19	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
971	19	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
972	19	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
973	19	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
974	19	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
975	19	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
976	19	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
977	19	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
978	19	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
979	19	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
980	19	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
981	19	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
982	19	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
983	19	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
984	19	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
985	19	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
986	19	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
987	19	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
988	19	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
989	19	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
990	19	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
991	19	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
992	20	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
993	20	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
994	20	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
995	20	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
996	20	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
997	20	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
998	20	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
999	20	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1000	20	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1001	20	22	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1002	20	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1003	20	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1004	20	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1005	20	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1006	20	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1007	20	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1008	20	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1009	20	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1010	20	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1011	20	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1012	20	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1013	20	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1014	20	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1015	20	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1016	20	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1017	20	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1018	20	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1019	20	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1020	20	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1021	20	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1022	20	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1023	20	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1024	20	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1025	20	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1026	20	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1027	20	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1028	20	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1029	20	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1030	20	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1031	20	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1032	20	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1033	20	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1034	20	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1035	20	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1036	20	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1037	20	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1038	20	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1039	20	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1040	20	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1041	20	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1042	20	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1043	20	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1044	21	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1045	21	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1046	21	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1047	21	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1048	21	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1049	21	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1050	21	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1051	21	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1052	21	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1053	21	22	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1054	21	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1055	21	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1056	21	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1057	21	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1058	21	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1059	21	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1060	21	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1061	21	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1062	21	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1063	21	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1064	21	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1065	21	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1066	21	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1067	21	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1068	21	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1069	21	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1070	21	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1071	21	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1072	21	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1073	21	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1074	21	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1075	21	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1076	21	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1077	21	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1078	21	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1079	21	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1080	21	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1081	21	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1082	21	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1083	21	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1084	21	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1085	21	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1086	21	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1087	21	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1088	21	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1089	21	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1090	21	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1091	21	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1092	21	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1093	21	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1094	21	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1095	21	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1096	22	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1097	22	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1098	22	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1099	22	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1100	22	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1101	22	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1102	22	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1103	22	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1104	22	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1105	22	22	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1106	22	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1107	22	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1108	22	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1109	22	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1110	22	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1111	22	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1112	22	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1113	22	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1114	22	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1115	22	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1116	22	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1117	22	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1118	22	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1119	22	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1120	22	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1121	22	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1122	22	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1123	22	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1124	22	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1125	22	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1126	22	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1127	22	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1128	22	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1129	22	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1130	22	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1131	22	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1132	22	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1133	22	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1134	22	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1135	22	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1136	22	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1137	22	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1138	22	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1139	22	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1140	22	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1141	22	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1142	22	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1143	22	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1144	22	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1145	22	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1146	22	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1147	22	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1148	23	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1149	23	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1150	23	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1151	23	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1152	23	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1153	23	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1154	23	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1155	23	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1156	23	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1157	23	22	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1158	23	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1159	23	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1160	23	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1161	23	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1162	23	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1163	23	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1164	23	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1165	23	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1166	23	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1167	23	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1168	23	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1169	23	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1170	23	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1171	23	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1172	23	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1173	23	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1174	23	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1175	23	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1176	23	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1177	23	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1178	23	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1179	23	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1180	23	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1181	23	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1182	23	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1183	23	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1184	23	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1185	23	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1186	23	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1187	23	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1188	23	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1189	23	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1190	23	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1191	23	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1192	23	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1193	23	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1194	23	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1195	23	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1196	23	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1197	23	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1198	23	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1199	23	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1200	24	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1201	24	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1202	24	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1203	24	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1204	24	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1205	24	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1206	24	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1207	24	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1208	24	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1209	24	22	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1210	24	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1211	24	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1212	24	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1213	24	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1214	24	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1215	24	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1216	24	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1217	24	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1218	24	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1219	24	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1220	24	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1221	24	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1222	24	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1223	24	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1224	24	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1225	24	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1226	24	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1227	24	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1228	24	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1229	24	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1230	24	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1231	24	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1232	24	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1233	24	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1234	24	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1235	24	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1236	24	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1237	24	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1238	24	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1239	24	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1240	24	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1241	24	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1242	24	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1243	24	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1244	24	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1245	24	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1246	24	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1247	24	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1248	24	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1249	24	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1250	24	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1251	24	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1252	25	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1253	25	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1254	25	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1255	25	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1256	25	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1257	25	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1258	25	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1259	25	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1260	25	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1261	25	22	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1262	25	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1263	25	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1264	25	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1265	25	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1266	25	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1267	25	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1268	25	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1269	25	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1270	25	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1271	25	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1272	25	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1273	25	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1274	25	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1275	25	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1276	25	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1277	25	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1278	25	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1279	25	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1280	25	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1281	25	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1282	25	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1283	25	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1284	25	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1285	25	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1286	25	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1287	25	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1288	25	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1289	25	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1290	25	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1291	25	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1292	25	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1293	25	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1294	25	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1295	25	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1296	25	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1297	25	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1298	25	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1299	25	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1300	25	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1301	25	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1302	25	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1303	25	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1304	26	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1305	26	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1306	26	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1307	26	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1308	26	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1309	26	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1310	26	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1311	26	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1312	26	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1313	26	22	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1314	26	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1315	26	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1316	26	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1317	26	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1318	26	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1319	26	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1320	26	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1321	26	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1322	26	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1323	26	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1324	26	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1325	26	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1326	26	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1327	26	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1328	26	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1329	26	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1330	26	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1331	26	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1332	26	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1333	26	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1334	26	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1335	26	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1336	26	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1337	26	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1338	26	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1339	26	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1340	26	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1341	26	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1342	26	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1343	26	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1344	26	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1345	26	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1346	26	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1347	26	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1348	26	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1349	26	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1350	26	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1351	26	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1352	26	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1353	26	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1354	26	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1355	26	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1356	27	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1357	27	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1358	27	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1359	27	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1360	27	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1361	27	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1362	27	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1363	27	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1364	27	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1365	27	22	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1366	27	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1367	27	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1368	27	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1369	27	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1370	27	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1371	27	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1372	27	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1373	27	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1374	27	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1375	27	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1376	27	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1377	27	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1378	27	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1379	27	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1380	27	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1381	27	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1382	27	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1383	27	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1384	27	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1385	27	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1386	27	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1387	27	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1388	27	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1389	27	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1390	27	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1391	27	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1392	27	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1393	27	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1394	27	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1395	27	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1396	27	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1397	27	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1398	27	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1399	27	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1400	27	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1401	27	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1402	27	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1403	27	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1404	27	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1405	27	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1406	27	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1407	27	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1408	28	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1409	28	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1410	28	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1411	28	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1412	28	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1413	28	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1414	28	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1415	28	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1416	28	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1417	28	22	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1418	28	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1419	28	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1420	28	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1421	28	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1422	28	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1423	28	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1424	28	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1425	28	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1426	28	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1427	28	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1428	28	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1429	28	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1430	28	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1431	28	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1432	28	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1433	28	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1434	28	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1435	28	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1436	28	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1437	28	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1438	28	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1439	28	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1440	28	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1441	28	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1442	28	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1443	28	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1444	28	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1445	28	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1446	28	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1447	28	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1448	28	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1449	28	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1450	28	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1451	28	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1452	28	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1453	28	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1454	28	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1455	28	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1456	28	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1457	28	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1458	28	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1459	28	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1460	29	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1461	29	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1462	29	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1463	29	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1464	29	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1465	29	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1466	29	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1467	29	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1468	29	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1469	29	22	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1470	29	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1471	29	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1472	29	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1473	29	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1474	29	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1475	29	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1476	29	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1477	29	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1478	29	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1479	29	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1480	29	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1481	29	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1482	29	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1483	29	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1484	29	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1485	29	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1486	29	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1487	29	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1488	29	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1489	29	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1490	29	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1491	29	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1492	29	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1493	29	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1494	29	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1495	29	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1496	29	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1497	29	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1498	29	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1499	29	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1500	29	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1501	29	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1502	29	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1503	29	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1504	29	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1505	29	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1506	29	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1507	29	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1508	29	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1509	29	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1510	29	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1511	29	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1512	30	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1513	30	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1514	30	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1515	30	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1516	30	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1517	30	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1518	30	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1519	30	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1520	30	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1521	30	22	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1522	30	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1523	30	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1524	30	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1525	30	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1526	30	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1527	30	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1528	30	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1529	30	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1530	30	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1531	30	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1532	30	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1533	30	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1534	30	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1535	30	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1536	30	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1537	30	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1538	30	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1539	30	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1540	30	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1541	30	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1542	30	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1543	30	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1544	30	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1545	30	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1546	30	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1547	30	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1548	30	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1549	30	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1550	30	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1551	30	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1552	30	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1553	30	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1554	30	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1555	30	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1556	30	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1557	30	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1558	30	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1559	30	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1560	30	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1561	30	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1562	30	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1563	30	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1564	31	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1565	31	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1566	31	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1567	31	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1568	31	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1569	31	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1570	31	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1571	31	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1572	31	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1573	31	22	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1574	31	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1575	31	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1576	31	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1577	31	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1578	31	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1579	31	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1580	31	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1581	31	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1582	31	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1583	31	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1584	31	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1585	31	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1586	31	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1587	31	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1588	31	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1589	31	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1590	31	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1591	31	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1592	31	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1593	31	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1594	31	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1595	31	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1596	31	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1597	31	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1598	31	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1599	31	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1600	31	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1601	31	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1602	31	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1603	31	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1604	31	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1605	31	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1606	31	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1607	31	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1608	31	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1609	31	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1610	31	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1611	31	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1612	31	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1613	31	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1614	31	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1615	31	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1616	32	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1617	32	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1618	32	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1619	32	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1620	32	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1621	32	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1622	32	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1623	32	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1624	32	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1625	32	22	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1626	32	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1627	32	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1628	32	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1629	32	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1630	32	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1631	32	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1632	32	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1633	32	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1634	32	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1635	32	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1636	32	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1637	32	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1638	32	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1639	32	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1640	32	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1641	32	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1642	32	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1643	32	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1644	32	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1645	32	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1646	32	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1647	32	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1648	32	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1649	32	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1650	32	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1651	32	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1652	32	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1653	32	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1654	32	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1655	32	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1656	32	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1657	32	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1658	32	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1659	32	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1660	32	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1661	32	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1662	32	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1663	32	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1664	32	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1665	32	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1666	32	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1667	32	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1668	33	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1669	33	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1670	33	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1671	33	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1672	33	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1673	33	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1674	33	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1675	33	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1676	33	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1677	33	22	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1678	33	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1679	33	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1680	33	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1681	33	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1682	33	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1683	33	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1684	33	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1685	33	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1686	33	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1687	33	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1688	33	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1689	33	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1690	33	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1691	33	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1692	33	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1693	33	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1694	33	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1695	33	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1696	33	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1697	33	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1698	33	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1699	33	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1700	33	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1701	33	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1702	33	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1703	33	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1704	33	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1705	33	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1706	33	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1707	33	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1708	33	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1709	33	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1710	33	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1711	33	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1712	33	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1713	33	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1714	33	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1715	33	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1716	33	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1717	33	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1718	33	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1719	33	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1720	34	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1721	34	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1722	34	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1723	34	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1724	34	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1725	34	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1726	34	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1727	34	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1728	34	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1729	34	22	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1730	34	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1731	34	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1732	34	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1733	34	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1734	34	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1735	34	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1736	34	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1737	34	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1738	34	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1739	34	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1740	34	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1741	34	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1742	34	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1743	34	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1744	34	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1745	34	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1746	34	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1747	34	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1748	34	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1749	34	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1750	34	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1751	34	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1752	34	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1753	34	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1754	34	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1755	34	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1756	34	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1757	34	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1758	34	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1759	34	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1760	34	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1761	34	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1762	34	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1763	34	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1764	34	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1765	34	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1766	34	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1767	34	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1768	34	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1769	34	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1770	34	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1771	34	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1772	35	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1773	35	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1774	35	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1775	35	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1776	35	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1777	35	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1778	35	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1779	35	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1780	35	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1781	35	22	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1782	35	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1783	35	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1784	35	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1785	35	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1786	35	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1787	35	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1788	35	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1789	35	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1790	35	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1791	35	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1792	35	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1793	35	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1794	35	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1795	35	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1796	35	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1797	35	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1798	35	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1799	35	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1800	35	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1801	35	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1802	35	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1803	35	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1804	35	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1805	35	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1806	35	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1807	35	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1808	35	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1809	35	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1810	35	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1811	35	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1812	35	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1813	35	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1814	35	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1815	35	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1816	35	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1817	35	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1818	35	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1819	35	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1820	35	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1821	35	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1822	35	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1823	35	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1824	36	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1825	36	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1826	36	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1827	36	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1828	36	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1829	36	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1830	36	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1831	36	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1832	36	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1833	36	22	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1834	36	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1835	36	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1836	36	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1837	36	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1838	36	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1839	36	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1840	36	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1841	36	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1842	36	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1843	36	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1844	36	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1845	36	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1846	36	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1847	36	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1848	36	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1849	36	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1850	36	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1851	36	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1852	36	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1853	36	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1854	36	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1855	36	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1856	36	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1857	36	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1858	36	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1859	36	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1860	36	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1861	36	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1862	36	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1863	36	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1864	36	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1865	36	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1866	36	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1867	36	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1868	36	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1869	36	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1870	36	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1871	36	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1872	36	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1873	36	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1874	36	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1875	36	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1876	37	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1877	37	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1878	37	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1879	37	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1880	37	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1881	37	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1882	37	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1883	37	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1884	37	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1885	37	22	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1886	37	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1887	37	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1888	37	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1889	37	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1890	37	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1891	37	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1892	37	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1893	37	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1894	37	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1895	37	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1896	37	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1897	37	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1898	37	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1899	37	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1900	37	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1901	37	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1902	37	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1903	37	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1904	37	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1905	37	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1906	37	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1907	37	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1908	37	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1909	37	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1910	37	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1911	37	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1912	37	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1913	37	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1914	37	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1915	37	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1916	37	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1917	37	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1918	37	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1919	37	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1920	37	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1921	37	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1922	37	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1923	37	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1924	37	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1925	37	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1926	37	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1927	37	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1928	38	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1929	38	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1930	38	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1931	38	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1932	38	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1933	38	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1934	38	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1935	38	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1936	38	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1937	38	22	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1938	38	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1939	38	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1940	38	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1941	38	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1942	38	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1943	38	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1944	38	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1945	38	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1946	38	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1947	38	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1948	38	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1949	38	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1950	38	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1951	38	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1952	38	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1953	38	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1954	38	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1955	38	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1956	38	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1957	38	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1958	38	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1959	38	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1960	38	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1961	38	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1962	38	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1963	38	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1964	38	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1965	38	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1966	38	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1967	38	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1968	38	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1969	38	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1970	38	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1971	38	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1972	38	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1973	38	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1974	38	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1975	38	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1976	38	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1977	38	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1978	38	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1979	38	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1980	39	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1981	39	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1982	39	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1983	39	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1984	39	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1985	39	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1986	39	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1987	39	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1988	39	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1989	39	22	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1990	39	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1991	39	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1992	39	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1993	39	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1994	39	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1995	39	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1996	39	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1997	39	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1998	39	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
1999	39	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2000	39	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2001	39	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2002	39	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2003	39	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2004	39	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2005	39	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2006	39	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2007	39	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2008	39	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2009	39	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2010	39	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2011	39	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2012	39	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2013	39	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2014	39	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2015	39	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2016	39	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2017	39	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2018	39	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2019	39	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2020	39	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2021	39	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2022	39	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2023	39	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2024	39	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2025	39	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2026	39	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2027	39	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2028	39	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2029	39	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2030	39	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2031	39	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2032	40	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2033	40	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2034	40	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2035	40	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2036	40	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2037	40	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2038	40	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2039	40	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2040	40	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2041	40	22	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2042	40	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2043	40	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2044	40	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2045	40	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2046	40	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2047	40	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2048	40	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2049	40	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2050	40	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2051	40	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2052	40	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2053	40	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2054	40	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2055	40	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2056	40	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2057	40	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2058	40	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2059	40	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2060	40	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2061	40	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2062	40	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2063	40	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2064	40	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2065	40	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2066	40	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2067	40	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2068	40	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2069	40	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2070	40	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2071	40	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2072	40	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2073	40	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2074	40	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2075	40	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2076	40	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2077	40	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2078	40	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2079	40	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2080	40	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2081	40	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2082	40	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2083	40	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2084	41	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2085	41	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2086	41	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2087	41	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2088	41	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2089	41	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2090	41	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2091	41	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2092	41	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2093	41	22	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2094	41	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2095	41	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2096	41	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2097	41	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2098	41	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2099	41	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2100	41	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2101	41	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2102	41	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2103	41	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2104	41	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2105	41	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2106	41	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2107	41	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2108	41	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2109	41	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2110	41	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2111	41	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2112	41	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2113	41	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2114	41	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2115	41	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2116	41	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2117	41	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2118	41	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2119	41	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2120	41	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2121	41	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2122	41	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2123	41	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2124	41	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2125	41	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2126	41	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2127	41	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2128	41	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2129	41	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2130	41	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2131	41	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2132	41	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2133	41	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2134	41	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2135	41	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2136	42	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2137	42	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2138	42	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2139	42	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2140	42	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2141	42	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2142	42	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2143	42	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2144	42	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2145	42	22	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2146	42	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2147	42	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2148	42	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2149	42	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2150	42	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2151	42	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2152	42	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2153	42	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2154	42	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2155	42	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2156	42	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2157	42	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2158	42	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2159	42	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2160	42	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2161	42	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2162	42	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2163	42	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2164	42	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2165	42	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2166	42	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2167	42	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2168	42	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2169	42	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2170	42	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2171	42	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2172	42	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2173	42	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2174	42	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2175	42	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2176	42	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2177	42	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2178	42	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2179	42	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2180	42	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2181	42	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2182	42	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2183	42	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2184	42	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2185	42	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2186	42	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2187	42	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2188	43	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2189	43	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2190	43	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2191	43	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2192	43	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2193	43	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2194	43	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2195	43	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2196	43	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2197	43	22	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2198	43	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2199	43	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2200	43	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2201	43	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2202	43	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2203	43	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2204	43	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2205	43	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2206	43	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2207	43	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2208	43	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2209	43	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2210	43	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2211	43	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2212	43	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2213	43	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2214	43	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2215	43	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2216	43	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2217	43	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2218	43	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2219	43	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2220	43	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2221	43	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2222	43	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2223	43	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2224	43	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2225	43	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2226	43	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2227	43	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2228	43	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2229	43	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2230	43	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2231	43	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2232	43	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2233	43	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2234	43	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2235	43	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2236	43	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2237	43	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2238	43	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2239	43	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2240	44	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2241	44	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2242	44	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2243	44	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2244	44	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2245	44	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2246	44	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2247	44	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2248	44	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2249	44	22	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2250	44	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2251	44	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2252	44	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2253	44	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2254	44	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2255	44	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2256	44	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2257	44	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2258	44	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2259	44	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2260	44	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2261	44	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2262	44	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2263	44	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2264	44	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2265	44	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2266	44	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2267	44	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2268	44	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2269	44	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2270	44	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2271	44	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2272	44	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2273	44	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2274	44	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2275	44	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2276	44	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2277	44	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2278	44	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2279	44	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2280	44	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2281	44	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2282	44	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2283	44	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2284	44	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2285	44	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2286	44	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2287	44	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2288	44	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2289	44	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2290	44	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2291	44	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2292	45	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2293	45	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2294	45	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2295	45	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2296	45	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2297	45	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2298	45	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2299	45	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2300	45	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2301	45	22	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2302	45	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2303	45	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2304	45	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2305	45	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2306	45	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2307	45	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2308	45	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2309	45	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2310	45	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2311	45	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2312	45	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2313	45	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2314	45	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2315	45	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2316	45	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2317	45	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2318	45	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2319	45	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2320	45	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2321	45	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2322	45	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2323	45	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2324	45	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2325	45	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2326	45	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2327	45	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2328	45	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2329	45	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2330	45	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2331	45	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2332	45	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2333	45	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2334	45	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2335	45	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2336	45	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2337	45	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2338	45	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2339	45	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2340	45	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2341	45	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2342	45	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2343	45	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2344	46	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2345	46	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2346	46	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2347	46	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2348	46	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2349	46	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2350	46	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2351	46	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2352	46	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2353	46	22	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2354	46	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2355	46	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2356	46	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2357	46	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2358	46	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2359	46	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2360	46	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2361	46	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2362	46	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2363	46	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2364	46	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2365	46	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2366	46	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2367	46	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2368	46	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2369	46	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2370	46	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2371	46	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2372	46	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2373	46	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2374	46	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2375	46	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2376	46	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2377	46	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2378	46	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2379	46	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2380	46	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2381	46	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2382	46	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2383	46	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2384	46	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2385	46	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2386	46	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2387	46	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2388	46	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2389	46	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2390	46	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2391	46	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2392	46	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2393	46	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2394	46	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2395	46	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2396	47	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2397	47	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2398	47	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2399	47	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2400	47	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2401	47	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2402	47	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2403	47	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2404	47	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2405	47	22	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2406	47	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2407	47	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2408	47	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2409	47	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2410	47	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2411	47	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2412	47	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2413	47	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2414	47	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2415	47	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2416	47	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2417	47	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2418	47	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2419	47	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2420	47	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2421	47	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2422	47	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2423	47	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2424	47	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2425	47	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2426	47	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2427	47	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2428	47	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2429	47	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2430	47	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2431	47	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2432	47	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2433	47	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2434	47	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2435	47	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2436	47	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2437	47	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2438	47	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2439	47	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2440	47	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2441	47	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2442	47	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2443	47	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2444	47	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2445	47	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2446	47	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2447	47	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2448	48	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2449	48	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2450	48	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2451	48	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2452	48	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2453	48	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2454	48	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2455	48	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2456	48	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2457	48	22	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2458	48	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2459	48	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2460	48	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2461	48	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2462	48	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2463	48	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2464	48	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2465	48	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2466	48	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2467	48	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2468	48	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2469	48	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2470	48	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2471	48	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2472	48	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2473	48	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2474	48	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2475	48	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2476	48	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2477	48	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2478	48	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2479	48	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2480	48	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2481	48	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2482	48	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2483	48	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2484	48	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2485	48	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2486	48	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2487	48	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2488	48	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2489	48	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2490	48	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2491	48	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2492	48	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2493	48	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2494	48	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2495	48	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2496	48	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2497	48	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2498	48	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2499	48	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2500	49	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2501	49	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2502	49	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2503	49	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2504	49	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2505	49	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2506	49	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2507	49	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2508	49	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2509	49	22	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2510	49	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2511	49	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2512	49	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2513	49	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2514	49	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2515	49	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2516	49	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2517	49	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2518	49	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2519	49	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2520	49	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2521	49	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2522	49	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2523	49	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2524	49	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2525	49	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2526	49	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2527	49	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2528	49	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2529	49	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2530	49	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2531	49	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2532	49	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2533	49	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2534	49	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2535	49	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2536	49	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2537	49	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2538	49	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2539	49	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2540	49	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2541	49	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2542	49	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2543	49	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2544	49	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2545	49	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2546	49	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2547	49	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2548	49	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2549	49	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2550	49	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2551	49	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2552	50	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2553	50	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2554	50	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2555	50	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2556	50	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2557	50	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2558	50	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2559	50	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2560	50	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2561	50	22	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2562	50	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2563	50	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2564	50	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2565	50	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2566	50	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2567	50	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2568	50	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2569	50	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2570	50	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2571	50	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2572	50	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2573	50	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2574	50	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2575	50	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2576	50	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2577	50	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2578	50	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2579	50	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2580	50	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2581	50	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2582	50	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2583	50	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2584	50	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2585	50	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2586	50	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2587	50	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2588	50	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2589	50	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2590	50	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2591	50	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2592	50	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2593	50	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2594	50	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2595	50	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2596	50	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2597	50	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2598	50	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2599	50	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2600	50	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2601	50	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2602	50	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2603	50	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2604	51	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2605	51	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2606	51	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2607	51	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2608	51	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2609	51	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2610	51	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2611	51	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2612	51	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2613	51	22	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2614	51	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2615	51	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2616	51	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2617	51	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2618	51	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2619	51	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2620	51	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2621	51	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2622	51	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2623	51	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2624	51	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2625	51	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2626	51	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2627	51	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2628	51	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2629	51	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2630	51	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2631	51	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2632	51	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2633	51	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2634	51	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2635	51	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2636	51	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2637	51	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2638	51	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2639	51	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2640	51	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2641	51	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2642	51	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2643	51	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2644	51	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2645	51	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2646	51	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2647	51	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2648	51	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2649	51	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2650	51	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2651	51	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2652	51	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2653	51	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2654	51	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2655	51	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2656	52	11	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2657	52	12	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2658	52	13	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2659	52	14	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2660	52	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2661	52	16	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2662	52	17	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2663	52	18	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2664	52	21	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2665	52	22	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2666	52	23	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2667	52	24	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2668	52	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2669	52	26	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2670	52	27	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2671	52	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2672	52	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2673	52	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2674	52	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2675	52	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2676	52	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2677	52	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2678	52	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2679	52	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2680	52	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2681	52	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2682	52	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2683	52	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2684	52	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2685	52	46	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2686	52	47	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2687	52	48	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2688	52	51	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2689	52	52	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2690	52	53	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2691	52	54	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2692	52	55	5	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2693	52	61	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2694	52	62	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2695	52	63	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2696	52	64	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2697	52	65	6	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2698	52	71	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2699	52	72	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2700	52	73	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2701	52	74	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2702	52	75	7	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2703	52	81	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2704	52	82	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2705	52	83	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2706	52	84	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
2707	52	85	8	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
70	2	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
172	4	28	2	0	0	0	0	0	0	f	f	f	f	f	t	f	0	f	f
\.


--
-- TOC entry 2577 (class 0 OID 0)
-- Dependencies: 219
-- Name: odontogramas_odontograma_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.odontogramas_odontograma_id_seq', 2707, true);


--
-- TOC entry 2508 (class 0 OID 41420)
-- Dependencies: 220
-- Data for Name: pacientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pacientes (paciente_id, paciente_expediente, paciente_primer_nombre, paciente_segundo_nombre, paciente_primer_apellido, paciente_segundo_apellido, paciente_fecha_nacimiento, paciente_sexo, paciente_correo, paciente_trabajo, paciente_telefono_casa, paciente_telefono_movil, paciente_telefono_oficina, paciente_whatsapp, paciente_estado, paciente_antecedentes, paciente_recordatorio, paciente_fecha_seguimiento, paciente_responsable, paciente_fecha_creacion, paciente_usuario_creacion, paciente_fecha_modificacion, paciente_usuario_modificacion, paciente_notificar_correo, paciente_codigo, paciente_usuario_usuario, paciente_promocion_cumpleanyos, paciente_promocion_general) FROM stdin;
6	\N	Diego	Rafael	Guzman	Flores	1990-01-12	t	diego.flores@gmail.com	EDESSA	2216-5689	7485-7485	7845-1245	t	t	\N	t	\N		2019-01-25	\N	\N	\N	t	1218	\N	\N	\N
8	\N	Ingrid	Violeta	Castro	Ramirez	1940-04-10	f	valgomez11029@gmail.com	MINSAL	2413-2301	7649-3932	2204-7685	t	t	\N	t	\N		2019-06-19	\N	\N	\N	t	1970	\N	\N	\N
9	\N	Hugo	Javier	Lemus	Marroquin	1991-06-12	t	juanfran.aldana@gmail.com	MINED	2475-8339	7433-2922	2434-4848	t	t	\N	t	\N		2019-06-19	\N	\N	\N	t	1257	\N	\N	\N
10	\N	Abner	Gerardo	Pineda	Sierra	1951-01-04	t	fwilfredo5@gmail.com	Banco Promerica	2418-3832	7439-2746	2458-3239	t	t	\N	t	\N		2019-06-19	\N	\N	\N	t	1862	\N	\N	\N
11	\N	Andrea	Michell	Olivar 	Rivas	1956-06-08	f	valgomez11029@gmail.com	SISA	2458-6894	7774-4439	2224-4443	t	t	\N	t	\N		2019-06-19	\N	\N	\N	t	1063	\N	\N	\N
12	\N	Lazaro		Flamenco	Trujillo	1956-06-14	t	fwilfredo5@gmail.com	Comerciante	2425-2224	7665-3535	2425-2224	t	t	\N	t	\N		2019-06-19	\N	\N	\N	t	1272	\N	\N	\N
13	\N	Manuel	Eduardo	Zavala	Bolaños	1954-09-27	t	juanfran.aldana@gmail.com	Ferreteria La Economica	2413-2257	7463-9292	2415-2222	t	t	\N	t	\N		2019-06-19	\N	\N	\N	t	1357	\N	\N	\N
7	\N	Eder	Stuardo 	Urbina 	Perez	1954-10-13	t	fwilfredo5@gmail.com	Electrolab Medic	2413-2345	7654-8383	2505-5555	t	t	\N	t	\N		2019-06-19	\N	2019-06-19	Nombre de usuario	t	1143	\N	\N	\N
14	\N	José 	Manuel	Perez	Castro	1949-06-15	t	juanfran.aldana@gmail.com	Banco Agricola	2433-3929	7639-5458	2244-3333	t	t	\N	t	\N		2019-06-19	\N	\N	\N	t	1641	\N	\N	\N
15	\N	Tatiana	Guadalupe	Mejia	Diaz	1952-06-12	f	valgomez11029@gmail.com	Banco Atlantida	2329-2985	7635-3822	6848-6126	t	t	\N	t	\N		2019-06-19	\N	\N	\N	t	1379	\N	\N	\N
16	\N	Diana 	Stefanie	Rojas	Carcamo	1987-06-10	f	erickcampos.rivas@gmail.com	Claro	2411-4354	7543-0934	2249-5494	t	t	\N	t	\N		2019-06-19	\N	\N	\N	t	1112	\N	\N	\N
17	\N	Juan 	Martin	Flores	Contreras	1985-06-13	t	fwilfredo5@gmail.com	Corte Suprema de Justicia	2586-9040	7493-9393	2506-4883	t	t	\N	t	\N		2019-06-20	\N	\N	\N	t	1572	\N	\N	\N
18	\N	Oscar	José	Linares	Molina	2000-02-16	t	erickcampos.rivas@gmail.com	Colegio Cristiano	2457-7899	6734-3678	2599-6444	t	t	\N	t	\N		2019-06-20	\N	\N	\N	t	1120	\N	\N	\N
19	\N	William	Eduardo	Ramos	Salazar	1949-06-08	t	juanfran.aldana@gmail.com	Molsa	2567-8954	6235-4678	2567-9786	f	t	\N	t	\N		2019-06-20	\N	\N	\N	f	1986	\N	\N	\N
20	\N	Andres	Franco	Ramirez	Garcia	1982-06-09	t	valgomez11029@gmail.com	SISA	2786-7898	6345-6589		t	t	\N	t	\N		2019-06-20	\N	\N	\N	f	1489	\N	\N	\N
21	\N	Cristian	David	Ramos	Menendez	1990-11-14	t	erickcampos.rivas@gmail.com	CAES		7645-7679		t	t	\N	t	\N		2019-06-20	\N	\N	\N	t	1140	\N	\N	\N
22	\N	Carlos	Alberto	Aguilar	Ayala	1980-11-13	t	juanfran.aldana@gmail.com	CLESA		6787-9324		t	t	\N	t	\N		2019-06-20	\N	\N	\N	t	1876	\N	\N	\N
23	\N	Grecia	Elena	Solano	Aviles	1993-05-18	f	valgomez11029@gmail.com	Alcaldía de San Salvador		7334-5676		t	t	\N	t	\N		2019-06-20	\N	\N	\N	t	1887	\N	\N	\N
24	\N	Linda 	Maria	Perez	Castro	1992-09-09	f	valgomez11029@gmail.com	Banco Credomatic		6235-4668		t	t	\N	t	\N		2019-06-20	\N	\N	\N	t	1180	\N	\N	\N
25	\N	Karen	Liliana	Dubon	Mendoza	1997-03-19	f	valgomez11029@gmail.com	Regus		6445-6778		t	t	\N	t	\N		2019-06-20	\N	\N	\N	t	1209	\N	\N	\N
26	\N	Katherine	Patricia	Herrera	Lopéz	1985-10-16	f	valgomez11029@gmail.com	Correos ES	2475-8780	7234-3797		t	t	\N	t	\N		2019-06-20	\N	\N	\N	t	1211	\N	\N	\N
27	\N	Marvin	Alexander	García	García	1975-09-17	t	juanfran.aldana@gmail.com	Electrolab Medic		6578-9880		t	t	\N	t	\N		2019-06-20	\N	\N	\N	t	1969	\N	\N	\N
28	\N	Andrea	Marlene	Guillen	Chavez	1998-12-23	f	valgomez11029@gmail.com	FESFUT		6343-4335		t	t	\N	t	\N		2019-06-20	\N	\N	\N	t	1859	\N	\N	\N
29	\N	Melvin	José	Alvarado	Figueroa	1980-10-15	t	juanfran.aldana@gmail.com	Banco Promerica		6556-7788		t	t	\N	t	\N		2019-06-20	\N	\N	\N	t	1637	\N	\N	\N
30	\N	Daniela	Xiomara	Pinto	Cabezas	1990-08-22	f	valgomez11029@gmail.com	Banco Promerica		5623-2443		t	t	\N	t	\N		2019-06-20	\N	\N	\N	t	1092	\N	\N	\N
31	\N	Alex	José	Diaz	Gomez	1994-09-15	t	erickcampos.rivas@gmail.com	Hotel Crowne Plaza		6344-6575		t	t	\N	t	\N		2019-06-20	\N	\N	\N	t	1701	\N	\N	\N
32	\N	Juan	Martin	Pinto	Guzman	1990-02-14	t	juanfran.aldana@gmail.com	Hospital Rosales		7548-9989		t	t	\N	t	\N		2019-06-20	\N	\N	\N	t	1951	\N	\N	\N
33	\N	Carlos	Eduardo	Rosales	Diaz	1979-06-20	t	erickcampos.rivas@gmail.com	Aeroman		7568-9797		t	t	\N	t	\N		2019-06-20	\N	\N	\N	t	1561	\N	\N	\N
34	\N	Roberto	Angel	Castro	Ibarra	1982-04-13	t	fwilfredo5@gmail.com	Holsin		7379-2332		t	t	\N	t	\N		2019-06-20	\N	\N	\N	t	1539	\N	\N	\N
35	\N	Karla	Elena	Calderon	Juarez	1987-01-15	f	valgomez11029@gmail.com	Corte Suprema de Justicia		7652-1412		t	t	\N	t	\N		2019-06-20	\N	\N	\N	t	1260	\N	\N	\N
36	\N	Oscar 	Nelson	Gonzales	Magaña	1988-08-17	t	juanfran.aldana@gmail.com	SISA		6487-3487		t	t	\N	t	\N		2019-06-20	\N	\N	\N	t	1277	\N	\N	\N
37	\N	Raul 	Ernesto	Arevalo 	García	1980-09-17	t	erickcampos.rivas@gmail.com	UES		7365-5456		t	t	\N	t	\N		2019-06-20	\N	\N	\N	t	1800	\N	\N	\N
38	\N	Sonia	Vaneza	Moran	Gomez	1994-05-18	f	valgomez11029@gmail.com	UCA		6326-2387		t	t	\N	t	\N		2019-06-20	\N	\N	\N	t	1686	\N	\N	\N
39	\N	Rafael	Ernesto	Castellanos	Figueroa	1990-08-21	t	juanfran.aldana@gmail.com	Claro		7989-2387		t	t	\N	t	\N		2019-06-20	\N	\N	\N	t	1140	\N	\N	\N
40	\N	Joel	Andres	Reyes	Magaña	1989-07-18	t	erickcampos.rivas@gmail.com	El Diario de Hoy		7651-2142		t	t	\N	t	\N		2019-06-20	\N	\N	\N	t	1668	\N	\N	\N
41	\N	Virginia	Noemi	Cañas	Santos	1989-10-03	f	valgomez11029@gmail.com	Siman		6379-3283		t	t	\N	t	\N		2019-06-20	\N	\N	\N	t	1641	\N	\N	\N
42	\N	Diego	José	Bautista	Salinas	1980-06-17	t	juanfran.aldana@gmail.com	Tigo		7734-5454		t	t	\N	t	\N		2019-06-20	\N	\N	\N	t	1578	\N	\N	\N
43	\N	Brenda	María	Salinas	Yepes	1998-09-14	f	valgomez11029@gmail.com	Telefonica		6343-4343		t	t	\N	t	\N		2019-06-20	\N	\N	\N	f	1556	\N	\N	\N
44	\N	Diana	Alejandra	Ascencio	Guardado	1987-10-05	f	valgomez11029@gmail.com	Zapateria MD		7343-4344		t	t	\N	t	\N		2019-06-20	\N	\N	\N	t	1355	\N	\N	\N
45	\N	Fernanda	Alejandra	Villeda	Miron	1987-02-11	f	fwilfredo5@gmail.com	Digicel		6236-7673		t	t	\N	t	\N		2019-06-20	\N	\N	\N	t	1746	\N	\N	\N
46	\N	Stefanie	Victoria	Franco	Villeda	1978-08-15	f	erickcampos.rivas@gmail.com	La Curacao		6345-5354		t	t	\N	t	\N		2019-06-20	\N	\N	\N	t	1970	\N	\N	\N
47	\N	José	Alejandro	Escalante	Escobar	2000-08-15	t	juanfran.aldana@gmail.com	Colegio David		7346-7879		t	t	\N	t	\N		2019-06-20	\N	\N	\N	t	1001	\N	\N	\N
48	\N	Geovany	Francisco	Zalaya	Nuñez	1998-08-17	t	juanfran.aldana@gmail.com	Claro		7678-0933		t	t	\N	t	\N		2019-06-20	\N	\N	\N	t	1087	\N	\N	\N
49	\N	Christopher	José	Perez	Leon	1998-04-14	t	erickcampos.rivas@gmail.com	Universidad Tecnologica		7235-5786		t	t	\N	t	\N		2019-06-20	\N	\N	\N	t	1664	\N	\N	\N
50	\N	Monica	Alejandra	Artero	Escamilla	1987-04-22	f	valgomez11029@gmail.com	Volaris		6578-6879		t	t	\N	t	\N		2019-06-20	\N	\N	\N	t	1492	\N	\N	\N
3	\N	Laura	Marcela	Campos	Soto	1990-02-19	f	valeria.campos@hotmail.com	GOES	2356-8978	7412-5896	2145-7845	t	t		t	\N		2018-10-27	\N	2019-07-01	Nombre de usuario	t	5214	\N	\N	\N
2	\N	Edwin	Enrique	Viche	Rivas	1990-02-27	t	erick.rivas@yahoo.es	MINSAL	2255-8877	7485-4785	2221-5454	f	t		t	\N		2018-10-27	\N	2019-07-01	Nombre de usuario	t	8456	\N	\N	\N
5	\N	Francis	Amilcar	Menjivar	Menjivar	1980-10-10	t	francis.menjivar@hotmail.com	UES	2216-4578	7878-7878	2255-4477	t	t	\N	t	\N		2018-11-06	\N	\N	\N	t	5263	\N	\N	\N
4	\N	Marvin	Raymundo	Pinto	Zetino	1990-01-02	t	wilfredo.flamenco@yahoo.com	AMSS	2356-8978	7485-9621	2158-9654	f	t		t	\N		2018-10-27	\N	2019-07-01	Nombre de usuario	t	9458	\N	\N	\N
51	\N	Saul	Ernesto	Flores	Campos	1984-04-12	t	fwilfredo5@gmail.com	Claro		7129-8128		t	t	\N	t	\N		2019-07-01	\N	\N	\N	t	1181	\N	\N	\N
52	\N	William	Alexander	Avalos	Ayala	1989-10-09	t	juanfran.aldana@gmail.com	Regus		6932-8792		t	t	\N	t	\N		2019-07-01	\N	\N	\N	t	1532	\N	\N	\N
1	\N	José	Alex	Zepeda	Figueroa	1990-05-27	t	juanfran.aldana@gmail.com	UES	2216-4578	7611-0659	2255-7777	t	t	El paciente es alérgico al frío.	t	\N		2018-10-27	\N	2019-07-01	Nombre de usuario	t	1234	\N	\N	\N
\.


--
-- TOC entry 2578 (class 0 OID 0)
-- Dependencies: 221
-- Name: pacientes_paciente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pacientes_paciente_id_seq', 52, true);


--
-- TOC entry 2510 (class 0 OID 41428)
-- Dependencies: 222
-- Data for Name: patologias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.patologias (patologia_id, patologia_nombre, patologia_estado, patologia_fecha_creacion, patologia_usuario_creacion, patologia_fecha_modificacion, patologia_usuario_modificacio) FROM stdin;
2	Hipotiroidismo	t	2018-10-27	Nombre de usuario	\N	\N
3	Enfermedades cardiacas	t	2018-10-27	Nombre de usuario	\N	\N
4	Hipertensión arterial	t	2018-10-27	Nombre de usuario	\N	\N
6	Enfermedades hematológicas	t	2018-10-27	Nombre de usuario	\N	\N
8	Tratamientos de quimioterapia	t	2018-10-27	Nombre de usuario	\N	\N
9	Enfermedades autoinmunes	t	2018-10-27	Nombre de usuario	\N	\N
10	VIH SIDA	t	2018-10-27	Nombre de usuario	\N	\N
11	Tratamientos con anticoagulantes	t	2018-10-27	Nombre de usuario	\N	\N
12	Insuficiencia renal	t	2018-10-27	Nombre de usuario	\N	\N
13	Artritis reumatoidea	t	2018-10-27	Nombre de usuario	\N	\N
14	Tratamientos quirúrgicos	t	2018-10-27	Nombre de usuario	\N	\N
17	Varicela	t	2018-10-27	Nombre de usuario	\N	\N
15	Alergias	t	2018-10-27	Nombre de usuario	2018-11-13	Nombre de usuario
5	Asma	t	2018-10-27	Nombre de usuario	2018-11-23	JuanFran
1	Diábetes	t	2018-10-27	Nombre de usuario	2018-11-23	JuanFran
16	Gripe	t	2018-10-27	Nombre de usuario	2018-11-23	JuanFran
7	Hepatitis	t	2018-10-27	Nombre de usuario	2018-11-23	JuanFran
\.


--
-- TOC entry 2579 (class 0 OID 0)
-- Dependencies: 223
-- Name: patologias_patologia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.patologias_patologia_id_seq', 17, true);


--
-- TOC entry 2512 (class 0 OID 41433)
-- Dependencies: 224
-- Data for Name: patologias_por_pacientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.patologias_por_pacientes (paciente_id, patologia_id) FROM stdin;
1	12
1	5
1	1
1	4
1	15
2	17
2	5
2	4
2	15
3	16
3	7
3	4
3	2
3	6
4	16
4	3
4	1
4	4
4	5
\.


--
-- TOC entry 2513 (class 0 OID 41436)
-- Dependencies: 225
-- Data for Name: privilegios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.privilegios (privilegio_id, submenu_id, privilegio_accion) FROM stdin;
1	2	Consultar
2	2	Editar
3	2	Eliminar
4	3	Consultar
5	3	Editar
6	3	Eliminar
7	11	Consultar
8	11	Editar
9	11	Eliminar
10	17	Consultar
11	17	Editar
12	17	Eliminar
13	31	Consultar
14	31	Editar
15	31	Eliminar
16	32	Consultar
17	32	Editar
18	32	Eliminar
19	33	Editar
20	33	Eliminar
21	34	Editar
22	34	Eliminar
23	35	Editar
24	35	Eliminar
25	36	Editar
26	36	Eliminar
\.


--
-- TOC entry 2514 (class 0 OID 41439)
-- Dependencies: 226
-- Data for Name: privilegios_por_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.privilegios_por_roles (privilegios_id, submenu_id, roles_id) FROM stdin;
1	2	4
2	2	4
3	2	4
4	3	4
5	3	4
6	3	4
7	11	4
8	11	4
10	17	4
1	2	2
2	2	2
3	2	2
4	3	2
5	3	2
6	3	2
7	11	2
8	11	2
9	11	2
10	17	2
11	17	2
12	17	2
13	31	2
14	31	2
15	31	2
16	32	2
17	32	2
18	32	2
19	33	2
20	33	2
21	34	2
22	34	2
23	35	2
24	35	2
25	36	2
26	36	2
10	17	3
\.


--
-- TOC entry 2515 (class 0 OID 41442)
-- Dependencies: 227
-- Data for Name: promociones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.promociones (promocion_id, promocion_nombre, promocion_descripcion, promocion_inicio, promocion_fin, promocion_estado, promocion_tipo, promocion_imagen, promocion_imagen_nombre, promocion_imagen_url, promocion_mensaje, promocion_activa, promocion_fecha_creacion, promocion_usuario_creacion, promocion_fecha_modificacion, promocion_usuario_modificacion, promocion_correo_limitado_espera) FROM stdin;
6	Navideña	Esta es una descripción de promoción navideña.	2018-01-01	2018-12-31	f	2	\N			Este es un correo para promoción navideña.	t	2018-12-14	Nombre Usuario	2018-12-14	Nombre Usuario	0
2	Navideña	Esta es una descripción de promoción.	2018-12-01	2018-12-31	f	3	\N			Este es un mensaje de promociÃ³n.	t	2018-10-30	Nombre Usuario	2018-11-08	Nombre Usuario	0
3	General	Esta es una descripción de promoción.	2018-11-01	2018-11-30	t	1	\N	Promocion3.jpg	c://Users/Fam. Gomez Aldana/Documents/NetBeansProjects/siaec/web/images/promociones/Promocion3.jpg	Este es un mensaje de promociÃ³n.	t	2018-10-30	Nombre Usuario	\N	\N	0
7	Linux		2019-01-01	2019-12-31	f	2	\N			imagenlinux	t	2019-04-23	Nombre Usuario	2019-06-26	Nombre Usuario	0
1	Cumpleanios	Esta es una descripcion de promocion.	2019-01-01	2019-03-12	t	2	\N	Promocion5.jpg	c://Users/Fam. Gomez Aldana/Documents/NetBeansProjects/siaec/web/images/promociones/Promocion5.jpg	Este es un mensaje de promocion.	t	2018-10-30	Nombre Usuario	2019-06-26	Nombre Usuario	1
4	Halloween	Descripcion de promocion.	2018-01-01	2018-12-31	t	1	\N	Promocion1.jpg	c://Users/Fam. Gomez Aldana/Documents/NetBeansProjects/siaec/web/images/promociones/Promocion1.jpg	Mensaje de promocion.	t	2018-11-07	Nombre Usuario	2019-07-01	Nombre Usuario	0
5	Verano	Descripcin Bienvenida Vacaciones.	2019-01-01	2019-01-31	t	1	\N	promocion2.jpg	c://Users/Fam. Gomez Aldana/Documents/NetBeansProjects/siaec/web/images/promociones/promocion2.jpg	Mensaje de promon Bienvenida Vacaciones.	t	2018-11-07	Nombre Usuario	2019-07-01	Nombre Usuario	0
8	Navidad		2019-12-01	2019-12-31	t	1	\N	Promocion8.jpg	C:\\Users\\WilfredoFlamenco\\Documents\\NetBeansProjects\\siaec\\build\\web\\images\\promociones/Promocion8.jpg	Acércate a nuestras clínicas y aprovecha nuestros descuentos espectaculares.	t	2019-07-01	Nombre Usuario	\N	\N	0
9	Día del Padre		2019-07-01	2019-07-31	t	1	\N	Promocion9.jpg	C:\\Users\\WilfredoFlamenco\\Documents\\NetBeansProjects\\siaec\\build\\web\\images\\promociones/Promocion9.jpg	Aprovecha nuestros increíbles descuentos este día del padre y durante todo el mes.	t	2019-07-01	Nombre Usuario	\N	\N	0
10	Mitad de Año		2019-07-01	2019-07-31	t	1	\N	Promocion7.jpg	C:\\Users\\WilfredoFlamenco\\Documents\\NetBeansProjects\\siaec\\build\\web\\images\\promociones/Promocion7.jpg	Aprovecha nuestro descuentos en extracción de muelas cordales, libérate de esas incomodides.	t	2019-07-01	Nombre Usuario	\N	\N	0
\.


--
-- TOC entry 2580 (class 0 OID 0)
-- Dependencies: 228
-- Name: promociones_promocion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.promociones_promocion_id_seq', 10, true);


--
-- TOC entry 2517 (class 0 OID 41450)
-- Dependencies: 229
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (rol_id, rol_nombre, rol_descripcion, rol_fecha_creacion, rol_usuario_creacion, rol_fecha_modificacion, rol_usuario_modificacion, dashboard_id, rol_alerta, rol_notificacion) FROM stdin;
2	Director/a	Supervisa las sucursales.	2018-12-28	Sistema	\N	\N	2	t	t
3	Doctor/a	Odontologa	2018-12-28	Sistema	\N	\N	3	f	t
5	Paciente	Paciente de la clínica	2018-12-28	Sistema	\N	\N	4	f	f
4	Asistente	Asistente de la clínica	2018-12-28	Sistema	\N	\N	6	t	t
1	Administrador/a	Administra el sistema SIAEC.	2018-12-28	Sistema	\N	\N	5	f	f
\.


--
-- TOC entry 2581 (class 0 OID 0)
-- Dependencies: 230
-- Name: roles_rol_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_rol_id_seq', 1, false);


--
-- TOC entry 2519 (class 0 OID 41455)
-- Dependencies: 231
-- Data for Name: sub_menus_por_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sub_menus_por_roles (rol_id, submenu_id) FROM stdin;
1	29
1	30
1	37
1	38
1	39
1	40
2	1
2	2
2	3
2	4
2	7
2	8
2	9
2	10
2	11
2	12
2	13
2	14
2	15
2	16
2	17
2	18
2	19
2	20
2	21
2	22
2	23
2	24
2	25
2	26
2	27
2	28
2	30
2	31
2	32
2	33
2	34
2	35
2	36
2	37
2	40
3	7
3	8
3	9
3	10
3	17
3	20
3	21
3	24
3	28
3	40
4	1
4	2
4	3
4	4
4	7
4	8
4	9
4	11
4	12
4	13
4	14
4	15
4	17
4	20
4	21
4	22
4	23
4	25
4	26
4	27
4	28
4	40
5	5
5	6
5	41
\.


--
-- TOC entry 2520 (class 0 OID 41458)
-- Dependencies: 232
-- Data for Name: submenus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.submenus (submenu_id, sumbenu_nombre, menu_id, submenu_descripcion, submenu_url) FROM stdin;
1	Nueva Cita	1	Clínica	/views/1_citas/cita_clinica_nueva.xhtml
2	Citas Confirmadas	1	Clínica	/views/1_citas/cita_clinica_listado_confirmadas.xhtml
3	Citas Reservadas	1	Clínica	/views/1_citas/cita_clinica_listado_pendiente.xhtml
4	Histórico de Citas	1	Clínica	/views/1_citas/cita_clinica_historico.xhtml
5	Registrar Cita	1	Paciente	/views/1_citas/cita_paciente_nueva.xhtml
8	Listado de Pacientes	2	Clínica	/views/2_expedientes/pacientes_listado.xhtml
9	Consultar Expedientes	2	Clínica	/views/2_expedientes/paciente_consultar.xhtml
11	Gestionar Insumos	3	Clínica	/views/3_insumos/insumo_listado.xhtml
12	Existencia de Insumos	3	Clínica	/views/3_insumos/insumo_existencias_listado.xhtml
13	Control de Insumos	3	Clínica	/views/3_insumos/insumo_control_listado.xhtml
14	Entrada y Salida de Insumos	3	Clínica	/views/3_insumos/insumo_entrada_salida_listado.xhtml
15	Solicitud de Insumo	3	Clínica	/views/3_insumos/insumo_solicitud_listado.xhtml
16	Registrar Promoción	4	Clínica	/views/4_promociones/promocion_nuevo.xhtml
17	Listado de Promociones	4	Clínica	/views/4_promociones/promocion_listado.xhtml
18	Tratamientos Mas Demandados por los Pacientes	5	Clínica	/views/5_reportes/rep_tratamientos_demandados.xhtml
19	Promociones Mas Demandadas por los Pacientes	5	Clínica	/views/5_reportes/rep_promociones_demandadas.xhtml
20	Listado de Pacientes por Médicos	5	Clínica	/views/5_reportes/rep_pacientes_por_medico.xhtml
21	Listado de Pacientes Atendidos por Tratamiento	5	Clínica	/views/5_reportes/rep_pacientes_por_tratamiento.xhtml
22	Listado de Pacientes Atendidos por Clínica	5	Clínica	/views/5_reportes/rep_pacientes_por_clinica.xhtml
23	Listado de Citas por Estado	5	Clínica	/views/5_reportes/rep_citas_por_estado.xhtml
24	Tratamientos Realizados a Paciente	5	Clínica	/views/5_reportes/rep_tratamientos_por_paciente.xhtml
25	Solicitud de Insumos Médicos	5	Clínica	/views/5_reportes/rep_solicitud_insumos.xhtml
26	Listado de Insumos Médicos 	5	Clínica	/views/5_reportes/rep_listado_insumos.xhtml
27	Agenda de Citas Programadas por Clínica	5	Clínica	/views/5_reportes/rep_citas_por_clinica.xhtml
28	Agenda de Citas Programadas por Médico	5	Clínica	/views/5_reportes/rep_citas_por_medico.xhtml
29	Gestionar Roles	6	Clínica	/views/6_administracion/cat_roles_listado.xhtml
30	Gestionar Usuarios	6	Clínica	/views/6_administracion/cat_usuarios_listado.xhtml
31	Gestionar Sucursales	6	Clínica	/views/6_administracion/cat_sucursales_listado.xhtml
32	Gestionar Médicos	6	Clínica	/views/6_administracion/cat_medicos_listado.xhtml
33	Gestionar Tratamientos	6	Clínica	/views/6_administracion/cat_tratamientos_listado.xhtml
34	Gestionar Patologías	6	Clínica	/views/6_administracion/cat_patologias_listado.xhtml
35	Gestionar Tipo de Insumo	6	Clínica	/views/6_administracion/cat_tipoinsumos_listado.xhtml
36	Gestionar Unidades de Medida	6	Clínica	/views/6_administracion/cat_unidadesmedidas_listado.xhtml
37	Configuración de Publicidad	7	Clínica	/views/7_configuracion/home_parametros.xhtml
38	Configuración de Correo	7	Clínica	/views/7_configuracion/configuracion_correo.xhtml
39	Tareas Automáticas	7	Clínica	/views/7_configuracion/tareas_automaticas.xhtml
40	Manual de Usuarios	8	General	/views/8_ayuda/manual_usuario.xhtml
41	Crear Cita en Linea	8	Paciente	/mantenimiento.xhtml
10	Gestionar Expediente	2	Clínica	/views/2_expedientes/paciente_gestionar.xhtml
6	Historal de Citas	1	Paciente	/views/1_citas/cita_paciente_historico.xhtml
7	Registrar Paciente	2	Clinica	/views/2_expedientes/paciente_registrar.xhtml
\.


--
-- TOC entry 2582 (class 0 OID 0)
-- Dependencies: 233
-- Name: submenus_submenu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.submenus_submenu_id_seq', 1, false);


--
-- TOC entry 2522 (class 0 OID 41463)
-- Dependencies: 234
-- Data for Name: tipos_insumos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipos_insumos (tipoinsumo_id, tipoinsumo_nombre, tipoinsumo_descripcion, tipoinsumo_estado) FROM stdin;
2	Endodóncia	Esta es una descripción de tipo de insumo	t
1	General	Esta es una descripción de tipo de insumo	t
\.


--
-- TOC entry 2583 (class 0 OID 0)
-- Dependencies: 235
-- Name: tipos_insumos_tipoinsumo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipos_insumos_tipoinsumo_id_seq', 2, true);


--
-- TOC entry 2524 (class 0 OID 41468)
-- Dependencies: 236
-- Data for Name: tratamientos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tratamientos (tratamiento_id, tratamiento_nombre, tratamiento_descripcion, tratamiento_estado, tratamiento_fecha_creacion, tratamiento_usuario_creacion, tratamiento_fecha_modificacion, tratamiento_usuario_modificacio) FROM stdin;
1	Endodoncia	Esta es una descripción de tratamiento	t	2018-10-27	Nombre de usuario	\N	\N
3	Extracción	Esta es una descripción de tratamiento	t	2018-10-27	Nombre de usuario	\N	\N
4	Prótesis	Esta es una descripción de tratamiento	t	2018-10-27	Nombre de usuario	\N	\N
5	Corona	Esta es una descripción de tratamiento	t	2018-10-27	Nombre de usuario	\N	\N
6	Cirugía	Esta es una descripción de tratamiento	t	2018-10-27	Nombre de usuario	\N	\N
7	Sellantes	Esta es una descripción de tratamiento	t	2018-10-27	Nombre de usuario	\N	\N
8	Reconstrucción	Esta es una descripción de tratamiento	t	2018-10-27	Nombre de usuario	\N	\N
9	Blanqueamiento	Esta es una descripción de tratamiento	t	2018-10-27	Nombre de usuario	\N	\N
10	Implante	Esta es una descripción de tratamiento	t	2018-10-27	Nombre de usuario	\N	\N
2	Obturación	Esta es una descripción de tratamiento	t	2018-10-27	Nombre de usuario	2018-10-27	Nombre de usuario
\.


--
-- TOC entry 2584 (class 0 OID 0)
-- Dependencies: 237
-- Name: tratamientos_tratamiento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tratamientos_tratamiento_id_seq', 10, true);


--
-- TOC entry 2526 (class 0 OID 41473)
-- Dependencies: 238
-- Data for Name: unidades_medidas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.unidades_medidas (unidadmedida_id, unidadmedida_nombre, unidadmedida_abreviatura, unidadmedida_estado) FROM stdin;
2	Gramo	gm	t
4	Galón	gl	t
5	Libra	lb	t
6	Caja	cj	t
7	Mililitro	ml	t
8	Litro	lt	t
3	Kilogramo	kg	t
1	Miligramo	mg	t
9	Botella	bt	t
10	Unidad	ud	t
\.


--
-- TOC entry 2585 (class 0 OID 0)
-- Dependencies: 239
-- Name: unidades_medidas_unidadmedida_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.unidades_medidas_unidadmedida_id_seq', 10, true);


--
-- TOC entry 2528 (class 0 OID 41478)
-- Dependencies: 240
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (usuario_usuario, rol_id, usuario_correo, usuario_telefono, usuario_contrasenia, usuario_estado, usuario_fecha_creacion, usuario_fecha_modificacion, usuario_bloqueado, usuario_intento_fallido, usuario_primer_nombre, usuario_segundo_nombre, usuario_primer_apellido, usuario_segundo_apellido, usuario_nombre, usuario_apellido, usuario_codigo, usuario_activacion, medico_id, paciente_id) FROM stdin;
ruth.alvarado@gmail.com	5	ruth.alvarado@gmail.com	7676-7676	670b14728ad9902aecba32e22fa4f6bd	t	2019-02-13	\N	t	0	Fracis	Nohemí	Alvarado	Cañada	\N	\N	\N	t	\N	\N
turh.alvarado@gmail.com	5	turh.alvarado@gmail.com	7485-9632	670b14728ad9902aecba32e22fa4f6bd	t	2019-02-13	\N	t	0	Ruth	\N	Alvarado	\N	Ruth	Alvarado	\N	t	\N	\N
sandra.lopez@gmail.com	5	sandra.lopez@gmail.com	7412-5896	670b14728ad9902aecba32e22fa4f6bd	t	2019-02-13	\N	t	0	Sandra	Vanessa	López	Mendoza	\N	\N	\N	t	\N	\N
juanfran.aldana@gmail.com	5	juanfran.aldana@gmail.com	7485-7485	670b14728ad9902aecba32e22fa4f6bd	t	2019-02-13	\N	t	0	Fracis	Amilcar	Merjivar		Francis	\N	\N	t	\N	\N
JuanCarlos	5	fwilfredo5@gmail.com	7987-2529	670b14728ad9902aecba32e22fa4f6bd	t	2019-07-07	\N	t	0	Juan	Carlos	Mendoza	Chavez	\N	\N	1172	t	\N	\N
HugoJavier	5	fwilfredo5@gmail.com	7649-6116	670b14728ad9902aecba32e22fa4f6bd	t	2019-07-07	\N	t	0	Hugo	Javier	Lemus	Marroquin	\N	\N	1839	t	\N	\N
JuanErnesto	5	fwilfredo5@gmail.com	7987-2529	670b14728ad9902aecba32e22fa4f6bd	t	2019-07-15	\N	t	0	Juan	Ernesto	Suarez	Perez	\N	\N	1002	t	\N	\N
Valeria	3	valgomez@gmail.com	7485-7485	670b14728ad9902aecba32e22fa4f6bd	t	2018-11-13	\N	t	0	Valeria	Guadalupe	Campos	Gomez	Valeria	\N	\N	t	1	\N
Wilfredo	4	wflamenco@gmail.com	7452-4857	670b14728ad9902aecba32e22fa4f6bd	t	2018-11-13	\N	t	0	Wilfredo	José	Flamenco	Lemus	Wilfredo	\N	\N	t	\N	\N
Aldana	1	juanfran.aldana@gmail.com	7611-0659	670b14728ad9902aecba32e22fa4f6bd	t	2018-11-13	\N	t	0	Juan	Francisco	Aldana	Domínguez	JuanFran	\N	\N	t	\N	\N
Diana	5	fwilfredo5@gmail.com	7432-4845	670b14728ad9902aecba32e22fa4f6bd	t	2018-11-13	2019-07-18	t	0	Diana	Cecilia	De Rivas	Arucha	Diana	\N	1172	t	\N	4
Erick	2	erickcampos.rivas@gmail.com	7412-7845	670b14728ad9902aecba32e22fa4f6bd	t	2018-11-13	\N	t	0	Erick	Eduardo	Campos	Rivas	Erick	\N	\N	t	2	\N
\.


--
-- TOC entry 2226 (class 2606 OID 41506)
-- Name: dashboard dashboard_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard
    ADD CONSTRAINT dashboard_pkey PRIMARY KEY (dashboard_id);


--
-- TOC entry 2206 (class 2606 OID 41508)
-- Name: bitacora pk_bitacora; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bitacora
    ADD CONSTRAINT pk_bitacora PRIMARY KEY (bitacora_id);


--
-- TOC entry 2209 (class 2606 OID 41510)
-- Name: citas pk_citas; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.citas
    ADD CONSTRAINT pk_citas PRIMARY KEY (cita_id);


--
-- TOC entry 2215 (class 2606 OID 41512)
-- Name: clinicas pk_clinicas; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clinicas
    ADD CONSTRAINT pk_clinicas PRIMARY KEY (clinica_id);


--
-- TOC entry 2218 (class 2606 OID 41514)
-- Name: configuraciones pk_configuraciones; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configuraciones
    ADD CONSTRAINT pk_configuraciones PRIMARY KEY (configuracion_id);


--
-- TOC entry 2221 (class 2606 OID 41516)
-- Name: consultas pk_consultas; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consultas
    ADD CONSTRAINT pk_consultas PRIMARY KEY (consulta_id);


--
-- TOC entry 2229 (class 2606 OID 41518)
-- Name: departamentos pk_departamentos; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamentos
    ADD CONSTRAINT pk_departamentos PRIMARY KEY (departamento_id);


--
-- TOC entry 2232 (class 2606 OID 41520)
-- Name: detalles_consultas pk_detalles_consultas; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalles_consultas
    ADD CONSTRAINT pk_detalles_consultas PRIMARY KEY (detalleconsulta_id);


--
-- TOC entry 2237 (class 2606 OID 41522)
-- Name: direcciones pk_direcciones; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.direcciones
    ADD CONSTRAINT pk_direcciones PRIMARY KEY (direccion_id);


--
-- TOC entry 2244 (class 2606 OID 41524)
-- Name: existencias pk_existencias; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.existencias
    ADD CONSTRAINT pk_existencias PRIMARY KEY (existencia_id);


--
-- TOC entry 2249 (class 2606 OID 41526)
-- Name: imagenes pk_imagenes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagenes
    ADD CONSTRAINT pk_imagenes PRIMARY KEY (imagen_id);


--
-- TOC entry 2253 (class 2606 OID 41528)
-- Name: insumos pk_insumos; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insumos
    ADD CONSTRAINT pk_insumos PRIMARY KEY (insumo_id);


--
-- TOC entry 2258 (class 2606 OID 41530)
-- Name: medicos pk_medicos; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicos
    ADD CONSTRAINT pk_medicos PRIMARY KEY (medico_id);


--
-- TOC entry 2261 (class 2606 OID 41532)
-- Name: menus pk_menus; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menus
    ADD CONSTRAINT pk_menus PRIMARY KEY (menu_id);


--
-- TOC entry 2266 (class 2606 OID 41534)
-- Name: menus_por_roles pk_menus_por_roles; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menus_por_roles
    ADD CONSTRAINT pk_menus_por_roles PRIMARY KEY (rol_id, menu_id);


--
-- TOC entry 2269 (class 2606 OID 41536)
-- Name: movimientos pk_movimientos; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movimientos
    ADD CONSTRAINT pk_movimientos PRIMARY KEY (movimiento_id);


--
-- TOC entry 2273 (class 2606 OID 41538)
-- Name: municipios pk_municipios; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.municipios
    ADD CONSTRAINT pk_municipios PRIMARY KEY (municipio_id);


--
-- TOC entry 2277 (class 2606 OID 41540)
-- Name: odontogramas pk_odontogramas; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.odontogramas
    ADD CONSTRAINT pk_odontogramas PRIMARY KEY (odontograma_id);


--
-- TOC entry 2281 (class 2606 OID 41542)
-- Name: pacientes pk_pacientes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pacientes
    ADD CONSTRAINT pk_pacientes PRIMARY KEY (paciente_id);


--
-- TOC entry 2284 (class 2606 OID 41544)
-- Name: patologias pk_patologias; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patologias
    ADD CONSTRAINT pk_patologias PRIMARY KEY (patologia_id);


--
-- TOC entry 2289 (class 2606 OID 41546)
-- Name: patologias_por_pacientes pk_patologias_por_pacientes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patologias_por_pacientes
    ADD CONSTRAINT pk_patologias_por_pacientes PRIMARY KEY (paciente_id, patologia_id);


--
-- TOC entry 2295 (class 2606 OID 41548)
-- Name: promociones pk_promociones; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promociones
    ADD CONSTRAINT pk_promociones PRIMARY KEY (promocion_id);


--
-- TOC entry 2298 (class 2606 OID 41550)
-- Name: roles pk_roles; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT pk_roles PRIMARY KEY (rol_id);


--
-- TOC entry 2301 (class 2606 OID 41552)
-- Name: sub_menus_por_roles pk_sub_menus_por_roles; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sub_menus_por_roles
    ADD CONSTRAINT pk_sub_menus_por_roles PRIMARY KEY (rol_id, submenu_id);


--
-- TOC entry 2306 (class 2606 OID 41554)
-- Name: submenus pk_submenus; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.submenus
    ADD CONSTRAINT pk_submenus PRIMARY KEY (submenu_id);


--
-- TOC entry 2309 (class 2606 OID 41556)
-- Name: tipos_insumos pk_tipos_insumos; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipos_insumos
    ADD CONSTRAINT pk_tipos_insumos PRIMARY KEY (tipoinsumo_id);


--
-- TOC entry 2312 (class 2606 OID 41558)
-- Name: tratamientos pk_tratamientos; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tratamientos
    ADD CONSTRAINT pk_tratamientos PRIMARY KEY (tratamiento_id);


--
-- TOC entry 2315 (class 2606 OID 41560)
-- Name: unidades_medidas pk_unidades_medidas; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unidades_medidas
    ADD CONSTRAINT pk_unidades_medidas PRIMARY KEY (unidadmedida_id);


--
-- TOC entry 2318 (class 2606 OID 41562)
-- Name: usuarios pk_usuarios; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT pk_usuarios PRIMARY KEY (usuario_usuario);


--
-- TOC entry 2291 (class 2606 OID 41564)
-- Name: privilegios privilegios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.privilegios
    ADD CONSTRAINT privilegios_pkey PRIMARY KEY (privilegio_id, submenu_id);


--
-- TOC entry 2293 (class 2606 OID 41566)
-- Name: privilegios_por_roles privilegios_por_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.privilegios_por_roles
    ADD CONSTRAINT privilegios_por_roles_pkey PRIMARY KEY (privilegios_id, submenu_id, roles_id);


--
-- TOC entry 2204 (class 1259 OID 41567)
-- Name: bitacora_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX bitacora_pk ON public.bitacora USING btree (bitacora_id);


--
-- TOC entry 2207 (class 1259 OID 41568)
-- Name: citas_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX citas_pk ON public.citas USING btree (cita_id);


--
-- TOC entry 2213 (class 1259 OID 41569)
-- Name: clinicas_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX clinicas_pk ON public.clinicas USING btree (clinica_id);


--
-- TOC entry 2216 (class 1259 OID 41570)
-- Name: configuraciones_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX configuraciones_pk ON public.configuraciones USING btree (configuracion_id);


--
-- TOC entry 2219 (class 1259 OID 41571)
-- Name: consultas_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX consultas_pk ON public.consultas USING btree (consulta_id);


--
-- TOC entry 2227 (class 1259 OID 41572)
-- Name: departamentos_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX departamentos_pk ON public.departamentos USING btree (departamento_id);


--
-- TOC entry 2230 (class 1259 OID 41573)
-- Name: detalles_consultas_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX detalles_consultas_pk ON public.detalles_consultas USING btree (detalleconsulta_id);


--
-- TOC entry 2235 (class 1259 OID 41574)
-- Name: direcciones_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX direcciones_pk ON public.direcciones USING btree (direccion_id);


--
-- TOC entry 2242 (class 1259 OID 41575)
-- Name: existencias_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX existencias_pk ON public.existencias USING btree (existencia_id);


--
-- TOC entry 2247 (class 1259 OID 41576)
-- Name: imagenes_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX imagenes_pk ON public.imagenes USING btree (imagen_id);


--
-- TOC entry 2251 (class 1259 OID 41577)
-- Name: insumos_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX insumos_pk ON public.insumos USING btree (insumo_id);


--
-- TOC entry 2256 (class 1259 OID 41578)
-- Name: medicos_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX medicos_pk ON public.medicos USING btree (medico_id);


--
-- TOC entry 2259 (class 1259 OID 41579)
-- Name: menus_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX menus_pk ON public.menus USING btree (menu_id);


--
-- TOC entry 2262 (class 1259 OID 41580)
-- Name: menus_por_roles2_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX menus_por_roles2_fk ON public.menus_por_roles USING btree (menu_id);


--
-- TOC entry 2263 (class 1259 OID 41581)
-- Name: menus_por_roles_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX menus_por_roles_fk ON public.menus_por_roles USING btree (rol_id);


--
-- TOC entry 2264 (class 1259 OID 41582)
-- Name: menus_por_roles_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX menus_por_roles_pk ON public.menus_por_roles USING btree (rol_id, menu_id);


--
-- TOC entry 2267 (class 1259 OID 41583)
-- Name: movimientos_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX movimientos_pk ON public.movimientos USING btree (movimiento_id);


--
-- TOC entry 2271 (class 1259 OID 41584)
-- Name: municipios_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX municipios_pk ON public.municipios USING btree (municipio_id);


--
-- TOC entry 2275 (class 1259 OID 41585)
-- Name: odontogramas_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX odontogramas_pk ON public.odontogramas USING btree (odontograma_id);


--
-- TOC entry 2279 (class 1259 OID 41586)
-- Name: pacientes_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX pacientes_pk ON public.pacientes USING btree (paciente_id);


--
-- TOC entry 2282 (class 1259 OID 41587)
-- Name: patologias_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX patologias_pk ON public.patologias USING btree (patologia_id);


--
-- TOC entry 2285 (class 1259 OID 41588)
-- Name: patologias_por_pacientes2_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX patologias_por_pacientes2_fk ON public.patologias_por_pacientes USING btree (patologia_id);


--
-- TOC entry 2286 (class 1259 OID 41589)
-- Name: patologias_por_pacientes_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX patologias_por_pacientes_fk ON public.patologias_por_pacientes USING btree (paciente_id);


--
-- TOC entry 2287 (class 1259 OID 41590)
-- Name: patologias_por_pacientes_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX patologias_por_pacientes_pk ON public.patologias_por_pacientes USING btree (paciente_id, patologia_id);


--
-- TOC entry 2296 (class 1259 OID 41591)
-- Name: promociones_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX promociones_pk ON public.promociones USING btree (promocion_id);


--
-- TOC entry 2319 (class 1259 OID 41592)
-- Name: r01_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX r01_fk ON public.usuarios USING btree (rol_id);


--
-- TOC entry 2238 (class 1259 OID 41593)
-- Name: r06_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX r06_fk ON public.direcciones USING btree (medico_id);


--
-- TOC entry 2239 (class 1259 OID 41594)
-- Name: r07_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX r07_fk ON public.direcciones USING btree (municipio_id);


--
-- TOC entry 2274 (class 1259 OID 41595)
-- Name: r08_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX r08_fk ON public.municipios USING btree (departamento_id);


--
-- TOC entry 2222 (class 1259 OID 41596)
-- Name: r09_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX r09_fk ON public.consultas USING btree (paciente_id);


--
-- TOC entry 2250 (class 1259 OID 41597)
-- Name: r10_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX r10_fk ON public.imagenes USING btree (paciente_id);


--
-- TOC entry 2210 (class 1259 OID 41598)
-- Name: r14_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX r14_fk ON public.citas USING btree (clinica_id);


--
-- TOC entry 2240 (class 1259 OID 41599)
-- Name: r16_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX r16_fk ON public.direcciones USING btree (clinica_id);


--
-- TOC entry 2211 (class 1259 OID 41600)
-- Name: r17_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX r17_fk ON public.citas USING btree (usuario_usuario);


--
-- TOC entry 2212 (class 1259 OID 41601)
-- Name: r18_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX r18_fk ON public.citas USING btree (medico_id);


--
-- TOC entry 2223 (class 1259 OID 41602)
-- Name: r19_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX r19_fk ON public.consultas USING btree (promocion_id);


--
-- TOC entry 2233 (class 1259 OID 41603)
-- Name: r21_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX r21_fk ON public.detalles_consultas USING btree (tratamiento_id);


--
-- TOC entry 2254 (class 1259 OID 41604)
-- Name: r23_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX r23_fk ON public.insumos USING btree (unidadmedida_id);


--
-- TOC entry 2245 (class 1259 OID 41605)
-- Name: r24_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX r24_fk ON public.existencias USING btree (insumo_id);


--
-- TOC entry 2246 (class 1259 OID 41606)
-- Name: r25_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX r25_fk ON public.existencias USING btree (clinica_id);


--
-- TOC entry 2270 (class 1259 OID 41607)
-- Name: r26_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX r26_fk ON public.movimientos USING btree (existencia_id);


--
-- TOC entry 2241 (class 1259 OID 41608)
-- Name: r27_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX r27_fk ON public.direcciones USING btree (paciente_id);


--
-- TOC entry 2224 (class 1259 OID 41609)
-- Name: r28_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX r28_fk ON public.consultas USING btree (medico_id);


--
-- TOC entry 2255 (class 1259 OID 41610)
-- Name: r29_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX r29_fk ON public.insumos USING btree (tipoinsumo_id);


--
-- TOC entry 2278 (class 1259 OID 41611)
-- Name: r30_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX r30_fk ON public.odontogramas USING btree (paciente_id);


--
-- TOC entry 2234 (class 1259 OID 41612)
-- Name: r31_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX r31_fk ON public.detalles_consultas USING btree (paciente_id);


--
-- TOC entry 2299 (class 1259 OID 41613)
-- Name: roles_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX roles_pk ON public.roles USING btree (rol_id);


--
-- TOC entry 2302 (class 1259 OID 41614)
-- Name: sub_menus_por_roles2_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sub_menus_por_roles2_fk ON public.sub_menus_por_roles USING btree (submenu_id);


--
-- TOC entry 2303 (class 1259 OID 41615)
-- Name: sub_menus_por_roles_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sub_menus_por_roles_fk ON public.sub_menus_por_roles USING btree (rol_id);


--
-- TOC entry 2304 (class 1259 OID 41616)
-- Name: sub_menus_por_roles_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX sub_menus_por_roles_pk ON public.sub_menus_por_roles USING btree (rol_id, submenu_id);


--
-- TOC entry 2307 (class 1259 OID 41617)
-- Name: submenus_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX submenus_pk ON public.submenus USING btree (submenu_id);


--
-- TOC entry 2310 (class 1259 OID 41618)
-- Name: tipos_insumos_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX tipos_insumos_pk ON public.tipos_insumos USING btree (tipoinsumo_id);


--
-- TOC entry 2313 (class 1259 OID 41619)
-- Name: tratamientos_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX tratamientos_pk ON public.tratamientos USING btree (tratamiento_id);


--
-- TOC entry 2316 (class 1259 OID 41620)
-- Name: unidades_medidas_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX unidades_medidas_pk ON public.unidades_medidas USING btree (unidadmedida_id);


--
-- TOC entry 2320 (class 1259 OID 41621)
-- Name: usuarios_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX usuarios_pk ON public.usuarios USING btree (usuario_usuario);


--
-- TOC entry 2347 (class 2606 OID 41622)
-- Name: privilegios_por_roles f_privilegios_por_rol; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.privilegios_por_roles
    ADD CONSTRAINT f_privilegios_por_rol FOREIGN KEY (roles_id) REFERENCES public.roles(rol_id);


--
-- TOC entry 2346 (class 2606 OID 41627)
-- Name: privilegios f_privilegios_submenu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.privilegios
    ADD CONSTRAINT f_privilegios_submenu FOREIGN KEY (submenu_id) REFERENCES public.submenus(submenu_id);


--
-- TOC entry 2348 (class 2606 OID 41632)
-- Name: privilegios_por_roles f_privlegios_por_accion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.privilegios_por_roles
    ADD CONSTRAINT f_privlegios_por_accion FOREIGN KEY (privilegios_id, submenu_id) REFERENCES public.privilegios(privilegio_id, submenu_id);


--
-- TOC entry 2321 (class 2606 OID 41637)
-- Name: citas fk_citas_paciente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.citas
    ADD CONSTRAINT fk_citas_paciente FOREIGN KEY (paciente_id) REFERENCES public.pacientes(paciente_id);


--
-- TOC entry 2322 (class 2606 OID 41642)
-- Name: citas fk_citas_r14_clinicas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.citas
    ADD CONSTRAINT fk_citas_r14_clinicas FOREIGN KEY (clinica_id) REFERENCES public.clinicas(clinica_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2323 (class 2606 OID 41647)
-- Name: citas fk_citas_r17_usuarios; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.citas
    ADD CONSTRAINT fk_citas_r17_usuarios FOREIGN KEY (usuario_usuario) REFERENCES public.usuarios(usuario_usuario) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2324 (class 2606 OID 41652)
-- Name: citas fk_citas_r18_medicos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.citas
    ADD CONSTRAINT fk_citas_r18_medicos FOREIGN KEY (medico_id) REFERENCES public.medicos(medico_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2325 (class 2606 OID 41657)
-- Name: consultas fk_consulta_r09_paciente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consultas
    ADD CONSTRAINT fk_consulta_r09_paciente FOREIGN KEY (paciente_id) REFERENCES public.pacientes(paciente_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2326 (class 2606 OID 41662)
-- Name: consultas fk_consulta_r19_promocio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consultas
    ADD CONSTRAINT fk_consulta_r19_promocio FOREIGN KEY (promocion_id) REFERENCES public.promociones(promocion_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2327 (class 2606 OID 41667)
-- Name: consultas fk_consulta_r28_medicos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consultas
    ADD CONSTRAINT fk_consulta_r28_medicos FOREIGN KEY (medico_id) REFERENCES public.medicos(medico_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2328 (class 2606 OID 41672)
-- Name: detalles_consultas fk_detalles_r21_tratamie; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalles_consultas
    ADD CONSTRAINT fk_detalles_r21_tratamie FOREIGN KEY (tratamiento_id) REFERENCES public.tratamientos(tratamiento_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2329 (class 2606 OID 41677)
-- Name: detalles_consultas fk_detalles_r31_paciente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalles_consultas
    ADD CONSTRAINT fk_detalles_r31_paciente FOREIGN KEY (paciente_id) REFERENCES public.pacientes(paciente_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2330 (class 2606 OID 41682)
-- Name: direcciones fk_direccio_r06_medicos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.direcciones
    ADD CONSTRAINT fk_direccio_r06_medicos FOREIGN KEY (medico_id) REFERENCES public.medicos(medico_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2331 (class 2606 OID 41687)
-- Name: direcciones fk_direccio_r07_municipi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.direcciones
    ADD CONSTRAINT fk_direccio_r07_municipi FOREIGN KEY (municipio_id) REFERENCES public.municipios(municipio_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2332 (class 2606 OID 41692)
-- Name: direcciones fk_direccio_r16_clinicas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.direcciones
    ADD CONSTRAINT fk_direccio_r16_clinicas FOREIGN KEY (clinica_id) REFERENCES public.clinicas(clinica_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2333 (class 2606 OID 41697)
-- Name: direcciones fk_direccio_r27_paciente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.direcciones
    ADD CONSTRAINT fk_direccio_r27_paciente FOREIGN KEY (paciente_id) REFERENCES public.pacientes(paciente_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2334 (class 2606 OID 41702)
-- Name: existencias fk_existenc_r24_insumos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.existencias
    ADD CONSTRAINT fk_existenc_r24_insumos FOREIGN KEY (insumo_id) REFERENCES public.insumos(insumo_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2335 (class 2606 OID 41707)
-- Name: existencias fk_existenc_r25_clinicas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.existencias
    ADD CONSTRAINT fk_existenc_r25_clinicas FOREIGN KEY (clinica_id) REFERENCES public.clinicas(clinica_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2336 (class 2606 OID 41712)
-- Name: imagenes fk_imagenes_r10_paciente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagenes
    ADD CONSTRAINT fk_imagenes_r10_paciente FOREIGN KEY (paciente_id) REFERENCES public.pacientes(paciente_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2337 (class 2606 OID 41717)
-- Name: insumos fk_insumos_r23_unidades; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insumos
    ADD CONSTRAINT fk_insumos_r23_unidades FOREIGN KEY (unidadmedida_id) REFERENCES public.unidades_medidas(unidadmedida_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2338 (class 2606 OID 41722)
-- Name: insumos fk_insumos_r29_tipos_in; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insumos
    ADD CONSTRAINT fk_insumos_r29_tipos_in FOREIGN KEY (tipoinsumo_id) REFERENCES public.tipos_insumos(tipoinsumo_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2339 (class 2606 OID 41727)
-- Name: menus_por_roles fk_menus_po_menus_por_menus; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menus_por_roles
    ADD CONSTRAINT fk_menus_po_menus_por_menus FOREIGN KEY (menu_id) REFERENCES public.menus(menu_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2340 (class 2606 OID 41732)
-- Name: menus_por_roles fk_menus_po_menus_por_roles; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menus_por_roles
    ADD CONSTRAINT fk_menus_po_menus_por_roles FOREIGN KEY (rol_id) REFERENCES public.roles(rol_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2341 (class 2606 OID 41737)
-- Name: movimientos fk_movimien_r26_existenc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movimientos
    ADD CONSTRAINT fk_movimien_r26_existenc FOREIGN KEY (existencia_id) REFERENCES public.existencias(existencia_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2342 (class 2606 OID 41742)
-- Name: municipios fk_municipi_r08_departam; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.municipios
    ADD CONSTRAINT fk_municipi_r08_departam FOREIGN KEY (departamento_id) REFERENCES public.departamentos(departamento_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2343 (class 2606 OID 41747)
-- Name: odontogramas fk_odontogr_r30_paciente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.odontogramas
    ADD CONSTRAINT fk_odontogr_r30_paciente FOREIGN KEY (paciente_id) REFERENCES public.pacientes(paciente_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2344 (class 2606 OID 41752)
-- Name: patologias_por_pacientes fk_patologi_patologia_paciente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patologias_por_pacientes
    ADD CONSTRAINT fk_patologi_patologia_paciente FOREIGN KEY (paciente_id) REFERENCES public.pacientes(paciente_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2345 (class 2606 OID 41757)
-- Name: patologias_por_pacientes fk_patologi_patologia_patologi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patologias_por_pacientes
    ADD CONSTRAINT fk_patologi_patologia_patologi FOREIGN KEY (patologia_id) REFERENCES public.patologias(patologia_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2349 (class 2606 OID 41762)
-- Name: roles fk_roles_dashboard; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT fk_roles_dashboard FOREIGN KEY (dashboard_id) REFERENCES public.dashboard(dashboard_id);


--
-- TOC entry 2350 (class 2606 OID 41767)
-- Name: sub_menus_por_roles fk_sub_menu_sub_menus_roles; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sub_menus_por_roles
    ADD CONSTRAINT fk_sub_menu_sub_menus_roles FOREIGN KEY (rol_id) REFERENCES public.roles(rol_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2351 (class 2606 OID 41772)
-- Name: sub_menus_por_roles fk_sub_menu_sub_menus_submenus; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sub_menus_por_roles
    ADD CONSTRAINT fk_sub_menu_sub_menus_submenus FOREIGN KEY (submenu_id) REFERENCES public.submenus(submenu_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2352 (class 2606 OID 41777)
-- Name: submenus fk_submenus_menu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.submenus
    ADD CONSTRAINT fk_submenus_menu FOREIGN KEY (menu_id) REFERENCES public.menus(menu_id);


--
-- TOC entry 2353 (class 2606 OID 41782)
-- Name: usuarios fk_usuarios_r01_roles; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT fk_usuarios_r01_roles FOREIGN KEY (rol_id) REFERENCES public.roles(rol_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2354 (class 2606 OID 41787)
-- Name: usuarios fk_usuarios_r50_medicos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT fk_usuarios_r50_medicos FOREIGN KEY (medico_id) REFERENCES public.medicos(medico_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2355 (class 2606 OID 41792)
-- Name: usuarios fk_usuarios_r51_paciente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT fk_usuarios_r51_paciente FOREIGN KEY (paciente_id) REFERENCES public.pacientes(paciente_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


-- Completed on 2019-07-21 20:13:50 CST

--
-- PostgreSQL database dump complete
--

