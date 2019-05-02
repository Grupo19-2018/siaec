--
-- PostgreSQL database dump
--

-- Dumped from database version 9.6.11
-- Dumped by pg_dump version 9.6.11

-- Started on 2019-04-29 11:19:05 CST

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
-- TOC entry 1 (class 3079 OID 12393)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2539 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 187 (class 1259 OID 16456)
-- Name: bitacora; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bitacora (
    bitacora_id integer NOT NULL,
    bitacora_fecha_hora date,
    bitacora_usuario character varying(50),
    bitacora_transaccion character varying(100)
);


ALTER TABLE public.bitacora OWNER TO postgres;

--
-- TOC entry 188 (class 1259 OID 16459)
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
-- TOC entry 2540 (class 0 OID 0)
-- Dependencies: 188
-- Name: bitacora_bitacora_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bitacora_bitacora_id_seq OWNED BY public.bitacora.bitacora_id;


--
-- TOC entry 189 (class 1259 OID 16461)
-- Name: citas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.citas (
    cita_id integer NOT NULL,
    clinica_id integer NOT NULL,
    medico_id integer,
    usuario_usuario character varying(50),
    cita_fecha date,
    cita_hora time without time zone,
    cita_nombres character varying(50),
    cita_apellidos character varying(50),
    cita_telefono character varying(10),
    cita_correo character varying(50),
    cita_motivo character varying(250),
    cita_fecha_creacion date,
    cita_hora_creacion time without time zone,
    cita_estado integer,
    cita_usuario_creacion character varying(50),
    cita_fecha_modificacion date,
    cita_usuario_modificacion character varying(50),
    cita_ensala boolean,
    cita_paciente integer
);


ALTER TABLE public.citas OWNER TO postgres;

--
-- TOC entry 190 (class 1259 OID 16467)
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
-- TOC entry 2541 (class 0 OID 0)
-- Dependencies: 190
-- Name: citas_cita_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.citas_cita_id_seq OWNED BY public.citas.cita_id;


--
-- TOC entry 191 (class 1259 OID 16469)
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
-- TOC entry 192 (class 1259 OID 16472)
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
-- TOC entry 2542 (class 0 OID 0)
-- Dependencies: 192
-- Name: clinicas_clinica_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clinicas_clinica_id_seq OWNED BY public.clinicas.clinica_id;


--
-- TOC entry 193 (class 1259 OID 16474)
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
    configuracion_imagen_login character varying(300)
);


ALTER TABLE public.configuraciones OWNER TO postgres;

--
-- TOC entry 194 (class 1259 OID 16480)
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
-- TOC entry 2543 (class 0 OID 0)
-- Dependencies: 194
-- Name: configuraciones_configuracion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.configuraciones_configuracion_id_seq OWNED BY public.configuraciones.configuracion_id;


--
-- TOC entry 195 (class 1259 OID 16482)
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
-- TOC entry 196 (class 1259 OID 16488)
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
-- TOC entry 2544 (class 0 OID 0)
-- Dependencies: 196
-- Name: consultas_consulta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.consultas_consulta_id_seq OWNED BY public.consultas.consulta_id;


--
-- TOC entry 197 (class 1259 OID 16490)
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
-- TOC entry 198 (class 1259 OID 16492)
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
-- TOC entry 199 (class 1259 OID 16496)
-- Name: departamentos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.departamentos (
    departamento_id integer NOT NULL,
    departamento_nombre character varying(25)
);


ALTER TABLE public.departamentos OWNER TO postgres;

--
-- TOC entry 200 (class 1259 OID 16499)
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
-- TOC entry 2545 (class 0 OID 0)
-- Dependencies: 200
-- Name: departamentos_departamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.departamentos_departamento_id_seq OWNED BY public.departamentos.departamento_id;


--
-- TOC entry 201 (class 1259 OID 16501)
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
-- TOC entry 202 (class 1259 OID 16507)
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
-- TOC entry 2546 (class 0 OID 0)
-- Dependencies: 202
-- Name: detalles_consultas_detalleconsulta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.detalles_consultas_detalleconsulta_id_seq OWNED BY public.detalles_consultas.detalleconsulta_id;


--
-- TOC entry 203 (class 1259 OID 16509)
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
-- TOC entry 204 (class 1259 OID 16512)
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
-- TOC entry 2547 (class 0 OID 0)
-- Dependencies: 204
-- Name: direcciones_direccion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.direcciones_direccion_id_seq OWNED BY public.direcciones.direccion_id;


--
-- TOC entry 205 (class 1259 OID 16514)
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
-- TOC entry 206 (class 1259 OID 16517)
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
-- TOC entry 2548 (class 0 OID 0)
-- Dependencies: 206
-- Name: existencias_existencia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.existencias_existencia_id_seq OWNED BY public.existencias.existencia_id;


--
-- TOC entry 207 (class 1259 OID 16519)
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
-- TOC entry 208 (class 1259 OID 16525)
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
-- TOC entry 2549 (class 0 OID 0)
-- Dependencies: 208
-- Name: imagenes_imagen_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.imagenes_imagen_id_seq OWNED BY public.imagenes.imagen_id;


--
-- TOC entry 209 (class 1259 OID 16527)
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
-- TOC entry 210 (class 1259 OID 16530)
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
-- TOC entry 2550 (class 0 OID 0)
-- Dependencies: 210
-- Name: insumos_insumo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.insumos_insumo_id_seq OWNED BY public.insumos.insumo_id;


--
-- TOC entry 211 (class 1259 OID 16532)
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
-- TOC entry 212 (class 1259 OID 16535)
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
-- TOC entry 2551 (class 0 OID 0)
-- Dependencies: 212
-- Name: medicos_medico_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.medicos_medico_id_seq OWNED BY public.medicos.medico_id;


--
-- TOC entry 213 (class 1259 OID 16537)
-- Name: menus; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menus (
    menu_id integer NOT NULL,
    menu_nombre character varying(50)
);


ALTER TABLE public.menus OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 16540)
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
-- TOC entry 2552 (class 0 OID 0)
-- Dependencies: 214
-- Name: menus_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.menus_menu_id_seq OWNED BY public.menus.menu_id;


--
-- TOC entry 215 (class 1259 OID 16542)
-- Name: menus_por_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.menus_por_roles (
    rol_id integer NOT NULL,
    menu_id integer NOT NULL
);


ALTER TABLE public.menus_por_roles OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16545)
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
-- TOC entry 217 (class 1259 OID 16548)
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
-- TOC entry 2553 (class 0 OID 0)
-- Dependencies: 217
-- Name: movimientos_movimiento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.movimientos_movimiento_id_seq OWNED BY public.movimientos.movimiento_id;


--
-- TOC entry 218 (class 1259 OID 16550)
-- Name: municipios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.municipios (
    municipio_id integer NOT NULL,
    departamento_id integer NOT NULL,
    municipio_nombre character varying(50)
);


ALTER TABLE public.municipios OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16553)
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
-- TOC entry 2554 (class 0 OID 0)
-- Dependencies: 219
-- Name: municipios_municipio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.municipios_municipio_id_seq OWNED BY public.municipios.municipio_id;


--
-- TOC entry 220 (class 1259 OID 16555)
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
-- TOC entry 221 (class 1259 OID 16558)
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
-- TOC entry 2555 (class 0 OID 0)
-- Dependencies: 221
-- Name: odontogramas_odontograma_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.odontogramas_odontograma_id_seq OWNED BY public.odontogramas.odontograma_id;


--
-- TOC entry 222 (class 1259 OID 16560)
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
    paciente_usuario_usuario character varying(50)
);


ALTER TABLE public.pacientes OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16566)
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
-- TOC entry 2556 (class 0 OID 0)
-- Dependencies: 223
-- Name: pacientes_paciente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.pacientes_paciente_id_seq OWNED BY public.pacientes.paciente_id;


--
-- TOC entry 224 (class 1259 OID 16568)
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
-- TOC entry 225 (class 1259 OID 16571)
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
-- TOC entry 2557 (class 0 OID 0)
-- Dependencies: 225
-- Name: patologias_patologia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.patologias_patologia_id_seq OWNED BY public.patologias.patologia_id;


--
-- TOC entry 226 (class 1259 OID 16573)
-- Name: patologias_por_pacientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.patologias_por_pacientes (
    paciente_id integer NOT NULL,
    patologia_id integer NOT NULL
);


ALTER TABLE public.patologias_por_pacientes OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16576)
-- Name: privilegios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.privilegios (
    privilegio_id integer NOT NULL,
    submenu_id integer NOT NULL,
    privilegio_accion character varying(50)
);


ALTER TABLE public.privilegios OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16579)
-- Name: privilegios_por_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.privilegios_por_roles (
    privilegios_id integer NOT NULL,
    submenu_id integer NOT NULL,
    roles_id integer NOT NULL
);


ALTER TABLE public.privilegios_por_roles OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 16582)
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
-- TOC entry 230 (class 1259 OID 16588)
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
-- TOC entry 2558 (class 0 OID 0)
-- Dependencies: 230
-- Name: promociones_promocion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.promociones_promocion_id_seq OWNED BY public.promociones.promocion_id;


--
-- TOC entry 231 (class 1259 OID 16590)
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
-- TOC entry 232 (class 1259 OID 16593)
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
-- TOC entry 2559 (class 0 OID 0)
-- Dependencies: 232
-- Name: roles_rol_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.roles_rol_id_seq OWNED BY public.roles.rol_id;


