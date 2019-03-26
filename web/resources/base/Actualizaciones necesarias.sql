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
update public.submenus set submenu_url = '/mantenimiento.xhtml' where submenu_id=32;
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
