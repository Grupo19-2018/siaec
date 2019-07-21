--Completo
--Pantalla Menú Agenda 1
--Registros del 1 al 6
UPDATE submenus set sumbenu_nombre = 'Nueva Cita', menu_id= 1, submenu_url = '/views/1_citas/cita_clinica_nueva.xhtml', submenu_descripcion= 'Clínica' where submenu_id= 1;
UPDATE submenus set sumbenu_nombre = 'Citas Confirmadas', menu_id= 1, submenu_url = '/views/1_citas/cita_clinica_listado_confirmadas.xhtml', submenu_descripcion= 'Clínica' where submenu_id= 2;
UPDATE submenus set sumbenu_nombre = 'Citas Reservadas', menu_id= 1, submenu_url = '/views/1_citas/cita_clinica_listado_pendiente.xhtml' ,  submenu_descripcion= 'Clínica' where submenu_id= 3;
UPDATE submenus set sumbenu_nombre = 'Histórico de Citas', menu_id= 1, submenu_url = '/views/1_citas/cita_clinica_historico.xhtml' , submenu_descripcion= 'Clínica' where submenu_id= 4;
UPDATE submenus set sumbenu_nombre = 'Registrar Cita', menu_id= 1, submenu_url = '/views/1_citas/cita_paciente_nueva.xhtml' , submenu_descripcion= 'Paciente' where submenu_id= 5;
UPDATE submenus set sumbenu_nombre = 'Historal de Citas', menu_id= 1, submenu_url = '/views/1_citas/cita_paciente_historico.xhtml' , submenu_descripcion= 'Paciente' where submenu_id= 6;

--Pantalla Menú Pacientes 2
--Registros del 7 al 10
UPDATE submenus set sumbenu_nombre = 'Registrar Paciente', menu_id= 2, submenu_url = '/views/2_expedientes/paciente_registrar.xhtml', submenu_descripcion= 'Clínica' where submenu_id= 7;
UPDATE submenus set sumbenu_nombre = 'Listado de Pacientes', menu_id= 2, submenu_url = '/views/2_expedientes/pacientes_listado.xhtml', submenu_descripcion= 'Clínica' where submenu_id= 8;
UPDATE submenus set sumbenu_nombre = 'Consultar Expedientes', menu_id= 2, submenu_url = '/views/2_expedientes/paciente_consultar.xhtml', submenu_descripcion= 'Clínica' where submenu_id= 9;
UPDATE submenus set sumbenu_nombre = 'Gestionar Expediente', menu_id= 2, submenu_url = '/views/2_expedientes/paciente_gestionar.xhtml', submenu_descripcion= 'Clínica' where submenu_id= 10;

--Pantalla Menú Insumos 3
--Registros del 11 al 15 
UPDATE submenus set sumbenu_nombre = 'Gestionar Insumos', menu_id= 3, submenu_url = '/views/3_insumos/insumo_listado.xhtml', submenu_descripcion= 'Clínica' where submenu_id= 11;
UPDATE submenus set sumbenu_nombre = 'Existencia de Insumos', menu_id= 3, submenu_url = '/views/3_insumos/insumo_existencias_listado.xhtml', submenu_descripcion= 'Clínica' where submenu_id= 12;
UPDATE submenus set sumbenu_nombre = 'Control de Insumos', menu_id= 3, submenu_url = '/views/3_insumos/insumo_control_listado.xhtml', submenu_descripcion= 'Clínica' where submenu_id= 13;
UPDATE submenus set sumbenu_nombre = 'Entrada y Salida de Insumos', menu_id= 3, submenu_url = '/views/3_insumos/insumo_entrada_salida_listado.xhtml', submenu_descripcion= 'Clínica' where submenu_id= 14;
UPDATE submenus set sumbenu_nombre = 'Solicitud de Insumo', menu_id= 3, submenu_url = '/views/3_insumos/insumo_solicitud_listado.xhtml', submenu_descripcion= 'Clínica' where submenu_id= 15;

--Pantalla Menú Promociones 4
--Registros del 16 al 17
UPDATE submenus set sumbenu_nombre = 'Registrar Promoción', menu_id= 4, submenu_url = '/views/4_promociones/promocion_nuevo.xhtml', submenu_descripcion= 'Clínica' where submenu_id= 16;
UPDATE submenus set sumbenu_nombre = 'Listado de Promociones', menu_id= 4, submenu_url = '/views/4_promociones/promocion_listado.xhtml', submenu_descripcion= 'Clínica' where submenu_id= 17;