--
-- TOC entry 233 (class 1259 OID 16595)
-- Name: sub_menus_por_roles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sub_menus_por_roles (
    rol_id integer NOT NULL,
    submenu_id integer NOT NULL
);


ALTER TABLE public.sub_menus_por_roles OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16598)
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
-- TOC entry 235 (class 1259 OID 16601)
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
-- TOC entry 2560 (class 0 OID 0)
-- Dependencies: 235
-- Name: submenus_submenu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.submenus_submenu_id_seq OWNED BY public.submenus.submenu_id;


--
-- TOC entry 236 (class 1259 OID 16603)
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
-- TOC entry 237 (class 1259 OID 16606)
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
-- TOC entry 2561 (class 0 OID 0)
-- Dependencies: 237
-- Name: tipos_insumos_tipoinsumo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tipos_insumos_tipoinsumo_id_seq OWNED BY public.tipos_insumos.tipoinsumo_id;


--
-- TOC entry 238 (class 1259 OID 16608)
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
-- TOC entry 239 (class 1259 OID 16611)
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
-- TOC entry 2562 (class 0 OID 0)
-- Dependencies: 239
-- Name: tratamientos_tratamiento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tratamientos_tratamiento_id_seq OWNED BY public.tratamientos.tratamiento_id;


--
-- TOC entry 240 (class 1259 OID 16613)
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
-- TOC entry 241 (class 1259 OID 16616)
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
-- TOC entry 2563 (class 0 OID 0)
-- Dependencies: 241
-- Name: unidades_medidas_unidadmedida_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.unidades_medidas_unidadmedida_id_seq OWNED BY public.unidades_medidas.unidadmedida_id;


--
-- TOC entry 242 (class 1259 OID 16618)
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
-- TOC entry 2182 (class 2604 OID 16621)
-- Name: bitacora bitacora_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bitacora ALTER COLUMN bitacora_id SET DEFAULT nextval('public.bitacora_bitacora_id_seq'::regclass);


--
-- TOC entry 2183 (class 2604 OID 16622)
-- Name: citas cita_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.citas ALTER COLUMN cita_id SET DEFAULT nextval('public.citas_cita_id_seq'::regclass);


--
-- TOC entry 2184 (class 2604 OID 16623)
-- Name: clinicas clinica_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clinicas ALTER COLUMN clinica_id SET DEFAULT nextval('public.clinicas_clinica_id_seq'::regclass);


--
-- TOC entry 2185 (class 2604 OID 16624)
-- Name: configuraciones configuracion_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configuraciones ALTER COLUMN configuracion_id SET DEFAULT nextval('public.configuraciones_configuracion_id_seq'::regclass);


--
-- TOC entry 2186 (class 2604 OID 16625)
-- Name: consultas consulta_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consultas ALTER COLUMN consulta_id SET DEFAULT nextval('public.consultas_consulta_id_seq'::regclass);


--
-- TOC entry 2188 (class 2604 OID 16626)
-- Name: departamentos departamento_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamentos ALTER COLUMN departamento_id SET DEFAULT nextval('public.departamentos_departamento_id_seq'::regclass);


--
-- TOC entry 2189 (class 2604 OID 16627)
-- Name: detalles_consultas detalleconsulta_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalles_consultas ALTER COLUMN detalleconsulta_id SET DEFAULT nextval('public.detalles_consultas_detalleconsulta_id_seq'::regclass);


--
-- TOC entry 2190 (class 2604 OID 16628)
-- Name: direcciones direccion_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.direcciones ALTER COLUMN direccion_id SET DEFAULT nextval('public.direcciones_direccion_id_seq'::regclass);


--
-- TOC entry 2191 (class 2604 OID 16629)
-- Name: existencias existencia_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.existencias ALTER COLUMN existencia_id SET DEFAULT nextval('public.existencias_existencia_id_seq'::regclass);


--
-- TOC entry 2192 (class 2604 OID 16630)
-- Name: imagenes imagen_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagenes ALTER COLUMN imagen_id SET DEFAULT nextval('public.imagenes_imagen_id_seq'::regclass);


--
-- TOC entry 2193 (class 2604 OID 16631)
-- Name: insumos insumo_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insumos ALTER COLUMN insumo_id SET DEFAULT nextval('public.insumos_insumo_id_seq'::regclass);


--
-- TOC entry 2194 (class 2604 OID 16632)
-- Name: medicos medico_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicos ALTER COLUMN medico_id SET DEFAULT nextval('public.medicos_medico_id_seq'::regclass);


--
-- TOC entry 2195 (class 2604 OID 16633)
-- Name: menus menu_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menus ALTER COLUMN menu_id SET DEFAULT nextval('public.menus_menu_id_seq'::regclass);


--
-- TOC entry 2196 (class 2604 OID 16634)
-- Name: movimientos movimiento_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movimientos ALTER COLUMN movimiento_id SET DEFAULT nextval('public.movimientos_movimiento_id_seq'::regclass);


--
-- TOC entry 2197 (class 2604 OID 16635)
-- Name: municipios municipio_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.municipios ALTER COLUMN municipio_id SET DEFAULT nextval('public.municipios_municipio_id_seq'::regclass);


--
-- TOC entry 2198 (class 2604 OID 16636)
-- Name: odontogramas odontograma_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.odontogramas ALTER COLUMN odontograma_id SET DEFAULT nextval('public.odontogramas_odontograma_id_seq'::regclass);


--
-- TOC entry 2199 (class 2604 OID 16637)
-- Name: pacientes paciente_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pacientes ALTER COLUMN paciente_id SET DEFAULT nextval('public.pacientes_paciente_id_seq'::regclass);


--
-- TOC entry 2200 (class 2604 OID 16638)
-- Name: patologias patologia_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patologias ALTER COLUMN patologia_id SET DEFAULT nextval('public.patologias_patologia_id_seq'::regclass);


--
-- TOC entry 2201 (class 2604 OID 16639)
-- Name: promociones promocion_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promociones ALTER COLUMN promocion_id SET DEFAULT nextval('public.promociones_promocion_id_seq'::regclass);


--
-- TOC entry 2202 (class 2604 OID 16640)
-- Name: roles rol_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles ALTER COLUMN rol_id SET DEFAULT nextval('public.roles_rol_id_seq'::regclass);


--
-- TOC entry 2203 (class 2604 OID 16641)
-- Name: submenus submenu_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.submenus ALTER COLUMN submenu_id SET DEFAULT nextval('public.submenus_submenu_id_seq'::regclass);


--
-- TOC entry 2204 (class 2604 OID 16642)
-- Name: tipos_insumos tipoinsumo_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipos_insumos ALTER COLUMN tipoinsumo_id SET DEFAULT nextval('public.tipos_insumos_tipoinsumo_id_seq'::regclass);


--
-- TOC entry 2205 (class 2604 OID 16643)
-- Name: tratamientos tratamiento_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tratamientos ALTER COLUMN tratamiento_id SET DEFAULT nextval('public.tratamientos_tratamiento_id_seq'::regclass);


--
-- TOC entry 2206 (class 2604 OID 16644)
-- Name: unidades_medidas unidadmedida_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unidades_medidas ALTER COLUMN unidadmedida_id SET DEFAULT nextval('public.unidades_medidas_unidadmedida_id_seq'::regclass);


--
-- TOC entry 2476 (class 0 OID 16456)
-- Dependencies: 187
-- Data for Name: bitacora; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bitacora (bitacora_id, bitacora_fecha_hora, bitacora_usuario, bitacora_transaccion) FROM stdin;
\.


--
-- TOC entry 2564 (class 0 OID 0)
-- Dependencies: 188
-- Name: bitacora_bitacora_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bitacora_bitacora_id_seq', 1, false);


--
-- TOC entry 2478 (class 0 OID 16461)
-- Dependencies: 189
-- Data for Name: citas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.citas (cita_id, clinica_id, medico_id, usuario_usuario, cita_fecha, cita_hora, cita_nombres, cita_apellidos, cita_telefono, cita_correo, cita_motivo, cita_fecha_creacion, cita_hora_creacion, cita_estado, cita_usuario_creacion, cita_fecha_modificacion, cita_usuario_modificacion, cita_ensala, cita_paciente) FROM stdin;
3	1	2	\N	2019-01-25	09:00:00	Diego	Guzman	2456-4656	diego.guzman@gmail.com	Motivo	2019-01-23	15:43:58	1	\N	\N	\N	\N	\N
5	2	\N	juanfran.aldana@gmail.com	2019-02-13	08:00:00	Francis	\N	7485-7485	juanfran.aldana@gmail.com		2019-02-13	13:53:29	4	juanfran.aldana@gmail.com	2019-02-13	juanfran.aldana@gmail.com	\N	\N
6	2	1	juanfran.aldana@gmail.com	2019-02-13	08:00:00	Fracis	Merjivar	7485-7485	juanfran.aldana@gmail.com		2019-02-13	15:52:40	1	juanfran.aldana@gmail.com	\N	\N	\N	\N
4	1	1	Diana	2019-02-13	09:00:00	Diana	De Rivas	7432-4845	diana.chavez@gmail.com	Dolor en muela	2019-02-13	13:52:15	4	Diana	2019-02-13	Diana	t	\N
\.


--
-- TOC entry 2565 (class 0 OID 0)
-- Dependencies: 190
-- Name: citas_cita_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.citas_cita_id_seq', 6, true);


