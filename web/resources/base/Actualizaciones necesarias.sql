--Fecha: 15/ febrero /2019
--Error en en la entidad de paciente_usuario_usuario
-- No existe la columna paciente_usuario_usuario
--Temporalmente agregada o cambiado la entidad. 

--Eliminando del rol Paciente los submenus:
--Mis Citas Aprobadas  Id 6
--Mis Citas Pendientes Id 7
--INSERT INTO public.sub_menus_por_roles(rol_id, submenu_id) VALUES (5, 6);
delete from public.sub_menus_por_roles where rol_id = 5 and submenu_id=6;
--INSERT INTO public.sub_menus_por_roles(rol_id, submenu_id) VALUES (5, 7);
delete from public.sub_menus_por_roles where rol_id = 5 and submenu_id=7;