--Pantalla Menú Reportes 5
--Registros del 18 al 28
UPDATE submenus set sumbenu_nombre = 'Tratamientos Mas Demandados por los Pacientes', menu_id= 5, submenu_url = '/views/5_reportes/rep_tratamientos_demandados.xhtml', submenu_descripcion= 'Clínica' where submenu_id= 18;
UPDATE submenus set sumbenu_nombre = 'Promociones Mas Demandadas por los Pacientes', menu_id= 5, submenu_url = '/views/5_reportes/rep_promociones_demandadas.xhtml', submenu_descripcion= 'Clínica' where submenu_id= 19;
UPDATE submenus set sumbenu_nombre = 'Listado de Pacientes por Médicos', menu_id= 5, submenu_url = '/views/5_reportes/rep_pacientes_por_medico.xhtml', submenu_descripcion= 'Clínica' where submenu_id= 20;
UPDATE submenus set sumbenu_nombre = 'Listado de Pacientes Atendidos por Tratamiento', menu_id= 5, submenu_url = '/views/5_reportes/rep_pacientes_por_tratamiento.xhtml', submenu_descripcion= 'Clínica' where submenu_id= 21;
UPDATE submenus set sumbenu_nombre = 'Listado de Pacientes Atendidos por Clínica', menu_id= 5, submenu_url = '/views/5_reportes/rep_pacientes_por_clinica.xhtml', submenu_descripcion= 'Clínica' where submenu_id= 22;
UPDATE submenus set sumbenu_nombre = 'Listado de Citas por Estado', menu_id= 5, submenu_url = '/views/5_reportes/rep_citas_por_estado.xhtml', submenu_descripcion= 'Clínica' where submenu_id= 23;
UPDATE submenus set sumbenu_nombre = 'Tratamientos Realizados a Paciente', menu_id= 5, submenu_url = '/views/5_reportes/rep_tratamientos_por_paciente.xhtml', submenu_descripcion= 'Clínica' where submenu_id= 24;
UPDATE submenus set sumbenu_nombre = 'Solicitud de Insumos Médicos', menu_id= 5, submenu_url = '/views/5_reportes/rep_solicitud_insumos.xhtml', submenu_descripcion= 'Clínica' where submenu_id= 25;
UPDATE submenus set sumbenu_nombre = 'Listado de Insumos Médicos ', menu_id= 5, submenu_url = '/views/5_reportes/rep_listado_insumos.xhtml', submenu_descripcion= 'Clínica' where submenu_id= 26;
UPDATE submenus set sumbenu_nombre = 'Agenda de Citas Programadas por Clínica', menu_id= 5, submenu_url = '/views/5_reportes/rep_citas_por_clinica.xhtml', submenu_descripcion= 'Clínica' where submenu_id= 27;
UPDATE submenus set sumbenu_nombre = 'Agenda de Citas Programadas por Médico', menu_id= 5, submenu_url = '/views/5_reportes/rep_citas_por_medico.xhtml', submenu_descripcion= 'Clínica' where submenu_id= 28;

--Pantalla Menú Administracion 6
--Registros 29 al 36
UPDATE submenus set sumbenu_nombre = 'Gestionar Roles', menu_id= 6, submenu_url = '/views/6_administracion/cat_roles_listado.xhtml', submenu_descripcion= 'Clínica' where submenu_id= 29;
UPDATE submenus set sumbenu_nombre = 'Gestionar Usuarios', menu_id= 6, submenu_url = '/views/6_administracion/cat_usuarios_listado.xhtml', submenu_descripcion= 'Clínica' where submenu_id= 30;
UPDATE submenus set sumbenu_nombre = 'Gestionar Sucursales', menu_id= 6, submenu_url = '/views/6_administracion/cat_sucursales_listado.xhtml', submenu_descripcion= 'Clínica' where submenu_id= 31;
UPDATE submenus set sumbenu_nombre = 'Gestionar Médicos', menu_id= 6, submenu_url = '/views/6_administracion/cat_medicos_listado.xhtml', submenu_descripcion= 'Clínica' where submenu_id= 32;
UPDATE submenus set sumbenu_nombre = 'Gestionar Tratamientos', menu_id= 6, submenu_url = '/views/6_administracion/cat_tratamientos_listado.xhtml', submenu_descripcion= 'Clínica' where submenu_id= 33;
UPDATE submenus set sumbenu_nombre = 'Gestionar Patologías', menu_id= 6, submenu_url = '/views/6_administracion/cat_patologias_listado.xhtml', submenu_descripcion= 'Clínica' where submenu_id= 34;
UPDATE submenus set sumbenu_nombre = 'Gestionar Tipo de Insumo', menu_id= 6, submenu_url = '/views/6_administracion/cat_tipoinsumos_listado.xhtml', submenu_descripcion= 'Clínica' where submenu_id= 35;
UPDATE submenus set sumbenu_nombre = 'Gestionar Unidades de Medida', menu_id= 6, submenu_url = '/views/6_administracion/cat_unidadesmedidas_listado.xhtml', submenu_descripcion= 'Clínica' where submenu_id= 36;

--Pantalla Menú Configuracion 7
--Registros 37 al 39
UPDATE submenus set sumbenu_nombre = 'Configuración de Publicidad', menu_id= 7, submenu_url = '/views/7_configuracion/home_parametros.xhtml', submenu_descripcion= 'Clínica' where submenu_id= 37;
UPDATE submenus set sumbenu_nombre = 'Configuración de Correo', menu_id= 7, submenu_url = '/views/7_configuracion/configuracion_correo.xhtml', submenu_descripcion= 'Clínica' where submenu_id= 38;
UPDATE submenus set sumbenu_nombre = 'Tareas Automáticas', menu_id= 7, submenu_url = '/views/7_configuracion/tareas_automaticas.xhtml', submenu_descripcion= 'Clínica' where submenu_id= 39;

--Pantalla Menú Ayuda 8
--Registros 40 al 41
UPDATE submenus set sumbenu_nombre = 'Manual de Usuarios', menu_id= 8, submenu_url = '/views/8_ayuda/manual_usuario.xhtml', submenu_descripcion= 'General' where submenu_id= 40;
UPDATE submenus set sumbenu_nombre = 'Crear Cita en Linea', menu_id= 8, submenu_url = '/mantenimiento.xhtml', submenu_descripcion= 'Paciente' where submenu_id= 41;

-- UPDATE submenus set sumbenu_nombre = '', menu_id= 3, submenu_url = '', submenu_descripcion= 'Clínica' where submenu_id= 10;