--
-- TOC entry 2480 (class 0 OID 16469)
-- Dependencies: 191
-- Data for Name: clinicas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clinicas (clinica_id, clinica_nombre, clinica_correo, clinica_telefono_fijo, clinica_telefono_movil, clinica_modulo, clinica_horario_apertura, clinica_horario_cierre, clinica_estado, clinica_fecha_creacion, clinica_usuario_creacion, clinica_fecha_modificacion, clinica_usuario_modificacion) FROM stdin;
1	Smiling San Salvador	smiling.sansalvador@gmail.com	2211-4477	7845-1454	2	08:00:00	17:00:00	t	2018-10-27	Nombre de usuario	\N	\N
2	Smiling Antigua Cuscatlán	smiling.antiguocuscatlan@gmail.com	2214-7845	7485-9654	1	08:00:00	17:00:00	t	2018-10-27	Nombre de usuario	\N	\N
\.


--
-- TOC entry 2566 (class 0 OID 0)
-- Dependencies: 192
-- Name: clinicas_clinica_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clinicas_clinica_id_seq', 2, true);


--
-- TOC entry 2482 (class 0 OID 16474)
-- Dependencies: 193
-- Data for Name: configuraciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.configuraciones (configuracion_id, configuracion_tiempo_sesion, configuracion_correo_host, configuracion_correo_port, configuracion_correo_requerido, configuracion_correo_encryptacion, configuracion_correo_cuenta, configuracion_correo_contrasenya, configuracion_correo_ilimitada, configuracion_correo_mes, configuracion_correo_dia, configuracion_correo_enviado_mes, configuracion_correo_enviado_dia, configuracion_correo_activo, configuracion_titulo, configuracion_mensaje, configuracion_imagen_superior, configuracion_imagen_inferior, configuracion_imagen_login) FROM stdin;
1	30	smtp.gmail.com	587	t	tls	pruebascampos.er@gmail.com	$prueba$#correo	f	2000	20	0	0	t	VISIÓN	Posicionarse como la mejor red de clínicas dentales en El Salvador que permita mejorar los niveles de salud bucal de nuestra sociedad. En donde se destaque la atención por su calidad, enfoque estático, responsabilidad, respeto, ética profesional, para de esta forma ir generando una relación odontólogo-paciente de confianza.	bannerfinal.png	direcciones.png	fondo.png
\.


--
-- TOC entry 2567 (class 0 OID 0)
-- Dependencies: 194
-- Name: configuraciones_configuracion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.configuraciones_configuracion_id_seq', 1, true);


--
-- TOC entry 2484 (class 0 OID 16482)
-- Dependencies: 195
-- Data for Name: consultas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.consultas (consulta_id, promocion_id, paciente_id, medico_id, consulta_motivo, consulta_diagnostico, consulta_receta, consulta_nota, consulta_fecha_creacion, consulta_usuario_creacion, consulta_fecha_modificacion, consulta_usuario_modificacion) FROM stdin;
1	2	1	2	Este es un motivo de consulta.	Este es un diagnóstico de consulta.	Esta es una receta de consulta.	Esta es una nota de consulta.	2018-10-31	\N	\N	\N
2	1	1	2	Esto es un motivo de consulta.	Este es un diagnóstico de consulta.	Esta es una receta.	Esta es una nota.	2018-11-01	\N	\N	\N
3	2	1	3	Este es un motivo de consulta.	Este es un diagnostico de consulta.	Esta es una receta.	Esta es una nota de consulta.	2018-11-04	\N	\N	\N
4	1	1	1	Este es un motivo de consulta.	Este es un diagnóstico de consulta.	Eta es una receta.	Esta es una nota de consulta.	2018-11-04	\N	\N	\N
5	1	3	1	Este es un motivo de consulta.	Este es un diagnostico de consulta.	Esta es una receta.	Esta es una nota.	2018-11-04	\N	\N	\N
6	1	1	4	Este es un motivo de consulta.	Este es un diagnostico de consulta.	Esta es una receta de consulta.	Esta es una nota de consulta.	2018-11-04	\N	\N	\N
7	2	1	1	Este es un motivo de consulta.	Este es un diagnóstico de consulta.	Esta es una receta de consulta.	Esta es una nota de consulta.	2018-11-05	\N	\N	\N
8	1	1	2	Este es un motivo de consulta.	Este es un diagnóstico de consulta.	Esta es una receta de consulta.	Esta es una nota de consulta.	2018-11-09	\N	\N	\N
10	5	1	2	Este es un motivo de consulta.	Este es un diagnostico de consulta.	Esta es una receta.	Esta es una nota.	2019-01-04	\N	\N	\N
9	5	1	2	\tEste es un motivo de consulta.	Este es un diagnóstico de consulta.	Esta es una receta de consulta.	Esta es una nota de consulta.	2018-11-11	\N	\N	\N
\.


--
-- TOC entry 2568 (class 0 OID 0)
-- Dependencies: 196
-- Name: consultas_consulta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.consultas_consulta_id_seq', 10, true);


--
-- TOC entry 2487 (class 0 OID 16492)
-- Dependencies: 198
-- Data for Name: dashboard; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dashboard (dashboard_id, dashboard_nombre, dashboard_descripcion, dashboard_url, dashboard_imagen) FROM stdin;
1	Básico	Muestra un mensaje de Bienvenida	/templates/dashboard/basico.xhtml	/templates/dashboard/basico.jpg
2	Estadistica	Muestra estadisticas general de la clínica	/templates/dashboard/estadisticas.xhtml	/templates/dashboard/basico.jpg
3	Médicos	Muestra citas o compromisos del médico	/templates/dashboard/medico.xhtml	/templates/dashboard/basico.jpg
4	Paciente	Registro rápido de citas y citas reservadas	/templates/dashboard/paciente.xhtml	/templates/dashboard/paciente.jpg
5	Administración	Muestra los la cantidad de registro del SIAEC	/templates/dashboard/paciente.xhtml	/templates/dashboard/paciente.jpg
6	Asistente	Muestras las citas del día.	/templates/dashboard/asistente.xhtml	/templates/dashboard/asistente.jpg
\.


--
-- TOC entry 2569 (class 0 OID 0)
-- Dependencies: 197
-- Name: dashboard_dashboard_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dashboard_dashboard_id_seq', 1, false);


--
-- TOC entry 2488 (class 0 OID 16496)
-- Dependencies: 199
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
-- TOC entry 2570 (class 0 OID 0)
-- Dependencies: 200
-- Name: departamentos_departamento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.departamentos_departamento_id_seq', 1, false);


--
-- TOC entry 2490 (class 0 OID 16501)
-- Dependencies: 201
-- Data for Name: detalles_consultas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.detalles_consultas (detalleconsulta_id, tratamiento_id, paciente_id, detalleconsulta_pieza, detalleconsulta_tratamiento, detalleconsulta_cargo, detalleconsulta_abono, detalleconsulta_fecha_creacion, detalleconsulta_usuario_creacio) FROM stdin;
1	3	1	28	\N	30	30	2018-11-03	Nombre Usuario
2	4	1	38	\N	50	45	2018-11-03	Nombre Usuario
3	6	1	18	\N	20	20	2018-11-04	Nombre Usuario
4	4	1	fgfdgg	\N	10	10	2018-11-05	Nombre Usuario
5	\N	1	\N	\N	\N	\N	2018-11-05	Nombre Usuario
6	1	1	25	\N	50	25	2018-11-05	Nombre Usuario
7	5	1	22	\N	50	45	2018-11-05	Nombre Usuario
8	7	1	55	\N	80	70	2018-11-05	Nombre Usuario
9	3	1	22	\N	90	80	2018-11-05	Nombre Usuario
10	1	1	44	\N	50	50	2018-11-05	Nombre Usuario
11	5	1	55	\N	10	10	2018-11-05	Nombre Usuario
12	6	1	65	\N	60	60	2018-11-05	Nombre Usuario
13	2	1	12	\N	10	10	2018-11-05	Nombre Usuario
14	10	4	44	\N	50	50	2018-11-05	Nombre Usuario
15	4	4	65	\N	40	40	2018-11-05	Nombre Usuario
16	5	4	85	\N	50	50	2018-11-05	Nombre Usuario
17	1	3	22	\N	50	50	2018-11-05	Nombre Usuario
18	4	3	65	\N	50	50	2018-11-05	Nombre Usuario
19	5	3	55	\N	20	20	2018-11-05	Nombre Usuario
20	3	4	33	\N	40	40	2018-11-05	Nombre Usuario
21	1	2	32	\N	50	30	2018-11-06	Nombre Usuario
22	3	5	35	\N	40	30	2018-11-11	Nombre Usuario
\.


--
-- TOC entry 2571 (class 0 OID 0)
-- Dependencies: 202
-- Name: detalles_consultas_detalleconsulta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.detalles_consultas_detalleconsulta_id_seq', 22, true);


--
-- TOC entry 2492 (class 0 OID 16509)
-- Dependencies: 203
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
7	1	\N	\N	180	Miralvalle	Principal	1	Barcelona	A	B
11	5	\N	\N	180	Madre Tierra	Principal	2	A	20	La Ceiba
12	6	\N	\N	180	Los Limones	Principal	48	A	B	El Trebol
\.


--
-- TOC entry 2572 (class 0 OID 0)
-- Dependencies: 204
-- Name: direcciones_direccion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.direcciones_direccion_id_seq', 12, true);


--
-- TOC entry 2494 (class 0 OID 16514)
-- Dependencies: 205
-- Data for Name: existencias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.existencias (existencia_id, insumo_id, clinica_id, existencia_cantidad) FROM stdin;
3	2	1	2000
11	6	1	7
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
18	9	2	4
17	9	1	0
\.


