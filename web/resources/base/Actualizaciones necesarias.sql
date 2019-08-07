--Fecha: 18/ marzo /2019
--Lista de tareas automaticas. 
--Agregano la pantalla a la tabla submenu
INSERT INTO public.submenus(submenu_id, sumbenu_nombre      , menu_id, submenu_descripcion, submenu_url)
	                VALUES (44        , 'Tareas automáticas', 7      , 'Clínica'          , '/views/7_configuracion/tareas_automaticas.xhtml');
					
--Rol y pantalla
--Rol: Administrador/a
INSERT INTO public.sub_menus_por_roles (rol_id, submenu_id)
								VALUES (1     , 44);
--*********************************************************************************************************************
--Fecha: 18/ febrero /2019
--Arreglo temporal
--Eliminando del menu:
--Mis Citas aprobadas id: 6
--Mis Cita Pendientes id: 7

--Primero:
--Eliminar los privilegios del rol paciente.
--En la tabla privilegios por roles
--Mostrar todos los privilegios para el rol paciente
--SELECT * FROM public.privilegios_por_roles where roles_id=5;  
--Borrando privilegios del rol 5, Paciente.
delete from privilegios_por_roles where roles_id=5;

--Segundo:
--Borrar privilegio de pantalla: Mis Citas aprobadas id: 6
--Privilegios numero 7 al 9
--Verificacion de privilegios
--SELECT * FROM public.privilegios where submenu_id=6;
--Borrando de privilegios
delete from privilegios where submenu_id=6;

--Tercero:
--Borrar privilegios de pantalla: Mis Cita Pendientes id: 7
--Privilegios del 10 al 12
--Verificacion de privilegios
--SELECT * FROM public.privilegios where submenu_id=7;
--Borrando privilegios 
delete from privilegios where submenu_id=7;

--Cuarto:
--Borrando pantallas:
---Mis Citas Aprobadas id 6.
---Mis Citas Pendientes id 7. 
delete from public.submenus where submenu_id =6;
delete from public.submenus where submenu_id =7;

--*********************************************************************************************************************
--Fecha: 15/ febrero /2019
--Error en en la entidad de paciente_usuario_usuario
-- No existe la columna paciente_usuario_usuario
--Temporalmente agregada esperar las modificaciones globales del sitio 
alter table pacientes add COLUMN paciente_usuario_usuario CHARACTER VARYING(50);

--Eliminando del rol Paciente los submenus:
--Mis Citas Aprobadas  Id 6
--Mis Citas Pendientes Id 7
--INSERT INTO public.sub_menus_por_roles(rol_id, submenu_id) VALUES (5, 6);
delete from public.sub_menus_por_roles where rol_id = 5 and submenu_id=6;
--INSERT INTO public.sub_menus_por_roles(rol_id, submenu_id) VALUES (5, 7);
delete from public.sub_menus_por_roles where rol_id = 5 and submenu_id=7;

--Paginas en mantenimiento
--Gestion de roles. Manejo dinamico o estatico pendiente. 
--submenu_id = 32
--update public.submenus set submenu_url = '/mantenimiento.xhtml' where submenu_id=32;
update public.submenus set submenu_url = '/views/6_administracion/cat_roles_listado.xhtml' where submenu_id=32;

--Corrección de submenu ya que se cambió el nombre del archivo xhtml
update public.submenus set submenu_url = '/views/4_promociones/promocion_listado.xhtml' where submenu_id=19;

--Corrección de submenu y url de reportes
update public.submenus set submenu_url = '/views/5_reportes/rep_promociones_demandadas.xhtml' where submenu_id=20;
update public.submenus set sumbenu_nombre = 'Tratamientos Demandados' where submenu_id=21;
update public.submenus set sumbenu_nombre = 'Listado de Insumos Médicos Próximos a Agotarse' where submenu_id=23;
update public.submenus set submenu_url = '/views/5_reportes/rep_solicitud_insumos.xhtml' where submenu_id=23;
update public.submenus set sumbenu_nombre = 'Listado de Pacientes por Médico' where submenu_id=24;
update public.submenus set submenu_url = '/views/5_reportes/rep_pacientes_por_medico.xhtml' where submenu_id=24;
update public.submenus set submenu_url = '/views/5_reportes/rep_tratamientos_paciente.xhtml' where submenu_id=25;

--Actualización de tabla usuarios para verificación de cuenta
alter table usuarios add column usuario_codigo Integer;
alter table usuarios add column usuario_activacion boolean;

--Actualización de tabla usuarios para crear referencia directa a médicos y pacientes
alter table usuarios add column medico_id integer NULL;
alter table usuarios add column paciente_id integer NULL;
alter table usuarios add CONSTRAINT fk_usuarios_r50_medicos FOREIGN KEY (medico_id)
      REFERENCES medicos (medico_id) MATCH SIMPLE
      ON UPDATE RESTRICT ON DELETE RESTRICT;
alter table usuarios add CONSTRAINT fk_usuarios_r51_paciente FOREIGN KEY (paciente_id)
      REFERENCES pacientes (paciente_id) MATCH SIMPLE
      ON UPDATE RESTRICT ON DELETE RESTRICT;

--Actualización de tabla citas para crear referencia directa a pacientes
alter table citas add column cita_paciente Integer;

--Para dar privilegios de consulta de expedientes a rol asistente
insert into sub_menus_por_roles values(4, 11);

