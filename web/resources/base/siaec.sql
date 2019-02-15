--
-- PostgreSQL database dump
--

-- Dumped from database version 9.3.13
-- Dumped by pg_dump version 9.3.13
-- Started on 2019-02-13 16:34:35

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- TOC entry 1 (class 3079 OID 11750)
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- TOC entry 2342 (class 0 OID 0)
-- Dependencies: 1
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- TOC entry 172 (class 1259 OID 64359)
-- Name: bitacora; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE bitacora (
    bitacora_id integer NOT NULL,
    bitacora_fecha_hora date,
    bitacora_usuario character varying(50),
    bitacora_transaccion character varying(100)
);


ALTER TABLE public.bitacora OWNER TO postgres;

--
-- TOC entry 171 (class 1259 OID 64357)
-- Name: bitacora_bitacora_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE bitacora_bitacora_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.bitacora_bitacora_id_seq OWNER TO postgres;

--
-- TOC entry 2343 (class 0 OID 0)
-- Dependencies: 171
-- Name: bitacora_bitacora_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE bitacora_bitacora_id_seq OWNED BY bitacora.bitacora_id;


--
-- TOC entry 174 (class 1259 OID 64368)
-- Name: citas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE citas (
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
    cita_ensala boolean
);


ALTER TABLE public.citas OWNER TO postgres;

--
-- TOC entry 173 (class 1259 OID 64366)
-- Name: citas_cita_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE citas_cita_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.citas_cita_id_seq OWNER TO postgres;

--
-- TOC entry 2344 (class 0 OID 0)
-- Dependencies: 173
-- Name: citas_cita_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE citas_cita_id_seq OWNED BY citas.cita_id;