--
-- TOC entry 2573 (class 0 OID 0)
-- Dependencies: 206
-- Name: existencias_existencia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.existencias_existencia_id_seq', 20, true);


--
-- TOC entry 2496 (class 0 OID 16519)
-- Dependencies: 207
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
24	4	Carta Asesora.pdf	Esta es una anotación de la imagen tomada al paciente en la consulta.	\N	c://Users/Fam. Gomez Aldana/Documents/NetBeansProjects/siaec/web/images/pacientes/4/Carta Asesora.pdf	2018-11-04	Nombre Usuario
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
-- TOC entry 2574 (class 0 OID 0)
-- Dependencies: 208
-- Name: imagenes_imagen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.imagenes_imagen_id_seq', 37, true);


--
-- TOC entry 2498 (class 0 OID 16527)
-- Dependencies: 209
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
-- TOC entry 2575 (class 0 OID 0)
-- Dependencies: 210
-- Name: insumos_insumo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.insumos_insumo_id_seq', 10, true);


--
-- TOC entry 2500 (class 0 OID 16532)
-- Dependencies: 211
-- Data for Name: medicos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.medicos (medico_id, medico_primer_nombre, medico_segundo_nombre, medico_primer_apellido, medico_segundo_apellido, medico_fecha_nacimiento, medico_sexo, medico_correo, medico_especialidad, medico_telefono_casa, medico_telefono_movil, medico_numero_acreditacion, medico_estado, medico_usuario, medico_fecha_creacion, medico_usuario_creacion, medico_fecha_modificacion, medico_usuario_modificacion) FROM stdin;
2	Joseline	Graciela	Alfaro	Domínguez	1993-12-16	f	joseline.alfaro@hotmail.com	Ortodoncia	2514-2536	7845-1245	5678	t	\N	2018-10-27	Nombre de usuario	2018-10-27	Nombre de usuario
3	Jacqueline	Yessenia	Nieto	Palacios	1986-12-27	f	jacqueline.nieto@yahoo.es	Periodoncia	2233-5656	7412-5478	9123	t	\N	2018-10-27	Nombre de usuario	\N	\N
4	Johana	Beatriz	Guzmán	Flores	1990-05-27	f	johana.guzman@gmail.com	Prostodoncia	2356-8974	7412-5896	4567	t	\N	2018-10-27	Nombre de usuario	\N	\N
1	Jessica	Elizabeth	Rivas	Rodriguez	1990-09-20	f	jessica.rivas@gmail.com	Odontología general	2255-4488	7788-5544	1234	t	Valeria	2018-10-27	Nombre de usuario	\N	\N
\.


--
-- TOC entry 2576 (class 0 OID 0)
-- Dependencies: 212
-- Name: medicos_medico_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.medicos_medico_id_seq', 4, true);


--
-- TOC entry 2502 (class 0 OID 16537)
-- Dependencies: 213
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
-- TOC entry 2577 (class 0 OID 0)
-- Dependencies: 214
-- Name: menus_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.menus_menu_id_seq', 1, false);


--
-- TOC entry 2504 (class 0 OID 16542)
-- Dependencies: 215
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
-- TOC entry 2505 (class 0 OID 16545)
-- Dependencies: 216
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
\.


--
-- TOC entry 2578 (class 0 OID 0)
-- Dependencies: 217
-- Name: movimientos_movimiento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.movimientos_movimiento_id_seq', 42, true);


--
-- TOC entry 2507 (class 0 OID 16550)
-- Dependencies: 218
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
-- TOC entry 2579 (class 0 OID 0)
-- Dependencies: 219
-- Name: municipios_municipio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.municipios_municipio_id_seq', 1, false);


--
-- TOC entry 2509 (class 0 OID 16555)
-- Dependencies: 220
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
65	2	25	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
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
81	2	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
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
70	2	32	3	0	0	0	0	0	0	f	f	f	f	f	t	f	0	f	f
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
109	3	15	1	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
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
125	3	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
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
172	4	28	2	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
173	4	31	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
174	4	32	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
175	4	33	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
176	4	34	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
177	4	35	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
178	4	36	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
179	4	37	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
180	4	38	3	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
181	4	41	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
182	4	42	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
183	4	43	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
184	4	44	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
185	4	45	4	0	0	0	0	0	0	f	f	f	f	f	f	f	0	f	f
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
\.


--
-- TOC entry 2580 (class 0 OID 0)
-- Dependencies: 221
-- Name: odontogramas_odontograma_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.odontogramas_odontograma_id_seq', 315, true);


--
-- TOC entry 2511 (class 0 OID 16560)
-- Dependencies: 222
-- Data for Name: pacientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.pacientes (paciente_id, paciente_expediente, paciente_primer_nombre, paciente_segundo_nombre, paciente_primer_apellido, paciente_segundo_apellido, paciente_fecha_nacimiento, paciente_sexo, paciente_correo, paciente_trabajo, paciente_telefono_casa, paciente_telefono_movil, paciente_telefono_oficina, paciente_whatsapp, paciente_estado, paciente_antecedentes, paciente_recordatorio, paciente_fecha_seguimiento, paciente_responsable, paciente_fecha_creacion, paciente_usuario_creacion, paciente_fecha_modificacion, paciente_usuario_modificacion, paciente_notificar_correo, paciente_codigo, paciente_usuario_usuario) FROM stdin;
2	1009	Erick	Eduardo	Campos	Rivas	1990-02-27	t	erick.rivas@yahoo.es	MINSAL	2255-8877	7485-4785	2221-5454	f	t	\N	t	\N	\N	2018-10-27	\N	\N	\N	\N	8456	\N
3	1009	Valeria	Guadalupe	Campos	Gómez	1990-02-19	f	valeria.campos@hotmail.com	GOES	2356-8978	7412-5896	2145-7845	t	t	\N	t	\N	\N	2018-10-27	\N	\N	\N	\N	5214	\N
4	1009	Wilfredo	José	Flamenco	Lémus	1990-01-02	t	wilfredo.flamenco@yahoo.com	AMSS	2356-8978	7485-9621	2158-9654	f	t	\N	t	\N	\N	2018-10-27	\N	2018-11-05	Nombre de usuario	\N	9458	\N
5	\N	Francis	Amilcar	Menjivar	Menjivar	1980-10-10	t	francis.menjivar@hotmail.com	UES	2216-4578	7878-7878	2255-4477	t	t	\N	t	\N	\N	2018-11-06	\N	\N	\N	\N	5263	\N
6	\N	Diego	Rafael	Guzman	Flores	1990-01-12	t	diego.flores@gmail.com	EDESSA	2216-5689	7485-7485	7845-1245	t	t	\N	t	\N		2019-01-25	\N	\N	\N	t	1218	\N
1	1009	Juan	Francisco	Aldana	Domínguez	1990-05-27	t	juanfran.aldana@gmail.com	UES	2216-4578	7611-0659	2255-7777	t	t	El paciente es alérgico al frío.	t	\N		2018-10-27	\N	2018-11-28	Nombre de usuario	t	1234	\N
\.


--
-- TOC entry 2581 (class 0 OID 0)
-- Dependencies: 223
-- Name: pacientes_paciente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.pacientes_paciente_id_seq', 6, true);


--
-- TOC entry 2513 (class 0 OID 16568)
-- Dependencies: 224
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
-- TOC entry 2582 (class 0 OID 0)
-- Dependencies: 225
-- Name: patologias_patologia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.patologias_patologia_id_seq', 17, true);


--
-- TOC entry 2515 (class 0 OID 16573)
-- Dependencies: 226
-- Data for Name: patologias_por_pacientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.patologias_por_pacientes (paciente_id, patologia_id) FROM stdin;
1	12
1	5
1	1
1	4
\.


--
-- TOC entry 2516 (class 0 OID 16576)
-- Dependencies: 227
-- Data for Name: privilegios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.privilegios (privilegio_id, submenu_id, privilegio_accion) FROM stdin;
1	2	Consultar
2	2	Editar
3	2	Eliminar
4	3	Consultar
5	3	Editar
6	3	Eliminar
13	13	Consultar
14	13	Editar
15	13	Eliminar
16	19	Consultar
17	19	Editar
18	19	Eliminar
19	34	Consultar
20	34	Editar
21	34	Eliminar
22	35	Consultar
23	35	Editar
24	35	Eliminar
25	36	Editar
26	36	Eliminar
27	37	Editar
28	37	Eliminar
29	38	Editar
30	38	Eliminar
31	39	Editar
32	39	Eliminar
\.


--
-- TOC entry 2517 (class 0 OID 16579)
-- Dependencies: 228
-- Data for Name: privilegios_por_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.privilegios_por_roles (privilegios_id, submenu_id, roles_id) FROM stdin;
1	2	2
2	2	2
3	2	2
4	3	2
5	3	2
6	3	2
13	13	2
14	13	2
15	13	2
16	19	2
17	19	2
18	19	2
19	34	2
20	34	2
21	34	2
22	35	2
23	35	2
24	35	2
25	36	2
26	36	2
27	37	2
28	37	2
29	38	2
30	38	2
31	39	2
32	39	2
16	19	3
1	2	4
2	2	4
3	2	4
4	3	4
5	3	4
6	3	4
13	13	4
14	13	4
16	19	4
\.