--Cambio de nombres a los reportes`
update public.submenus set submenu_url = '/views/5_reportes/rep_tratamientos_demandados.xhtml', sumbenu_nombre = 'Tratamientos Más Demandados por Pacientes' where submenu_id=20;
update public.submenus set submenu_url = '/views/5_reportes/rep_promociones_demandadas.xhtml', sumbenu_nombre = 'Promociones Más Demandadas por Pacientes' where submenu_id=21;
update public.submenus set submenu_url = '/views/5_reportes/rep_pacientes_por_medico.xhtml', sumbenu_nombre = 'Listado de Pacientes por Médico' where submenu_id=22;
update public.submenus set submenu_url = '/views/5_reportes/rep_pacientes_por_tratamiento.xhtml', sumbenu_nombre = 'Listado de Pacientes Atendidos por Tratamiento' where submenu_id=23;
update public.submenus set submenu_url = '/views/5_reportes/rep_pacientes_por_clinica.xhtml', sumbenu_nombre = 'Listado de Pacientes Atendidos por Clínica' where submenu_id=24;
update public.submenus set submenu_url = '/views/5_reportes/rep_citas_por_estado.xhtml', sumbenu_nombre = 'Listado de Citas por Estado' where submenu_id=25;
update public.submenus set submenu_url = '/views/5_reportes/rep_tratamientos_por_paciente.xhtml', sumbenu_nombre = 'Tratamientos Realizados a Paciente' where submenu_id=26;
update public.submenus set submenu_url = '/views/5_reportes/rep_solicitud_insumos.xhtml', sumbenu_nombre = 'Solicitud de Insumos Médicos' where submenu_id=27;
update public.submenus set submenu_url = '/views/5_reportes/rep_listado_insumos.xhtml', sumbenu_nombre = 'Listado de Insumos Médicos' where submenu_id=28;
update public.submenus set submenu_url = '/views/5_reportes/rep_citas_por_clinica.xhtml', sumbenu_nombre = 'Agenda de Citas Programadas por Clínica' where submenu_id=29;
update public.submenus set submenu_url = '/views/5_reportes/rep_citas_por_medico.xhtml', sumbenu_nombre = 'Agenda de Citas Programadas por Médico' where submenu_id=30;

--Para dar acceso a todos los reportes al rol director
INSERT INTO public.sub_menus_por_roles (rol_id, submenu_id) VALUES (2, 26);
INSERT INTO public.sub_menus_por_roles (rol_id, submenu_id) VALUES (2, 27);
INSERT INTO public.sub_menus_por_roles (rol_id, submenu_id) VALUES (2, 28);
INSERT INTO public.sub_menus_por_roles (rol_id, submenu_id) VALUES (2, 29);
INSERT INTO public.sub_menus_por_roles (rol_id, submenu_id) VALUES (2, 30);

--Update 75
--Para el envio de las tareas automaticas 
---Promociones cumpleanyos
alter table configuraciones add column configuracion_promocion_cumpleanyos BOOLEAN;
update configuraciones set configuracion_promocion_cumpleanyos = false;

--Se notifico al paciente sobre promociones sobre cumpleanyos. 
--False para no enviados.
--True para enviados. 
alter table pacientes add column paciente_promocion_cumpleanyos BOOLEAN;
--update pacientes set paciente_promocion_cumpleanyos= false;

--Se notificara al paciente sobre promociones generales. 
--False para no enviados. 
alter table pacientes add column paciente_promocion_general boolean;
--update pacientes set paciente_promocion_general= false;

--Para el envio de promociones generales automaticas
--Promociones cumpleanyos
alter table configuraciones add column configuracion_promocion_general BOOLEAN;
update configuraciones set configuracion_promocion_general = false;

--Update 77
--Pantalla para crear nuevo rol,
--Agregando un nuevo dashboard a la base de datos 
--Dashboard Vacio.
INSERT INTO public.dashboard(dashboard_id,dashboard_nombre, dashboard_descripcion           , dashboard_url         , dashboard_imagen)
	             VALUES ( 7          ,'Vacío'         , 'Muestra una pantalla en blanco', '/templates/dashboard/vacio.xhtml', '/templates/dashboard/vacio.jpg');

--Update 80
--Actualizaciones para dashboard administrador
--Actualizando rol
UPDATE roles set dashboard_id= 5 where rol_id =1;
--Actualizando imagen 
UPDATE dashboard set dashboard_imagen = '/templates/dashboard/administracion.png' WHERE dashboard_id = 5;

--Update 81
--Actualizando tipo de dato para fecha y hora en bitacora
ALTER TABLE bitacora ALTER COLUMN bitacora_fecha_hora SET DATA TYPE TIMESTAMP;

--Update 82
--Encriptando la contrasenia de todos los registros en la base equivalente a 000000
UPDATE usuarios SET usuario_contrasenia = '670b14728ad9902aecba32e22fa4f6bd';

--Update 89
--Agregar menu para bitacora
INSERT INTO public.submenus (submenu_id, sumbenu_nombre, menu_id, submenu_descripcion, submenu_url) VALUES (42, 'Bitácora de Transacciones', 5, 'Clinica', '/views/5_reportes/rep_bitacora.xhtml');
--Asignar privilegios a rol admin y director para poder ver bitacora
INSERT INTO public.sub_menus_por_roles (rol_id, submenu_id) VALUES (1, 42);
INSERT INTO public.sub_menus_por_roles (rol_id, submenu_id) VALUES (2, 42);

--Update 92
--Corrección de submenu
update public.submenus set sumbenu_nombre = 'Entrada y Salida de Insumos' where submenu_id=13;
update public.submenus set sumbenu_nombre = 'Historial de transacciones' where submenu_id=14;
update public.submenus set sumbenu_nombre = 'Pedido de Insumos' where submenu_id=15;

