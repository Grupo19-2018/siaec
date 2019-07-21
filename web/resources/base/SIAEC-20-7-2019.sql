PGDMP         ;                w            siaec    9.3.23    9.5.5 !   #	           0    0    ENCODING    ENCODING        SET client_encoding = 'UTF8';
                       false            $	           0    0 
   STDSTRINGS 
   STDSTRINGS     (   SET standard_conforming_strings = 'on';
                       false            %	           1262    34287    siaec    DATABASE     �   CREATE DATABASE siaec WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Spanish_El Salvador.1252' LC_CTYPE = 'Spanish_El Salvador.1252';
    DROP DATABASE siaec;
             postgres    false                        2615    2200    public    SCHEMA        CREATE SCHEMA public;
    DROP SCHEMA public;
             postgres    false            &	           0    0    SCHEMA public    COMMENT     6   COMMENT ON SCHEMA public IS 'standard public schema';
                  postgres    false    7            '	           0    0    public    ACL     �   REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;
                  postgres    false    7                        3079    11750    plpgsql 	   EXTENSION     ?   CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;
    DROP EXTENSION plpgsql;
                  false            (	           0    0    EXTENSION plpgsql    COMMENT     @   COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';
                       false    1            �            1259    34288    bitacora    TABLE     �   CREATE TABLE bitacora (
    bitacora_id integer NOT NULL,
    bitacora_fecha_hora timestamp without time zone,
    bitacora_usuario character varying(50),
    bitacora_transaccion character varying(100)
);
    DROP TABLE public.bitacora;
       public         postgres    false    7            �            1259    34291    bitacora_bitacora_id_seq    SEQUENCE     z   CREATE SEQUENCE bitacora_bitacora_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 /   DROP SEQUENCE public.bitacora_bitacora_id_seq;
       public       postgres    false    7    171            )	           0    0    bitacora_bitacora_id_seq    SEQUENCE OWNED BY     G   ALTER SEQUENCE bitacora_bitacora_id_seq OWNED BY bitacora.bitacora_id;
            public       postgres    false    172            �            1259    34293    citas    TABLE       CREATE TABLE citas (
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
    DROP TABLE public.citas;
       public         postgres    false    7            �            1259    34296    citas_cita_id_seq    SEQUENCE     s   CREATE SEQUENCE citas_cita_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.citas_cita_id_seq;
       public       postgres    false    7    173            *	           0    0    citas_cita_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE citas_cita_id_seq OWNED BY citas.cita_id;
            public       postgres    false    174            �            1259    34298    clinicas    TABLE     D  CREATE TABLE clinicas (
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
    DROP TABLE public.clinicas;
       public         postgres    false    7            �            1259    34301    clinicas_clinica_id_seq    SEQUENCE     y   CREATE SEQUENCE clinicas_clinica_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.clinicas_clinica_id_seq;
       public       postgres    false    7    175            +	           0    0    clinicas_clinica_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE clinicas_clinica_id_seq OWNED BY clinicas.clinica_id;
            public       postgres    false    176            �            1259    34303    configuraciones    TABLE       CREATE TABLE configuraciones (
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
 #   DROP TABLE public.configuraciones;
       public         postgres    false    7            �            1259    34309 $   configuraciones_configuracion_id_seq    SEQUENCE     �   CREATE SEQUENCE configuraciones_configuracion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.configuraciones_configuracion_id_seq;
       public       postgres    false    177    7            ,	           0    0 $   configuraciones_configuracion_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE configuraciones_configuracion_id_seq OWNED BY configuraciones.configuracion_id;
            public       postgres    false    178            �            1259    34311 	   consultas    TABLE       CREATE TABLE consultas (
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
    DROP TABLE public.consultas;
       public         postgres    false    7            �            1259    34317    consultas_consulta_id_seq    SEQUENCE     {   CREATE SEQUENCE consultas_consulta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.consultas_consulta_id_seq;
       public       postgres    false    7    179            -	           0    0    consultas_consulta_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE consultas_consulta_id_seq OWNED BY consultas.consulta_id;
            public       postgres    false    180            �            1259    34319    dashboard_dashboard_id_seq    SEQUENCE     |   CREATE SEQUENCE dashboard_dashboard_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 1   DROP SEQUENCE public.dashboard_dashboard_id_seq;
       public       postgres    false    7            �            1259    34321 	   dashboard    TABLE     +  CREATE TABLE dashboard (
    dashboard_id integer DEFAULT nextval('dashboard_dashboard_id_seq'::regclass) NOT NULL,
    dashboard_nombre character varying(50),
    dashboard_descripcion character varying(100),
    dashboard_url character varying(100),
    dashboard_imagen character varying(150)
);
    DROP TABLE public.dashboard;
       public         postgres    false    181    7            �            1259    34325    departamentos    TABLE     t   CREATE TABLE departamentos (
    departamento_id integer NOT NULL,
    departamento_nombre character varying(25)
);
 !   DROP TABLE public.departamentos;
       public         postgres    false    7            �            1259    34328 !   departamentos_departamento_id_seq    SEQUENCE     �   CREATE SEQUENCE departamentos_departamento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 8   DROP SEQUENCE public.departamentos_departamento_id_seq;
       public       postgres    false    183    7            .	           0    0 !   departamentos_departamento_id_seq    SEQUENCE OWNED BY     Y   ALTER SEQUENCE departamentos_departamento_id_seq OWNED BY departamentos.departamento_id;
            public       postgres    false    184            �            1259    34330    detalles_consultas    TABLE     �  CREATE TABLE detalles_consultas (
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
 &   DROP TABLE public.detalles_consultas;
       public         postgres    false    7            �            1259    34336 )   detalles_consultas_detalleconsulta_id_seq    SEQUENCE     �   CREATE SEQUENCE detalles_consultas_detalleconsulta_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 @   DROP SEQUENCE public.detalles_consultas_detalleconsulta_id_seq;
       public       postgres    false    185    7            /	           0    0 )   detalles_consultas_detalleconsulta_id_seq    SEQUENCE OWNED BY     i   ALTER SEQUENCE detalles_consultas_detalleconsulta_id_seq OWNED BY detalles_consultas.detalleconsulta_id;
            public       postgres    false    186            �            1259    34338    direcciones    TABLE     �  CREATE TABLE direcciones (
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
    DROP TABLE public.direcciones;
       public         postgres    false    7            �            1259    34341    direcciones_direccion_id_seq    SEQUENCE     ~   CREATE SEQUENCE direcciones_direccion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.direcciones_direccion_id_seq;
       public       postgres    false    7    187            0	           0    0    direcciones_direccion_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE direcciones_direccion_id_seq OWNED BY direcciones.direccion_id;
            public       postgres    false    188            �            1259    34343    existencias    TABLE     �   CREATE TABLE existencias (
    existencia_id integer NOT NULL,
    insumo_id integer NOT NULL,
    clinica_id integer NOT NULL,
    existencia_cantidad double precision
);
    DROP TABLE public.existencias;
       public         postgres    false    7            �            1259    34346    existencias_existencia_id_seq    SEQUENCE        CREATE SEQUENCE existencias_existencia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.existencias_existencia_id_seq;
       public       postgres    false    189    7            1	           0    0    existencias_existencia_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE existencias_existencia_id_seq OWNED BY existencias.existencia_id;
            public       postgres    false    190            �            1259    34348    imagenes    TABLE     E  CREATE TABLE imagenes (
    imagen_id integer NOT NULL,
    paciente_id integer NOT NULL,
    imagen_nombre character varying(75),
    imagen_anotacion character varying(250),
    imagen_imagen bytea,
    imagen_url character varying(300),
    imagen_fecha_creacion date,
    imagen_usuario_creacion character varying(50)
);
    DROP TABLE public.imagenes;
       public         postgres    false    7            �            1259    34354    imagenes_imagen_id_seq    SEQUENCE     x   CREATE SEQUENCE imagenes_imagen_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 -   DROP SEQUENCE public.imagenes_imagen_id_seq;
       public       postgres    false    7    191            2	           0    0    imagenes_imagen_id_seq    SEQUENCE OWNED BY     C   ALTER SEQUENCE imagenes_imagen_id_seq OWNED BY imagenes.imagen_id;
            public       postgres    false    192            �            1259    34356    insumos    TABLE     �  CREATE TABLE insumos (
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
    DROP TABLE public.insumos;
       public         postgres    false    7            �            1259    34359    insumos_insumo_id_seq    SEQUENCE     w   CREATE SEQUENCE insumos_insumo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.insumos_insumo_id_seq;
       public       postgres    false    7    193            3	           0    0    insumos_insumo_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE insumos_insumo_id_seq OWNED BY insumos.insumo_id;
            public       postgres    false    194            �            1259    34361    medicos    TABLE       CREATE TABLE medicos (
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
    DROP TABLE public.medicos;
       public         postgres    false    7            �            1259    34364    medicos_medico_id_seq    SEQUENCE     w   CREATE SEQUENCE medicos_medico_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ,   DROP SEQUENCE public.medicos_medico_id_seq;
       public       postgres    false    195    7            4	           0    0    medicos_medico_id_seq    SEQUENCE OWNED BY     A   ALTER SEQUENCE medicos_medico_id_seq OWNED BY medicos.medico_id;
            public       postgres    false    196            �            1259    34366    menus    TABLE     \   CREATE TABLE menus (
    menu_id integer NOT NULL,
    menu_nombre character varying(50)
);
    DROP TABLE public.menus;
       public         postgres    false    7            �            1259    34369    menus_menu_id_seq    SEQUENCE     s   CREATE SEQUENCE menus_menu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 (   DROP SEQUENCE public.menus_menu_id_seq;
       public       postgres    false    197    7            5	           0    0    menus_menu_id_seq    SEQUENCE OWNED BY     9   ALTER SEQUENCE menus_menu_id_seq OWNED BY menus.menu_id;
            public       postgres    false    198            �            1259    34371    menus_por_roles    TABLE     \   CREATE TABLE menus_por_roles (
    rol_id integer NOT NULL,
    menu_id integer NOT NULL
);
 #   DROP TABLE public.menus_por_roles;
       public         postgres    false    7            �            1259    34374    movimientos    TABLE       CREATE TABLE movimientos (
    movimiento_id integer NOT NULL,
    existencia_id integer NOT NULL,
    movimiento_cantidad double precision,
    movimiento_tipo boolean,
    movimiento_fecha_creacion date,
    movimiento_usuario_creacion character varying(50)
);
    DROP TABLE public.movimientos;
       public         postgres    false    7            �            1259    34377    movimientos_movimiento_id_seq    SEQUENCE        CREATE SEQUENCE movimientos_movimiento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 4   DROP SEQUENCE public.movimientos_movimiento_id_seq;
       public       postgres    false    7    200            6	           0    0    movimientos_movimiento_id_seq    SEQUENCE OWNED BY     Q   ALTER SEQUENCE movimientos_movimiento_id_seq OWNED BY movimientos.movimiento_id;
            public       postgres    false    201            �            1259    34379 
   municipios    TABLE     �   CREATE TABLE municipios (
    municipio_id integer NOT NULL,
    departamento_id integer NOT NULL,
    municipio_nombre character varying(50)
);
    DROP TABLE public.municipios;
       public         postgres    false    7            �            1259    34382    municipios_municipio_id_seq    SEQUENCE     }   CREATE SEQUENCE municipios_municipio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.municipios_municipio_id_seq;
       public       postgres    false    7    202            7	           0    0    municipios_municipio_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE municipios_municipio_id_seq OWNED BY municipios.municipio_id;
            public       postgres    false    203            �            1259    34384    odontogramas    TABLE     �  CREATE TABLE odontogramas (
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
     DROP TABLE public.odontogramas;
       public         postgres    false    7            �            1259    34387    odontogramas_odontograma_id_seq    SEQUENCE     �   CREATE SEQUENCE odontogramas_odontograma_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.odontogramas_odontograma_id_seq;
       public       postgres    false    204    7            8	           0    0    odontogramas_odontograma_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE odontogramas_odontograma_id_seq OWNED BY odontogramas.odontograma_id;
            public       postgres    false    205            �            1259    34389 	   pacientes    TABLE     �  CREATE TABLE pacientes (
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
    DROP TABLE public.pacientes;
       public         postgres    false    7            �            1259    34395    pacientes_paciente_id_seq    SEQUENCE     {   CREATE SEQUENCE pacientes_paciente_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 0   DROP SEQUENCE public.pacientes_paciente_id_seq;
       public       postgres    false    7    206            9	           0    0    pacientes_paciente_id_seq    SEQUENCE OWNED BY     I   ALTER SEQUENCE pacientes_paciente_id_seq OWNED BY pacientes.paciente_id;
            public       postgres    false    207            �            1259    34397 
   patologias    TABLE     B  CREATE TABLE patologias (
    patologia_id integer NOT NULL,
    patologia_nombre character varying(50),
    patologia_estado boolean,
    patologia_fecha_creacion date,
    patologia_usuario_creacion character varying(50),
    patologia_fecha_modificacion date,
    patologia_usuario_modificacio character varying(50)
);
    DROP TABLE public.patologias;
       public         postgres    false    7            �            1259    34400    patologias_patologia_id_seq    SEQUENCE     }   CREATE SEQUENCE patologias_patologia_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 2   DROP SEQUENCE public.patologias_patologia_id_seq;
       public       postgres    false    7    208            :	           0    0    patologias_patologia_id_seq    SEQUENCE OWNED BY     M   ALTER SEQUENCE patologias_patologia_id_seq OWNED BY patologias.patologia_id;
            public       postgres    false    209            �            1259    34402    patologias_por_pacientes    TABLE     o   CREATE TABLE patologias_por_pacientes (
    paciente_id integer NOT NULL,
    patologia_id integer NOT NULL
);
 ,   DROP TABLE public.patologias_por_pacientes;
       public         postgres    false    7            �            1259    34405    privilegios    TABLE     �   CREATE TABLE privilegios (
    privilegio_id integer NOT NULL,
    submenu_id integer NOT NULL,
    privilegio_accion character varying(50)
);
    DROP TABLE public.privilegios;
       public         postgres    false    7            �            1259    34408    privilegios_por_roles    TABLE     �   CREATE TABLE privilegios_por_roles (
    privilegios_id integer NOT NULL,
    submenu_id integer NOT NULL,
    roles_id integer NOT NULL
);
 )   DROP TABLE public.privilegios_por_roles;
       public         postgres    false    7            �            1259    34411    promociones    TABLE     �  CREATE TABLE promociones (
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
    DROP TABLE public.promociones;
       public         postgres    false    7            �            1259    34417    promociones_promocion_id_seq    SEQUENCE     ~   CREATE SEQUENCE promociones_promocion_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 3   DROP SEQUENCE public.promociones_promocion_id_seq;
       public       postgres    false    213    7            ;	           0    0    promociones_promocion_id_seq    SEQUENCE OWNED BY     O   ALTER SEQUENCE promociones_promocion_id_seq OWNED BY promociones.promocion_id;
            public       postgres    false    214            �            1259    34419    roles    TABLE     x  CREATE TABLE roles (
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
    DROP TABLE public.roles;
       public         postgres    false    7            �            1259    34422    roles_rol_id_seq    SEQUENCE     r   CREATE SEQUENCE roles_rol_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 '   DROP SEQUENCE public.roles_rol_id_seq;
       public       postgres    false    7    215            <	           0    0    roles_rol_id_seq    SEQUENCE OWNED BY     7   ALTER SEQUENCE roles_rol_id_seq OWNED BY roles.rol_id;
            public       postgres    false    216            �            1259    34424    sub_menus_por_roles    TABLE     c   CREATE TABLE sub_menus_por_roles (
    rol_id integer NOT NULL,
    submenu_id integer NOT NULL
);
 '   DROP TABLE public.sub_menus_por_roles;
       public         postgres    false    7            �            1259    34427    submenus    TABLE     �   CREATE TABLE submenus (
    submenu_id integer NOT NULL,
    sumbenu_nombre character varying(50),
    menu_id integer,
    submenu_descripcion character varying(250),
    submenu_url character varying(100)
);
    DROP TABLE public.submenus;
       public         postgres    false    7            �            1259    34430    submenus_submenu_id_seq    SEQUENCE     y   CREATE SEQUENCE submenus_submenu_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 .   DROP SEQUENCE public.submenus_submenu_id_seq;
       public       postgres    false    7    218            =	           0    0    submenus_submenu_id_seq    SEQUENCE OWNED BY     E   ALTER SEQUENCE submenus_submenu_id_seq OWNED BY submenus.submenu_id;
            public       postgres    false    219            �            1259    34432    tipos_insumos    TABLE     �   CREATE TABLE tipos_insumos (
    tipoinsumo_id integer NOT NULL,
    tipoinsumo_nombre character varying(50),
    tipoinsumo_descripcion character varying(250),
    tipoinsumo_estado boolean
);
 !   DROP TABLE public.tipos_insumos;
       public         postgres    false    7            �            1259    34435    tipos_insumos_tipoinsumo_id_seq    SEQUENCE     �   CREATE SEQUENCE tipos_insumos_tipoinsumo_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.tipos_insumos_tipoinsumo_id_seq;
       public       postgres    false    7    220            >	           0    0    tipos_insumos_tipoinsumo_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE tipos_insumos_tipoinsumo_id_seq OWNED BY tipos_insumos.tipoinsumo_id;
            public       postgres    false    221            �            1259    34437    tratamientos    TABLE     �  CREATE TABLE tratamientos (
    tratamiento_id integer NOT NULL,
    tratamiento_nombre character varying(100),
    tratamiento_descripcion character varying(250),
    tratamiento_estado boolean,
    tratamiento_fecha_creacion date,
    tratamiento_usuario_creacion character varying(50),
    tratamiento_fecha_modificacion date,
    tratamiento_usuario_modificacio character varying(50)
);
     DROP TABLE public.tratamientos;
       public         postgres    false    7            �            1259    34440    tratamientos_tratamiento_id_seq    SEQUENCE     �   CREATE SEQUENCE tratamientos_tratamiento_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 6   DROP SEQUENCE public.tratamientos_tratamiento_id_seq;
       public       postgres    false    7    222            ?	           0    0    tratamientos_tratamiento_id_seq    SEQUENCE OWNED BY     U   ALTER SEQUENCE tratamientos_tratamiento_id_seq OWNED BY tratamientos.tratamiento_id;
            public       postgres    false    223            �            1259    34442    unidades_medidas    TABLE     �   CREATE TABLE unidades_medidas (
    unidadmedida_id integer NOT NULL,
    unidadmedida_nombre character varying(50),
    unidadmedida_abreviatura character varying(10),
    unidadmedida_estado boolean
);
 $   DROP TABLE public.unidades_medidas;
       public         postgres    false    7            �            1259    34445 $   unidades_medidas_unidadmedida_id_seq    SEQUENCE     �   CREATE SEQUENCE unidades_medidas_unidadmedida_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;
 ;   DROP SEQUENCE public.unidades_medidas_unidadmedida_id_seq;
       public       postgres    false    224    7            @	           0    0 $   unidades_medidas_unidadmedida_id_seq    SEQUENCE OWNED BY     _   ALTER SEQUENCE unidades_medidas_unidadmedida_id_seq OWNED BY unidades_medidas.unidadmedida_id;
            public       postgres    false    225            �            1259    34447    usuarios    TABLE     "  CREATE TABLE usuarios (
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
    DROP TABLE public.usuarios;
       public         postgres    false    7            �           2604    34450    bitacora_id    DEFAULT     n   ALTER TABLE ONLY bitacora ALTER COLUMN bitacora_id SET DEFAULT nextval('bitacora_bitacora_id_seq'::regclass);
 C   ALTER TABLE public.bitacora ALTER COLUMN bitacora_id DROP DEFAULT;
       public       postgres    false    172    171            �           2604    34451    cita_id    DEFAULT     `   ALTER TABLE ONLY citas ALTER COLUMN cita_id SET DEFAULT nextval('citas_cita_id_seq'::regclass);
 <   ALTER TABLE public.citas ALTER COLUMN cita_id DROP DEFAULT;
       public       postgres    false    174    173            �           2604    34452 
   clinica_id    DEFAULT     l   ALTER TABLE ONLY clinicas ALTER COLUMN clinica_id SET DEFAULT nextval('clinicas_clinica_id_seq'::regclass);
 B   ALTER TABLE public.clinicas ALTER COLUMN clinica_id DROP DEFAULT;
       public       postgres    false    176    175            �           2604    34453    configuracion_id    DEFAULT     �   ALTER TABLE ONLY configuraciones ALTER COLUMN configuracion_id SET DEFAULT nextval('configuraciones_configuracion_id_seq'::regclass);
 O   ALTER TABLE public.configuraciones ALTER COLUMN configuracion_id DROP DEFAULT;
       public       postgres    false    178    177            �           2604    34454    consulta_id    DEFAULT     p   ALTER TABLE ONLY consultas ALTER COLUMN consulta_id SET DEFAULT nextval('consultas_consulta_id_seq'::regclass);
 D   ALTER TABLE public.consultas ALTER COLUMN consulta_id DROP DEFAULT;
       public       postgres    false    180    179            �           2604    34455    departamento_id    DEFAULT     �   ALTER TABLE ONLY departamentos ALTER COLUMN departamento_id SET DEFAULT nextval('departamentos_departamento_id_seq'::regclass);
 L   ALTER TABLE public.departamentos ALTER COLUMN departamento_id DROP DEFAULT;
       public       postgres    false    184    183            �           2604    34456    detalleconsulta_id    DEFAULT     �   ALTER TABLE ONLY detalles_consultas ALTER COLUMN detalleconsulta_id SET DEFAULT nextval('detalles_consultas_detalleconsulta_id_seq'::regclass);
 T   ALTER TABLE public.detalles_consultas ALTER COLUMN detalleconsulta_id DROP DEFAULT;
       public       postgres    false    186    185            �           2604    34457    direccion_id    DEFAULT     v   ALTER TABLE ONLY direcciones ALTER COLUMN direccion_id SET DEFAULT nextval('direcciones_direccion_id_seq'::regclass);
 G   ALTER TABLE public.direcciones ALTER COLUMN direccion_id DROP DEFAULT;
       public       postgres    false    188    187            �           2604    34458    existencia_id    DEFAULT     x   ALTER TABLE ONLY existencias ALTER COLUMN existencia_id SET DEFAULT nextval('existencias_existencia_id_seq'::regclass);
 H   ALTER TABLE public.existencias ALTER COLUMN existencia_id DROP DEFAULT;
       public       postgres    false    190    189            �           2604    34459 	   imagen_id    DEFAULT     j   ALTER TABLE ONLY imagenes ALTER COLUMN imagen_id SET DEFAULT nextval('imagenes_imagen_id_seq'::regclass);
 A   ALTER TABLE public.imagenes ALTER COLUMN imagen_id DROP DEFAULT;
       public       postgres    false    192    191            �           2604    34460 	   insumo_id    DEFAULT     h   ALTER TABLE ONLY insumos ALTER COLUMN insumo_id SET DEFAULT nextval('insumos_insumo_id_seq'::regclass);
 @   ALTER TABLE public.insumos ALTER COLUMN insumo_id DROP DEFAULT;
       public       postgres    false    194    193            �           2604    34461 	   medico_id    DEFAULT     h   ALTER TABLE ONLY medicos ALTER COLUMN medico_id SET DEFAULT nextval('medicos_medico_id_seq'::regclass);
 @   ALTER TABLE public.medicos ALTER COLUMN medico_id DROP DEFAULT;
       public       postgres    false    196    195            �           2604    34462    menu_id    DEFAULT     `   ALTER TABLE ONLY menus ALTER COLUMN menu_id SET DEFAULT nextval('menus_menu_id_seq'::regclass);
 <   ALTER TABLE public.menus ALTER COLUMN menu_id DROP DEFAULT;
       public       postgres    false    198    197            �           2604    34463    movimiento_id    DEFAULT     x   ALTER TABLE ONLY movimientos ALTER COLUMN movimiento_id SET DEFAULT nextval('movimientos_movimiento_id_seq'::regclass);
 H   ALTER TABLE public.movimientos ALTER COLUMN movimiento_id DROP DEFAULT;
       public       postgres    false    201    200            �           2604    34464    municipio_id    DEFAULT     t   ALTER TABLE ONLY municipios ALTER COLUMN municipio_id SET DEFAULT nextval('municipios_municipio_id_seq'::regclass);
 F   ALTER TABLE public.municipios ALTER COLUMN municipio_id DROP DEFAULT;
       public       postgres    false    203    202            �           2604    34465    odontograma_id    DEFAULT     |   ALTER TABLE ONLY odontogramas ALTER COLUMN odontograma_id SET DEFAULT nextval('odontogramas_odontograma_id_seq'::regclass);
 J   ALTER TABLE public.odontogramas ALTER COLUMN odontograma_id DROP DEFAULT;
       public       postgres    false    205    204            �           2604    34466    paciente_id    DEFAULT     p   ALTER TABLE ONLY pacientes ALTER COLUMN paciente_id SET DEFAULT nextval('pacientes_paciente_id_seq'::regclass);
 D   ALTER TABLE public.pacientes ALTER COLUMN paciente_id DROP DEFAULT;
       public       postgres    false    207    206            �           2604    34467    patologia_id    DEFAULT     t   ALTER TABLE ONLY patologias ALTER COLUMN patologia_id SET DEFAULT nextval('patologias_patologia_id_seq'::regclass);
 F   ALTER TABLE public.patologias ALTER COLUMN patologia_id DROP DEFAULT;
       public       postgres    false    209    208            �           2604    34468    promocion_id    DEFAULT     v   ALTER TABLE ONLY promociones ALTER COLUMN promocion_id SET DEFAULT nextval('promociones_promocion_id_seq'::regclass);
 G   ALTER TABLE public.promociones ALTER COLUMN promocion_id DROP DEFAULT;
       public       postgres    false    214    213            �           2604    34469    rol_id    DEFAULT     ^   ALTER TABLE ONLY roles ALTER COLUMN rol_id SET DEFAULT nextval('roles_rol_id_seq'::regclass);
 ;   ALTER TABLE public.roles ALTER COLUMN rol_id DROP DEFAULT;
       public       postgres    false    216    215            �           2604    34470 
   submenu_id    DEFAULT     l   ALTER TABLE ONLY submenus ALTER COLUMN submenu_id SET DEFAULT nextval('submenus_submenu_id_seq'::regclass);
 B   ALTER TABLE public.submenus ALTER COLUMN submenu_id DROP DEFAULT;
       public       postgres    false    219    218            �           2604    34471    tipoinsumo_id    DEFAULT     |   ALTER TABLE ONLY tipos_insumos ALTER COLUMN tipoinsumo_id SET DEFAULT nextval('tipos_insumos_tipoinsumo_id_seq'::regclass);
 J   ALTER TABLE public.tipos_insumos ALTER COLUMN tipoinsumo_id DROP DEFAULT;
       public       postgres    false    221    220            �           2604    34472    tratamiento_id    DEFAULT     |   ALTER TABLE ONLY tratamientos ALTER COLUMN tratamiento_id SET DEFAULT nextval('tratamientos_tratamiento_id_seq'::regclass);
 J   ALTER TABLE public.tratamientos ALTER COLUMN tratamiento_id DROP DEFAULT;
       public       postgres    false    223    222            �           2604    34473    unidadmedida_id    DEFAULT     �   ALTER TABLE ONLY unidades_medidas ALTER COLUMN unidadmedida_id SET DEFAULT nextval('unidades_medidas_unidadmedida_id_seq'::regclass);
 O   ALTER TABLE public.unidades_medidas ALTER COLUMN unidadmedida_id DROP DEFAULT;
       public       postgres    false    225    224            �          0    34288    bitacora 
   TABLE DATA               e   COPY bitacora (bitacora_id, bitacora_fecha_hora, bitacora_usuario, bitacora_transaccion) FROM stdin;
    public       postgres    false    171   �t      A	           0    0    bitacora_bitacora_id_seq    SEQUENCE SET     @   SELECT pg_catalog.setval('bitacora_bitacora_id_seq', 32, true);
            public       postgres    false    172            �          0    34293    citas 
   TABLE DATA                 COPY citas (cita_id, clinica_id, medico_id, usuario_usuario, cita_fecha, cita_hora, cita_motivo, cita_fecha_creacion, cita_hora_creacion, cita_estado, cita_usuario_creacion, cita_fecha_modificacion, cita_usuario_modificacion, cita_ensala, paciente_id) FROM stdin;
    public       postgres    false    173   ~v      B	           0    0    citas_cita_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('citas_cita_id_seq', 28, true);
            public       postgres    false    174            �          0    34298    clinicas 
   TABLE DATA               4  COPY clinicas (clinica_id, clinica_nombre, clinica_correo, clinica_telefono_fijo, clinica_telefono_movil, clinica_modulo, clinica_horario_apertura, clinica_horario_cierre, clinica_estado, clinica_fecha_creacion, clinica_usuario_creacion, clinica_fecha_modificacion, clinica_usuario_modificacion) FROM stdin;
    public       postgres    false    175   �x      C	           0    0    clinicas_clinica_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('clinicas_clinica_id_seq', 2, true);
            public       postgres    false    176            �          0    34303    configuraciones 
   TABLE DATA               �  COPY configuraciones (configuracion_id, configuracion_tiempo_sesion, configuracion_correo_host, configuracion_correo_port, configuracion_correo_requerido, configuracion_correo_encryptacion, configuracion_correo_cuenta, configuracion_correo_contrasenya, configuracion_correo_ilimitada, configuracion_correo_mes, configuracion_correo_dia, configuracion_correo_enviado_mes, configuracion_correo_enviado_dia, configuracion_correo_activo, configuracion_titulo, configuracion_mensaje, configuracion_imagen_superior, configuracion_imagen_inferior, configuracion_imagen_login, configuracion_promocion_cumpleanyos, configuracion_promocion_general) FROM stdin;
    public       postgres    false    177   �y      D	           0    0 $   configuraciones_configuracion_id_seq    SEQUENCE SET     K   SELECT pg_catalog.setval('configuraciones_configuracion_id_seq', 1, true);
            public       postgres    false    178            �          0    34311 	   consultas 
   TABLE DATA                 COPY consultas (consulta_id, promocion_id, paciente_id, medico_id, consulta_motivo, consulta_diagnostico, consulta_receta, consulta_nota, consulta_fecha_creacion, consulta_usuario_creacion, consulta_fecha_modificacion, consulta_usuario_modificacion) FROM stdin;
    public       postgres    false    179   �z      E	           0    0    consultas_consulta_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('consultas_consulta_id_seq', 22, true);
            public       postgres    false    180            �          0    34321 	   dashboard 
   TABLE DATA               t   COPY dashboard (dashboard_id, dashboard_nombre, dashboard_descripcion, dashboard_url, dashboard_imagen) FROM stdin;
    public       postgres    false    182   �~      F	           0    0    dashboard_dashboard_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('dashboard_dashboard_id_seq', 1, true);
            public       postgres    false    181            �          0    34325    departamentos 
   TABLE DATA               F   COPY departamentos (departamento_id, departamento_nombre) FROM stdin;
    public       postgres    false    183   -�      G	           0    0 !   departamentos_departamento_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('departamentos_departamento_id_seq', 1, false);
            public       postgres    false    184            �          0    34330    detalles_consultas 
   TABLE DATA               �   COPY detalles_consultas (detalleconsulta_id, tratamiento_id, paciente_id, detalleconsulta_pieza, detalleconsulta_tratamiento, detalleconsulta_cargo, detalleconsulta_abono, detalleconsulta_fecha_creacion, detalleconsulta_usuario_creacio) FROM stdin;
    public       postgres    false    185   ܀      H	           0    0 )   detalles_consultas_detalleconsulta_id_seq    SEQUENCE SET     Q   SELECT pg_catalog.setval('detalles_consultas_detalleconsulta_id_seq', 25, true);
            public       postgres    false    186            �          0    34338    direcciones 
   TABLE DATA               �   COPY direcciones (direccion_id, paciente_id, medico_id, clinica_id, municipio_id, direccion_colonia, direccion_calle, direccion_casa, direccion_pasaje, direccion_poligono, direccion_apartamento) FROM stdin;
    public       postgres    false    187   ؁      I	           0    0    direcciones_direccion_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('direcciones_direccion_id_seq', 58, true);
            public       postgres    false    188            �          0    34343    existencias 
   TABLE DATA               Y   COPY existencias (existencia_id, insumo_id, clinica_id, existencia_cantidad) FROM stdin;
    public       postgres    false    189   �      J	           0    0    existencias_existencia_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('existencias_existencia_id_seq', 20, true);
            public       postgres    false    190            �          0    34348    imagenes 
   TABLE DATA               �   COPY imagenes (imagen_id, paciente_id, imagen_nombre, imagen_anotacion, imagen_imagen, imagen_url, imagen_fecha_creacion, imagen_usuario_creacion) FROM stdin;
    public       postgres    false    191   ��      K	           0    0    imagenes_imagen_id_seq    SEQUENCE SET     >   SELECT pg_catalog.setval('imagenes_imagen_id_seq', 37, true);
            public       postgres    false    192            �          0    34356    insumos 
   TABLE DATA               �   COPY insumos (insumo_id, tipoinsumo_id, unidadmedida_id, insumo_nombre, insumo_descripcion, insumo_minimo, insumo_estado, insumo_fecha_creacion, insumo_usuario_creacion, insumo_fecha_modificacion, insumo_usuario_modificacion) FROM stdin;
    public       postgres    false    193   �      L	           0    0    insumos_insumo_id_seq    SEQUENCE SET     =   SELECT pg_catalog.setval('insumos_insumo_id_seq', 10, true);
            public       postgres    false    194            	          0    34361    medicos 
   TABLE DATA               �  COPY medicos (medico_id, medico_primer_nombre, medico_segundo_nombre, medico_primer_apellido, medico_segundo_apellido, medico_fecha_nacimiento, medico_sexo, medico_correo, medico_especialidad, medico_telefono_casa, medico_telefono_movil, medico_numero_acreditacion, medico_estado, medico_usuario, medico_fecha_creacion, medico_usuario_creacion, medico_fecha_modificacion, medico_usuario_modificacion) FROM stdin;
    public       postgres    false    195   �      M	           0    0    medicos_medico_id_seq    SEQUENCE SET     <   SELECT pg_catalog.setval('medicos_medico_id_seq', 4, true);
            public       postgres    false    196            	          0    34366    menus 
   TABLE DATA               .   COPY menus (menu_id, menu_nombre) FROM stdin;
    public       postgres    false    197   l�      N	           0    0    menus_menu_id_seq    SEQUENCE SET     9   SELECT pg_catalog.setval('menus_menu_id_seq', 1, false);
            public       postgres    false    198            	          0    34371    menus_por_roles 
   TABLE DATA               3   COPY menus_por_roles (rol_id, menu_id) FROM stdin;
    public       postgres    false    199   �      	          0    34374    movimientos 
   TABLE DATA               �   COPY movimientos (movimiento_id, existencia_id, movimiento_cantidad, movimiento_tipo, movimiento_fecha_creacion, movimiento_usuario_creacion) FROM stdin;
    public       postgres    false    200   :�      O	           0    0    movimientos_movimiento_id_seq    SEQUENCE SET     E   SELECT pg_catalog.setval('movimientos_movimiento_id_seq', 46, true);
            public       postgres    false    201            	          0    34379 
   municipios 
   TABLE DATA               N   COPY municipios (municipio_id, departamento_id, municipio_nombre) FROM stdin;
    public       postgres    false    202   ��      P	           0    0    municipios_municipio_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('municipios_municipio_id_seq', 1, false);
            public       postgres    false    203            
	          0    34384    odontogramas 
   TABLE DATA               �  COPY odontogramas (odontograma_id, paciente_id, odontograma_pieza, odontograma_cuadrante, odontograma_oclusal, odontograma_vestibular, odontograma_mesial, odontograma_distal, odontograma_lingual, odontograma_palatina, odontograma_extraccion, odontograma_ausente, odontograma_fractura, odontograma_protesis, odontograma_implante, odontograma_endodoncia, odontograma_raiz, odontograma_general, odontograma_endodoncia_reincide, odontograma_protesis_reincide) FROM stdin;
    public       postgres    false    204   1�      Q	           0    0    odontogramas_odontograma_id_seq    SEQUENCE SET     I   SELECT pg_catalog.setval('odontogramas_odontograma_id_seq', 2707, true);
            public       postgres    false    205            	          0    34389 	   pacientes 
   TABLE DATA               �  COPY pacientes (paciente_id, paciente_expediente, paciente_primer_nombre, paciente_segundo_nombre, paciente_primer_apellido, paciente_segundo_apellido, paciente_fecha_nacimiento, paciente_sexo, paciente_correo, paciente_trabajo, paciente_telefono_casa, paciente_telefono_movil, paciente_telefono_oficina, paciente_whatsapp, paciente_estado, paciente_antecedentes, paciente_recordatorio, paciente_fecha_seguimiento, paciente_responsable, paciente_fecha_creacion, paciente_usuario_creacion, paciente_fecha_modificacion, paciente_usuario_modificacion, paciente_notificar_correo, paciente_codigo, paciente_usuario_usuario, paciente_promocion_cumpleanyos, paciente_promocion_general) FROM stdin;
    public       postgres    false    206   ��      R	           0    0    pacientes_paciente_id_seq    SEQUENCE SET     A   SELECT pg_catalog.setval('pacientes_paciente_id_seq', 52, true);
            public       postgres    false    207            	          0    34397 
   patologias 
   TABLE DATA               �   COPY patologias (patologia_id, patologia_nombre, patologia_estado, patologia_fecha_creacion, patologia_usuario_creacion, patologia_fecha_modificacion, patologia_usuario_modificacio) FROM stdin;
    public       postgres    false    208   �      S	           0    0    patologias_patologia_id_seq    SEQUENCE SET     C   SELECT pg_catalog.setval('patologias_patologia_id_seq', 17, true);
            public       postgres    false    209            	          0    34402    patologias_por_pacientes 
   TABLE DATA               F   COPY patologias_por_pacientes (paciente_id, patologia_id) FROM stdin;
    public       postgres    false    210   ��      	          0    34405    privilegios 
   TABLE DATA               L   COPY privilegios (privilegio_id, submenu_id, privilegio_accion) FROM stdin;
    public       postgres    false    211   �      	          0    34408    privilegios_por_roles 
   TABLE DATA               N   COPY privilegios_por_roles (privilegios_id, submenu_id, roles_id) FROM stdin;
    public       postgres    false    212   ��      	          0    34411    promociones 
   TABLE DATA               �  COPY promociones (promocion_id, promocion_nombre, promocion_descripcion, promocion_inicio, promocion_fin, promocion_estado, promocion_tipo, promocion_imagen, promocion_imagen_nombre, promocion_imagen_url, promocion_mensaje, promocion_activa, promocion_fecha_creacion, promocion_usuario_creacion, promocion_fecha_modificacion, promocion_usuario_modificacion, promocion_correo_limitado_espera) FROM stdin;
    public       postgres    false    213   ��      T	           0    0    promociones_promocion_id_seq    SEQUENCE SET     D   SELECT pg_catalog.setval('promociones_promocion_id_seq', 10, true);
            public       postgres    false    214            	          0    34419    roles 
   TABLE DATA               �   COPY roles (rol_id, rol_nombre, rol_descripcion, rol_fecha_creacion, rol_usuario_creacion, rol_fecha_modificacion, rol_usuario_modificacion, dashboard_id, rol_alerta, rol_notificacion) FROM stdin;
    public       postgres    false    215   ��      U	           0    0    roles_rol_id_seq    SEQUENCE SET     8   SELECT pg_catalog.setval('roles_rol_id_seq', 1, false);
            public       postgres    false    216            	          0    34424    sub_menus_por_roles 
   TABLE DATA               :   COPY sub_menus_por_roles (rol_id, submenu_id) FROM stdin;
    public       postgres    false    217   ]�      	          0    34427    submenus 
   TABLE DATA               b   COPY submenus (submenu_id, sumbenu_nombre, menu_id, submenu_descripcion, submenu_url) FROM stdin;
    public       postgres    false    218   �      V	           0    0    submenus_submenu_id_seq    SEQUENCE SET     ?   SELECT pg_catalog.setval('submenus_submenu_id_seq', 1, false);
            public       postgres    false    219            	          0    34432    tipos_insumos 
   TABLE DATA               m   COPY tipos_insumos (tipoinsumo_id, tipoinsumo_nombre, tipoinsumo_descripcion, tipoinsumo_estado) FROM stdin;
    public       postgres    false    220   ��      W	           0    0    tipos_insumos_tipoinsumo_id_seq    SEQUENCE SET     F   SELECT pg_catalog.setval('tipos_insumos_tipoinsumo_id_seq', 2, true);
            public       postgres    false    221            	          0    34437    tratamientos 
   TABLE DATA               �   COPY tratamientos (tratamiento_id, tratamiento_nombre, tratamiento_descripcion, tratamiento_estado, tratamiento_fecha_creacion, tratamiento_usuario_creacion, tratamiento_fecha_modificacion, tratamiento_usuario_modificacio) FROM stdin;
    public       postgres    false    222   ��      X	           0    0    tratamientos_tratamiento_id_seq    SEQUENCE SET     G   SELECT pg_catalog.setval('tratamientos_tratamiento_id_seq', 10, true);
            public       postgres    false    223            	          0    34442    unidades_medidas 
   TABLE DATA               x   COPY unidades_medidas (unidadmedida_id, unidadmedida_nombre, unidadmedida_abreviatura, unidadmedida_estado) FROM stdin;
    public       postgres    false    224   ��      Y	           0    0 $   unidades_medidas_unidadmedida_id_seq    SEQUENCE SET     L   SELECT pg_catalog.setval('unidades_medidas_unidadmedida_id_seq', 10, true);
            public       postgres    false    225             	          0    34447    usuarios 
   TABLE DATA               �  COPY usuarios (usuario_usuario, rol_id, usuario_correo, usuario_telefono, usuario_contrasenia, usuario_estado, usuario_fecha_creacion, usuario_fecha_modificacion, usuario_bloqueado, usuario_intento_fallido, usuario_primer_nombre, usuario_segundo_nombre, usuario_primer_apellido, usuario_segundo_apellido, usuario_nombre, usuario_apellido, usuario_codigo, usuario_activacion, medico_id, paciente_id) FROM stdin;
    public       postgres    false    226   ]�      �           2606    34475    dashboard_pkey 
   CONSTRAINT     Y   ALTER TABLE ONLY dashboard
    ADD CONSTRAINT dashboard_pkey PRIMARY KEY (dashboard_id);
 B   ALTER TABLE ONLY public.dashboard DROP CONSTRAINT dashboard_pkey;
       public         postgres    false    182    182            �           2606    34477    pk_bitacora 
   CONSTRAINT     T   ALTER TABLE ONLY bitacora
    ADD CONSTRAINT pk_bitacora PRIMARY KEY (bitacora_id);
 >   ALTER TABLE ONLY public.bitacora DROP CONSTRAINT pk_bitacora;
       public         postgres    false    171    171            �           2606    34479    pk_citas 
   CONSTRAINT     J   ALTER TABLE ONLY citas
    ADD CONSTRAINT pk_citas PRIMARY KEY (cita_id);
 8   ALTER TABLE ONLY public.citas DROP CONSTRAINT pk_citas;
       public         postgres    false    173    173            �           2606    34481    pk_clinicas 
   CONSTRAINT     S   ALTER TABLE ONLY clinicas
    ADD CONSTRAINT pk_clinicas PRIMARY KEY (clinica_id);
 >   ALTER TABLE ONLY public.clinicas DROP CONSTRAINT pk_clinicas;
       public         postgres    false    175    175            �           2606    34483    pk_configuraciones 
   CONSTRAINT     g   ALTER TABLE ONLY configuraciones
    ADD CONSTRAINT pk_configuraciones PRIMARY KEY (configuracion_id);
 L   ALTER TABLE ONLY public.configuraciones DROP CONSTRAINT pk_configuraciones;
       public         postgres    false    177    177            �           2606    34485    pk_consultas 
   CONSTRAINT     V   ALTER TABLE ONLY consultas
    ADD CONSTRAINT pk_consultas PRIMARY KEY (consulta_id);
 @   ALTER TABLE ONLY public.consultas DROP CONSTRAINT pk_consultas;
       public         postgres    false    179    179            �           2606    34487    pk_departamentos 
   CONSTRAINT     b   ALTER TABLE ONLY departamentos
    ADD CONSTRAINT pk_departamentos PRIMARY KEY (departamento_id);
 H   ALTER TABLE ONLY public.departamentos DROP CONSTRAINT pk_departamentos;
       public         postgres    false    183    183                       2606    34489    pk_detalles_consultas 
   CONSTRAINT     o   ALTER TABLE ONLY detalles_consultas
    ADD CONSTRAINT pk_detalles_consultas PRIMARY KEY (detalleconsulta_id);
 R   ALTER TABLE ONLY public.detalles_consultas DROP CONSTRAINT pk_detalles_consultas;
       public         postgres    false    185    185                       2606    34491    pk_direcciones 
   CONSTRAINT     [   ALTER TABLE ONLY direcciones
    ADD CONSTRAINT pk_direcciones PRIMARY KEY (direccion_id);
 D   ALTER TABLE ONLY public.direcciones DROP CONSTRAINT pk_direcciones;
       public         postgres    false    187    187                       2606    34493    pk_existencias 
   CONSTRAINT     \   ALTER TABLE ONLY existencias
    ADD CONSTRAINT pk_existencias PRIMARY KEY (existencia_id);
 D   ALTER TABLE ONLY public.existencias DROP CONSTRAINT pk_existencias;
       public         postgres    false    189    189                       2606    34495    pk_imagenes 
   CONSTRAINT     R   ALTER TABLE ONLY imagenes
    ADD CONSTRAINT pk_imagenes PRIMARY KEY (imagen_id);
 >   ALTER TABLE ONLY public.imagenes DROP CONSTRAINT pk_imagenes;
       public         postgres    false    191    191                       2606    34497 
   pk_insumos 
   CONSTRAINT     P   ALTER TABLE ONLY insumos
    ADD CONSTRAINT pk_insumos PRIMARY KEY (insumo_id);
 <   ALTER TABLE ONLY public.insumos DROP CONSTRAINT pk_insumos;
       public         postgres    false    193    193                       2606    34499 
   pk_medicos 
   CONSTRAINT     P   ALTER TABLE ONLY medicos
    ADD CONSTRAINT pk_medicos PRIMARY KEY (medico_id);
 <   ALTER TABLE ONLY public.medicos DROP CONSTRAINT pk_medicos;
       public         postgres    false    195    195                       2606    34501    pk_menus 
   CONSTRAINT     J   ALTER TABLE ONLY menus
    ADD CONSTRAINT pk_menus PRIMARY KEY (menu_id);
 8   ALTER TABLE ONLY public.menus DROP CONSTRAINT pk_menus;
       public         postgres    false    197    197            $           2606    34503    pk_menus_por_roles 
   CONSTRAINT     f   ALTER TABLE ONLY menus_por_roles
    ADD CONSTRAINT pk_menus_por_roles PRIMARY KEY (rol_id, menu_id);
 L   ALTER TABLE ONLY public.menus_por_roles DROP CONSTRAINT pk_menus_por_roles;
       public         postgres    false    199    199    199            '           2606    34505    pk_movimientos 
   CONSTRAINT     \   ALTER TABLE ONLY movimientos
    ADD CONSTRAINT pk_movimientos PRIMARY KEY (movimiento_id);
 D   ALTER TABLE ONLY public.movimientos DROP CONSTRAINT pk_movimientos;
       public         postgres    false    200    200            +           2606    34507    pk_municipios 
   CONSTRAINT     Y   ALTER TABLE ONLY municipios
    ADD CONSTRAINT pk_municipios PRIMARY KEY (municipio_id);
 B   ALTER TABLE ONLY public.municipios DROP CONSTRAINT pk_municipios;
       public         postgres    false    202    202            /           2606    34509    pk_odontogramas 
   CONSTRAINT     _   ALTER TABLE ONLY odontogramas
    ADD CONSTRAINT pk_odontogramas PRIMARY KEY (odontograma_id);
 F   ALTER TABLE ONLY public.odontogramas DROP CONSTRAINT pk_odontogramas;
       public         postgres    false    204    204            3           2606    34511    pk_pacientes 
   CONSTRAINT     V   ALTER TABLE ONLY pacientes
    ADD CONSTRAINT pk_pacientes PRIMARY KEY (paciente_id);
 @   ALTER TABLE ONLY public.pacientes DROP CONSTRAINT pk_pacientes;
       public         postgres    false    206    206            6           2606    34513    pk_patologias 
   CONSTRAINT     Y   ALTER TABLE ONLY patologias
    ADD CONSTRAINT pk_patologias PRIMARY KEY (patologia_id);
 B   ALTER TABLE ONLY public.patologias DROP CONSTRAINT pk_patologias;
       public         postgres    false    208    208            ;           2606    34515    pk_patologias_por_pacientes 
   CONSTRAINT     �   ALTER TABLE ONLY patologias_por_pacientes
    ADD CONSTRAINT pk_patologias_por_pacientes PRIMARY KEY (paciente_id, patologia_id);
 ^   ALTER TABLE ONLY public.patologias_por_pacientes DROP CONSTRAINT pk_patologias_por_pacientes;
       public         postgres    false    210    210    210            A           2606    34517    pk_promociones 
   CONSTRAINT     [   ALTER TABLE ONLY promociones
    ADD CONSTRAINT pk_promociones PRIMARY KEY (promocion_id);
 D   ALTER TABLE ONLY public.promociones DROP CONSTRAINT pk_promociones;
       public         postgres    false    213    213            D           2606    34519    pk_roles 
   CONSTRAINT     I   ALTER TABLE ONLY roles
    ADD CONSTRAINT pk_roles PRIMARY KEY (rol_id);
 8   ALTER TABLE ONLY public.roles DROP CONSTRAINT pk_roles;
       public         postgres    false    215    215            G           2606    34521    pk_sub_menus_por_roles 
   CONSTRAINT     q   ALTER TABLE ONLY sub_menus_por_roles
    ADD CONSTRAINT pk_sub_menus_por_roles PRIMARY KEY (rol_id, submenu_id);
 T   ALTER TABLE ONLY public.sub_menus_por_roles DROP CONSTRAINT pk_sub_menus_por_roles;
       public         postgres    false    217    217    217            L           2606    34523    pk_submenus 
   CONSTRAINT     S   ALTER TABLE ONLY submenus
    ADD CONSTRAINT pk_submenus PRIMARY KEY (submenu_id);
 >   ALTER TABLE ONLY public.submenus DROP CONSTRAINT pk_submenus;
       public         postgres    false    218    218            O           2606    34525    pk_tipos_insumos 
   CONSTRAINT     `   ALTER TABLE ONLY tipos_insumos
    ADD CONSTRAINT pk_tipos_insumos PRIMARY KEY (tipoinsumo_id);
 H   ALTER TABLE ONLY public.tipos_insumos DROP CONSTRAINT pk_tipos_insumos;
       public         postgres    false    220    220            R           2606    34527    pk_tratamientos 
   CONSTRAINT     _   ALTER TABLE ONLY tratamientos
    ADD CONSTRAINT pk_tratamientos PRIMARY KEY (tratamiento_id);
 F   ALTER TABLE ONLY public.tratamientos DROP CONSTRAINT pk_tratamientos;
       public         postgres    false    222    222            U           2606    34529    pk_unidades_medidas 
   CONSTRAINT     h   ALTER TABLE ONLY unidades_medidas
    ADD CONSTRAINT pk_unidades_medidas PRIMARY KEY (unidadmedida_id);
 N   ALTER TABLE ONLY public.unidades_medidas DROP CONSTRAINT pk_unidades_medidas;
       public         postgres    false    224    224            X           2606    34531    pk_usuarios 
   CONSTRAINT     X   ALTER TABLE ONLY usuarios
    ADD CONSTRAINT pk_usuarios PRIMARY KEY (usuario_usuario);
 >   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT pk_usuarios;
       public         postgres    false    226    226            =           2606    34533    privilegios_pkey 
   CONSTRAINT     j   ALTER TABLE ONLY privilegios
    ADD CONSTRAINT privilegios_pkey PRIMARY KEY (privilegio_id, submenu_id);
 F   ALTER TABLE ONLY public.privilegios DROP CONSTRAINT privilegios_pkey;
       public         postgres    false    211    211    211            ?           2606    34535    privilegios_por_roles_pkey 
   CONSTRAINT     �   ALTER TABLE ONLY privilegios_por_roles
    ADD CONSTRAINT privilegios_por_roles_pkey PRIMARY KEY (privilegios_id, submenu_id, roles_id);
 Z   ALTER TABLE ONLY public.privilegios_por_roles DROP CONSTRAINT privilegios_por_roles_pkey;
       public         postgres    false    212    212    212    212            �           1259    34536    bitacora_pk    INDEX     N   CREATE UNIQUE INDEX bitacora_pk ON public.bitacora USING btree (bitacora_id);
    DROP INDEX public.bitacora_pk;
       public         postgres    false    171            �           1259    34537    citas_pk    INDEX     D   CREATE UNIQUE INDEX citas_pk ON public.citas USING btree (cita_id);
    DROP INDEX public.citas_pk;
       public         postgres    false    173            �           1259    34538    clinicas_pk    INDEX     M   CREATE UNIQUE INDEX clinicas_pk ON public.clinicas USING btree (clinica_id);
    DROP INDEX public.clinicas_pk;
       public         postgres    false    175            �           1259    34539    configuraciones_pk    INDEX     a   CREATE UNIQUE INDEX configuraciones_pk ON public.configuraciones USING btree (configuracion_id);
 &   DROP INDEX public.configuraciones_pk;
       public         postgres    false    177            �           1259    34540    consultas_pk    INDEX     P   CREATE UNIQUE INDEX consultas_pk ON public.consultas USING btree (consulta_id);
     DROP INDEX public.consultas_pk;
       public         postgres    false    179            �           1259    34541    departamentos_pk    INDEX     \   CREATE UNIQUE INDEX departamentos_pk ON public.departamentos USING btree (departamento_id);
 $   DROP INDEX public.departamentos_pk;
       public         postgres    false    183                        1259    34542    detalles_consultas_pk    INDEX     i   CREATE UNIQUE INDEX detalles_consultas_pk ON public.detalles_consultas USING btree (detalleconsulta_id);
 )   DROP INDEX public.detalles_consultas_pk;
       public         postgres    false    185                       1259    34543    direcciones_pk    INDEX     U   CREATE UNIQUE INDEX direcciones_pk ON public.direcciones USING btree (direccion_id);
 "   DROP INDEX public.direcciones_pk;
       public         postgres    false    187                       1259    34544    existencias_pk    INDEX     V   CREATE UNIQUE INDEX existencias_pk ON public.existencias USING btree (existencia_id);
 "   DROP INDEX public.existencias_pk;
       public         postgres    false    189                       1259    34545    imagenes_pk    INDEX     L   CREATE UNIQUE INDEX imagenes_pk ON public.imagenes USING btree (imagen_id);
    DROP INDEX public.imagenes_pk;
       public         postgres    false    191                       1259    34546 
   insumos_pk    INDEX     J   CREATE UNIQUE INDEX insumos_pk ON public.insumos USING btree (insumo_id);
    DROP INDEX public.insumos_pk;
       public         postgres    false    193                       1259    34547 
   medicos_pk    INDEX     J   CREATE UNIQUE INDEX medicos_pk ON public.medicos USING btree (medico_id);
    DROP INDEX public.medicos_pk;
       public         postgres    false    195                       1259    34548    menus_pk    INDEX     D   CREATE UNIQUE INDEX menus_pk ON public.menus USING btree (menu_id);
    DROP INDEX public.menus_pk;
       public         postgres    false    197                        1259    34549    menus_por_roles2_fk    INDEX     R   CREATE INDEX menus_por_roles2_fk ON public.menus_por_roles USING btree (menu_id);
 '   DROP INDEX public.menus_por_roles2_fk;
       public         postgres    false    199            !           1259    34550    menus_por_roles_fk    INDEX     P   CREATE INDEX menus_por_roles_fk ON public.menus_por_roles USING btree (rol_id);
 &   DROP INDEX public.menus_por_roles_fk;
       public         postgres    false    199            "           1259    34551    menus_por_roles_pk    INDEX     `   CREATE UNIQUE INDEX menus_por_roles_pk ON public.menus_por_roles USING btree (rol_id, menu_id);
 &   DROP INDEX public.menus_por_roles_pk;
       public         postgres    false    199    199            %           1259    34552    movimientos_pk    INDEX     V   CREATE UNIQUE INDEX movimientos_pk ON public.movimientos USING btree (movimiento_id);
 "   DROP INDEX public.movimientos_pk;
       public         postgres    false    200            )           1259    34553    municipios_pk    INDEX     S   CREATE UNIQUE INDEX municipios_pk ON public.municipios USING btree (municipio_id);
 !   DROP INDEX public.municipios_pk;
       public         postgres    false    202            -           1259    34554    odontogramas_pk    INDEX     Y   CREATE UNIQUE INDEX odontogramas_pk ON public.odontogramas USING btree (odontograma_id);
 #   DROP INDEX public.odontogramas_pk;
       public         postgres    false    204            1           1259    34555    pacientes_pk    INDEX     P   CREATE UNIQUE INDEX pacientes_pk ON public.pacientes USING btree (paciente_id);
     DROP INDEX public.pacientes_pk;
       public         postgres    false    206            4           1259    34556    patologias_pk    INDEX     S   CREATE UNIQUE INDEX patologias_pk ON public.patologias USING btree (patologia_id);
 !   DROP INDEX public.patologias_pk;
       public         postgres    false    208            7           1259    34557    patologias_por_pacientes2_fk    INDEX     i   CREATE INDEX patologias_por_pacientes2_fk ON public.patologias_por_pacientes USING btree (patologia_id);
 0   DROP INDEX public.patologias_por_pacientes2_fk;
       public         postgres    false    210            8           1259    34558    patologias_por_pacientes_fk    INDEX     g   CREATE INDEX patologias_por_pacientes_fk ON public.patologias_por_pacientes USING btree (paciente_id);
 /   DROP INDEX public.patologias_por_pacientes_fk;
       public         postgres    false    210            9           1259    34559    patologias_por_pacientes_pk    INDEX     |   CREATE UNIQUE INDEX patologias_por_pacientes_pk ON public.patologias_por_pacientes USING btree (paciente_id, patologia_id);
 /   DROP INDEX public.patologias_por_pacientes_pk;
       public         postgres    false    210    210            B           1259    34560    promociones_pk    INDEX     U   CREATE UNIQUE INDEX promociones_pk ON public.promociones USING btree (promocion_id);
 "   DROP INDEX public.promociones_pk;
       public         postgres    false    213            Y           1259    34561    r01_fk    INDEX     =   CREATE INDEX r01_fk ON public.usuarios USING btree (rol_id);
    DROP INDEX public.r01_fk;
       public         postgres    false    226                       1259    34562    r06_fk    INDEX     C   CREATE INDEX r06_fk ON public.direcciones USING btree (medico_id);
    DROP INDEX public.r06_fk;
       public         postgres    false    187            	           1259    34563    r07_fk    INDEX     F   CREATE INDEX r07_fk ON public.direcciones USING btree (municipio_id);
    DROP INDEX public.r07_fk;
       public         postgres    false    187            ,           1259    34564    r08_fk    INDEX     H   CREATE INDEX r08_fk ON public.municipios USING btree (departamento_id);
    DROP INDEX public.r08_fk;
       public         postgres    false    202            �           1259    34565    r09_fk    INDEX     C   CREATE INDEX r09_fk ON public.consultas USING btree (paciente_id);
    DROP INDEX public.r09_fk;
       public         postgres    false    179                       1259    34566    r10_fk    INDEX     B   CREATE INDEX r10_fk ON public.imagenes USING btree (paciente_id);
    DROP INDEX public.r10_fk;
       public         postgres    false    191            �           1259    34567    r14_fk    INDEX     >   CREATE INDEX r14_fk ON public.citas USING btree (clinica_id);
    DROP INDEX public.r14_fk;
       public         postgres    false    173            
           1259    34568    r16_fk    INDEX     D   CREATE INDEX r16_fk ON public.direcciones USING btree (clinica_id);
    DROP INDEX public.r16_fk;
       public         postgres    false    187            �           1259    34569    r17_fk    INDEX     C   CREATE INDEX r17_fk ON public.citas USING btree (usuario_usuario);
    DROP INDEX public.r17_fk;
       public         postgres    false    173            �           1259    34570    r18_fk    INDEX     =   CREATE INDEX r18_fk ON public.citas USING btree (medico_id);
    DROP INDEX public.r18_fk;
       public         postgres    false    173            �           1259    34571    r19_fk    INDEX     D   CREATE INDEX r19_fk ON public.consultas USING btree (promocion_id);
    DROP INDEX public.r19_fk;
       public         postgres    false    179                       1259    34572    r21_fk    INDEX     O   CREATE INDEX r21_fk ON public.detalles_consultas USING btree (tratamiento_id);
    DROP INDEX public.r21_fk;
       public         postgres    false    185                       1259    34573    r23_fk    INDEX     E   CREATE INDEX r23_fk ON public.insumos USING btree (unidadmedida_id);
    DROP INDEX public.r23_fk;
       public         postgres    false    193                       1259    34574    r24_fk    INDEX     C   CREATE INDEX r24_fk ON public.existencias USING btree (insumo_id);
    DROP INDEX public.r24_fk;
       public         postgres    false    189                       1259    34575    r25_fk    INDEX     D   CREATE INDEX r25_fk ON public.existencias USING btree (clinica_id);
    DROP INDEX public.r25_fk;
       public         postgres    false    189            (           1259    34576    r26_fk    INDEX     G   CREATE INDEX r26_fk ON public.movimientos USING btree (existencia_id);
    DROP INDEX public.r26_fk;
       public         postgres    false    200                       1259    34577    r27_fk    INDEX     E   CREATE INDEX r27_fk ON public.direcciones USING btree (paciente_id);
    DROP INDEX public.r27_fk;
       public         postgres    false    187            �           1259    34578    r28_fk    INDEX     A   CREATE INDEX r28_fk ON public.consultas USING btree (medico_id);
    DROP INDEX public.r28_fk;
       public         postgres    false    179                       1259    34579    r29_fk    INDEX     C   CREATE INDEX r29_fk ON public.insumos USING btree (tipoinsumo_id);
    DROP INDEX public.r29_fk;
       public         postgres    false    193            0           1259    34580    r30_fk    INDEX     F   CREATE INDEX r30_fk ON public.odontogramas USING btree (paciente_id);
    DROP INDEX public.r30_fk;
       public         postgres    false    204                       1259    34581    r31_fk    INDEX     L   CREATE INDEX r31_fk ON public.detalles_consultas USING btree (paciente_id);
    DROP INDEX public.r31_fk;
       public         postgres    false    185            E           1259    34582    roles_pk    INDEX     C   CREATE UNIQUE INDEX roles_pk ON public.roles USING btree (rol_id);
    DROP INDEX public.roles_pk;
       public         postgres    false    215            H           1259    34583    sub_menus_por_roles2_fk    INDEX     ]   CREATE INDEX sub_menus_por_roles2_fk ON public.sub_menus_por_roles USING btree (submenu_id);
 +   DROP INDEX public.sub_menus_por_roles2_fk;
       public         postgres    false    217            I           1259    34584    sub_menus_por_roles_fk    INDEX     X   CREATE INDEX sub_menus_por_roles_fk ON public.sub_menus_por_roles USING btree (rol_id);
 *   DROP INDEX public.sub_menus_por_roles_fk;
       public         postgres    false    217            J           1259    34585    sub_menus_por_roles_pk    INDEX     k   CREATE UNIQUE INDEX sub_menus_por_roles_pk ON public.sub_menus_por_roles USING btree (rol_id, submenu_id);
 *   DROP INDEX public.sub_menus_por_roles_pk;
       public         postgres    false    217    217            M           1259    34586    submenus_pk    INDEX     M   CREATE UNIQUE INDEX submenus_pk ON public.submenus USING btree (submenu_id);
    DROP INDEX public.submenus_pk;
       public         postgres    false    218            P           1259    34587    tipos_insumos_pk    INDEX     Z   CREATE UNIQUE INDEX tipos_insumos_pk ON public.tipos_insumos USING btree (tipoinsumo_id);
 $   DROP INDEX public.tipos_insumos_pk;
       public         postgres    false    220            S           1259    34588    tratamientos_pk    INDEX     Y   CREATE UNIQUE INDEX tratamientos_pk ON public.tratamientos USING btree (tratamiento_id);
 #   DROP INDEX public.tratamientos_pk;
       public         postgres    false    222            V           1259    34589    unidades_medidas_pk    INDEX     b   CREATE UNIQUE INDEX unidades_medidas_pk ON public.unidades_medidas USING btree (unidadmedida_id);
 '   DROP INDEX public.unidades_medidas_pk;
       public         postgres    false    224            Z           1259    34590    usuarios_pk    INDEX     R   CREATE UNIQUE INDEX usuarios_pk ON public.usuarios USING btree (usuario_usuario);
    DROP INDEX public.usuarios_pk;
       public         postgres    false    226            u           2606    34591    f_privilegios_por_rol    FK CONSTRAINT     �   ALTER TABLE ONLY privilegios_por_roles
    ADD CONSTRAINT f_privilegios_por_rol FOREIGN KEY (roles_id) REFERENCES roles(rol_id);
 U   ALTER TABLE ONLY public.privilegios_por_roles DROP CONSTRAINT f_privilegios_por_rol;
       public       postgres    false    212    215    2116            t           2606    34596    f_privilegios_submenu    FK CONSTRAINT     �   ALTER TABLE ONLY privilegios
    ADD CONSTRAINT f_privilegios_submenu FOREIGN KEY (submenu_id) REFERENCES submenus(submenu_id);
 K   ALTER TABLE ONLY public.privilegios DROP CONSTRAINT f_privilegios_submenu;
       public       postgres    false    211    218    2124            v           2606    34601    f_privlegios_por_accion    FK CONSTRAINT     �   ALTER TABLE ONLY privilegios_por_roles
    ADD CONSTRAINT f_privlegios_por_accion FOREIGN KEY (privilegios_id, submenu_id) REFERENCES privilegios(privilegio_id, submenu_id);
 W   ALTER TABLE ONLY public.privilegios_por_roles DROP CONSTRAINT f_privlegios_por_accion;
       public       postgres    false    212    212    211    211    2109            [           2606    34606    fk_citas_paciente    FK CONSTRAINT     y   ALTER TABLE ONLY citas
    ADD CONSTRAINT fk_citas_paciente FOREIGN KEY (paciente_id) REFERENCES pacientes(paciente_id);
 A   ALTER TABLE ONLY public.citas DROP CONSTRAINT fk_citas_paciente;
       public       postgres    false    173    206    2099            \           2606    34611    fk_citas_r14_clinicas    FK CONSTRAINT     �   ALTER TABLE ONLY citas
    ADD CONSTRAINT fk_citas_r14_clinicas FOREIGN KEY (clinica_id) REFERENCES clinicas(clinica_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 E   ALTER TABLE ONLY public.citas DROP CONSTRAINT fk_citas_r14_clinicas;
       public       postgres    false    173    175    2033            ]           2606    34616    fk_citas_r17_usuarios    FK CONSTRAINT     �   ALTER TABLE ONLY citas
    ADD CONSTRAINT fk_citas_r17_usuarios FOREIGN KEY (usuario_usuario) REFERENCES usuarios(usuario_usuario) ON UPDATE RESTRICT ON DELETE RESTRICT;
 E   ALTER TABLE ONLY public.citas DROP CONSTRAINT fk_citas_r17_usuarios;
       public       postgres    false    173    226    2136            ^           2606    34621    fk_citas_r18_medicos    FK CONSTRAINT     �   ALTER TABLE ONLY citas
    ADD CONSTRAINT fk_citas_r18_medicos FOREIGN KEY (medico_id) REFERENCES medicos(medico_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 D   ALTER TABLE ONLY public.citas DROP CONSTRAINT fk_citas_r18_medicos;
       public       postgres    false    173    195    2076            _           2606    34626    fk_consulta_r09_paciente    FK CONSTRAINT     �   ALTER TABLE ONLY consultas
    ADD CONSTRAINT fk_consulta_r09_paciente FOREIGN KEY (paciente_id) REFERENCES pacientes(paciente_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 L   ALTER TABLE ONLY public.consultas DROP CONSTRAINT fk_consulta_r09_paciente;
       public       postgres    false    179    206    2099            `           2606    34631    fk_consulta_r19_promocio    FK CONSTRAINT     �   ALTER TABLE ONLY consultas
    ADD CONSTRAINT fk_consulta_r19_promocio FOREIGN KEY (promocion_id) REFERENCES promociones(promocion_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 L   ALTER TABLE ONLY public.consultas DROP CONSTRAINT fk_consulta_r19_promocio;
       public       postgres    false    213    2113    179            a           2606    34636    fk_consulta_r28_medicos    FK CONSTRAINT     �   ALTER TABLE ONLY consultas
    ADD CONSTRAINT fk_consulta_r28_medicos FOREIGN KEY (medico_id) REFERENCES medicos(medico_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 K   ALTER TABLE ONLY public.consultas DROP CONSTRAINT fk_consulta_r28_medicos;
       public       postgres    false    179    195    2076            b           2606    34641    fk_detalles_r21_tratamie    FK CONSTRAINT     �   ALTER TABLE ONLY detalles_consultas
    ADD CONSTRAINT fk_detalles_r21_tratamie FOREIGN KEY (tratamiento_id) REFERENCES tratamientos(tratamiento_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 U   ALTER TABLE ONLY public.detalles_consultas DROP CONSTRAINT fk_detalles_r21_tratamie;
       public       postgres    false    2130    185    222            c           2606    34646    fk_detalles_r31_paciente    FK CONSTRAINT     �   ALTER TABLE ONLY detalles_consultas
    ADD CONSTRAINT fk_detalles_r31_paciente FOREIGN KEY (paciente_id) REFERENCES pacientes(paciente_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 U   ALTER TABLE ONLY public.detalles_consultas DROP CONSTRAINT fk_detalles_r31_paciente;
       public       postgres    false    206    185    2099            d           2606    34651    fk_direccio_r06_medicos    FK CONSTRAINT     �   ALTER TABLE ONLY direcciones
    ADD CONSTRAINT fk_direccio_r06_medicos FOREIGN KEY (medico_id) REFERENCES medicos(medico_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 M   ALTER TABLE ONLY public.direcciones DROP CONSTRAINT fk_direccio_r06_medicos;
       public       postgres    false    195    187    2076            e           2606    34656    fk_direccio_r07_municipi    FK CONSTRAINT     �   ALTER TABLE ONLY direcciones
    ADD CONSTRAINT fk_direccio_r07_municipi FOREIGN KEY (municipio_id) REFERENCES municipios(municipio_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 N   ALTER TABLE ONLY public.direcciones DROP CONSTRAINT fk_direccio_r07_municipi;
       public       postgres    false    202    187    2091            f           2606    34661    fk_direccio_r16_clinicas    FK CONSTRAINT     �   ALTER TABLE ONLY direcciones
    ADD CONSTRAINT fk_direccio_r16_clinicas FOREIGN KEY (clinica_id) REFERENCES clinicas(clinica_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 N   ALTER TABLE ONLY public.direcciones DROP CONSTRAINT fk_direccio_r16_clinicas;
       public       postgres    false    175    2033    187            g           2606    34666    fk_direccio_r27_paciente    FK CONSTRAINT     �   ALTER TABLE ONLY direcciones
    ADD CONSTRAINT fk_direccio_r27_paciente FOREIGN KEY (paciente_id) REFERENCES pacientes(paciente_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 N   ALTER TABLE ONLY public.direcciones DROP CONSTRAINT fk_direccio_r27_paciente;
       public       postgres    false    206    2099    187            h           2606    34671    fk_existenc_r24_insumos    FK CONSTRAINT     �   ALTER TABLE ONLY existencias
    ADD CONSTRAINT fk_existenc_r24_insumos FOREIGN KEY (insumo_id) REFERENCES insumos(insumo_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 M   ALTER TABLE ONLY public.existencias DROP CONSTRAINT fk_existenc_r24_insumos;
       public       postgres    false    193    189    2071            i           2606    34676    fk_existenc_r25_clinicas    FK CONSTRAINT     �   ALTER TABLE ONLY existencias
    ADD CONSTRAINT fk_existenc_r25_clinicas FOREIGN KEY (clinica_id) REFERENCES clinicas(clinica_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 N   ALTER TABLE ONLY public.existencias DROP CONSTRAINT fk_existenc_r25_clinicas;
       public       postgres    false    2033    189    175            j           2606    34681    fk_imagenes_r10_paciente    FK CONSTRAINT     �   ALTER TABLE ONLY imagenes
    ADD CONSTRAINT fk_imagenes_r10_paciente FOREIGN KEY (paciente_id) REFERENCES pacientes(paciente_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 K   ALTER TABLE ONLY public.imagenes DROP CONSTRAINT fk_imagenes_r10_paciente;
       public       postgres    false    191    2099    206            k           2606    34686    fk_insumos_r23_unidades    FK CONSTRAINT     �   ALTER TABLE ONLY insumos
    ADD CONSTRAINT fk_insumos_r23_unidades FOREIGN KEY (unidadmedida_id) REFERENCES unidades_medidas(unidadmedida_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 I   ALTER TABLE ONLY public.insumos DROP CONSTRAINT fk_insumos_r23_unidades;
       public       postgres    false    224    2133    193            l           2606    34691    fk_insumos_r29_tipos_in    FK CONSTRAINT     �   ALTER TABLE ONLY insumos
    ADD CONSTRAINT fk_insumos_r29_tipos_in FOREIGN KEY (tipoinsumo_id) REFERENCES tipos_insumos(tipoinsumo_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 I   ALTER TABLE ONLY public.insumos DROP CONSTRAINT fk_insumos_r29_tipos_in;
       public       postgres    false    220    193    2127            m           2606    34696    fk_menus_po_menus_por_menus    FK CONSTRAINT     �   ALTER TABLE ONLY menus_por_roles
    ADD CONSTRAINT fk_menus_po_menus_por_menus FOREIGN KEY (menu_id) REFERENCES menus(menu_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 U   ALTER TABLE ONLY public.menus_por_roles DROP CONSTRAINT fk_menus_po_menus_por_menus;
       public       postgres    false    197    2079    199            n           2606    34701    fk_menus_po_menus_por_roles    FK CONSTRAINT     �   ALTER TABLE ONLY menus_por_roles
    ADD CONSTRAINT fk_menus_po_menus_por_roles FOREIGN KEY (rol_id) REFERENCES roles(rol_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 U   ALTER TABLE ONLY public.menus_por_roles DROP CONSTRAINT fk_menus_po_menus_por_roles;
       public       postgres    false    2116    215    199            o           2606    34706    fk_movimien_r26_existenc    FK CONSTRAINT     �   ALTER TABLE ONLY movimientos
    ADD CONSTRAINT fk_movimien_r26_existenc FOREIGN KEY (existencia_id) REFERENCES existencias(existencia_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 N   ALTER TABLE ONLY public.movimientos DROP CONSTRAINT fk_movimien_r26_existenc;
       public       postgres    false    200    2062    189            p           2606    34711    fk_municipi_r08_departam    FK CONSTRAINT     �   ALTER TABLE ONLY municipios
    ADD CONSTRAINT fk_municipi_r08_departam FOREIGN KEY (departamento_id) REFERENCES departamentos(departamento_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 M   ALTER TABLE ONLY public.municipios DROP CONSTRAINT fk_municipi_r08_departam;
       public       postgres    false    183    2047    202            q           2606    34716    fk_odontogr_r30_paciente    FK CONSTRAINT     �   ALTER TABLE ONLY odontogramas
    ADD CONSTRAINT fk_odontogr_r30_paciente FOREIGN KEY (paciente_id) REFERENCES pacientes(paciente_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 O   ALTER TABLE ONLY public.odontogramas DROP CONSTRAINT fk_odontogr_r30_paciente;
       public       postgres    false    206    2099    204            r           2606    34721    fk_patologi_patologia_paciente    FK CONSTRAINT     �   ALTER TABLE ONLY patologias_por_pacientes
    ADD CONSTRAINT fk_patologi_patologia_paciente FOREIGN KEY (paciente_id) REFERENCES pacientes(paciente_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 a   ALTER TABLE ONLY public.patologias_por_pacientes DROP CONSTRAINT fk_patologi_patologia_paciente;
       public       postgres    false    2099    210    206            s           2606    34726    fk_patologi_patologia_patologi    FK CONSTRAINT     �   ALTER TABLE ONLY patologias_por_pacientes
    ADD CONSTRAINT fk_patologi_patologia_patologi FOREIGN KEY (patologia_id) REFERENCES patologias(patologia_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 a   ALTER TABLE ONLY public.patologias_por_pacientes DROP CONSTRAINT fk_patologi_patologia_patologi;
       public       postgres    false    208    210    2102            w           2606    34731    fk_roles_dashboard    FK CONSTRAINT     |   ALTER TABLE ONLY roles
    ADD CONSTRAINT fk_roles_dashboard FOREIGN KEY (dashboard_id) REFERENCES dashboard(dashboard_id);
 B   ALTER TABLE ONLY public.roles DROP CONSTRAINT fk_roles_dashboard;
       public       postgres    false    215    182    2044            x           2606    34736    fk_sub_menu_sub_menus_roles    FK CONSTRAINT     �   ALTER TABLE ONLY sub_menus_por_roles
    ADD CONSTRAINT fk_sub_menu_sub_menus_roles FOREIGN KEY (rol_id) REFERENCES roles(rol_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 Y   ALTER TABLE ONLY public.sub_menus_por_roles DROP CONSTRAINT fk_sub_menu_sub_menus_roles;
       public       postgres    false    2116    215    217            y           2606    34741    fk_sub_menu_sub_menus_submenus    FK CONSTRAINT     �   ALTER TABLE ONLY sub_menus_por_roles
    ADD CONSTRAINT fk_sub_menu_sub_menus_submenus FOREIGN KEY (submenu_id) REFERENCES submenus(submenu_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 \   ALTER TABLE ONLY public.sub_menus_por_roles DROP CONSTRAINT fk_sub_menu_sub_menus_submenus;
       public       postgres    false    217    2124    218            z           2606    34746    fk_submenus_menu    FK CONSTRAINT     o   ALTER TABLE ONLY submenus
    ADD CONSTRAINT fk_submenus_menu FOREIGN KEY (menu_id) REFERENCES menus(menu_id);
 C   ALTER TABLE ONLY public.submenus DROP CONSTRAINT fk_submenus_menu;
       public       postgres    false    2079    197    218            {           2606    34751    fk_usuarios_r01_roles    FK CONSTRAINT     �   ALTER TABLE ONLY usuarios
    ADD CONSTRAINT fk_usuarios_r01_roles FOREIGN KEY (rol_id) REFERENCES roles(rol_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 H   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT fk_usuarios_r01_roles;
       public       postgres    false    2116    226    215            |           2606    34756    fk_usuarios_r50_medicos    FK CONSTRAINT     �   ALTER TABLE ONLY usuarios
    ADD CONSTRAINT fk_usuarios_r50_medicos FOREIGN KEY (medico_id) REFERENCES medicos(medico_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 J   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT fk_usuarios_r50_medicos;
       public       postgres    false    195    2076    226            }           2606    34761    fk_usuarios_r51_paciente    FK CONSTRAINT     �   ALTER TABLE ONLY usuarios
    ADD CONSTRAINT fk_usuarios_r51_paciente FOREIGN KEY (paciente_id) REFERENCES pacientes(paciente_id) ON UPDATE RESTRICT ON DELETE RESTRICT;
 K   ALTER TABLE ONLY public.usuarios DROP CONSTRAINT fk_usuarios_r51_paciente;
       public       postgres    false    206    226    2099            �   �  x��T;n�0��S�\&�ǟ�Έ�p p�4i�Y��R�>F�#�by����L"�P!����#��q{��-oc�t�����W)�q S��h�bVn��X}�c��C�_��a���$|��R�D�@b���@vw��ɯ?|
x?EC�fC�����l�.�����v��cL؁%�eZ����}ĐX)3iK88�*�.D��S�ݔ�Pg��+AZ^}���1t�E��SP�:�}�79^9a�hd9D�S���G߇1^�9�:��2�� �1 ��Y��qA����1�v������h��4O�}�Ϟx�շ1�9�]Z���4�\�:&����rC7�y8��xڟ?r�����zU�����x�u��Q���Z���?��]8���u&�=�4���d�N�v��d�N6�(�m�7hYj�,��� m�ť
�S���r��/�A-��zN�i]�?ȩ��      �   I  x���K�� ���}GT�iz�ji�٠Iғ�K���]���D�+
>���ʨ
��G�;��fp���V��~|�ݶ[���rhk�5���9}��"��Ŷ��A�7���kH��eZ�B�U�%��uK;"x{���]?��/��si�hAQ���p/Є�&����I���q�ٹ�8��K +�*�M2��h��r_������',Ɋy���w��˃&v6@h��bg(6�	<�S��dDZ$_8�B��ca�
�����jyq�[�YK�SS��k����'�T�ߚ)+�t�ǩ��?i/Ӵ��$�PC�~U���<tSIF]�lM�`� ����1R�yM�̶$�:��E^;��7MB���o�)��bƳ&F4��_�i{�o!r��1Q���A�t�{��D���uÐ��BX	�0��ڲ���Yi"���UJb�!��e�!g*O��*1�,C���(��g�Sv��e�x�;='?�����3Hc�&U�S:t1M.j�����w��z��Z�+z�F�K�nh��ڡ&_����B��WB�`���&���%<��u�H�-Ty�]��	~�Y^.cߥ'��      �   �   x���M
�0����@JR��R�m7�v3�R�����>�ŋm)��������z�l�C>w�>����L���֕&z�s*�R���(��L����g����Q����2^��Z�i��F�"6�1Lv��8���䞏�9�3E�,~1�����h������a�XS&���<Zs#]Iy�Q�      �   J  x�E�=N1���)|�e���44	��ƛ8�@�q���Ta.�� �HQ�|~~��;�9]Z��S��,����5��]�����":Q����ϡ��qAyMO.���ng���������݊&���*�U
d���B� ��y���Q-�����*��>w�BuI��+dQ��B7����<B"��D�WAx�d�6�f�O�7C�N���Ul�D��~��ek��+��3��g�4�T��cܼ��� ��!U���"��hۋ�k�w�Y���ltX�pL�o8�=���d�S�مTɏ��h�����ô�l~ Kt�k      �   �  x��X���6=k���6$ٻ��V=H���q/�D�(R!�`ӿ�q9喫,oHqEXn�i����aA�f޼y3�ȳ������ g[˫~�������н`���{{X-^��0��>�^vJ8Vq+�[f/��2-l`'W�����ۚ[,w�V��4gN�?���(cɗ���7-�U[��tϨfw�de�O��Z�w�~�D�[��Vhv��ms�J �K����-��'����.�.ö"l�$�("q�[.,g*���U@��9b`�픏�&�j��yq�ȋE�ή������������A��M�zOU%w�4-{g#�x�k0ইh#X���m�c%?g"a����HYa�h�٭śg�뼡ā��nw�6ƩY���c54�25���(<�EQ�3����co�.��/���ÎM�O��oeKUF�A��2{��%��3n"��j��~	�c�}wǽ���1葸 �17t�Jcǲw�� �
���ռ�Ńk���ۈ�pN!�JԾD(z,�J��hj�+���0�E]���Q�m�Wo�,��)l
o������I=I�Ŕ�K����ɸ���	Ā�N
o�Nh���Z���4��5��P�� ��/_��b[�{jV��I��K��,|oY!S�l�	�������n��r V���&��١�}�~#�A��˅�l�X@�p/v��{V��%m8����F"�*!��@��$R�'�16�cP�M���%��B"�0�����xگ������-�bn��[E%�^��������L5z���)P�k4�v �B;�!��6�S���z��K7)�{u�:f������(/.��y���������c�e�X�+���O�^�n�b}*��*�y��b���˖y������N-�B�E��+��C���_s.�Yy�����MI[�W^if}}�Y-��o������Y3�d�_��˳��/�ʕ      �   H  x���=n�0�g�:A���I��C��:ua,"Q!Q���q2v��#�b�uǙ��{��7;�eP�-r����=�j�zn�j$k@M��AB���*@4����}��UT�..Ղ�ɖ��w�z������5{��sq,���R����T܅(m��������9��� 6�hΔo�V�P�k&TO��qbб�U�i{��~#2��Ѱo�Z��;��o��xK���拺�.7�S���F��c>����lq?L��e��,����V�8O~�f� �^@Ц����qw�ډx�^����AW�5�\I�Щ��esu�uR�7QI>@      �   �   x��M
�0��{���Q���
��nF*��b�.�M�Pz/V�n>fE��Oxm�Jtؾp�Q9��k���s*���M���BR͝^<>Gݱ�%�V��'|��.X��F$��1h�긫�yc�+��1�Z�f�Fz$��UF�g�ɩu�/�f��<�      �   �   x���=j�@����)r���J�p��M)R�C��/[>^ͮ
��8��G��y$����q�|y��}�~]�U�i�`ް��ZN+����ަ��6W����xX���`g�j=�΄B��{ȹn�2�l��&�,^+�M,��)�DqX!"=�%W�-������Vkf����Ö����
�b)]Ŋ�@�-/#��b�]��Y������ɶ�x�/ö�S]����u�?�V��      �   .  x�uVKr�6\?����H�"���O�f\��f�(S������e��2�#�b�~m3�>h���F��3E�%to��t��ikzp�*�IJ6�%���5�b^� Y�w�`X)k�l%�1]`�ε����������.ZU��I׍��j�=Y�Y��RJ�m�:$��8�C�p/���te�oN��޷� ��~�h#h��w�������,��΀��`�cʢqV�� ��]�o�9���\g�J��TᗢiN���1����ZW6�t�{����B����Uc+m��#/K�䟌�U�@���i^��X��|�2�;u0�=�Ց�|E{Y:~��a��iP��vJd R�3;�^m��!�,����l����;m_T�Khd�<��UB�������Y��#��'Y)(�E)m�EP���k� ��~���*��n�5��C��dm͛��ܯ�X�q�;�J��x��V�Ҵ'��Q�ɄW�
V�<2g��52��^��U��P4����g����{��Gsi/�s0��JC����~:5����=i�
[S��[��Y:l�.�ϋ�p@_��B� �{U��Tg��S48!]��xS�`�w��^Gmx�`��)�Ppf�8P{R��N�N�Ĭ��Q6����G�bM[h6�����mfņ昊]{����L���ٵ�\k�{������^{�e$�X��mՕ0���[�����7��<<���͜�c�{[��6�n��T��7���cF�7Ao ��=����F7=w$bz@��T,���@F����I��Ql���r/����~1�x�q�I�lϔ�'��A1�#� 	ŃO�|&4B�FXxnp����H)^��;g�ek_hMb��k�a�\qMg"#�O�y�NbM{�g�E�G�����Iz�6|.��f@<�I'\L�7�[1���<�7���@�{���k1�d+�#�k�D���!�7!���=��:HbK�x�Ȃw��R���o���ݾ�m�$�$	����������6��������U��h�͈d�ni4{q�C�q�Q�䎫���zȰ��Y���)Y��_���*�\�1�c�(W�#�6�ТV>��]fQ��b��j��V��!E�M#>���T<�K�<���bl�5�~S���]''+ϣ���SAɘ��ͶzV�+��������t'��ҋ����5��l�����)��v���m�ȳ��!2x�hU�u�Qئ�;ӥ`]0Y�[(���(]2�?HCc����G<�K��x7М:EGJFK8��}�����F���%�� G@]*      �   q   x�%��0��K1�w/鿎����R�tw�Ԯ�x���%t4I(^ u�iL���mim\J����`LZ,���ze9�`���jR{^�n�,%)�6}?f���D      �   >  x�՘Mn�0���)x��$;��i��Q��n6�L
$��ȵz�^��OZ���H j+���03o��%��4Mg����H>�NS�h�h�����{C+M�Z?��v��{\у?>ޥ��?/l����+[R�1��L��']��g[�g����F�{[������t�n���>��?p�6�evlx�c�w8&ٿJE��KΗ�"[[�ZC\���.�B(1(1�"����ʈ�M����#T��������o?5��D�P�l��1(�F���:�����J��_��RS+��(��Ε�F��qtp�d)6�L)2�o�<`�!�����	�!&��K�?Pj�@�]"�����P�T�����%�]BIA�Sp��?K3�;\�r"�8��7;-�J?�J���V�K� �Z�]_V{ ��$�Ew��bN���A�.����]�z�
�57g7�:_���?c<0cA7D��͐�0�$�)���'n��⏶<mCLkd���y��CL\Y�'[11��p.�k���j=��8�Jş�����B�ob��<z_"�7�>[��׾*�L#�M�۩V���/��O�      �   �   x���1n�0Eg���I�g4�"@�,혅qXC�,�����Xiw-Z�"�x��_2`�B��x���g�(W%`u�<$w�R�����Z�V��6����tI���\0���Yٯ�=���lz��eg	y#��m��&
s9�q�GJ.�(2��&~+�o��ݧ��X��^����ԭ
ox�KD#Yx�����R��2��DB�ŢqH�~�p��䤡���w��ǿ|������OJ�/{�2L      	   i  x���AN�0������رgW�J�.J�	��!1�!��� ��p Nы1.�eUu��|O��SX`�>��v�Lߛ�",����Һx�3�9���)w!6�čs��ae�u��J� D�2��rI'��5\�0�z	"��$,\��ٛIe&c?"-��2��p�n��`>���Ww��&���%�h:D�"�M�m����w�p"�*c��呤����I��;"Y��f���vK�]kvGS�DLT�-1����{��q��'��ǆ�R�I�5��L))�ڒd���E ��,�0�|���f*��|��L�{�&���0�n�p��su�K&TJ�����R5�����0Z�Q� ��      	   n   x�3�tLO�KI�2�HL�L�+I-�2���+.��/�2�(���O�����r�����q:��f�e��ޜ�e�霟���^
��t�,�l��Z�������� N�%=      	   @   x��� 1�7.�$b����_��c�X���:�Z�X0�������n���h�?��C�0�'�;<�      	   E  x���KN�@�s
.d�瑹Dw�	$�R���OҊ$vԬ�O��x\!)����4
������r}}x��~��_�@��/��;�-� �(�Hx����&�7�B�ö*�xꠉPUrP%�+&A���qG*%�<�RqsE��3I�J�	�[�� Le��������j�^��ۡQ&B���ǀ/��������z�{��D�ȼ=#=*@�Cm����yG���R>�P�HB��}묔v
�Z�6{���l��޹�K�Ϣ�f���&l'eOa��ff���`��2�L�Qh�/�.ۗ�|����c��fi߯2"�^�'�M��q~��|��      	   �	  x�eX�r�H=_�/�`���-�dq,��K	,Q� Ql,���G�0ᛯ��y/Q )ύ�(����&jr�ܛ��l���HSޚږ&��w����μ�(�x���nK��YOWvz֙�G	W���}���G)ď�yۘz���M��w��r�~0��Cc�ҵ����z��^�]Tݭol��`aW��.��y�R@����.�f�O��DO.\�WohbH���Qm�����-;��u��T�����y�:|4Re[�}�٭�ᑞZZ�3
�WWv�q&�z2���{3�0��x-�sBMi:�#S��S�:�x�l*��Z¥S"~�����L���\T����;S)����N?��cc��;�� �3萢�4Hf�� ,Lc���>���[3�5���A\�j)���Q���N����L�i�޾��y�<;����neVќ>ͻ������/���B���/|�k�$Ŵ�y9��x>V�cM��b����|F}=�6��A��6��
G�#r��[�A����w�1;6E����6%J<�F@
Q{l��7Q�ōo�?�4-��߇�>�Y�����,ml%��wn�HK:mS�_��l����$8�!I(�(��R�h�$������4I)�c'����A��[<��. �y�T<�M�3`��a�K>N3�*(��i:��/lӣ�Y���Ƶ���#
2�l��<x�$%M�f���Q���ؒr7���T�h�T�^s�8a�}��g<��2z�d{�N��$��}�ƮhO��_<��s���	�u?E��(�	��fe��ޘְ޳���_�i�,�x�0;YN���H�
HlT�h�-�� n,m�)K�w�����oz�e_����cy�ĸ|����d嫫*S���<�;�!�m�gX���O�<�Y>B󗦪��_�n���K���J䭕���O���ߙ��O��E��#�]*b 'uZ$�oP!-���S�cˠ�P"�Qd��+_����8Y�����
ৃ��Sv��YP]m�z�HV* ��R�͆<�f:h%��|��O��O�P����@�b���͒��I1>���p��`���Yta��;,���N�+�)�֪���p��y/8���>jp`��7���:v��0��DAW\>� ��?�Ҿ�J&:�l|��	������W�-�������}3p���gi/&�N&����`z4��g�k��K0��gl�/��3���J�V��3���쏾z�[�&�w�n1�����⋱SS��n'╦�Rg�}�E��������N7oC;���0$�n0kN����- [�|�c�0�R�C�@��V�$0y.#�PL)��Q�2H��r�3��^��s�ҽ�֬,�%�x~ڏ
,�s�B�yY�@�t���}�ϬS��Tz�Oq~ �����,�+/�͇T@����LKH����@!�T���, ��@%j����g':���0���	ר��ra��p�~�\~TBc�p��%��&!iN%��\;��[ YxX��[pU�b�B�%r�2�U��SbN-F:��G�A��x�CT�GfmI�%1*phq�3��A�P�ss�C�#�+S�[>T�O�V�,�ú�2���,�VF��/t֭a!�A�Ao��l�߬�,rؘ���ʒ�&�4 ��'DF�,g=z����N��X;,���\!���^.	J���Ý$���v���������P,PY�][3��Y �σ[!⊲5�1�;�����CP*�O�ex\�]p��\��Z���eq�,�B,X�)yR�O�Nꮘ�Ѓ�^e�UE�a�/�߼��8��:(��}'&<�7\(ą��e����y��6�#T:V��*z��"��w���Q{�Q���3JA�t��Z�'_㖣����=S�o����5\P��{�v��0�0��l����o$�z&n-Gӳb��6�-Z�S_Q�[��/�ɂJ�CC��gx��rO,����>�xs���DHq^� y��7��v��Ё�5�2�:\�A�J�k˅y�P��c�X�kdk�� �s��kuX�@��ğ��U(�顢~�X��3wL6Xn��f��hp-e�ܼS��v�%��D��a���Y �;����������A�?�Q ���
vU�cAk�D�_��7S������1<��%*��z�yzT_��g]�T/g��Pl���͠�X嵑��I�Ed������4��m�	��"��x�dL�d�:7ǡ)�x���O�[#�� ����4��X���a����&����ºC����N����ec����&b|� 5�@q�~n<:X�Sk�_Ҷ�[{:IF��e-�q��I:�n��F�$ܘWg�dIt��Ue�
Iq��2:���X������2���}�K��_Q�?�      
	      x���[�$�q@����2�E�ZA�
�V�H͐s!�� �twެ�S�������5~���������/���[���?��,��^�ׯ�������K#��t�ҩ��\��қKC-}�t����ң��\z���-�ߴ�ץ3������4k���f���Ҭ5B-�Zc��Yk�4k�k�ެ5�����f�9�Ҭ5�Z���RK���4kͭ�f�y�Ҭ5�Z��V���Ҭ��Y��֚ji�ZK-�Z+�Ҭ��Z���QK�ֺji֊�+�ҬC-�Z1�ҬK,�-kE��Yk����Ҭ��Z���TK���_���x��Ҭ�}��4k}��fi��>��Ҭ�}ʋ�=k}��fi��>�X����C�4C}�fi��>���}��Ҿ�#@]c_^[��
����H�o/��������_��頿������d�_^]�����sq��/+�ЖKE��K*���Qq-����JST㿦D�N���\�<��w��w���W������Q"{;Idp�l���$#r�Q��F
3)C�l��_��4s*l�̩�13���̜N��A#s:gdN�*�̩��2�B�ʜ�+)b�l�������F�B������FJ+)\D6R��l�h�H�"���n�D^��=��뿺�F^���5����y�W�x��\aw˕���h
j;o��{!;�[!;�;!;_yuwc�+�nn�|�ս������ɗR���K�xq�T�8�R*^�|�+^�|�/N��'_tŋ�����������W^���+��p�Wh���+	�|�n��J7_y%�������W^I��O����FJ/)	�l�$𲑒��FJ/)	��?|$�����HA��l�$�[�ъ�e%e��2��@o���gh���8�[~,*����
���A��M������u��=�u�M��,�k}�y]R��3�����	���L����=(����l�G�R8�#k��#k��#k)I���%��J}dE�>2�2B�@!��L���y�:��rB��W�!:��2EGr
�P�V�+:��+��Z
}e-%�������O����;�7?���՟���Җ����k��]�����RP_��R�+�W�A}�HA��|_)	���+E���}�,�W��
C=�}� �|_9E�r���<Y�y(���Pd-�ȏ�ȏ�x�Tyh�\�<��"�n���G��G��G�����C;8�L�<�3�����C'8�|]rN��9'?�rN&p�9�@�0�'8�L�<t�uuȹ��vȹ��!�f����������������r�uury��vry��;��|��\^��J.���<���w�����ȿ|��E�eu�-���h�@]�G��"?Z&P��2��ȏ�D�"?Z�R�Ѳ��ȏ���E>�>W�B{��ȥ���v���Iq;H{������=����r�wu����\�v���-u;HG&p�BG&p�BG&p�BG&p�BG&p�BG&p�BG&p�BG^�BY�c3F�r;Hg�r;>f�ܖ��aݞ��a妏�v}��}���}��6~��v~̬�~���v����v���%����p�Z���{l�|�}�+�n_����ۗ��=����|(���塱�=�<4"�����uRt�N�N��I�i�:9:�:9:E�rt����Y��)�����Z�N;k9:���贳�����p��槆�D4?5'��)�8�Oǉh�|�)͑�?%�9���D4G����������2G�Rx�#k)<͑����Z
Osf-��9���ӜYK�iά�D4g�R"�3k)͙�����ZJDsf-%�9���\YK�h���D4W�R"�+k)͕��nؕ��vؕ��~ؕ��]��Zr�k֒�\����Y��t��嶺F�r{]#k�-���ܙ��Z�LMd-w�&��;SY˝��Y˝���g�35;�lw�f�������ݙ���;S���;S����˾�*g��r���i�T���K��r�%uv9��:��|I�]N���.gK�]�ɥ�.'k9�����r���? �.� 8�������? �.7k9�ܬ��r�����Z�./k9�����򲖳��Z�./k9�����򲖳��Z�./k9�����Z�RvY-k)�����]V�Z�.�e-e�ղ���jYK��Z�N�Z�N�Z�N�Z�N�Z�N�Z�N�Z�N�Z��N�Z��N�Z�.�g-e�ճ����YK�e���9���J��]�w%~�X�w%~�.�?g��]���������e}W��첾+�svY��Rc�5���˚YK�eͬ��f�RvY3k)�����]��Z�.kf-e�5���˚YK�e����V�RvY+k)�����]��Z�.ke-e������ZYK�e����V�RvY���]Vd-g��Z�.���]"k9�D�rv����Y��%���Kd-g����]v�rv�Y��eg-g����Q��첳����Z�.;k9����r�����Z�.߫�a���{�s������Zŗ/@�U~9��
0�V	�\�*�Ze��r�C���ʵJ1�n�1�n�1�n2�nN2�n�2�n�2�n3�nN3�n�3�n�3�n4�nN4�n�4�n�4�n5�nN5�n�5�n�5��`�nJ6��h�n�6��p�nJ7��x�n�7�覀�nJ8�馈�n�8�馐�nJ9�馘�n�9�馠�nJ:�馨�n�:1��f����*�nr�
�܄�Q'�Ԍ�Q��Ք�Q�l՜�Q�tԤ�Qߊ�Y+��B�i+��g��^0㝘�Qމ��v坘tSމI7坘tSމI7坘tSމI7�XtSމE7�XtSމE7�XtSމE7�XtSމE7�XtSމE7��)�D��y'��ts�	�9�ݜw�n�;A7睠��N��yg��yg��yg��yg��yg��yg��yg��yg��yg��yg��y���y���y���y���y���y���y���|�S[��wNm�Q�9����έLn�\�Ly��?Ly��(��1s��!4�K7�K7�K7�K7�G7�G7�G7�G7�G7�G7�G7�G7�G7�G7��覼�ݔwv����ntS�ٍn�;��Myg7�)��F7��覼�ݔwv݈W���K��ή�_�馼�;ݔwv�����tS�ٝn�;��Mygw�)��A7�=覼�ݔw�����tS�كn�;{�Myg�)��Q�}�w���5�;{֗Y�;{֍ �=QjV�����Ξ5�F�ӝu�]Mԝ<_��ԝ��Su����N��ɺ�n�;{����]ts�x��,�E7坽覼�ݔw�����^tS�ًn�;;覼��n�;A7睠��N��y'��ts�	�9�ݜw�n�;�n�;�n�;�n�;�n�;�n�;�n�;�n�;�n�;�n�;�n�;�n�;�n�;�n�;�n�;�n�;�n�;�n�;�n�;�n�;�n�;�6�(����Iy���[�Q޹�Py��x�[sT޹uH]y�r(�y�	�y���y���y���y���y���y��M>{�n�;�n�;�n�;�n�i�n�y�n��n��n��n��n���n�;��My�4�)�F7�S�wN}9��s�ƶ�Ω_
�wN}�*�N7��馼s:ݔwN�����tS�9�n�;g�My��)�A7�3覼sݔwΠ���tS�9�n�;g�My�L�)�I7�3��!�3�Ɗ�Ι��3k���Ι��h�3k"�z���;g։/㝳�\��s��w΢���YtS�9�n�;gBy�,�)�E7坳�架�覼s�n��LA7睠��N�M>��n�;A7睠��N��y'��ts��ts��ts��ts��ts��ts��ts��ts��ts��ts��ts�9ts�9ts�9ts�9ts�9ts�9ts�9ts�9ts�9ts�9ts޹ts޹ts޹ts޹ts޹uDy��w�~ɖ޹5~Oy�ָ�[�˕w^�R�y�	Zy籁�y����Σ��Σ����s�yts�yts�ytS޹�n�;��My�6�)��F7��覼sݔwn����mtS޹�n�;��My���I�l�:t��NY��wn}��eY7���,�,�<���rO��tsϴ�tsO��tsϵtS޹�n�;w�My��)��A7�;覼sݔw��tS޹�n�;w�My�N�)��I7�;馼s'ݔw    �Νu�7޹�f���Y���w�Y6�;wաq㝻�����]�Y�x���c�s_�)���&坻覼s�0坻覼sݔwn�My�ݜw�n�;A7睠��N��y'��ts�	�9�ݜw6ݜw6ݜw6ݜw6ݜw6ݜw6ݜw6ݜw6ݜw6����&��M7�C7�C7�C7�C7�C7�C7�C7�C7�C7�K7�K7�K7�K7�K7�K7�K7�K7�[�|�wn�S�y5�Fy���n�W��w^m*V�y�!Gy�՗Y�;�A�;D9�<��;�n�;��My�5�)�F7��覼�ݔw^����ktS�y�n�;��My�5�)����j���Ϋ���;�6�+�� �����c�W7^�w^�Ң���^y�u�)�A7�7覼�ݔwޠ���tS�y�n�;o�My��)�A7�7覼�&ݔwޤ��ΛtS�y�n�;o�My�M�)�I7�7馼�&ݔwޤ�����%rX���%rZ���%r\���%r^���%r`���%rb���%rd���%rf���%rh���%rj��)＠��N��y'��ts�	�9�ݜw�n�;A7睠��Φ��Φ��Φ��Φ��Φ��Φ��Φ��Φ��Φ��Φ��Ρ��Ρ��Ρ��Ρ��Ρ��Ρ��Ρ��Ρ��Ρ��Ρ��Υ��Υ��Υ��Υ��Υ��Υ��Υ��Υ��Υ��Υ��Σ��Σ������r��{�א��[�U�y�k����m�*��k����]�*��k��ʽ���x�ŝ�F<�b�)�|�i���-&�BϷ�zJ=�b�)�|����-&��Ϸ��J>�u
*�|�)���-���Ϸ��J?�b
*�|�)���-��з��J@�b
*}�)��۠�Bз��JA�b
�g��AA�o1���T�SPQ�[LAe�o1���T�mRPq�[LA�o1���T"�SP��[LAe�o1���T*�SP��[LA�����T2�SP��[LAe�o1'����KR:���W��[̆�o1�&) }�����[�E�o1C����&:#E��qF�:�u��)jW�3RԖ&g������n�9#m
J#m�H#m
J#m
J#m
J#m
J#m
J#m
J#m
J#m
J#
J#
J#
J#
J#
J#
J#
J#
J#
J#
J#]
J#]
J#]
J#]
J#]
J#]
J#]
J#]
J#]
J#]
J#=
J#=
J#=
J#=
J#=
J#=
J#=NI#=��J#=��H#=�(rF�{,�H��g�ޘ������z��=�H�ձwe���̘2Ro��Z��ڭ���[}է���C���⡌�k�3R���H�f/9#�\����ԟ3R�-��H���9#������}Ng�^�wF���wFꃂ�H}P��
:#�AAg�>(�������3R�tF꓂�H}R��O
:#�IAg�>)��'�����3R�tF꓂�H}Q��/
:#�EAg��(�������3R_tFꋂ�H}���/��8#�� g��	�F
H ��F�F
�
J#Cy���N�;#EsF��K���i�Wx�H��e9#�B�3Ү�3Ҧ�4Ҧ�4Ҧ�4Ҧ�4Ҧ�4Ҧ�4ҡ�4ҡ�4ҡ�4ҡ�4ҡ�4ҡ�4ҡ�4ҡ�4ҡ�4ҡ�4ҥ�4ҥ�4ҥ�4ҥ�4ҥ�4ҥ�4ҥ�4ҥ�4ҥ�4ҥ�4ң�4ң�4ң�4ң�4ң�4ң�4ң�4ң�4ң�4ң�3�h�NqF��i��F�~�3�h\���Fc�3�h�tF�y;�H�qX�i�:饌4Zm�VF?�pWF?@UF?OSF?��PF?s������Ge�Q���F�pFuV�i�Fwg�Q;Ĝ�F}U�4ꞡ3�(<;#�z9#�AAg�1(�4��Ơ�3�tF���HcR�iL
:#�IAg�1)�4&��Ƥ�3ҘtF���HcR�i,
:#�EAg��(�4��Ƣ�3�XtF���HcQ�i,
:#�EAg�tFAAi���i�ஂ4Rpy�F
K#� ���Q:�H�9ti���4Ү���H�v9#��:�i�}!g�]@rFڵ�i�<Gg�]Ð��6��6����������������������.��.��.��.��.��.��.��.��.��.����������������������f��3�ltF����H�Q�i6~�wF����3�l�*vF��A�H�1%�i6��;#���,g��٢�4����4[��4����4���4�M+#͟Q��H�gΑ2����4�l�3ҬM��H�v[9#����i��7g�YuF�U�i
:#�AAg�9(�4'��椠3ҜtF����HsR�iN
:#�IAg�9)�4'��椠3�\tF����HsQ�i.
:#�EAg��(�4��梠3�\tF����H3(�4���HAAi���4RPP)((�\����1��H�?i�` �4��ظ4����4�f#�4�fG�4Ү����v�cqFڅg�]����vMatF�5�����g�S'���������������4ҡ�4ҡ�4ҥ�4ҥ�4ҥ�4ҥ�4ҥ�4ҥ�4ҥ�4ҥ�4ҥ�4ҥ�4ң�4ң�4ң�4ң�4ң�4ң�4ң�4ң�4ң�4ң�3�jtFZ���H�Q�i5
:#�FAg��(茴��V��3�jLvFZ��|�H�3��iuw;#��)'g����댴�y��H�6ꌴ~�ԥ��~s���~fD+#����H�g*�2��9����~Ω)#����H�v.9#��
�iս,g�U�sFZ��sFZ���HkR�iM
:#�IAg�5)茴&��֤�3ҚtFZ���HkR�iM
:#�EAg��(茴��֢�3�ZtFZ���HkQ�i-
:#�EAg��(茴���H+((��F

J#�����HAAi���4RPP)((���d��oqg�3Rޓ�㲿œ��HyOF��ǯ!'f�7���򞌜��-��X)��ȩ�}
J#
J#
J#
J#
J#
J#
J#
J#
J#
J#]
J#]
J#]
J#]
J#]
J#]
J#]
J#]
J#]
J#]
J#=
J#=
J#=
J#=
J#=
J#=
J#=
J#=
J#=
J#=
:#E��3R4
:#E��3R4
:#E��3R4
:#E��3R4
:#E��3R4
:#E��3Rt
:#��)l�'����ϔ#����be�ȧ{�!����k�)����be�ȇ2�9ۑ����Q~v�v
:#Š�3R
:#Š�3R
:#Š�3R
:#Š�3RL
:#Ť�3RL
:#Ť�3RL
:#Ť�3RL
:#Ť�3RL
:#Ť�3R,
:#Ţ�3R,
:#Ţ�3R,
:#Ţ�3R,
:#Ţ�3R,
:#Ţ�3R��"((��F

J#�����HAAi���4RPP)((��)(��)(��)(��)(��9(-��91$���:+���C"���2EisWA�py�F:�s�F:6�F:L��F:�F:�F:�F:�F:�F:�F�$g�[+��n��tF�5���ְg�[����nm_wF�����RP�RP�QP�QP�QP�QP�QP�QP�QP�QP�QP�Q�i7
:#�FAg��(茴��v��3�ntFڍ��H�Q�i7
:#�FAg��)茴;��v��3��tFڝ��H�S�iw��8#��Wg�]�<wF���Pg�]��rF���	g�]S���v�tF�5��iׁtg�]'���vmQvFڵW�iחV�H���8#�b�3Ҟ57[i� ���gMRRFڳF
(#�Yg딑��M��H{�n+e�=�kGe��(茴�����3�^tFڋ��H{Q�i/
:#�EAg��(茴��vP�i�����HAAi���4RPP)((��F

J#��6��6��6��6��6��6��6��6��6�P��6�1��_LH#~C�F:\�������C���r���ƥ�秤�����.��.��.��.��n�ytF�5�����g�['���nmwF��'��՗��H��9#=
J#=^7i�GAi�GAi�GAi�GAi�GAi�GAg��(�t��N��3�itF:���H�Q��4
:#�FAg��(�t    ��N��3��tF:���H�S��t
:#�NAg��)�t:��N��3��tF:�trg�S��tF:��*g�SnpF:5����(?g�S3m��N�vF:u����v_g�S�^��N}�t�N�3�)8#�IAg�3)�tfM%RF:���+#�Y�Ԕ�ά��Hg��%e���+<e���^�2�Y�:e����9#�EAg��(�t��΢�3�YtF:AAg��F

J#�����HAAi���4RPP)((��F��F��F��F��F��F��F��F��F��F��F:�F:�F:��F:��+�t�ؗF:��F:ܓF:L��F:��F:�E�F�lʕF��N�F��F��F��F��F��F��F�u����i2g�W۪��^�/rFz�E�3ҫ;N�H���������((��((��((��(�t��n��3�mtF����H�Q��6
:#�FAg��(�t��n��3��tF����H�S��v
:#�NAg��)�t;��n��3��tF����HwP��
:#�z,�3ҭ�c:#�z��3ҭ� 8#ݚ�tk,�3ҭ�0�H�J;#�:1�tk�3ҭ=$�H��LqF�uW������N
:#�IAg�;)�t'���3_�Hw��ge��j�2�]�u�2�]u_H��2�]�R�M��t��3�
:#ݠ�4RPP)((��F

J#�����HAAi���4Ҧ�4Ҧ�4Ҧ�4Ҧ�4Ҧ�4Ҧ�4Ҧ�4Ҧ�4Ҧ�4Ҧ�4ҡ�4ҡ�4ҡ�4ҡ�4ҡ�4ҡ�4��#T�0�W�0�N�0�E�r�Y�r�G��U��C��4��wi�KAi�KAi�KAi�KAi�GAi�GAi�W[���^��qFz���3ҫ�7�H���jn�3ҫ��H�&))#�FAg��(����^��3�ktFz���H�Q��5�8#�FAg��(��:��^��3��tFz���H�S��u
:#�NAg��)��:��^��3�tFz���HoP��
:#�zĶ3ҫgM:#�z�3ҫ�8#�����jĜ3ҫY+�H�;#�:}��j�3ҫ��H���pFz��3ҫK�3қtFz���HoQ��-
:#�EAg��(��V��QFz��ZRFz��(#�U�PFz��[+#�Uc��^Լ#e�u��)((��F

J#�����HAAi��u�F

J#m
J#m
J#m
J#m
J#m
J#m
J#m
J#m
J#m
J#m
J#
J#
J#
J#
J#
J#
J#
J#
J#
J#
J#�=;g��=;g��=;g��=;g��=;g��=;g��=;g��=;g��=;g��=;g�=
J#=
J#=
J#=
J#=
J#=
J#=
J#=
J#=
J#=
*#��(���-��2ҷ���H�b
*#}�)���-��2ҷ���H�b
*#}�)���-��2�h���H�b
*#}�)���-��2ҷ���H�b
*#}�)���-��2ҷ���H�b
*#�6(���-��2ҷ���H�b
*#}�)���-��2ҷ���H�b
*#}�)���-��2�h���H�b
*#}��.9g�[<Yl��-^,6F�����ś��H���bc�o�e�1ҷ���i�o�s��ŝ��H�b
*#}�)���-��2ҷ���H�b
*#}�)���-��2ҷ���H������F

J#�����HAAi���4RPP)((��F��F��F��F��F��F��F��F��F��F��F:�F:�F:�F:�F:�F:�F:�F:�F:�F:�F��F��F��F��F���F��d�F�l�F��m�F���F���+���ؗFz��FzܓFzL��Fz�Fz�Fz�Fz�Fz�FztFꍂ�H�Q��7
:#�FAg��(����z��3RotFꭾhSF��8)#�^�RF���H���Ke��k��2R�5A��:���;��z��3R�tFꝂ�H}P��
:#�AAg�>(�������3RtFꃂ�H�*�����H�3��k޾3R����H�&�9#�E���L�3R��&�H�6^:#�ځ����V�3R��I��z}8;#��4`g������a���⠴3R_tFꋂ�H}Q��/
:#���3R
J#�����HAAi���4RPP)((��F

J#��/䌴H�H�V:#�M錴kF�3Үa�H�N�9#�ھ)(��)(�t((�t((�t((�t((�t((�t((�t((�t((�t((�t((�t)(�t)(�t)(�t)(�t)(�t)(�t)(�t)(�t�)�t�' ���a.����Q��*����+��^'����"��8�,��8�#��((��(�4��F��3�htF���H�Q�i4
:#�FAg��(�4��F��3��tF���H�c��F����H�� Ie��k��2��5R@i�:[��4zm2WF�v[)#�AAg�1(�4��Ơ�3�tF���HcP�i
:#�AAg�1(�4���H��T�4�=�H�f�;#���4j��3Ҩ��H�η:#�:��4jǣ3Ҩo�F��vF���3Ҩ:g�����4#朑�b֊3�X:vF��7�Hc��i��FPP)((��F

J#�����HAAi���4RPPiSPiSPiSPiSPi�tkg�]c��v�;rF�u��i�	8g�][���N�rF:��3ҡ�4ҡ�4��u�F:�F:�F:�F:�F:�F��F��F��F��F��F��F��F��F��F��Fz�Fz�Fz�|�Fz�&���8�Fz̿�Fz��FzLD�Fz�Fz��qF��͢�H��k�i6
:#�FAg��(�4��f��3�ltF����H�Q�iv
:#�NAg��)�4;��f��3��tF���1*#�^S���f����H��95e�9jö2��sIi��
Oi�����4����_�4��栠3�tF����HsR�iN
:#�zر3Ҭ��9#�z��3Ҭ9��H��:#͚�4kD�3Ҭ���H�M8#��=�4�ktg�Y����f���4�C�i.��:#�Ÿ6g���[�4x��fp��i[:�����H�M~i���4RPP)((��F

J#��6��6��6��6��6��6��6��6��v�rF�u����i2g�S۪��N�/rF:�E�3ҩ;N�H���t�;H#
J#
J#
J#]
J#]
J#]
J#]
J#]
J#]
J#]
J#]
J#]
J#]
J#=
J#=
J#=
J#=
J#=
J#=
J#=~����d��Cդ��E��V㘭3�j�7qFZ����H���i5n�;#����H�Q�i5
:#�FAg��(茴:��V��3��tFZ���H�S�iu
:#�NAg��)茴:��V��3�u�]i�:󥌴Fm~VFZ�v)#�Q_�)#�Q�����( )#�Q+��֠�3�tFZ���HkR�iM
:#�IAg�UvFZ�=g�U��qFZ5S�i�pQg�US���V��pFZu��i�g�U;�V}%팴�ެ3Ҫ_R��V��:#���Wg��}挴� �H+8+��
�F
�GJ#������H�o��H�G�4RPP)((��)(��)(��)(��)(��)(��)(��)(��)(��)(��)(�t((�t((�t�d�3ҩ-��H���8#�������g�S�qF:57��� Ig�KAi�KAi�KAi�KAi�KAi�KAi�KAi�KAi�Ki�KAi�GAi�GAi�GAi�GAi�GAi�GAi�GAi�GAi�GAi�GAg��{2r�����X)򞌜��-�,VF��'#�l����H��d��o�a�2R�=9g�[�X�����H�)����H�)����H�)����H�)����H�)����H1(����H1(����H1(����H1(����H1(����H1)����H1)����H1)����H1)����H1)����H�(����H�(����H�(����H�(����H�(�AAg�
J#�����e�lG�@�9ۑ?Pv�v�f�3R;#�e�3R<;#햋���O��s�cSPiSPiSPiSPiSPiSPiSPiSP�PP�PP�PP�PP�PP {  �PP�PP�PP�PP�PP�RP�RP�RP�RP�RP�RP�RP�RP�RP�RP�QP�QP�QP�QP�QP�QP�QP�QP�QP�Q�i7
:#�FAg��(茴��v�`�3�n��pFڍ���H��3�n�|vFڍ��v���iw��:#�� 8g�ݙ�⌴;��v��3��tFڝ��H�S�iw
:#�AAg�=(茴�����3�tFڃ��H{P�i
:#�AAg�=(茴'�����3ҞtFړ��H{R�iO
:#�Y������K�H��Q��H��q�H���)�H���;#��錴k��3Ү�H�N:#��rk�3Ү/a��vݍtF��rg�]�Oi���4RPP)((��F
�AH#���oƥ��[��H�ߕ��6�H�)��H�qm�H��%�H���H���H���H���H���H���H���H���H���H���H���H���H���H���H���H���H���H���H���H���H���H���H���H��9#������'g�W�rFz�wpFz�Fz�Fz�Fz�Fz�Fz�FztF:���H�Q��4
:#�FAg��(�t��N��3�iTF��U�����t�������_�����<?�      	   �
  x��YAv�8\#���GH�Z�e'+�g%�����$3Cn�rھQ��3�bS�$(�iNO^�MK�\�_�~}P��޲�Ҭ-��+m*v�{��]T�1[�E�I�pֲ%����=��z���la7lz>��ǌ�DER���\F�ey*��T��-�)���8)�]�����%<�?�p���uS.���V��l��mCH7ec.�4Jb�b��ZۍyL��������i"".�e*-"Q�xq��SQR��+����=�j�����4��lv[6�Mcߕ5��7!�>�t�jt}�����)��9�e2ʅ �`�R�Fi���q��%����K��fiٻ�6K����h��	 N��՗�Z5fie 쥮v���M���_��b�,UxL�1�C ��^6F�Y��5U�~��{݌�5����������_�����,�@ ����R1[�D���ҏZC#��}��\V�= K�$oB�-J]�ฌ��d$���c�j���9�3]�Ы�����?�������uԥQLU���`Z�W���h����t��IR���
�s�� �"����.!�y���؇榬���3��%5q����Vf�ί��hf��b��0�L��9�ɸ�e$�b��[��i�hiF�-p���'i���.������=�r�Dp �n��h�Lcx���Z[��8�]��$���i$�o�*M��E�����o����ΰ��\j��v�΍��e[A�%��	d�J@�9��`H�J�&��`*?k4~ޚ��Kî�g��D7�!>�̽9:���ݞ5d	a�UԜPA�B��d*�x��Di1���$�-��7(#U�i���غm��Z�m�>Ojub�֌滻�l4���nۖp4WQ�1��@_a�hl>��<>�+O����_��x��+4���
Wx��G	U��M��uiG��ܒ��Y�EY^Le�CBe��,�H�SAM��_x��	�,��`[��0�9�V{�8���*�r�S�L=><Vd��v����:�#>��G[v�P#Rƥ&+���i���#@ �r�`P���D�SHi�w��;G�Xv��Lm�3N�3���D�O猒r�ʆ�qVT�;�O+ W7�i-�w%��h��!�F�pr5I�Z),&��r9��l�Z��X���}Y��
;@����jp��tM:G�C��zi0% z�I�㎻��V\jg#����(8g�9/���l`��׹�/��&�?�5�UnN��nlMRZ�G�]�d�O��6kd\���l ��VI{�ֆ��m��e$�+{��룷Y����1v;��}���3N~��@tI0I�+#jv�W�]Sl!�L߱
H�`��~-L�,��(a+T�\~�(M�z�aKEQ'����A��`����t~��=#s����4.C0�zf*"�Ϟ1z�A���r�3���A<,7��|yԗA�	��9E8ҿJtD��n5�7�Q�w�i��PI4`�i��*.�I-��Aud�PvI�и��X���W�5,�~����LW�&X�,�.@J;���i� <K�ϖ����n��VW�k��d�� �b��k�&`��9Ą$��ߥ��14H�x�6�B<�˯m7��5���_�h�IS,H{��+��p��Й�}���x��wT������sB2�5�'�)�QT�d :���"��� :boM��K[?����K�#*��{�4]����2MZ���ֻjĦMm�T�ƀ,�G�7�-�OF\p�ܱ��qH�������G]Áa��O�����aB���$�r��|�ԝ��I!!��b�64������/����L'��_��@��k�p*�GF���hZ�`��Iѯ�s�O�3��#,���f]R��Z�)AѪ��zdlqߘ���}u�����q�اΡ�鬟/���B�ii��t����嚪E�d<0r#�X�3�D�\��AM��os�3w�Z*�a彩�
��Ї 2h�b;B*ञJ�����`����ԋ�f&�g�T�>[���?��S�{XYR����ijM<�}��F̕��ެ�	P�th���r�Πدhg�:�=�qׇ���墵��t�F�wf�̡˕Mv�^h��j+�P-���������"˦��;2ŕ�t��/�����¯�T?Z��n�q��R��Kc�u��y*
���`���}�~~��=R���]2u�=��S {���c�/�W�i���ϟ|��{�lK���YԶ�kׇm���M�ez(�s3��A#"gt%�@e�S|ڟ�?bW�'��$5���I֦�W:%�Z�0q�`��k�E����3�˭mX.��R`��,C2�d^(��"#�����d3~��0)���Y�$`�A�.� "N��}����x��T��>�[k�h^v7����g����f��� �7���Ě���zw�]�ƨ,=�L����/�e�����M��	˔��}Ô��6�����I�,���9�0�*�����Gm��_�ͮ�w�P�O[�^x���7߳Uw��#֭����k���x"�R���ׂ����:�#������K�����S[��l^Dy��;;8'�,�O:)�i��c����!��>E��폊
�#��σ�p���O����M�|�&�wSN>��˲NbȐwzQ���َt��+���j�Bرg��	A��v��ŋ�@�d�      	   6  x��S�n1�}Oq/@E
tD�-t`i��b��tI��<P����X}�:�Z�)�#���礂5�}d��p�"Tc�����ۃP�P�BBa���b��Hb���BY�4�5�<���$��wW�����gC�w�}�]N�m`o�-��>���Ė���3c��������(ӄ�n�._7�e&�m�^�s�k���j��\�ƅt�Z�j�R��o&��(9(,��sC����pM]�/���\�s�鵦6W��-������4#�O�P�`�j�RTxI�]a`���2��/|Ϣ����t��/����(�oB�?�      	   :   x���  �7cB�����!}�
*

�mtS<������8�<�=%ͷH~��
�      	   �   x�M�K
1@��0e�$3�.��l
���ܿF������������H��j}�>��h�@UU��U3 �l�8�Ugq�C)Nx�H
�2p܊���E�[9'�#{��E���ߠI�!pvG
���.+��s���`n����5�c      	   0   x�%��  �wƳ��0�?�\�$�#�e�D�KnY ����������      	   �  x����R�0���S���N�$��(6Ѝ67҅��%�d��O��oмX��&$��O;0�lI���͑�=6��p� �cȁc���0H�3��,��̻��ov����q2��	=�0�w	�d}&����.ȥ���ÖZ��D�æ.�y�� ��3q��j�e������m�k\-��wYb!7��v��e�)w�NТ�J�+���eΒR�Y���A�:�br?���C��'.��|bX���,�N�)�6��k��!h@��,�)\a��EY7Z�/MO����w�\:~Ѹ�J�5�����n��f����M�	;,�̐g�B;x������d�RV*Xþ���w����6Ig�}c�-�eGO�h9��&oO�nq�$�9lG0,l�c�]Љ��ѿ��Z��_��ZFK*�K)�7��h��U���շ+(�<����Q��p_�ʺ_����ܱ2,�K�B4�Q�bVh�� 
B��h�C�o"�?�:"�m�!��4�{�%��q��7(�.�]��~A2h�!�� ~Ik���5fG���1��G��g1l4~g@u�ɦm�����`�QTkYi����M�N9N�ӗbJbv�sPeD'��RL�w�4lǴF�r��d���tZ�)�����=� �9T�me�����^���T�*�      	   �   x���M�0���S��0l��p�&l�4m1MJk:�[y
/fA�+��,���}�à�^����C;ޔ�k��p�8��#7
S`۬J2��
Z�A���C�>��t68���)�>�J�p��jT�8�
�|X-VE$�����X�ߌݼz�����|�7��P|{h{���G�3�K	!/�Kd�      	   �   x����0�V1�"���%�ױL�`���z�`\��������D�]�=�} D�4L�f����8�|;q��18���������J.%��K���=qO\k��rj9��Z�ݱ;v��42�L#�Ȭ4+�JS�T0�Mz�ޜ1g������U�a�0      	   y  x���Kn�0���)t�8����5�q8� 1�X��$��&�M�]d�#�bR�DIBe����!93��[ɞ ��HH���5�1��g��4�1����q��͵������ID�R[���2��/&媀Dи���Y=0���G�'�'����s�G�o��"H�Y�7��B+k؂��I�v�� 6�.rN�`g����U�c�D�"ʞO�Z��Z��K�q�'�ʴ@�v�|o�>�J^Ð|f��"G�W˄"�mFy56��{n��=����JG�X#�/6���R�#�q����d��1΂��R��v��Se�}��܋�c(�I���*+��N�I�����r2 ��T�\��m"���:�������&
�th	�1�?����$d��w���������pp4iP�ކ8nw����9�l�5�)��������/�B�c�Id|H3���%
/�)tU�;���Xk�nZ������H{u!��f����k��<{�m*��27�y7���	8hV42Ҵ�k�b6�'�fu�t�����˯�]��#�"����r��5�������t���z!clt�b�\H�b/�%�$C�ti��;���ROٵC��J�\x�z~��^��e\J���T��ύng��jș�t���I�{���8�_�}�$�k�p��''O��FU�}��������&��23���1�����M�-ꂀ2�YU�q%@�"c�C�X;��a^_�n��Lx0;�pL�,xC@2Lᛲ��o���,���V��N���!/��nM�q�s&!��5��2�if�ڌ�l�_u�˃[�3@Hۆ��.޹�B7��&ٿG>Zu\��
!���w
�w��K��m�,A{�=�VZ�~\M&��2�$      	   O   x�3�t�K�O9�9/93�ӵ�$Q!�X�4/Q!%�8�(� 9(�(�d��̼���|�.CN�ԼԢ�Ҵ��qqq 4[*      	   �   x���;�0@g��@QS>���KA�vI�Ej��8�b�z1B%V� y�l?Y��P��v�H-�r$�oD�)'Q�Rϓ	IB(HZ�@�g|��,���Т��x�jM���z�!��7p�y"崋�Biњ�&vPj����[�M��0AD\��JZ��?�w�c����w**�gp�EK\p�|��F~Y�b����7�      	   }   x�%�1�0E��T�-+�؍�iPp��'�z�:T^���]b���GR���e��ӑ�Z�AO��~��X&� �ˇ�8	�0:���[ř��ϢE��L�����y8Co#�\�R?+�+�       	   C  x����n�@���O� ��������ҨJ��&7cXlR`��8Rި���~��r��J��������j�11ۣ�X~\�ff$spA�(��{�>��[+��<�8-�"Z���	:���a�b�aq���tK�\)��n�F�0m`������9v�u�����;�k���/#����=���_tt%�B3�[�:�|�q��ӻ�W�,DY"�~���Y�|�Cv��R����V�O�T�i�f*�S�)Z(�2d\�U&K�J^�,Q"��1O�wy�~���G@��%5����kH�y��Z�%�S�Fq<'4<��(�1�6���F�A�R�[�O`��x�ʽ��5���,�+T���ⱬ�x0*E�a��Z�'�}^�cG�ӭ}]� Ȫ����[�ڵ���}��yl� ^�sQD�Q�r���ˈ�՗�<|��֠�[�zZ�'�����1,�}o�N�ꊵ��hZù��Z�+�J����J���A�kTgk*ڛ�����6��ڨ�u��G+uD\�S>�֎�kw6I��AM�x�D�f�<s񡡙�*�`���3y2'��o�I�     