--
-- TOC entry 2518 (class 0 OID 16582)
-- Dependencies: 229
-- Data for Name: promociones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.promociones (promocion_id, promocion_nombre, promocion_descripcion, promocion_inicio, promocion_fin, promocion_estado, promocion_tipo, promocion_imagen, promocion_imagen_nombre, promocion_imagen_url, promocion_mensaje, promocion_activa, promocion_fecha_creacion, promocion_usuario_creacion, promocion_fecha_modificacion, promocion_usuario_modificacion, promocion_correo_limitado_espera) FROM stdin;
4	Nombre de Promocion	Descripcion de promocion.	2018-01-01	2018-12-31	t	1	\N	Promocion1.jpg	c://Users/Fam. Gomez Aldana/Documents/NetBeansProjects/siaec/web/images/promociones/Promocion1.jpg	Mensaje de promocion.	t	2018-11-07	Nombre Usuario	2018-11-08	Nombre Usuario	0
6	Navideña	Esta es una descripción de promoción navideña.	2018-01-01	2018-12-31	f	2	\N			Este es un correo para promoción navideña.	t	2018-12-14	Nombre Usuario	2018-12-14	Nombre Usuario	0
1	Cumpleanios	Esta es una descripcion de promocion.	2019-01-01	2019-12-31	t	2	\N	Promocion5.jpg	c://Users/Fam. Gomez Aldana/Documents/NetBeansProjects/siaec/web/images/promociones/Promocion5.jpg	Este es un mensaje de promocion.	t	2018-10-30	Nombre Usuario	2019-01-11	Nombre Usuario	1
5	Promocion Bienvenidas Vacaciones	Descripcin Bienvenida Vacaciones.	2019-01-01	2019-01-31	t	1	\N	promocion2.jpg	c://Users/Fam. Gomez Aldana/Documents/NetBeansProjects/siaec/web/images/promociones/promocion2.jpg	Mensaje de promon Bienvenida Vacaciones.	t	2018-11-07	Nombre Usuario	2019-01-12	Nombre Usuario	0
2	Navideña	Esta es una descripción de promoción.	2018-12-01	2018-12-31	f	3	\N			Este es un mensaje de promociÃ³n.	t	2018-10-30	Nombre Usuario	2018-11-08	Nombre Usuario	0
3	General	Esta es una descripción de promoción.	2018-11-01	2018-11-30	t	1	\N	Promocion3.jpg	c://Users/Fam. Gomez Aldana/Documents/NetBeansProjects/siaec/web/images/promociones/Promocion3.jpg	Este es un mensaje de promociÃ³n.	t	2018-10-30	Nombre Usuario	\N	\N	0
7	Linux		2019-01-01	2019-12-31	t	2	\N	asphalt-dark-dawn-531321.jpg	/home/erick/NetBeansProjects/GIT/siaec/build/web/images/promociones/asphalt-dark-dawn-531321.jpg	imagenlinux	t	2019-04-23	Nombre Usuario	\N	\N	0
\.


--
-- TOC entry 2583 (class 0 OID 0)
-- Dependencies: 230
-- Name: promociones_promocion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.promociones_promocion_id_seq', 7, true);


--
-- TOC entry 2520 (class 0 OID 16590)
-- Dependencies: 231
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.roles (rol_id, rol_nombre, rol_descripcion, rol_fecha_creacion, rol_usuario_creacion, rol_fecha_modificacion, rol_usuario_modificacion, dashboard_id, rol_alerta, rol_notificacion) FROM stdin;
1	Administrador/a	Administra el sistema SIAEC.	2018-12-28	Sistema	\N	\N	1	t	t
2	Director/a	Supervisa las sucursales.	2018-12-28	Sistema	\N	\N	2	t	t
3	Doctor/a	Odontologa	2018-12-28	Sistema	\N	\N	3	f	t
5	Paciente	Paciente de la clínica	2018-12-28	Sistema	\N	\N	4	f	f
4	Asistente	Asistente de la clínica	2018-12-28	Sistema	\N	\N	6	t	t
\.


--
-- TOC entry 2584 (class 0 OID 0)
-- Dependencies: 232
-- Name: roles_rol_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.roles_rol_id_seq', 1, false);


--
-- TOC entry 2522 (class 0 OID 16595)
-- Dependencies: 233
-- Data for Name: sub_menus_por_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sub_menus_por_roles (rol_id, submenu_id) FROM stdin;
1	32
1	33
1	40
1	41
1	43
2	1
2	2
2	3
2	4
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
2	33
2	34
2	35
2	36
2	37
2	38
2	39
2	42
2	43
3	9
3	10
3	11
3	12
3	19
3	22
3	23
3	24
3	43
4	1
4	2
4	3
4	4
4	9
4	10
4	13
4	14
4	15
4	16
4	17
4	19
4	22
4	23
4	24
4	42
4	43
5	5
5	8
1	44
4	11
\.


--
-- TOC entry 2523 (class 0 OID 16598)
-- Dependencies: 234
-- Data for Name: submenus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.submenus (submenu_id, sumbenu_nombre, menu_id, submenu_descripcion, submenu_url) FROM stdin;
1	Registrar Cita	1	Clínica	/views/1_citas/cita_clinica_nueva.xhtml
2	Citas Aprobadas	1	Clínica	/views/1_citas/cita_clinica_listado_aprobadas.xhtml
3	Citas Pendientes	1	Clínica	/views/1_citas/cita_clinica_listado_pendiente.xhtml
4	Histórico de Citas	1	Clínica	/views/1_citas/cita_clinica_historico.xhtml
5	Nueva Cita	1	Paciente	/views/1_citas/cita_paciente_nueva.xhtml
8	Histórico	1	Paciente	/views/1_citas/cita_paciente_historico.xhtml
9	Registrar Paciente	2	Clínica	/views/2_expedientes/paciente_registrar.xhtml
10	Listado de Pacientes	2	Clínica	/views/2_expedientes/pacientes_listado.xhtml
11	Consultar Expediente	2	Clínica	/views/2_expedientes/paciente_consultar.xhtml
12	Gestionar Expediente	2	Clínica	/views/2_expedientes/paciente_gestionar.xhtml
13	Gestionar Insumos	3	Clínica	/views/3_insumos/insumo_listado.xhtml
14	Existencia de Insumos	3	Clínica	/views/3_insumos/insumo_existencias_listado.xhtml
15	Control de Insumos	3	Clínica	/views/3_insumos/insumo_control_listado.xhtml
16	Entrada y Salida de Insumos	3	Clínica	/views/3_insumos/insumo_entrada_salida_listado.xhtml
17	Solicitud de Insumo	3	Clínica	/views/3_insumos/insumo_solicitud_listado.xhtml
18	Registrar Promoción	4	Clínica	/views/4_promociones/promocion_nuevo.xhtml
22	Listado de Insumos Médicos	5	Clínica	/views/5_reportes/rep_tratamientos_demandados.xhtml
26	Reporte 7	5	Clínica	mantenimiento.xhtml
27	Reporte 8	5	Clínica	mantenimiento.xhtml
28	Reporte 9	5	Clínica	mantenimiento.xhtml
29	Reporte 10	5	Clínica	mantenimiento.xhtml
30	Reporte 11	5	Clínica	mantenimiento.xhtml
31	Reporte 12	5	Clínica	mantenimiento.xhtml
33	Gestionar Usuarios	6	Clínica	/views/6_administracion/cat_usuarios_listado.xhtml
34	Gestionar Sucursales	6	Clínica	/views/6_administracion/cat_sucursales_listado.xhtml
35	Gestionar Médicos	6	Clínica	/views/6_administracion/cat_medicos_listado.xhtml
36	Gestionar Tratamientos	6	Clínica	/views/6_administracion/cat_tratamientos_listado.xhtml
37	Gestionar Patologías	6	Clínica	/views/6_administracion/cat_patologias_listado.xhtml
38	Gestionar Tipo de Insumo	6	Clínica	/views/6_administracion/cat_tipoinsumos_listado.xhtml
39	Gestionar Unidades de Medida	6	Clínica	/views/6_administracion/cat_unidadesmedidas_listado.xhtml
40	Configuración de Correo	7	Clínica	/views/7_configuracion/configuracion_correo.xhtml
41	Enviar Correo	7	Clínica	/views/7_configuracion/configuracion_correo_enviar.xhtml
42	Configuración de Publicidad	7	Clínica	/views/7_configuracion/home_parametros.xhtml
43	Manual de Usuarios	8	General	/views/8_ayuda/manual_usuario.xhtml
44	Tareas automáticas	7	Clínica	/views/7_configuracion/tareas_automaticas.xhtml
32	Gestionar Roles	6	Clínica	/views/6_administracion/cat_roles_listado.xhtml
19	Listado de Promociones	4	Clínica	/views/4_promociones/promocion_listado.xhtml
20	Promociones Demandadas	5	Clínica	/views/5_reportes/rep_promociones_demandadas.xhtml
21	Tratamientos Demandados	5	Clínica	/views/5_reportes/rep_tratamientos_demandados.xhtml
23	Listado de Insumos Médicos Próximos a Agotarse	5	Clínica	/views/5_reportes/rep_solicitud_insumos.xhtml
24	Listado de Pacientes por Médico	5	Clínica	/views/5_reportes/rep_pacientes_por_medico.xhtml
25	Tratamientos Realizados a Pacientes	5	Clínica	/views/5_reportes/rep_tratamientos_paciente.xhtml
\.


--
-- TOC entry 2585 (class 0 OID 0)
-- Dependencies: 235
-- Name: submenus_submenu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.submenus_submenu_id_seq', 1, false);


--
-- TOC entry 2525 (class 0 OID 16603)
-- Dependencies: 236
-- Data for Name: tipos_insumos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tipos_insumos (tipoinsumo_id, tipoinsumo_nombre, tipoinsumo_descripcion, tipoinsumo_estado) FROM stdin;
2	Endodóncia	Esta es una descripción de tipo de insumo	t
1	General	Esta es una descripción de tipo de insumo	t
\.