--
-- TOC entry 176 (class 1259 OID 64383)
-- Name: clinicas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE clinicas (
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
-- TOC entry 175 (class 1259 OID 64381)
-- Name: clinicas_clinica_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE clinicas_clinica_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.clinicas_clinica_id_seq OWNER TO postgres;

--
-- TOC entry 2345 (class 0 OID 0)
-- Dependencies: 175
-- Name: clinicas_clinica_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE clinicas_clinica_id_seq OWNED BY clinicas.clinica_id;


--
-- TOC entry 222 (class 1259 OID 71697)
-- Name: configuraciones; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE configuraciones (
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
-- TOC entry 221 (class 1259 OID 71695)
-- Name: configuraciones_configuracion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE configuraciones_configuracion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.configuraciones_configuracion_id_seq OWNER TO postgres;

--
-- TOC entry 2346 (class 0 OID 0)
-- Dependencies: 221
-- Name: configuraciones_configuracion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE configuraciones_configuracion_id_seq OWNED BY configuraciones.configuracion_id;


--
-- TOC entry 178 (class 1259 OID 64398)
-- Name: consultas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE consultas (
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
-- TOC entry 177 (class 1259 OID 64396)
-- Name: consultas_consulta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE consultas_consulta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.consultas_consulta_id_seq OWNER TO postgres;

--
-- TOC entry 2347 (class 0 OID 0)
-- Dependencies: 177
-- Name: consultas_consulta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE consultas_consulta_id_seq OWNED BY consultas.consulta_id;


--
-- TOC entry 223 (class 1259 OID 79917)
-- Name: dashboard_dashboard_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE dashboard_dashboard_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dashboard_dashboard_id_seq OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 79919)
-- Name: dashboard; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE dashboard (
    dashboard_id integer DEFAULT nextval('dashboard_dashboard_id_seq'::regclass) NOT NULL,
    dashboard_nombre character varying(50),
    dashboard_descripcion character varying(100),
    dashboard_url character varying(100),
    dashboard_imagen character varying(150)
);


ALTER TABLE public.dashboard OWNER TO postgres;

--
-- TOC entry 180 (class 1259 OID 64413)
-- Name: departamentos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE departamentos (
    departamento_id integer NOT NULL,
    departamento_nombre character varying(25)
);


ALTER TABLE public.departamentos OWNER TO postgres;

--
-- TOC entry 179 (class 1259 OID 64411)
-- Name: departamentos_departamento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE departamentos_departamento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.departamentos_departamento_id_seq OWNER TO postgres;

--
-- TOC entry 2348 (class 0 OID 0)
-- Dependencies: 179
-- Name: departamentos_departamento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE departamentos_departamento_id_seq OWNED BY departamentos.departamento_id;


--
-- TOC entry 182 (class 1259 OID 64422)
-- Name: detalles_consultas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE detalles_consultas (
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
-- TOC entry 181 (class 1259 OID 64420)
-- Name: detalles_consultas_detalleconsulta_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE detalles_consultas_detalleconsulta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.detalles_consultas_detalleconsulta_id_seq OWNER TO postgres;

--
-- TOC entry 2349 (class 0 OID 0)
-- Dependencies: 181
-- Name: detalles_consultas_detalleconsulta_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE detalles_consultas_detalleconsulta_id_seq OWNED BY detalles_consultas.detalleconsulta_id;


--
-- TOC entry 184 (class 1259 OID 64436)
-- Name: direcciones; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE direcciones (
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
-- TOC entry 183 (class 1259 OID 64434)
-- Name: direcciones_direccion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE direcciones_direccion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.direcciones_direccion_id_seq OWNER TO postgres;

--
-- TOC entry 2350 (class 0 OID 0)
-- Dependencies: 183
-- Name: direcciones_direccion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE direcciones_direccion_id_seq OWNED BY direcciones.direccion_id;


--
-- TOC entry 186 (class 1259 OID 64449)
-- Name: existencias; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE existencias (
    existencia_id integer NOT NULL,
    insumo_id integer NOT NULL,
    clinica_id integer NOT NULL,
    existencia_cantidad double precision
);


ALTER TABLE public.existencias OWNER TO postgres;

--
-- TOC entry 185 (class 1259 OID 64447)
-- Name: existencias_existencia_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE existencias_existencia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.existencias_existencia_id_seq OWNER TO postgres;

--
-- TOC entry 2351 (class 0 OID 0)
-- Dependencies: 185
-- Name: existencias_existencia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE existencias_existencia_id_seq OWNED BY existencias.existencia_id;


--
-- TOC entry 188 (class 1259 OID 64460)
-- Name: imagenes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE imagenes (
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
-- TOC entry 187 (class 1259 OID 64458)
-- Name: imagenes_imagen_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE imagenes_imagen_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.imagenes_imagen_id_seq OWNER TO postgres;

--
-- TOC entry 2352 (class 0 OID 0)
-- Dependencies: 187
-- Name: imagenes_imagen_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE imagenes_imagen_id_seq OWNED BY imagenes.imagen_id;


--
-- TOC entry 190 (class 1259 OID 64473)
-- Name: insumos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE insumos (
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
-- TOC entry 189 (class 1259 OID 64471)
-- Name: insumos_insumo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE insumos_insumo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.insumos_insumo_id_seq OWNER TO postgres;

--
-- TOC entry 2353 (class 0 OID 0)
-- Dependencies: 189
-- Name: insumos_insumo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE insumos_insumo_id_seq OWNED BY insumos.insumo_id;


--
-- TOC entry 192 (class 1259 OID 64485)
-- Name: medicos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE medicos (
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
-- TOC entry 191 (class 1259 OID 64483)
-- Name: medicos_medico_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE medicos_medico_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.medicos_medico_id_seq OWNER TO postgres;

--
-- TOC entry 2354 (class 0 OID 0)
-- Dependencies: 191
-- Name: medicos_medico_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE medicos_medico_id_seq OWNED BY medicos.medico_id;


--
-- TOC entry 194 (class 1259 OID 64494)
-- Name: menus; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE menus (
    menu_id integer NOT NULL,
    menu_nombre character varying(50)
);


ALTER TABLE public.menus OWNER TO postgres;

--
-- TOC entry 193 (class 1259 OID 64492)
-- Name: menus_menu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE menus_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.menus_menu_id_seq OWNER TO postgres;

--
-- TOC entry 2355 (class 0 OID 0)
-- Dependencies: 193
-- Name: menus_menu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE menus_menu_id_seq OWNED BY menus.menu_id;


--
-- TOC entry 195 (class 1259 OID 64502)
-- Name: menus_por_roles; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE menus_por_roles (
    rol_id integer NOT NULL,
    menu_id integer NOT NULL
);


ALTER TABLE public.menus_por_roles OWNER TO postgres;

--
-- TOC entry 197 (class 1259 OID 64512)
-- Name: movimientos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE movimientos (
    movimiento_id integer NOT NULL,
    existencia_id integer NOT NULL,
    movimiento_cantidad double precision,
    movimiento_tipo boolean,
    movimiento_fecha_creacion date,
    movimiento_usuario_creacion character varying(50)
);


ALTER TABLE public.movimientos OWNER TO postgres;

--
-- TOC entry 196 (class 1259 OID 64510)
-- Name: movimientos_movimiento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE movimientos_movimiento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.movimientos_movimiento_id_seq OWNER TO postgres;

--
-- TOC entry 2356 (class 0 OID 0)
-- Dependencies: 196
-- Name: movimientos_movimiento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE movimientos_movimiento_id_seq OWNED BY movimientos.movimiento_id;


--
-- TOC entry 199 (class 1259 OID 64522)
-- Name: municipios; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE municipios (
    municipio_id integer NOT NULL,
    departamento_id integer NOT NULL,
    municipio_nombre character varying(50)
);


ALTER TABLE public.municipios OWNER TO postgres;

--
-- TOC entry 198 (class 1259 OID 64520)
-- Name: municipios_municipio_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE municipios_municipio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.municipios_municipio_id_seq OWNER TO postgres;

--
-- TOC entry 2357 (class 0 OID 0)
-- Dependencies: 198
-- Name: municipios_municipio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE municipios_municipio_id_seq OWNED BY municipios.municipio_id;


--
-- TOC entry 201 (class 1259 OID 64532)
-- Name: odontogramas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE odontogramas (
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
-- TOC entry 200 (class 1259 OID 64530)
-- Name: odontogramas_odontograma_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE odontogramas_odontograma_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.odontogramas_odontograma_id_seq OWNER TO postgres;

--
-- TOC entry 2358 (class 0 OID 0)
-- Dependencies: 200
-- Name: odontogramas_odontograma_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE odontogramas_odontograma_id_seq OWNED BY odontogramas.odontograma_id;


--
-- TOC entry 203 (class 1259 OID 64542)
-- Name: pacientes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE pacientes (
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
    paciente_codigo integer
);


ALTER TABLE public.pacientes OWNER TO postgres;

--
-- TOC entry 202 (class 1259 OID 64540)
-- Name: pacientes_paciente_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE pacientes_paciente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.pacientes_paciente_id_seq OWNER TO postgres;

--
-- TOC entry 2359 (class 0 OID 0)
-- Dependencies: 202
-- Name: pacientes_paciente_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE pacientes_paciente_id_seq OWNED BY pacientes.paciente_id;


--
-- TOC entry 205 (class 1259 OID 64566)
-- Name: patologias; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE patologias (
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
-- TOC entry 204 (class 1259 OID 64564)
-- Name: patologias_patologia_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE patologias_patologia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.patologias_patologia_id_seq OWNER TO postgres;

--
-- TOC entry 2360 (class 0 OID 0)
-- Dependencies: 204
-- Name: patologias_patologia_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE patologias_patologia_id_seq OWNED BY patologias.patologia_id;


--
-- TOC entry 206 (class 1259 OID 64573)
-- Name: patologias_por_pacientes; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE patologias_por_pacientes (
    paciente_id integer NOT NULL,
    patologia_id integer NOT NULL
);


ALTER TABLE public.patologias_por_pacientes OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 79930)
-- Name: privilegios; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE privilegios (
    privilegio_id integer NOT NULL,
    submenu_id integer NOT NULL,
    privilegio_accion character varying(50)
);


ALTER TABLE public.privilegios OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 79940)
-- Name: privilegios_por_roles; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE privilegios_por_roles (
    privilegios_id integer NOT NULL,
    submenu_id integer NOT NULL,
    roles_id integer NOT NULL
);


ALTER TABLE public.privilegios_por_roles OWNER TO postgres;

--
-- TOC entry 208 (class 1259 OID 64584)
-- Name: promociones; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE promociones (
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
-- TOC entry 207 (class 1259 OID 64582)
-- Name: promociones_promocion_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE promociones_promocion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.promociones_promocion_id_seq OWNER TO postgres;

--
-- TOC entry 2361 (class 0 OID 0)
-- Dependencies: 207
-- Name: promociones_promocion_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE promociones_promocion_id_seq OWNED BY promociones.promocion_id;


--
-- TOC entry 210 (class 1259 OID 64596)
-- Name: roles; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE roles (
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
-- TOC entry 209 (class 1259 OID 64594)
-- Name: roles_rol_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE roles_rol_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.roles_rol_id_seq OWNER TO postgres;

--
-- TOC entry 2362 (class 0 OID 0)
-- Dependencies: 209
-- Name: roles_rol_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE roles_rol_id_seq OWNED BY roles.rol_id;


--
-- TOC entry 213 (class 1259 OID 64613)
-- Name: sub_menus_por_roles; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE sub_menus_por_roles (
    rol_id integer NOT NULL,
    submenu_id integer NOT NULL
);


ALTER TABLE public.sub_menus_por_roles OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 64605)
-- Name: submenus; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE submenus (
    submenu_id integer NOT NULL,
    sumbenu_nombre character varying(50),
    menu_id integer,
    submenu_descripcion character varying(250),
    submenu_url character varying(100)
);


ALTER TABLE public.submenus OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 64603)
-- Name: submenus_submenu_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE submenus_submenu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.submenus_submenu_id_seq OWNER TO postgres;

--
-- TOC entry 2363 (class 0 OID 0)
-- Dependencies: 211
-- Name: submenus_submenu_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE submenus_submenu_id_seq OWNED BY submenus.submenu_id;


--
-- TOC entry 215 (class 1259 OID 64623)
-- Name: tipos_insumos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tipos_insumos (
    tipoinsumo_id integer NOT NULL,
    tipoinsumo_nombre character varying(50),
    tipoinsumo_descripcion character varying(250),
    tipoinsumo_estado boolean
);


ALTER TABLE public.tipos_insumos OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 64621)
-- Name: tipos_insumos_tipoinsumo_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tipos_insumos_tipoinsumo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tipos_insumos_tipoinsumo_id_seq OWNER TO postgres;

--
-- TOC entry 2364 (class 0 OID 0)
-- Dependencies: 214
-- Name: tipos_insumos_tipoinsumo_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tipos_insumos_tipoinsumo_id_seq OWNED BY tipos_insumos.tipoinsumo_id;


--
-- TOC entry 217 (class 1259 OID 64632)
-- Name: tratamientos; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE tratamientos (
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
-- TOC entry 216 (class 1259 OID 64630)
-- Name: tratamientos_tratamiento_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE tratamientos_tratamiento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tratamientos_tratamiento_id_seq OWNER TO postgres;

--
-- TOC entry 2365 (class 0 OID 0)
-- Dependencies: 216
-- Name: tratamientos_tratamiento_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE tratamientos_tratamiento_id_seq OWNED BY tratamientos.tratamiento_id;


--
-- TOC entry 219 (class 1259 OID 64641)
-- Name: unidades_medidas; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE unidades_medidas (
    unidadmedida_id integer NOT NULL,
    unidadmedida_nombre character varying(50),
    unidadmedida_abreviatura character varying(10),
    unidadmedida_estado boolean
);


ALTER TABLE public.unidades_medidas OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 64639)
-- Name: unidades_medidas_unidadmedida_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE unidades_medidas_unidadmedida_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.unidades_medidas_unidadmedida_id_seq OWNER TO postgres;

--
-- TOC entry 2366 (class 0 OID 0)
-- Dependencies: 218
-- Name: unidades_medidas_unidadmedida_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE unidades_medidas_unidadmedida_id_seq OWNED BY unidades_medidas.unidadmedida_id;


--
-- TOC entry 220 (class 1259 OID 64648)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usuarios (
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
    usuario_apellido character varying(50)
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 1998 (class 2604 OID 64362)
-- Name: bitacora_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY bitacora ALTER COLUMN bitacora_id SET DEFAULT nextval('bitacora_bitacora_id_seq'::regclass);


--
-- TOC entry 1999 (class 2604 OID 64371)
-- Name: cita_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY citas ALTER COLUMN cita_id SET DEFAULT nextval('citas_cita_id_seq'::regclass);


--
-- TOC entry 2000 (class 2604 OID 64386)
-- Name: clinica_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY clinicas ALTER COLUMN clinica_id SET DEFAULT nextval('clinicas_clinica_id_seq'::regclass);


--
-- TOC entry 2021 (class 2604 OID 71700)
-- Name: configuracion_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY configuraciones ALTER COLUMN configuracion_id SET DEFAULT nextval('configuraciones_configuracion_id_seq'::regclass);


--
-- TOC entry 2001 (class 2604 OID 64401)
-- Name: consulta_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY consultas ALTER COLUMN consulta_id SET DEFAULT nextval('consultas_consulta_id_seq'::regclass);


--
-- TOC entry 2002 (class 2604 OID 64416)
-- Name: departamento_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY departamentos ALTER COLUMN departamento_id SET DEFAULT nextval('departamentos_departamento_id_seq'::regclass);


--
-- TOC entry 2003 (class 2604 OID 64425)
-- Name: detalleconsulta_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detalles_consultas ALTER COLUMN detalleconsulta_id SET DEFAULT nextval('detalles_consultas_detalleconsulta_id_seq'::regclass);


--
-- TOC entry 2004 (class 2604 OID 64439)
-- Name: direccion_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY direcciones ALTER COLUMN direccion_id SET DEFAULT nextval('direcciones_direccion_id_seq'::regclass);


--
-- TOC entry 2005 (class 2604 OID 64452)
-- Name: existencia_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY existencias ALTER COLUMN existencia_id SET DEFAULT nextval('existencias_existencia_id_seq'::regclass);


--
-- TOC entry 2006 (class 2604 OID 64463)
-- Name: imagen_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY imagenes ALTER COLUMN imagen_id SET DEFAULT nextval('imagenes_imagen_id_seq'::regclass);


--
-- TOC entry 2007 (class 2604 OID 64476)
-- Name: insumo_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY insumos ALTER COLUMN insumo_id SET DEFAULT nextval('insumos_insumo_id_seq'::regclass);


--
-- TOC entry 2008 (class 2604 OID 64488)
-- Name: medico_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY medicos ALTER COLUMN medico_id SET DEFAULT nextval('medicos_medico_id_seq'::regclass);


--
-- TOC entry 2009 (class 2604 OID 64497)
-- Name: menu_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY menus ALTER COLUMN menu_id SET DEFAULT nextval('menus_menu_id_seq'::regclass);


--
-- TOC entry 2010 (class 2604 OID 64515)
-- Name: movimiento_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movimientos ALTER COLUMN movimiento_id SET DEFAULT nextval('movimientos_movimiento_id_seq'::regclass);


--
-- TOC entry 2011 (class 2604 OID 64525)
-- Name: municipio_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY municipios ALTER COLUMN municipio_id SET DEFAULT nextval('municipios_municipio_id_seq'::regclass);


--
-- TOC entry 2012 (class 2604 OID 64535)
-- Name: odontograma_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY odontogramas ALTER COLUMN odontograma_id SET DEFAULT nextval('odontogramas_odontograma_id_seq'::regclass);


--
-- TOC entry 2013 (class 2604 OID 64545)
-- Name: paciente_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY pacientes ALTER COLUMN paciente_id SET DEFAULT nextval('pacientes_paciente_id_seq'::regclass);


--
-- TOC entry 2014 (class 2604 OID 64569)
-- Name: patologia_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY patologias ALTER COLUMN patologia_id SET DEFAULT nextval('patologias_patologia_id_seq'::regclass);


--
-- TOC entry 2015 (class 2604 OID 64587)
-- Name: promocion_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY promociones ALTER COLUMN promocion_id SET DEFAULT nextval('promociones_promocion_id_seq'::regclass);


--
-- TOC entry 2016 (class 2604 OID 64599)
-- Name: rol_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roles ALTER COLUMN rol_id SET DEFAULT nextval('roles_rol_id_seq'::regclass);


--
-- TOC entry 2017 (class 2604 OID 64608)
-- Name: submenu_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY submenus ALTER COLUMN submenu_id SET DEFAULT nextval('submenus_submenu_id_seq'::regclass);


--
-- TOC entry 2018 (class 2604 OID 64626)
-- Name: tipoinsumo_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tipos_insumos ALTER COLUMN tipoinsumo_id SET DEFAULT nextval('tipos_insumos_tipoinsumo_id_seq'::regclass);


--
-- TOC entry 2019 (class 2604 OID 64635)
-- Name: tratamiento_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY tratamientos ALTER COLUMN tratamiento_id SET DEFAULT nextval('tratamientos_tratamiento_id_seq'::regclass);


--
-- TOC entry 2020 (class 2604 OID 64644)
-- Name: unidadmedida_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY unidades_medidas ALTER COLUMN unidadmedida_id SET DEFAULT nextval('unidades_medidas_unidadmedida_id_seq'::regclass);


--
-- TOC entry 2280 (class 0 OID 64359)
-- Dependencies: 172
-- Data for Name: bitacora; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY bitacora (bitacora_id, bitacora_fecha_hora, bitacora_usuario, bitacora_transaccion) FROM stdin;
\.


--
-- TOC entry 2367 (class 0 OID 0)
-- Dependencies: 171
-- Name: bitacora_bitacora_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('bitacora_bitacora_id_seq', 1, false);


--
-- TOC entry 2282 (class 0 OID 64368)
-- Dependencies: 174
-- Data for Name: citas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY citas (cita_id, clinica_id, medico_id, usuario_usuario, cita_fecha, cita_hora, cita_nombres, cita_apellidos, cita_telefono, cita_correo, cita_motivo, cita_fecha_creacion, cita_hora_creacion, cita_estado, cita_usuario_creacion, cita_fecha_modificacion, cita_usuario_modificacion, cita_ensala) FROM stdin;
3	1	2	\N	2019-01-25	09:00:00	Diego	Guzman	2456-4656	diego.guzman@gmail.com	Motivo	2019-01-23	15:43:58	1	\N	\N	\N	\N
5	2	\N	juanfran.aldana@gmail.com	2019-02-13	08:00:00	Francis	\N	7485-7485	juanfran.aldana@gmail.com		2019-02-13	13:53:29	4	juanfran.aldana@gmail.com	2019-02-13	juanfran.aldana@gmail.com	\N
6	2	1	juanfran.aldana@gmail.com	2019-02-13	08:00:00	Fracis	Merjivar	7485-7485	juanfran.aldana@gmail.com		2019-02-13	15:52:40	1	juanfran.aldana@gmail.com	\N	\N	\N
4	1	1	Diana	2019-02-13	09:00:00	Diana	De Rivas	7432-4845	diana.chavez@gmail.com	Dolor en muela	2019-02-13	13:52:15	4	Diana	2019-02-13	Diana	t
\.


--
-- TOC entry 2368 (class 0 OID 0)
-- Dependencies: 173
-- Name: citas_cita_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('citas_cita_id_seq', 6, true);


--
-- TOC entry 2284 (class 0 OID 64383)
-- Dependencies: 176
-- Data for Name: clinicas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY clinicas (clinica_id, clinica_nombre, clinica_correo, clinica_telefono_fijo, clinica_telefono_movil, clinica_modulo, clinica_horario_apertura, clinica_horario_cierre, clinica_estado, clinica_fecha_creacion, clinica_usuario_creacion, clinica_fecha_modificacion, clinica_usuario_modificacion) FROM stdin;
1	Smiling San Salvador	smiling.sansalvador@gmail.com	2211-4477	7845-1454	2	08:00:00	17:00:00	t	2018-10-27	Nombre de usuario	\N	\N
2	Smiling Antigua Cuscatlán	smiling.antiguocuscatlan@gmail.com	2214-7845	7485-9654	1	08:00:00	17:00:00	t	2018-10-27	Nombre de usuario	\N	\N
\.


--
-- TOC entry 2369 (class 0 OID 0)
-- Dependencies: 175
-- Name: clinicas_clinica_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('clinicas_clinica_id_seq', 2, true);


--
-- TOC entry 2330 (class 0 OID 71697)
-- Dependencies: 222
-- Data for Name: configuraciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY configuraciones (configuracion_id, configuracion_tiempo_sesion, configuracion_correo_host, configuracion_correo_port, configuracion_correo_requerido, configuracion_correo_encryptacion, configuracion_correo_cuenta, configuracion_correo_contrasenya, configuracion_correo_ilimitada, configuracion_correo_mes, configuracion_correo_dia, configuracion_correo_enviado_mes, configuracion_correo_enviado_dia, configuracion_correo_activo, configuracion_titulo, configuracion_mensaje, configuracion_imagen_superior, configuracion_imagen_inferior, configuracion_imagen_login) FROM stdin;
1	30	smtp.gmail.com	587	t	tls	pruebascampos.er@gmail.com	$prueba$#correo	f	2000	20	0	0	t	VISIÓN	Posicionarse como la mejor red de clínicas dentales en El Salvador que permita mejorar los niveles de salud bucal de nuestra sociedad. En donde se destaque la atención por su calidad, enfoque estático, responsabilidad, respeto, ética profesional, para de esta forma ir generando una relación odontólogo-paciente de confianza.	bannerfinal.png	direcciones.png	fondo.png
\.


--
-- TOC entry 2370 (class 0 OID 0)
-- Dependencies: 221
-- Name: configuraciones_configuracion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('configuraciones_configuracion_id_seq', 1, true);


--
-- TOC entry 2286 (class 0 OID 64398)
-- Dependencies: 178
-- Data for Name: consultas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY consultas (consulta_id, promocion_id, paciente_id, medico_id, consulta_motivo, consulta_diagnostico, consulta_receta, consulta_nota, consulta_fecha_creacion, consulta_usuario_creacion, consulta_fecha_modificacion, consulta_usuario_modificacion) FROM stdin;
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
-- TOC entry 2371 (class 0 OID 0)
-- Dependencies: 177
-- Name: consultas_consulta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('consultas_consulta_id_seq', 10, true);


--
-- TOC entry 2332 (class 0 OID 79919)
-- Dependencies: 224
-- Data for Name: dashboard; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY dashboard (dashboard_id, dashboard_nombre, dashboard_descripcion, dashboard_url, dashboard_imagen) FROM stdin;
1	Básico	Muestra un mensaje de Bienvenida	/templates/dashboard/basico.xhtml	/templates/dashboard/basico.jpg
2	Estadistica	Muestra estadisticas general de la clínica	/templates/dashboard/estadisticas.xhtml	/templates/dashboard/basico.jpg
3	Médicos	Muestra citas o compromisos del médico	/templates/dashboard/medico.xhtml	/templates/dashboard/basico.jpg
4	Paciente	Registro rápido de citas y citas reservadas	/templates/dashboard/paciente.xhtml	/templates/dashboard/paciente.jpg
5	Administración	Muestra los la cantidad de registro del SIAEC	/templates/dashboard/paciente.xhtml	/templates/dashboard/paciente.jpg
6	Asistente	Muestras las citas del día.	/templates/dashboard/asistente.xhtml	/templates/dashboard/asistente.jpg
\.


--
-- TOC entry 2372 (class 0 OID 0)
-- Dependencies: 223
-- Name: dashboard_dashboard_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('dashboard_dashboard_id_seq', 1, false);


--
-- TOC entry 2288 (class 0 OID 64413)
-- Dependencies: 180
-- Data for Name: departamentos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY departamentos (departamento_id, departamento_nombre) FROM stdin;
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
-- TOC entry 2373 (class 0 OID 0)
-- Dependencies: 179
-- Name: departamentos_departamento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('departamentos_departamento_id_seq', 1, false);


--
-- TOC entry 2290 (class 0 OID 64422)
-- Dependencies: 182
-- Data for Name: detalles_consultas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY detalles_consultas (detalleconsulta_id, tratamiento_id, paciente_id, detalleconsulta_pieza, detalleconsulta_tratamiento, detalleconsulta_cargo, detalleconsulta_abono, detalleconsulta_fecha_creacion, detalleconsulta_usuario_creacio) FROM stdin;
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
-- TOC entry 2374 (class 0 OID 0)
-- Dependencies: 181
-- Name: detalles_consultas_detalleconsulta_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('detalles_consultas_detalleconsulta_id_seq', 22, true);


--
-- TOC entry 2292 (class 0 OID 64436)
-- Dependencies: 184
-- Data for Name: direcciones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY direcciones (direccion_id, paciente_id, medico_id, clinica_id, municipio_id, direccion_colonia, direccion_calle, direccion_casa, direccion_pasaje, direccion_poligono, direccion_apartamento) FROM stdin;
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
-- TOC entry 2375 (class 0 OID 0)
-- Dependencies: 183
-- Name: direcciones_direccion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('direcciones_direccion_id_seq', 12, true);


--
-- TOC entry 2294 (class 0 OID 64449)
-- Dependencies: 186
-- Data for Name: existencias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY existencias (existencia_id, insumo_id, clinica_id, existencia_cantidad) FROM stdin;
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
-- TOC entry 2376 (class 0 OID 0)
-- Dependencies: 185
-- Name: existencias_existencia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('existencias_existencia_id_seq', 20, true);


--
-- TOC entry 2296 (class 0 OID 64460)
-- Dependencies: 188
-- Data for Name: imagenes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY imagenes (imagen_id, paciente_id, imagen_nombre, imagen_anotacion, imagen_imagen, imagen_url, imagen_fecha_creacion, imagen_usuario_creacion) FROM stdin;
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
-- TOC entry 2377 (class 0 OID 0)
-- Dependencies: 187
-- Name: imagenes_imagen_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('imagenes_imagen_id_seq', 37, true);


--
-- TOC entry 2298 (class 0 OID 64473)
-- Dependencies: 190
-- Data for Name: insumos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY insumos (insumo_id, tipoinsumo_id, unidadmedida_id, insumo_nombre, insumo_descripcion, insumo_minimo, insumo_estado, insumo_fecha_creacion, insumo_usuario_creacion, insumo_fecha_modificacion, insumo_usuario_modificacion) FROM stdin;
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
-- TOC entry 2378 (class 0 OID 0)
-- Dependencies: 189
-- Name: insumos_insumo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('insumos_insumo_id_seq', 10, true);


--
-- TOC entry 2300 (class 0 OID 64485)
-- Dependencies: 192
-- Data for Name: medicos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY medicos (medico_id, medico_primer_nombre, medico_segundo_nombre, medico_primer_apellido, medico_segundo_apellido, medico_fecha_nacimiento, medico_sexo, medico_correo, medico_especialidad, medico_telefono_casa, medico_telefono_movil, medico_numero_acreditacion, medico_estado, medico_usuario, medico_fecha_creacion, medico_usuario_creacion, medico_fecha_modificacion, medico_usuario_modificacion) FROM stdin;
2	Joseline	Graciela	Alfaro	Domínguez	1993-12-16	f	joseline.alfaro@hotmail.com	Ortodoncia	2514-2536	7845-1245	5678	t	\N	2018-10-27	Nombre de usuario	2018-10-27	Nombre de usuario
3	Jacqueline	Yessenia	Nieto	Palacios	1986-12-27	f	jacqueline.nieto@yahoo.es	Periodoncia	2233-5656	7412-5478	9123	t	\N	2018-10-27	Nombre de usuario	\N	\N
4	Johana	Beatriz	Guzmán	Flores	1990-05-27	f	johana.guzman@gmail.com	Prostodoncia	2356-8974	7412-5896	4567	t	\N	2018-10-27	Nombre de usuario	\N	\N
1	Jessica	Elizabeth	Rivas	Rodriguez	1990-09-20	f	jessica.rivas@gmail.com	Odontología general	2255-4488	7788-5544	1234	t	Valeria	2018-10-27	Nombre de usuario	\N	\N
\.


--
-- TOC entry 2379 (class 0 OID 0)
-- Dependencies: 191
-- Name: medicos_medico_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('medicos_medico_id_seq', 4, true);


--
-- TOC entry 2302 (class 0 OID 64494)
-- Dependencies: 194
-- Data for Name: menus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY menus (menu_id, menu_nombre) FROM stdin;
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
-- TOC entry 2380 (class 0 OID 0)
-- Dependencies: 193
-- Name: menus_menu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('menus_menu_id_seq', 1, false);


--
-- TOC entry 2303 (class 0 OID 64502)
-- Dependencies: 195
-- Data for Name: menus_por_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY menus_por_roles (rol_id, menu_id) FROM stdin;
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
-- TOC entry 2305 (class 0 OID 64512)
-- Dependencies: 197
-- Data for Name: movimientos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY movimientos (movimiento_id, existencia_id, movimiento_cantidad, movimiento_tipo, movimiento_fecha_creacion, movimiento_usuario_creacion) FROM stdin;
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
-- TOC entry 2381 (class 0 OID 0)
-- Dependencies: 196
-- Name: movimientos_movimiento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('movimientos_movimiento_id_seq', 42, true);


--
-- TOC entry 2307 (class 0 OID 64522)
-- Dependencies: 199
-- Data for Name: municipios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY municipios (municipio_id, departamento_id, municipio_nombre) FROM stdin;
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
-- TOC entry 2382 (class 0 OID 0)
-- Dependencies: 198
-- Name: municipios_municipio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('municipios_municipio_id_seq', 1, false);


--
-- TOC entry 2309 (class 0 OID 64532)
-- Dependencies: 201
-- Data for Name: odontogramas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY odontogramas (odontograma_id, paciente_id, odontograma_pieza, odontograma_cuadrante, odontograma_oclusal, odontograma_vestibular, odontograma_mesial, odontograma_distal, odontograma_lingual, odontograma_palatina, odontograma_extraccion, odontograma_ausente, odontograma_fractura, odontograma_protesis, odontograma_implante, odontograma_endodoncia, odontograma_raiz, odontograma_general, odontograma_endodoncia_reincide, odontograma_protesis_reincide) FROM stdin;
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
-- TOC entry 2383 (class 0 OID 0)
-- Dependencies: 200
-- Name: odontogramas_odontograma_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('odontogramas_odontograma_id_seq', 315, true);


--
-- TOC entry 2311 (class 0 OID 64542)
-- Dependencies: 203
-- Data for Name: pacientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY pacientes (paciente_id, paciente_expediente, paciente_primer_nombre, paciente_segundo_nombre, paciente_primer_apellido, paciente_segundo_apellido, paciente_fecha_nacimiento, paciente_sexo, paciente_correo, paciente_trabajo, paciente_telefono_casa, paciente_telefono_movil, paciente_telefono_oficina, paciente_whatsapp, paciente_estado, paciente_antecedentes, paciente_recordatorio, paciente_fecha_seguimiento, paciente_responsable, paciente_fecha_creacion, paciente_usuario_creacion, paciente_fecha_modificacion, paciente_usuario_modificacion, paciente_notificar_correo, paciente_codigo) FROM stdin;
2	1009	Erick	Eduardo	Campos	Rivas	1990-02-27	t	erick.rivas@yahoo.es	MINSAL	2255-8877	7485-4785	2221-5454	f	t	\N	t	\N	\N	2018-10-27	\N	\N	\N	\N	8456
3	1009	Valeria	Guadalupe	Campos	Gómez	1990-02-19	f	valeria.campos@hotmail.com	GOES	2356-8978	7412-5896	2145-7845	t	t	\N	t	\N	\N	2018-10-27	\N	\N	\N	\N	5214
4	1009	Wilfredo	José	Flamenco	Lémus	1990-01-02	t	wilfredo.flamenco@yahoo.com	AMSS	2356-8978	7485-9621	2158-9654	f	t	\N	t	\N	\N	2018-10-27	\N	2018-11-05	Nombre de usuario	\N	9458
5	\N	Francis	Amilcar	Menjivar	Menjivar	1980-10-10	t	francis.menjivar@hotmail.com	UES	2216-4578	7878-7878	2255-4477	t	t	\N	t	\N	\N	2018-11-06	\N	\N	\N	\N	5263
6	\N	Diego	Rafael	Guzman	Flores	1990-01-12	t	diego.flores@gmail.com	EDESSA	2216-5689	7485-7485	7845-1245	t	t	\N	t	\N		2019-01-25	\N	\N	\N	t	1218
1	1009	Juan	Francisco	Aldana	Domínguez	1990-05-27	t	juanfran.aldana@gmail.com	UES	2216-4578	7611-0659	2255-7777	t	t	El paciente es alérgico al frío.	t	\N		2018-10-27	\N	2018-11-28	Nombre de usuario	t	1234
\.


--
-- TOC entry 2384 (class 0 OID 0)
-- Dependencies: 202
-- Name: pacientes_paciente_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('pacientes_paciente_id_seq', 6, true);


--
-- TOC entry 2313 (class 0 OID 64566)
-- Dependencies: 205
-- Data for Name: patologias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY patologias (patologia_id, patologia_nombre, patologia_estado, patologia_fecha_creacion, patologia_usuario_creacion, patologia_fecha_modificacion, patologia_usuario_modificacio) FROM stdin;
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
-- TOC entry 2385 (class 0 OID 0)
-- Dependencies: 204
-- Name: patologias_patologia_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('patologias_patologia_id_seq', 17, true);


--
-- TOC entry 2314 (class 0 OID 64573)
-- Dependencies: 206
-- Data for Name: patologias_por_pacientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY patologias_por_pacientes (paciente_id, patologia_id) FROM stdin;
1	12
1	5
1	1
1	4
\.


--
-- TOC entry 2333 (class 0 OID 79930)
-- Dependencies: 225
-- Data for Name: privilegios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY privilegios (privilegio_id, submenu_id, privilegio_accion) FROM stdin;
1	2	Consultar
2	2	Editar
3	2	Eliminar
4	3	Consultar
5	3	Editar
6	3	Eliminar
7	6	Consultar
8	6	Editar
9	6	Eliminar
10	7	Consultar
11	7	Editar
12	7	Eliminar
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
-- TOC entry 2334 (class 0 OID 79940)
-- Dependencies: 226
-- Data for Name: privilegios_por_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY privilegios_por_roles (privilegios_id, submenu_id, roles_id) FROM stdin;
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
7	6	5
8	6	5
9	6	5
10	7	5
11	7	5
12	7	5
\.


--
-- TOC entry 2316 (class 0 OID 64584)
-- Dependencies: 208
-- Data for Name: promociones; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY promociones (promocion_id, promocion_nombre, promocion_descripcion, promocion_inicio, promocion_fin, promocion_estado, promocion_tipo, promocion_imagen, promocion_imagen_nombre, promocion_imagen_url, promocion_mensaje, promocion_activa, promocion_fecha_creacion, promocion_usuario_creacion, promocion_fecha_modificacion, promocion_usuario_modificacion, promocion_correo_limitado_espera) FROM stdin;
4	Nombre de Promocion	Descripcion de promocion.	2018-01-01	2018-12-31	t	1	\N	Promocion1.jpg	c://Users/Fam. Gomez Aldana/Documents/NetBeansProjects/siaec/web/images/promociones/Promocion1.jpg	Mensaje de promocion.	t	2018-11-07	Nombre Usuario	2018-11-08	Nombre Usuario	0
6	Navideña	Esta es una descripción de promoción navideña.	2018-01-01	2018-12-31	f	2	\N			Este es un correo para promoción navideña.	t	2018-12-14	Nombre Usuario	2018-12-14	Nombre Usuario	0
1	Cumpleanios	Esta es una descripcion de promocion.	2019-01-01	2019-12-31	t	2	\N	Promocion5.jpg	c://Users/Fam. Gomez Aldana/Documents/NetBeansProjects/siaec/web/images/promociones/Promocion5.jpg	Este es un mensaje de promocion.	t	2018-10-30	Nombre Usuario	2019-01-11	Nombre Usuario	1
5	Promocion Bienvenidas Vacaciones	Descripcin Bienvenida Vacaciones.	2019-01-01	2019-01-31	t	1	\N	promocion2.jpg	c://Users/Fam. Gomez Aldana/Documents/NetBeansProjects/siaec/web/images/promociones/promocion2.jpg	Mensaje de promon Bienvenida Vacaciones.	t	2018-11-07	Nombre Usuario	2019-01-12	Nombre Usuario	0
2	Navideña	Esta es una descripción de promoción.	2018-12-01	2018-12-31	f	3	\N			Este es un mensaje de promociÃ³n.	t	2018-10-30	Nombre Usuario	2018-11-08	Nombre Usuario	0
3	General	Esta es una descripción de promoción.	2018-11-01	2018-11-30	t	1	\N	Promocion3.jpg	c://Users/Fam. Gomez Aldana/Documents/NetBeansProjects/siaec/web/images/promociones/Promocion3.jpg	Este es un mensaje de promociÃ³n.	t	2018-10-30	Nombre Usuario	\N	\N	0
\.


--
-- TOC entry 2386 (class 0 OID 0)
-- Dependencies: 207
-- Name: promociones_promocion_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('promociones_promocion_id_seq', 6, true);


--
-- TOC entry 2318 (class 0 OID 64596)
-- Dependencies: 210
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY roles (rol_id, rol_nombre, rol_descripcion, rol_fecha_creacion, rol_usuario_creacion, rol_fecha_modificacion, rol_usuario_modificacion, dashboard_id, rol_alerta, rol_notificacion) FROM stdin;
1	Administrador/a	Administra el sistema SIAEC.	2018-12-28	Sistema	\N	\N	1	t	t
2	Director/a	Supervisa las sucursales.	2018-12-28	Sistema	\N	\N	2	t	t
3	Doctor/a	Odontologa	2018-12-28	Sistema	\N	\N	3	f	t
5	Paciente	Paciente de la clínica	2018-12-28	Sistema	\N	\N	4	f	f
4	Asistente	Asistente de la clínica	2018-12-28	Sistema	\N	\N	6	t	t
\.


--
-- TOC entry 2387 (class 0 OID 0)
-- Dependencies: 209
-- Name: roles_rol_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('roles_rol_id_seq', 1, false);


--
-- TOC entry 2321 (class 0 OID 64613)
-- Dependencies: 213
-- Data for Name: sub_menus_por_roles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY sub_menus_por_roles (rol_id, submenu_id) FROM stdin;
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
5	6
5	7
5	8
\.


--
-- TOC entry 2320 (class 0 OID 64605)
-- Dependencies: 212
-- Data for Name: submenus; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY submenus (submenu_id, sumbenu_nombre, menu_id, submenu_descripcion, submenu_url) FROM stdin;
1	Registrar Cita	1	Clínica	/views/1_citas/cita_clinica_nueva.xhtml
2	Citas Aprobadas	1	Clínica	/views/1_citas/cita_clinica_listado_aprobadas.xhtml
3	Citas Pendientes	1	Clínica	/views/1_citas/cita_clinica_listado_pendiente.xhtml
4	Histórico de Citas	1	Clínica	/views/1_citas/cita_clinica_historico.xhtml
5	Nueva Cita	1	Paciente	/views/1_citas/cita_paciente_nueva.xhtml
6	Mis Citas Aprobadas	1	Paciente	/views/1_citas/cita_paciente_listado_aprobadas.xhtml
7	Mis Citas Pendientes	1	Paciente	/views/1_citas/cita_paciente_listado_pendiente.xhtml
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
19	Listado de Promociones	4	Clínica	/views/4_promociones/promociones_listado.xhtml
20	Promociones Demandadas	5	Clínica	/views/5_reportes/rep_promociones_demandados.xhtml
21	Tratamientos Demandadas	5	Clínica	/views/5_reportes/rep_tratamientos_demandados.xhtml
22	Listado de Insumos Médicos	5	Clínica	/views/5_reportes/rep_tratamientos_demandados.xhtml
23	Listado de Insumo Médicos Próximos a Agotarse	5	Clínica	/views/5_reportes/rep_listadoinsumos_agotados.xhtml
24	Listado de Pacientes por Médicos	5	Clínica	/views/5_reportes/rep_listadopacientes_xmedico.xhtml
25	Tratamientos Realizados a Pacientes	5	Clínica	/views/5_reportes/rep_tratamientos_apaciente.xhtml
26	Reporte 7	5	Clínica	mantenimiento.xhtml
27	Reporte 8	5	Clínica	mantenimiento.xhtml
28	Reporte 9	5	Clínica	mantenimiento.xhtml
29	Reporte 10	5	Clínica	mantenimiento.xhtml
30	Reporte 11	5	Clínica	mantenimiento.xhtml
31	Reporte 12	5	Clínica	mantenimiento.xhtml
32	Gestionar Roles	6	Clínica	/views/6_administracion/cat_roles_listado.xhtml
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
\.


--
-- TOC entry 2388 (class 0 OID 0)
-- Dependencies: 211
-- Name: submenus_submenu_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('submenus_submenu_id_seq', 1, false);


--
-- TOC entry 2323 (class 0 OID 64623)
-- Dependencies: 215
-- Data for Name: tipos_insumos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tipos_insumos (tipoinsumo_id, tipoinsumo_nombre, tipoinsumo_descripcion, tipoinsumo_estado) FROM stdin;
2	Endodóncia	Esta es una descripción de tipo de insumo	t
1	General	Esta es una descripción de tipo de insumo	t
\.


--
-- TOC entry 2389 (class 0 OID 0)
-- Dependencies: 214
-- Name: tipos_insumos_tipoinsumo_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tipos_insumos_tipoinsumo_id_seq', 2, true);


--
-- TOC entry 2325 (class 0 OID 64632)
-- Dependencies: 217
-- Data for Name: tratamientos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY tratamientos (tratamiento_id, tratamiento_nombre, tratamiento_descripcion, tratamiento_estado, tratamiento_fecha_creacion, tratamiento_usuario_creacion, tratamiento_fecha_modificacion, tratamiento_usuario_modificacio) FROM stdin;
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
-- TOC entry 2390 (class 0 OID 0)
-- Dependencies: 216
-- Name: tratamientos_tratamiento_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('tratamientos_tratamiento_id_seq', 10, true);


--
-- TOC entry 2327 (class 0 OID 64641)
-- Dependencies: 219
-- Data for Name: unidades_medidas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY unidades_medidas (unidadmedida_id, unidadmedida_nombre, unidadmedida_abreviatura, unidadmedida_estado) FROM stdin;
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
-- TOC entry 2391 (class 0 OID 0)
-- Dependencies: 218
-- Name: unidades_medidas_unidadmedida_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('unidades_medidas_unidadmedida_id_seq', 10, true);


--
-- TOC entry 2328 (class 0 OID 64648)
-- Dependencies: 220
-- Data for Name: usuarios; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usuarios (usuario_usuario, rol_id, usuario_correo, usuario_telefono, usuario_contrasenia, usuario_estado, usuario_fecha_creacion, usuario_fecha_modificacion, usuario_bloqueado, usuario_intento_fallido, usuario_primer_nombre, usuario_segundo_nombre, usuario_primer_apellido, usuario_segundo_apellido, usuario_nombre, usuario_apellido) FROM stdin;
juanfran.aldana@gmail.com	5	juanfran.aldana@gmail.com	7485-7485	000000	t	2019-02-13	\N	t	0	Fracis	Amilcar	Merjivar		Francis	\N
Aldana	1	juanfran.aldana@gmail.com	7611-0659	000000	t	2018-11-13	\N	t	0	Juan	Francisco	Aldana	Domínguez	JuanFran	\N
Erick	2	erickcampos.rivas@gmail.com	7412-7845	000000	t	2018-11-13	\N	t	0	Erick	\N	Rivas	\N	Erick	\N
Diana	5	diana.chavez@gmail.com	7432-4845	000000	t	2018-11-13	\N	t	0	Diana	\N	De Rivas	\N	Diana	\N
Wilfredo	4	wflamenco@gmail.com	7452-4857	000000	t	2018-11-13	\N	t	0	Wilfredo	José	Flamenco	Lemus	Wilfredo	\N
Valeria	3	valgomez@gmail.com	7485-7485	000000	t	2018-11-13	\N	t	0	Valeria	Guadalupe	Campos	Gomez	Valeria	\N
ruth.alvarado@gmail.com	5	ruth.alvarado@gmail.com	7676-7676	123456789	t	2019-02-13	\N	t	0	Fracis	Nohemí	Alvarado	Cañada	\N	\N
sandra.lopez@gmail.com	5	sandra.lopez@gmail.com	7412-5896	000000	t	2019-02-13	\N	t	0	Sandra	Vanessa	López	Mendoza	\N	\N
turh.alvarado@gmail.com	5	turh.alvarado@gmail.com	7485-9632	000000	t	2019-02-13	\N	t	0	Ruth	\N	Alvarado	\N	Ruth	Alvarado
\.


--
-- TOC entry 2135 (class 2606 OID 79924)
-- Name: dashboard_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY dashboard
    ADD CONSTRAINT dashboard_pkey PRIMARY KEY (dashboard_id);


--
-- TOC entry 2025 (class 2606 OID 64364)
-- Name: pk_bitacora; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY bitacora
    ADD CONSTRAINT pk_bitacora PRIMARY KEY (bitacora_id);


--
-- TOC entry 2028 (class 2606 OID 64376)
-- Name: pk_citas; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY citas
    ADD CONSTRAINT pk_citas PRIMARY KEY (cita_id);


--
-- TOC entry 2034 (class 2606 OID 64388)
-- Name: pk_clinicas; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY clinicas
    ADD CONSTRAINT pk_clinicas PRIMARY KEY (clinica_id);


--
-- TOC entry 2133 (class 2606 OID 71705)
-- Name: pk_configuraciones; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY configuraciones
    ADD CONSTRAINT pk_configuraciones PRIMARY KEY (configuracion_id);


--
-- TOC entry 2037 (class 2606 OID 64406)
-- Name: pk_consultas; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY consultas
    ADD CONSTRAINT pk_consultas PRIMARY KEY (consulta_id);


--
-- TOC entry 2043 (class 2606 OID 64418)
-- Name: pk_departamentos; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY departamentos
    ADD CONSTRAINT pk_departamentos PRIMARY KEY (departamento_id);


--
-- TOC entry 2046 (class 2606 OID 64430)
-- Name: pk_detalles_consultas; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY detalles_consultas
    ADD CONSTRAINT pk_detalles_consultas PRIMARY KEY (detalleconsulta_id);


--
-- TOC entry 2051 (class 2606 OID 64441)
-- Name: pk_direcciones; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY direcciones
    ADD CONSTRAINT pk_direcciones PRIMARY KEY (direccion_id);


--
-- TOC entry 2058 (class 2606 OID 64454)
-- Name: pk_existencias; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY existencias
    ADD CONSTRAINT pk_existencias PRIMARY KEY (existencia_id);


--
-- TOC entry 2063 (class 2606 OID 64468)
-- Name: pk_imagenes; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY imagenes
    ADD CONSTRAINT pk_imagenes PRIMARY KEY (imagen_id);


--
-- TOC entry 2067 (class 2606 OID 64478)
-- Name: pk_insumos; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY insumos
    ADD CONSTRAINT pk_insumos PRIMARY KEY (insumo_id);


--
-- TOC entry 2072 (class 2606 OID 64490)
-- Name: pk_medicos; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY medicos
    ADD CONSTRAINT pk_medicos PRIMARY KEY (medico_id);


--
-- TOC entry 2075 (class 2606 OID 64499)
-- Name: pk_menus; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY menus
    ADD CONSTRAINT pk_menus PRIMARY KEY (menu_id);


--
-- TOC entry 2080 (class 2606 OID 64506)
-- Name: pk_menus_por_roles; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY menus_por_roles
    ADD CONSTRAINT pk_menus_por_roles PRIMARY KEY (rol_id, menu_id);


--
-- TOC entry 2083 (class 2606 OID 64517)
-- Name: pk_movimientos; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY movimientos
    ADD CONSTRAINT pk_movimientos PRIMARY KEY (movimiento_id);


--
-- TOC entry 2087 (class 2606 OID 64527)
-- Name: pk_municipios; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY municipios
    ADD CONSTRAINT pk_municipios PRIMARY KEY (municipio_id);


--
-- TOC entry 2091 (class 2606 OID 64537)
-- Name: pk_odontogramas; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY odontogramas
    ADD CONSTRAINT pk_odontogramas PRIMARY KEY (odontograma_id);


--
-- TOC entry 2095 (class 2606 OID 64550)
-- Name: pk_pacientes; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY pacientes
    ADD CONSTRAINT pk_pacientes PRIMARY KEY (paciente_id);


--
-- TOC entry 2098 (class 2606 OID 64571)
-- Name: pk_patologias; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY patologias
    ADD CONSTRAINT pk_patologias PRIMARY KEY (patologia_id);


--
-- TOC entry 2103 (class 2606 OID 64577)
-- Name: pk_patologias_por_pacientes; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY patologias_por_pacientes
    ADD CONSTRAINT pk_patologias_por_pacientes PRIMARY KEY (paciente_id, patologia_id);


--
-- TOC entry 2105 (class 2606 OID 64592)
-- Name: pk_promociones; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY promociones
    ADD CONSTRAINT pk_promociones PRIMARY KEY (promocion_id);


--
-- TOC entry 2108 (class 2606 OID 64601)
-- Name: pk_roles; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT pk_roles PRIMARY KEY (rol_id);


--
-- TOC entry 2114 (class 2606 OID 64617)
-- Name: pk_sub_menus_por_roles; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY sub_menus_por_roles
    ADD CONSTRAINT pk_sub_menus_por_roles PRIMARY KEY (rol_id, submenu_id);


--
-- TOC entry 2111 (class 2606 OID 64610)
-- Name: pk_submenus; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY submenus
    ADD CONSTRAINT pk_submenus PRIMARY KEY (submenu_id);


--
-- TOC entry 2119 (class 2606 OID 64628)
-- Name: pk_tipos_insumos; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tipos_insumos
    ADD CONSTRAINT pk_tipos_insumos PRIMARY KEY (tipoinsumo_id);


--
-- TOC entry 2122 (class 2606 OID 64637)
-- Name: pk_tratamientos; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY tratamientos
    ADD CONSTRAINT pk_tratamientos PRIMARY KEY (tratamiento_id);


--
-- TOC entry 2125 (class 2606 OID 64646)
-- Name: pk_unidades_medidas; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY unidades_medidas
    ADD CONSTRAINT pk_unidades_medidas PRIMARY KEY (unidadmedida_id);


--
-- TOC entry 2128 (class 2606 OID 64652)
-- Name: pk_usuarios; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT pk_usuarios PRIMARY KEY (usuario_usuario);


--
-- TOC entry 2137 (class 2606 OID 79934)
-- Name: privilegios_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY privilegios
    ADD CONSTRAINT privilegios_pkey PRIMARY KEY (privilegio_id, submenu_id);


--
-- TOC entry 2139 (class 2606 OID 79944)
-- Name: privilegios_por_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY privilegios_por_roles
    ADD CONSTRAINT privilegios_por_roles_pkey PRIMARY KEY (privilegios_id, submenu_id, roles_id);


--
-- TOC entry 2023 (class 1259 OID 64365)
-- Name: bitacora_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX bitacora_pk ON bitacora USING btree (bitacora_id);


--
-- TOC entry 2026 (class 1259 OID 64377)
-- Name: citas_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX citas_pk ON citas USING btree (cita_id);


--
-- TOC entry 2032 (class 1259 OID 64389)
-- Name: clinicas_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX clinicas_pk ON clinicas USING btree (clinica_id);


--
-- TOC entry 2131 (class 1259 OID 71706)
-- Name: configuraciones_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX configuraciones_pk ON configuraciones USING btree (configuracion_id);


--
-- TOC entry 2035 (class 1259 OID 64407)
-- Name: consultas_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX consultas_pk ON consultas USING btree (consulta_id);


--
-- TOC entry 2041 (class 1259 OID 64419)
-- Name: departamentos_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX departamentos_pk ON departamentos USING btree (departamento_id);


--
-- TOC entry 2044 (class 1259 OID 64431)
-- Name: detalles_consultas_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX detalles_consultas_pk ON detalles_consultas USING btree (detalleconsulta_id);


--
-- TOC entry 2049 (class 1259 OID 64442)
-- Name: direcciones_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX direcciones_pk ON direcciones USING btree (direccion_id);


--
-- TOC entry 2056 (class 1259 OID 64455)
-- Name: existencias_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX existencias_pk ON existencias USING btree (existencia_id);


--
-- TOC entry 2061 (class 1259 OID 64469)
-- Name: imagenes_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX imagenes_pk ON imagenes USING btree (imagen_id);


--
-- TOC entry 2065 (class 1259 OID 64479)
-- Name: insumos_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX insumos_pk ON insumos USING btree (insumo_id);


--
-- TOC entry 2070 (class 1259 OID 64491)
-- Name: medicos_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX medicos_pk ON medicos USING btree (medico_id);


--
-- TOC entry 2073 (class 1259 OID 64500)
-- Name: menus_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX menus_pk ON menus USING btree (menu_id);


--
-- TOC entry 2076 (class 1259 OID 64509)
-- Name: menus_por_roles2_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX menus_por_roles2_fk ON menus_por_roles USING btree (menu_id);


--
-- TOC entry 2077 (class 1259 OID 64508)
-- Name: menus_por_roles_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX menus_por_roles_fk ON menus_por_roles USING btree (rol_id);


--
-- TOC entry 2078 (class 1259 OID 64507)
-- Name: menus_por_roles_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX menus_por_roles_pk ON menus_por_roles USING btree (rol_id, menu_id);


--
-- TOC entry 2081 (class 1259 OID 64518)
-- Name: movimientos_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX movimientos_pk ON movimientos USING btree (movimiento_id);


--
-- TOC entry 2085 (class 1259 OID 64528)
-- Name: municipios_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX municipios_pk ON municipios USING btree (municipio_id);


--
-- TOC entry 2089 (class 1259 OID 64538)
-- Name: odontogramas_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX odontogramas_pk ON odontogramas USING btree (odontograma_id);


--
-- TOC entry 2093 (class 1259 OID 64551)
-- Name: pacientes_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX pacientes_pk ON pacientes USING btree (paciente_id);


--
-- TOC entry 2096 (class 1259 OID 64572)
-- Name: patologias_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX patologias_pk ON patologias USING btree (patologia_id);


--
-- TOC entry 2099 (class 1259 OID 64580)
-- Name: patologias_por_pacientes2_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX patologias_por_pacientes2_fk ON patologias_por_pacientes USING btree (patologia_id);


--
-- TOC entry 2100 (class 1259 OID 64579)
-- Name: patologias_por_pacientes_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX patologias_por_pacientes_fk ON patologias_por_pacientes USING btree (paciente_id);


--
-- TOC entry 2101 (class 1259 OID 64578)
-- Name: patologias_por_pacientes_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX patologias_por_pacientes_pk ON patologias_por_pacientes USING btree (paciente_id, patologia_id);


--
-- TOC entry 2106 (class 1259 OID 64593)
-- Name: promociones_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX promociones_pk ON promociones USING btree (promocion_id);


--
-- TOC entry 2129 (class 1259 OID 64654)
-- Name: r01_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX r01_fk ON usuarios USING btree (rol_id);


--
-- TOC entry 2052 (class 1259 OID 64443)
-- Name: r06_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX r06_fk ON direcciones USING btree (medico_id);


--
-- TOC entry 2053 (class 1259 OID 64444)
-- Name: r07_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX r07_fk ON direcciones USING btree (municipio_id);


--
-- TOC entry 2088 (class 1259 OID 64529)
-- Name: r08_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX r08_fk ON municipios USING btree (departamento_id);


--
-- TOC entry 2038 (class 1259 OID 64408)
-- Name: r09_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX r09_fk ON consultas USING btree (paciente_id);


--
-- TOC entry 2064 (class 1259 OID 64470)
-- Name: r10_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX r10_fk ON imagenes USING btree (paciente_id);


--
-- TOC entry 2029 (class 1259 OID 64378)
-- Name: r14_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX r14_fk ON citas USING btree (clinica_id);


--
-- TOC entry 2054 (class 1259 OID 64445)
-- Name: r16_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX r16_fk ON direcciones USING btree (clinica_id);


--
-- TOC entry 2030 (class 1259 OID 64379)
-- Name: r17_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX r17_fk ON citas USING btree (usuario_usuario);


--
-- TOC entry 2031 (class 1259 OID 64380)
-- Name: r18_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX r18_fk ON citas USING btree (medico_id);


--
-- TOC entry 2039 (class 1259 OID 64409)
-- Name: r19_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX r19_fk ON consultas USING btree (promocion_id);


--
-- TOC entry 2047 (class 1259 OID 64432)
-- Name: r21_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX r21_fk ON detalles_consultas USING btree (tratamiento_id);


--
-- TOC entry 2068 (class 1259 OID 64480)
-- Name: r23_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX r23_fk ON insumos USING btree (unidadmedida_id);


--
-- TOC entry 2059 (class 1259 OID 64456)
-- Name: r24_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX r24_fk ON existencias USING btree (insumo_id);


--
-- TOC entry 2060 (class 1259 OID 64457)
-- Name: r25_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX r25_fk ON existencias USING btree (clinica_id);


--
-- TOC entry 2084 (class 1259 OID 64519)
-- Name: r26_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX r26_fk ON movimientos USING btree (existencia_id);


--
-- TOC entry 2055 (class 1259 OID 64446)
-- Name: r27_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX r27_fk ON direcciones USING btree (paciente_id);


--
-- TOC entry 2040 (class 1259 OID 64410)
-- Name: r28_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX r28_fk ON consultas USING btree (medico_id);


--
-- TOC entry 2069 (class 1259 OID 64481)
-- Name: r29_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX r29_fk ON insumos USING btree (tipoinsumo_id);


--
-- TOC entry 2092 (class 1259 OID 64539)
-- Name: r30_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX r30_fk ON odontogramas USING btree (paciente_id);


--
-- TOC entry 2048 (class 1259 OID 64433)
-- Name: r31_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX r31_fk ON detalles_consultas USING btree (paciente_id);


--
-- TOC entry 2109 (class 1259 OID 64602)
-- Name: roles_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX roles_pk ON roles USING btree (rol_id);


--
-- TOC entry 2115 (class 1259 OID 64620)
-- Name: sub_menus_por_roles2_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sub_menus_por_roles2_fk ON sub_menus_por_roles USING btree (submenu_id);


--
-- TOC entry 2116 (class 1259 OID 64619)
-- Name: sub_menus_por_roles_fk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE INDEX sub_menus_por_roles_fk ON sub_menus_por_roles USING btree (rol_id);


--
-- TOC entry 2117 (class 1259 OID 64618)
-- Name: sub_menus_por_roles_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX sub_menus_por_roles_pk ON sub_menus_por_roles USING btree (rol_id, submenu_id);


--
-- TOC entry 2112 (class 1259 OID 64611)
-- Name: submenus_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX submenus_pk ON submenus USING btree (submenu_id);


--
-- TOC entry 2120 (class 1259 OID 64629)
-- Name: tipos_insumos_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX tipos_insumos_pk ON tipos_insumos USING btree (tipoinsumo_id);


--
-- TOC entry 2123 (class 1259 OID 64638)
-- Name: tratamientos_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX tratamientos_pk ON tratamientos USING btree (tratamiento_id);


--
-- TOC entry 2126 (class 1259 OID 64647)
-- Name: unidades_medidas_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX unidades_medidas_pk ON unidades_medidas USING btree (unidadmedida_id);


--
-- TOC entry 2130 (class 1259 OID 64653)
-- Name: usuarios_pk; Type: INDEX; Schema: public; Owner: postgres; Tablespace: 
--

CREATE UNIQUE INDEX usuarios_pk ON usuarios USING btree (usuario_usuario);


--
-- TOC entry 2170 (class 2606 OID 79945)
-- Name: f_privilegios_por_rol; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY privilegios_por_roles
    ADD CONSTRAINT f_privilegios_por_rol FOREIGN KEY (roles_id) REFERENCES roles(rol_id);


--
-- TOC entry 2169 (class 2606 OID 79935)
-- Name: f_privilegios_submenu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY privilegios
    ADD CONSTRAINT f_privilegios_submenu FOREIGN KEY (submenu_id) REFERENCES submenus(submenu_id);


--
-- TOC entry 2171 (class 2606 OID 79950)
-- Name: f_privlegios_por_accion; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY privilegios_por_roles
    ADD CONSTRAINT f_privlegios_por_accion FOREIGN KEY (privilegios_id, submenu_id) REFERENCES privilegios(privilegio_id, submenu_id);


--
-- TOC entry 2140 (class 2606 OID 64655)
-- Name: fk_citas_r14_clinicas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY citas
    ADD CONSTRAINT fk_citas_r14_clinicas FOREIGN KEY (clinica_id) REFERENCES clinicas(clinica_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2141 (class 2606 OID 64660)
-- Name: fk_citas_r17_usuarios; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY citas
    ADD CONSTRAINT fk_citas_r17_usuarios FOREIGN KEY (usuario_usuario) REFERENCES usuarios(usuario_usuario) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2142 (class 2606 OID 64665)
-- Name: fk_citas_r18_medicos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY citas
    ADD CONSTRAINT fk_citas_r18_medicos FOREIGN KEY (medico_id) REFERENCES medicos(medico_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2143 (class 2606 OID 64670)
-- Name: fk_consulta_r09_paciente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY consultas
    ADD CONSTRAINT fk_consulta_r09_paciente FOREIGN KEY (paciente_id) REFERENCES pacientes(paciente_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2144 (class 2606 OID 64675)
-- Name: fk_consulta_r19_promocio; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY consultas
    ADD CONSTRAINT fk_consulta_r19_promocio FOREIGN KEY (promocion_id) REFERENCES promociones(promocion_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2145 (class 2606 OID 64680)
-- Name: fk_consulta_r28_medicos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY consultas
    ADD CONSTRAINT fk_consulta_r28_medicos FOREIGN KEY (medico_id) REFERENCES medicos(medico_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2146 (class 2606 OID 64685)
-- Name: fk_detalles_r21_tratamie; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detalles_consultas
    ADD CONSTRAINT fk_detalles_r21_tratamie FOREIGN KEY (tratamiento_id) REFERENCES tratamientos(tratamiento_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2147 (class 2606 OID 64690)
-- Name: fk_detalles_r31_paciente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY detalles_consultas
    ADD CONSTRAINT fk_detalles_r31_paciente FOREIGN KEY (paciente_id) REFERENCES pacientes(paciente_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2148 (class 2606 OID 64695)
-- Name: fk_direccio_r06_medicos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY direcciones
    ADD CONSTRAINT fk_direccio_r06_medicos FOREIGN KEY (medico_id) REFERENCES medicos(medico_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2149 (class 2606 OID 64700)
-- Name: fk_direccio_r07_municipi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY direcciones
    ADD CONSTRAINT fk_direccio_r07_municipi FOREIGN KEY (municipio_id) REFERENCES municipios(municipio_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2150 (class 2606 OID 64705)
-- Name: fk_direccio_r16_clinicas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY direcciones
    ADD CONSTRAINT fk_direccio_r16_clinicas FOREIGN KEY (clinica_id) REFERENCES clinicas(clinica_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2151 (class 2606 OID 64710)
-- Name: fk_direccio_r27_paciente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY direcciones
    ADD CONSTRAINT fk_direccio_r27_paciente FOREIGN KEY (paciente_id) REFERENCES pacientes(paciente_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2152 (class 2606 OID 64715)
-- Name: fk_existenc_r24_insumos; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY existencias
    ADD CONSTRAINT fk_existenc_r24_insumos FOREIGN KEY (insumo_id) REFERENCES insumos(insumo_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2153 (class 2606 OID 64720)
-- Name: fk_existenc_r25_clinicas; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY existencias
    ADD CONSTRAINT fk_existenc_r25_clinicas FOREIGN KEY (clinica_id) REFERENCES clinicas(clinica_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2154 (class 2606 OID 64725)
-- Name: fk_imagenes_r10_paciente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY imagenes
    ADD CONSTRAINT fk_imagenes_r10_paciente FOREIGN KEY (paciente_id) REFERENCES pacientes(paciente_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2155 (class 2606 OID 64730)
-- Name: fk_insumos_r23_unidades; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY insumos
    ADD CONSTRAINT fk_insumos_r23_unidades FOREIGN KEY (unidadmedida_id) REFERENCES unidades_medidas(unidadmedida_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2156 (class 2606 OID 64735)
-- Name: fk_insumos_r29_tipos_in; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY insumos
    ADD CONSTRAINT fk_insumos_r29_tipos_in FOREIGN KEY (tipoinsumo_id) REFERENCES tipos_insumos(tipoinsumo_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2158 (class 2606 OID 64750)
-- Name: fk_menus_po_menus_por_menus; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY menus_por_roles
    ADD CONSTRAINT fk_menus_po_menus_por_menus FOREIGN KEY (menu_id) REFERENCES menus(menu_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2157 (class 2606 OID 64745)
-- Name: fk_menus_po_menus_por_roles; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY menus_por_roles
    ADD CONSTRAINT fk_menus_po_menus_por_roles FOREIGN KEY (rol_id) REFERENCES roles(rol_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2159 (class 2606 OID 64755)
-- Name: fk_movimien_r26_existenc; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY movimientos
    ADD CONSTRAINT fk_movimien_r26_existenc FOREIGN KEY (existencia_id) REFERENCES existencias(existencia_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2160 (class 2606 OID 64760)
-- Name: fk_municipi_r08_departam; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY municipios
    ADD CONSTRAINT fk_municipi_r08_departam FOREIGN KEY (departamento_id) REFERENCES departamentos(departamento_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2161 (class 2606 OID 64765)
-- Name: fk_odontogr_r30_paciente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY odontogramas
    ADD CONSTRAINT fk_odontogr_r30_paciente FOREIGN KEY (paciente_id) REFERENCES pacientes(paciente_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2162 (class 2606 OID 64770)
-- Name: fk_patologi_patologia_paciente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY patologias_por_pacientes
    ADD CONSTRAINT fk_patologi_patologia_paciente FOREIGN KEY (paciente_id) REFERENCES pacientes(paciente_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2163 (class 2606 OID 64775)
-- Name: fk_patologi_patologia_patologi; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY patologias_por_pacientes
    ADD CONSTRAINT fk_patologi_patologia_patologi FOREIGN KEY (patologia_id) REFERENCES patologias(patologia_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2164 (class 2606 OID 79955)
-- Name: fk_roles_dashboard; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT fk_roles_dashboard FOREIGN KEY (dashboard_id) REFERENCES dashboard(dashboard_id);


--
-- TOC entry 2166 (class 2606 OID 64785)
-- Name: fk_sub_menu_sub_menus_roles; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sub_menus_por_roles
    ADD CONSTRAINT fk_sub_menu_sub_menus_roles FOREIGN KEY (rol_id) REFERENCES roles(rol_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2167 (class 2606 OID 64790)
-- Name: fk_sub_menu_sub_menus_submenus; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY sub_menus_por_roles
    ADD CONSTRAINT fk_sub_menu_sub_menus_submenus FOREIGN KEY (submenu_id) REFERENCES submenus(submenu_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2165 (class 2606 OID 71707)
-- Name: fk_submenus_menu; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY submenus
    ADD CONSTRAINT fk_submenus_menu FOREIGN KEY (menu_id) REFERENCES menus(menu_id);


--
-- TOC entry 2168 (class 2606 OID 64795)
-- Name: fk_usuarios_r01_roles; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usuarios
    ADD CONSTRAINT fk_usuarios_r01_roles FOREIGN KEY (rol_id) REFERENCES roles(rol_id) ON UPDATE RESTRICT ON DELETE RESTRICT;


--
-- TOC entry 2341 (class 0 OID 0)
-- Dependencies: 6
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2019-02-13 16:34:36

--
-- PostgreSQL database dump complete
--

