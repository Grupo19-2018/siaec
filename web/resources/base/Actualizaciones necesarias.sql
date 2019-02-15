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
update public.submenus set submenu_url = 'mantenimiento.xhtml' where submenu_id=32;