--
-- TOC entry 2586 (class 0 OID 0)
-- Dependencies: 237
-- Name: tipos_insumos_tipoinsumo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tipos_insumos_tipoinsumo_id_seq', 2, true);


--
-- TOC entry 2527 (class 0 OID 16608)
-- Dependencies: 238
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
-- TOC entry 2587 (class 0 OID 0)
-- Dependencies: 239
-- Name: tratamientos_tratamiento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tratamientos_tratamiento_id_seq', 10, true);


--
-- TOC entry 2529 (class 0 OID 16613)
-- Dependencies: 240
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
-- TOC entry 2588 (class 0 OID 0)
-- Dependencies: 241
-- Name: unidades_medidas_unidadmedida_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.unidades_medidas_unidadmedida_id_seq', 10, true);


--
-- TOC entry 2531 (class 0 OID 16618)
-- Dependencies: 242
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.usuarios (usuario_usuario, rol_id, usuario_correo, usuario_telefono, usuario_contrasenia, usuario_estado, usuario_fecha_creacion, usuario_fecha_modificacion, usuario_bloqueado, usuario_intento_fallido, usuario_primer_nombre, usuario_segundo_nombre, usuario_primer_apellido, usuario_segundo_apellido, usuario_nombre, usuario_apellido, usuario_codigo, usuario_activacion, medico_id, paciente_id) FROM stdin;
ruth.alvarado@gmail.com	5	ruth.alvarado@gmail.com	7676-7676	123456789	t	2019-02-13	\N	t	0	Fracis	Nohemí	Alvarado	Cañada	\N	\N	\N	t	\N	\N
Wilfredo	4	wflamenco@gmail.com	7452-4857	000000	t	2018-11-13	\N	t	0	Wilfredo	José	Flamenco	Lemus	Wilfredo	\N	\N	t	\N	\N
turh.alvarado@gmail.com	5	turh.alvarado@gmail.com	7485-9632	000000	t	2019-02-13	\N	t	0	Ruth	\N	Alvarado	\N	Ruth	Alvarado	\N	t	\N	\N
sandra.lopez@gmail.com	5	sandra.lopez@gmail.com	7412-5896	000000	t	2019-02-13	\N	t	0	Sandra	Vanessa	López	Mendoza	\N	\N	\N	t	\N	\N
juanfran.aldana@gmail.com	5	juanfran.aldana@gmail.com	7485-7485	000000	t	2019-02-13	\N	t	0	Fracis	Amilcar	Merjivar		Francis	\N	\N	t	\N	\N
Aldana	1	juanfran.aldana@gmail.com	7611-0659	000000	t	2018-11-13	\N	t	0	Juan	Francisco	Aldana	Domínguez	JuanFran	\N	\N	t	\N	\N
Valeria	3	valgomez@gmail.com	7485-7485	000000	t	2018-11-13	\N	t	0	Valeria	Guadalupe	Campos	Gomez	Valeria	\N	\N	t	1	\N
Diana	5	diana.chavez@gmail.com	7432-4845	000000	t	2018-11-13	\N	t	0	Diana	\N	De Rivas	\N	Diana	\N	\N	t	\N	4
Erick	2	erickcampos.rivas@gmail.com	7412-7845	000000	t	2018-11-13	\N	t	0	Erick	\N	Rivas	\N	Erick	\N	\N	t	2	\N
\.


--
-- TOC entry 2229 (class 2606 OID 16646)
-- Name: dashboard dashboard_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dashboard
    ADD CONSTRAINT dashboard_pkey PRIMARY KEY (dashboard_id);


--
-- TOC entry 2209 (class 2606 OID 16648)
-- Name: bitacora pk_bitacora; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bitacora
    ADD CONSTRAINT pk_bitacora PRIMARY KEY (bitacora_id);


--
-- TOC entry 2212 (class 2606 OID 16650)
-- Name: citas pk_citas; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.citas
    ADD CONSTRAINT pk_citas PRIMARY KEY (cita_id);


--
-- TOC entry 2218 (class 2606 OID 16652)
-- Name: clinicas pk_clinicas; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clinicas
    ADD CONSTRAINT pk_clinicas PRIMARY KEY (clinica_id);


--
-- TOC entry 2221 (class 2606 OID 16654)
-- Name: configuraciones pk_configuraciones; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.configuraciones
    ADD CONSTRAINT pk_configuraciones PRIMARY KEY (configuracion_id);


--
-- TOC entry 2224 (class 2606 OID 16656)
-- Name: consultas pk_consultas; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consultas
    ADD CONSTRAINT pk_consultas PRIMARY KEY (consulta_id);


--
-- TOC entry 2232 (class 2606 OID 16658)
-- Name: departamentos pk_departamentos; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.departamentos
    ADD CONSTRAINT pk_departamentos PRIMARY KEY (departamento_id);


--
-- TOC entry 2235 (class 2606 OID 16660)
-- Name: detalles_consultas pk_detalles_consultas; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalles_consultas
    ADD CONSTRAINT pk_detalles_consultas PRIMARY KEY (detalleconsulta_id);


--
-- TOC entry 2240 (class 2606 OID 16662)
-- Name: direcciones pk_direcciones; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.direcciones
    ADD CONSTRAINT pk_direcciones PRIMARY KEY (direccion_id);


--
-- TOC entry 2247 (class 2606 OID 16664)
-- Name: existencias pk_existencias; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.existencias
    ADD CONSTRAINT pk_existencias PRIMARY KEY (existencia_id);


--
-- TOC entry 2252 (class 2606 OID 16666)
-- Name: imagenes pk_imagenes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagenes
    ADD CONSTRAINT pk_imagenes PRIMARY KEY (imagen_id);


--
-- TOC entry 2256 (class 2606 OID 16668)
-- Name: insumos pk_insumos; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insumos
    ADD CONSTRAINT pk_insumos PRIMARY KEY (insumo_id);


--
-- TOC entry 2261 (class 2606 OID 16670)
-- Name: medicos pk_medicos; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.medicos
    ADD CONSTRAINT pk_medicos PRIMARY KEY (medico_id);


--
-- TOC entry 2264 (class 2606 OID 16672)
-- Name: menus pk_menus; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menus
    ADD CONSTRAINT pk_menus PRIMARY KEY (menu_id);


--
-- TOC entry 2269 (class 2606 OID 16674)
-- Name: menus_por_roles pk_menus_por_roles; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menus_por_roles
    ADD CONSTRAINT pk_menus_por_roles PRIMARY KEY (rol_id, menu_id);


--
-- TOC entry 2272 (class 2606 OID 16676)
-- Name: movimientos pk_movimientos; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movimientos
    ADD CONSTRAINT pk_movimientos PRIMARY KEY (movimiento_id);


--
-- TOC entry 2276 (class 2606 OID 16678)
-- Name: municipios pk_municipios; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.municipios
    ADD CONSTRAINT pk_municipios PRIMARY KEY (municipio_id);


--
-- TOC entry 2280 (class 2606 OID 16680)
-- Name: odontogramas pk_odontogramas; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.odontogramas
    ADD CONSTRAINT pk_odontogramas PRIMARY KEY (odontograma_id);


--
-- TOC entry 2284 (class 2606 OID 16682)
-- Name: pacientes pk_pacientes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.pacientes
    ADD CONSTRAINT pk_pacientes PRIMARY KEY (paciente_id);


--
-- TOC entry 2287 (class 2606 OID 16684)
-- Name: patologias pk_patologias; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patologias
    ADD CONSTRAINT pk_patologias PRIMARY KEY (patologia_id);


--
-- TOC entry 2292 (class 2606 OID 16686)
-- Name: patologias_por_pacientes pk_patologias_por_pacientes; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patologias_por_pacientes
    ADD CONSTRAINT pk_patologias_por_pacientes PRIMARY KEY (paciente_id, patologia_id);


--
-- TOC entry 2298 (class 2606 OID 16688)
-- Name: promociones pk_promociones; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.promociones
    ADD CONSTRAINT pk_promociones PRIMARY KEY (promocion_id);


--
-- TOC entry 2301 (class 2606 OID 16690)
-- Name: roles pk_roles; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT pk_roles PRIMARY KEY (rol_id);


--
-- TOC entry 2304 (class 2606 OID 16692)
-- Name: sub_menus_por_roles pk_sub_menus_por_roles; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sub_menus_por_roles
    ADD CONSTRAINT pk_sub_menus_por_roles PRIMARY KEY (rol_id, submenu_id);


--
-- TOC entry 2309 (class 2606 OID 16694)
-- Name: submenus pk_submenus; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.submenus
    ADD CONSTRAINT pk_submenus PRIMARY KEY (submenu_id);


--
-- TOC entry 2312 (class 2606 OID 16696)
-- Name: tipos_insumos pk_tipos_insumos; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tipos_insumos
    ADD CONSTRAINT pk_tipos_insumos PRIMARY KEY (tipoinsumo_id);


--
-- TOC entry 2315 (class 2606 OID 16698)
-- Name: tratamientos pk_tratamientos; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tratamientos
    ADD CONSTRAINT pk_tratamientos PRIMARY KEY (tratamiento_id);


--
-- TOC entry 2318 (class 2606 OID 16700)
-- Name: unidades_medidas pk_unidades_medidas; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.unidades_medidas
    ADD CONSTRAINT pk_unidades_medidas PRIMARY KEY (unidadmedida_id);


--
-- TOC entry 2321 (class 2606 OID 16702)
-- Name: usuarios pk_usuarios; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT pk_usuarios PRIMARY KEY (usuario_usuario);


--
-- TOC entry 2294 (class 2606 OID 16704)
-- Name: privilegios privilegios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.privilegios
    ADD CONSTRAINT privilegios_pkey PRIMARY KEY (privilegio_id, submenu_id);


--
-- TOC entry 2296 (class 2606 OID 16706)
-- Name: privilegios_por_roles privilegios_por_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.privilegios_por_roles
    ADD CONSTRAINT privilegios_por_roles_pkey PRIMARY KEY (privilegios_id, submenu_id, roles_id);


--
-- TOC entry 2207 (class 1259 OID 16707)
-- Name: bitacora_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX bitacora_pk ON public.bitacora USING btree (bitacora_id);


--
-- TOC entry 2210 (class 1259 OID 16708)
-- Name: citas_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX citas_pk ON public.citas USING btree (cita_id);


--
-- TOC entry 2216 (class 1259 OID 16709)
-- Name: clinicas_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX clinicas_pk ON public.clinicas USING btree (clinica_id);


--
-- TOC entry 2219 (class 1259 OID 16710)
-- Name: configuraciones_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX configuraciones_pk ON public.configuraciones USING btree (configuracion_id);


--
-- TOC entry 2222 (class 1259 OID 16711)
-- Name: consultas_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX consultas_pk ON public.consultas USING btree (consulta_id);


--
-- TOC entry 2230 (class 1259 OID 16712)
-- Name: departamentos_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX departamentos_pk ON public.departamentos USING btree (departamento_id);


--
-- TOC entry 2233 (class 1259 OID 16713)
-- Name: detalles_consultas_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX detalles_consultas_pk ON public.detalles_consultas USING btree (detalleconsulta_id);


--
-- TOC entry 2238 (class 1259 OID 16714)
-- Name: direcciones_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX direcciones_pk ON public.direcciones USING btree (direccion_id);


--
-- TOC entry 2245 (class 1259 OID 16715)
-- Name: existencias_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX existencias_pk ON public.existencias USING btree (existencia_id);


--
-- TOC entry 2250 (class 1259 OID 16716)
-- Name: imagenes_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX imagenes_pk ON public.imagenes USING btree (imagen_id);


--
-- TOC entry 2254 (class 1259 OID 16717)
-- Name: insumos_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX insumos_pk ON public.insumos USING btree (insumo_id);


--
-- TOC entry 2259 (class 1259 OID 16718)
-- Name: medicos_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX medicos_pk ON public.medicos USING btree (medico_id);


--
-- TOC entry 2262 (class 1259 OID 16719)
-- Name: menus_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX menus_pk ON public.menus USING btree (menu_id);


--
-- TOC entry 2265 (class 1259 OID 16720)
-- Name: menus_por_roles2_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX menus_por_roles2_fk ON public.menus_por_roles USING btree (menu_id);


--
-- TOC entry 2266 (class 1259 OID 16721)
-- Name: menus_por_roles_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX menus_por_roles_fk ON public.menus_por_roles USING btree (rol_id);


--
-- TOC entry 2267 (class 1259 OID 16722)
-- Name: menus_por_roles_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX menus_por_roles_pk ON public.menus_por_roles USING btree (rol_id, menu_id);


--
-- TOC entry 2270 (class 1259 OID 16723)
-- Name: movimientos_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX movimientos_pk ON public.movimientos USING btree (movimiento_id);


--
-- TOC entry 2274 (class 1259 OID 16724)
-- Name: municipios_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX municipios_pk ON public.municipios USING btree (municipio_id);


--
-- TOC entry 2278 (class 1259 OID 16725)
-- Name: odontogramas_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX odontogramas_pk ON public.odontogramas USING btree (odontograma_id);


--
-- TOC entry 2282 (class 1259 OID 16726)
-- Name: pacientes_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX pacientes_pk ON public.pacientes USING btree (paciente_id);


--
-- TOC entry 2285 (class 1259 OID 16727)
-- Name: patologias_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX patologias_pk ON public.patologias USING btree (patologia_id);


--
-- TOC entry 2288 (class 1259 OID 16728)
-- Name: patologias_por_pacientes2_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX patologias_por_pacientes2_fk ON public.patologias_por_pacientes USING btree (patologia_id);


--
-- TOC entry 2289 (class 1259 OID 16729)
-- Name: patologias_por_pacientes_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX patologias_por_pacientes_fk ON public.patologias_por_pacientes USING btree (paciente_id);


--
-- TOC entry 2290 (class 1259 OID 16730)
-- Name: patologias_por_pacientes_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX patologias_por_pacientes_pk ON public.patologias_por_pacientes USING btree (paciente_id, patologia_id);


--
-- TOC entry 2299 (class 1259 OID 16731)
-- Name: promociones_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX promociones_pk ON public.promociones USING btree (promocion_id);


--
-- TOC entry 2322 (class 1259 OID 16732)
-- Name: r01_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX r01_fk ON public.usuarios USING btree (rol_id);


--
-- TOC entry 2241 (class 1259 OID 16733)
-- Name: r06_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX r06_fk ON public.direcciones USING btree (medico_id);


--
-- TOC entry 2242 (class 1259 OID 16734)
-- Name: r07_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX r07_fk ON public.direcciones USING btree (municipio_id);


--
-- TOC entry 2277 (class 1259 OID 16735)
-- Name: r08_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX r08_fk ON public.municipios USING btree (departamento_id);


--
-- TOC entry 2225 (class 1259 OID 16736)
-- Name: r09_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX r09_fk ON public.consultas USING btree (paciente_id);


--
-- TOC entry 2253 (class 1259 OID 16737)
-- Name: r10_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX r10_fk ON public.imagenes USING btree (paciente_id);


--
-- TOC entry 2213 (class 1259 OID 16738)
-- Name: r14_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX r14_fk ON public.citas USING btree (clinica_id);


--
-- TOC entry 2243 (class 1259 OID 16739)
-- Name: r16_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX r16_fk ON public.direcciones USING btree (clinica_id);


--
-- TOC entry 2214 (class 1259 OID 16740)
-- Name: r17_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX r17_fk ON public.citas USING btree (usuario_usuario);


--
-- TOC entry 2215 (class 1259 OID 16741)
-- Name: r18_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX r18_fk ON public.citas USING btree (medico_id);


--
-- TOC entry 2226 (class 1259 OID 16742)
-- Name: r19_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX r19_fk ON public.consultas USING btree (promocion_id);


--
-- TOC entry 2236 (class 1259 OID 16743)
-- Name: r21_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX r21_fk ON public.detalles_consultas USING btree (tratamiento_id);


--
-- TOC entry 2257 (class 1259 OID 16744)
-- Name: r23_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX r23_fk ON public.insumos USING btree (unidadmedida_id);


--
-- TOC entry 2248 (class 1259 OID 16745)
-- Name: r24_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX r24_fk ON public.existencias USING btree (insumo_id);


--
-- TOC entry 2249 (class 1259 OID 16746)
-- Name: r25_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX r25_fk ON public.existencias USING btree (clinica_id);


--
-- TOC entry 2273 (class 1259 OID 16747)
-- Name: r26_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX r26_fk ON public.movimientos USING btree (existencia_id);


--
-- TOC entry 2244 (class 1259 OID 16748)
-- Name: r27_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX r27_fk ON public.direcciones USING btree (paciente_id);


--
-- TOC entry 2227 (class 1259 OID 16749)
-- Name: r28_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX r28_fk ON public.consultas USING btree (medico_id);


--
-- TOC entry 2258 (class 1259 OID 16750)
-- Name: r29_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX r29_fk ON public.insumos USING btree (tipoinsumo_id);


--
-- TOC entry 2281 (class 1259 OID 16751)
-- Name: r30_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX r30_fk ON public.odontogramas USING btree (paciente_id);


--
-- TOC entry 2237 (class 1259 OID 16752)
-- Name: r31_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX r31_fk ON public.detalles_consultas USING btree (paciente_id);


--
-- TOC entry 2302 (class 1259 OID 16753)
-- Name: roles_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX roles_pk ON public.roles USING btree (rol_id);


--
-- TOC entry 2305 (class 1259 OID 16754)
-- Name: sub_menus_por_roles2_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sub_menus_por_roles2_fk ON public.sub_menus_por_roles USING btree (submenu_id);


--
-- TOC entry 2306 (class 1259 OID 16755)
-- Name: sub_menus_por_roles_fk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sub_menus_por_roles_fk ON public.sub_menus_por_roles USING btree (rol_id);


--
-- TOC entry 2307 (class 1259 OID 16756)
-- Name: sub_menus_por_roles_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX sub_menus_por_roles_pk ON public.sub_menus_por_roles USING btree (rol_id, submenu_id);


--
-- TOC entry 2310 (class 1259 OID 16757)
-- Name: submenus_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX submenus_pk ON public.submenus USING btree (submenu_id);


--
-- TOC entry 2313 (class 1259 OID 16758)
-- Name: tipos_insumos_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX tipos_insumos_pk ON public.tipos_insumos USING btree (tipoinsumo_id);


--
-- TOC entry 2316 (class 1259 OID 16759)
-- Name: tratamientos_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX tratamientos_pk ON public.tratamientos USING btree (tratamiento_id);


--
-- TOC entry 2319 (class 1259 OID 16760)
-- Name: unidades_medidas_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX unidades_medidas_pk ON public.unidades_medidas USING btree (unidadmedida_id);


--
-- TOC entry 2323 (class 1259 OID 16761)
-- Name: usuarios_pk; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX usuarios_pk ON public.usuarios USING btree (usuario_usuario);


--
-- TOC entry 2350 (class 2606 OID 16762)
-- Name: privilegios_por_roles f_privilegios_por_rol; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.privilegios_por_roles
    ADD CONSTRAINT f_privilegios_por_rol FOREIGN KEY (roles_id) REFERENCES public.roles(rol_id);


--
-- TOC entry 2349 (class 2606 OID 16767)
-- Name: privilegios f_privilegios_submenu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.privilegios
    ADD CONSTRAINT f_privilegios_submenu FOREIGN KEY (submenu_id) REFERENCES public.submenus(submenu_id);


--
-- TOC entry 2351 (class 2606 OID 16772)
-- Name: privilegios_por_roles f_privlegios_por_accion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.privilegios_por_roles
    ADD CONSTRAINT f_privlegios_por_accion FOREIGN KEY (privilegios_id, submenu_id) REFERENCES public.privilegios(privilegio_id, submenu_id);


--
-- TOC entry 2327 (class 2606 OID 41111)
-- Name: citas fk_citas_paciente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.citas
    ADD CONSTRAINT fk_citas_paciente FOREIGN KEY (cita_paciente) REFERENCES public.pacientes(paciente_id);


--
-- TOC entry 2324 (class 2606 OID 16777)
-- Name: citas fk_citas_r14_clinicas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.citas
    ADD CONSTRAINT fk_citas_r14_clinicas FOREIGN KEY (clinica_id) REFERENCES public.clinicas(clinica_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2325 (class 2606 OID 16782)
-- Name: citas fk_citas_r17_usuarios; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.citas
    ADD CONSTRAINT fk_citas_r17_usuarios FOREIGN KEY (usuario_usuario) REFERENCES public.usuarios(usuario_usuario) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2326 (class 2606 OID 16787)
-- Name: citas fk_citas_r18_medicos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.citas
    ADD CONSTRAINT fk_citas_r18_medicos FOREIGN KEY (medico_id) REFERENCES public.medicos(medico_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2328 (class 2606 OID 16792)
-- Name: consultas fk_consulta_r09_paciente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consultas
    ADD CONSTRAINT fk_consulta_r09_paciente FOREIGN KEY (paciente_id) REFERENCES public.pacientes(paciente_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2329 (class 2606 OID 16797)
-- Name: consultas fk_consulta_r19_promocio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consultas
    ADD CONSTRAINT fk_consulta_r19_promocio FOREIGN KEY (promocion_id) REFERENCES public.promociones(promocion_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2330 (class 2606 OID 16802)
-- Name: consultas fk_consulta_r28_medicos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.consultas
    ADD CONSTRAINT fk_consulta_r28_medicos FOREIGN KEY (medico_id) REFERENCES public.medicos(medico_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2331 (class 2606 OID 16807)
-- Name: detalles_consultas fk_detalles_r21_tratamie; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalles_consultas
    ADD CONSTRAINT fk_detalles_r21_tratamie FOREIGN KEY (tratamiento_id) REFERENCES public.tratamientos(tratamiento_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2332 (class 2606 OID 16812)
-- Name: detalles_consultas fk_detalles_r31_paciente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.detalles_consultas
    ADD CONSTRAINT fk_detalles_r31_paciente FOREIGN KEY (paciente_id) REFERENCES public.pacientes(paciente_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2333 (class 2606 OID 16817)
-- Name: direcciones fk_direccio_r06_medicos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.direcciones
    ADD CONSTRAINT fk_direccio_r06_medicos FOREIGN KEY (medico_id) REFERENCES public.medicos(medico_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2334 (class 2606 OID 16822)
-- Name: direcciones fk_direccio_r07_municipi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.direcciones
    ADD CONSTRAINT fk_direccio_r07_municipi FOREIGN KEY (municipio_id) REFERENCES public.municipios(municipio_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2335 (class 2606 OID 16827)
-- Name: direcciones fk_direccio_r16_clinicas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.direcciones
    ADD CONSTRAINT fk_direccio_r16_clinicas FOREIGN KEY (clinica_id) REFERENCES public.clinicas(clinica_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2336 (class 2606 OID 16832)
-- Name: direcciones fk_direccio_r27_paciente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.direcciones
    ADD CONSTRAINT fk_direccio_r27_paciente FOREIGN KEY (paciente_id) REFERENCES public.pacientes(paciente_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2337 (class 2606 OID 16837)
-- Name: existencias fk_existenc_r24_insumos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.existencias
    ADD CONSTRAINT fk_existenc_r24_insumos FOREIGN KEY (insumo_id) REFERENCES public.insumos(insumo_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2338 (class 2606 OID 16842)
-- Name: existencias fk_existenc_r25_clinicas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.existencias
    ADD CONSTRAINT fk_existenc_r25_clinicas FOREIGN KEY (clinica_id) REFERENCES public.clinicas(clinica_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2339 (class 2606 OID 16847)
-- Name: imagenes fk_imagenes_r10_paciente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.imagenes
    ADD CONSTRAINT fk_imagenes_r10_paciente FOREIGN KEY (paciente_id) REFERENCES public.pacientes(paciente_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2340 (class 2606 OID 16852)
-- Name: insumos fk_insumos_r23_unidades; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insumos
    ADD CONSTRAINT fk_insumos_r23_unidades FOREIGN KEY (unidadmedida_id) REFERENCES public.unidades_medidas(unidadmedida_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2341 (class 2606 OID 16857)
-- Name: insumos fk_insumos_r29_tipos_in; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.insumos
    ADD CONSTRAINT fk_insumos_r29_tipos_in FOREIGN KEY (tipoinsumo_id) REFERENCES public.tipos_insumos(tipoinsumo_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2342 (class 2606 OID 16862)
-- Name: menus_por_roles fk_menus_po_menus_por_menus; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menus_por_roles
    ADD CONSTRAINT fk_menus_po_menus_por_menus FOREIGN KEY (menu_id) REFERENCES public.menus(menu_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2343 (class 2606 OID 16867)
-- Name: menus_por_roles fk_menus_po_menus_por_roles; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.menus_por_roles
    ADD CONSTRAINT fk_menus_po_menus_por_roles FOREIGN KEY (rol_id) REFERENCES public.roles(rol_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2344 (class 2606 OID 16872)
-- Name: movimientos fk_movimien_r26_existenc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.movimientos
    ADD CONSTRAINT fk_movimien_r26_existenc FOREIGN KEY (existencia_id) REFERENCES public.existencias(existencia_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2345 (class 2606 OID 16877)
-- Name: municipios fk_municipi_r08_departam; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.municipios
    ADD CONSTRAINT fk_municipi_r08_departam FOREIGN KEY (departamento_id) REFERENCES public.departamentos(departamento_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2346 (class 2606 OID 16882)
-- Name: odontogramas fk_odontogr_r30_paciente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.odontogramas
    ADD CONSTRAINT fk_odontogr_r30_paciente FOREIGN KEY (paciente_id) REFERENCES public.pacientes(paciente_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2347 (class 2606 OID 16887)
-- Name: patologias_por_pacientes fk_patologi_patologia_paciente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patologias_por_pacientes
    ADD CONSTRAINT fk_patologi_patologia_paciente FOREIGN KEY (paciente_id) REFERENCES public.pacientes(paciente_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2348 (class 2606 OID 16892)
-- Name: patologias_por_pacientes fk_patologi_patologia_patologi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.patologias_por_pacientes
    ADD CONSTRAINT fk_patologi_patologia_patologi FOREIGN KEY (patologia_id) REFERENCES public.patologias(patologia_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2352 (class 2606 OID 16897)
-- Name: roles fk_roles_dashboard; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.roles
    ADD CONSTRAINT fk_roles_dashboard FOREIGN KEY (dashboard_id) REFERENCES public.dashboard(dashboard_id);


--
-- TOC entry 2353 (class 2606 OID 16902)
-- Name: sub_menus_por_roles fk_sub_menu_sub_menus_roles; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sub_menus_por_roles
    ADD CONSTRAINT fk_sub_menu_sub_menus_roles FOREIGN KEY (rol_id) REFERENCES public.roles(rol_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2354 (class 2606 OID 16907)
-- Name: sub_menus_por_roles fk_sub_menu_sub_menus_submenus; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sub_menus_por_roles
    ADD CONSTRAINT fk_sub_menu_sub_menus_submenus FOREIGN KEY (submenu_id) REFERENCES public.submenus(submenu_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2355 (class 2606 OID 16912)
-- Name: submenus fk_submenus_menu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.submenus
    ADD CONSTRAINT fk_submenus_menu FOREIGN KEY (menu_id) REFERENCES public.menus(menu_id);


--
-- TOC entry 2356 (class 2606 OID 16917)
-- Name: usuarios fk_usuarios_r01_roles; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT fk_usuarios_r01_roles FOREIGN KEY (rol_id) REFERENCES public.roles(rol_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2357 (class 2606 OID 16923)
-- Name: usuarios fk_usuarios_r50_medicos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT fk_usuarios_r50_medicos FOREIGN KEY (medico_id) REFERENCES public.medicos(medico_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2358 (class 2606 OID 16928)
-- Name: usuarios fk_usuarios_r51_paciente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT fk_usuarios_r51_paciente FOREIGN KEY (paciente_id) REFERENCES public.pacientes(paciente_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


-- Completed on 2019-04-29 11:19:06 CST

--
-- PostgreSQL database dump complete
--

