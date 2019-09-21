package controllers;

import dao.BitacoraFacade;
import dao.DashboardFacade;
import dao.MenusFacade;
import dao.PrivilegiosFacade;
import dao.RolesFacade;
import dao.SubmenusFacade;
import entities.Bitacora;
import entities.Dashboard;
import entities.Menus;
import entities.Privilegios;
import entities.Roles;
import entities.Submenus;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.ejb.EJB;
import javax.faces.application.FacesMessage;
import javax.faces.bean.ManagedBean;
import javax.faces.bean.ManagedProperty;
import javax.faces.bean.ViewScoped;
import org.primefaces.context.RequestContext;

/* @author Equipo 19-2018 FIA-UES */
@ManagedBean
@ViewScoped
public class AdministracionBean implements Serializable {
//****************************************************************************//
//                          Declaración de variables                          //
//****************************************************************************//
    
    @EJB
    private BitacoraFacade bitacoraFacade;
    private Bitacora bitacoraNueva = new Bitacora();

    @EJB
    private RolesFacade rolesFacade;
    private Roles rolNuevo = new Roles();
    private Roles rolConsultar = new Roles();
    private Roles rolEditar = new Roles();
    private int rol_id = 0;

    @EJB
    private MenusFacade menusFacades;

    @EJB
    private SubmenusFacade subMenusFacades;

    @EJB
    private PrivilegiosFacade privilegiosFacade;

    @EJB
    private DashboardFacade dashboardFacade;
    private Dashboard dashboardSeleccionado = new Dashboard();

    @ManagedProperty(value = "#{appSession}")     // Sesion
    private AppSession appSession;
    
//*************************SubMenus *******************************************//
    private List<Submenus> submenu1 = new ArrayList<>(); // Agenda
    private List<Submenus> submenu2 = new ArrayList<>(); // Paciente
    private List<Submenus> submenu3 = new ArrayList<>(); // Insumos
    private List<Submenus> submenu4 = new ArrayList<>(); // Promociones
    private List<Submenus> submenu5 = new ArrayList<>(); // Reportes
    private List<Submenus> submenu6 = new ArrayList<>(); // Administracion
    private List<Submenus> submenu7 = new ArrayList<>(); // Configuracion
    private List<Submenus> submenu8 = new ArrayList<>(); // Ayuda

//*******************************Permisos **************************************
//*******************************Menu Agenda ***********************************
//Pantalla Citas Aprobadas
    private List<Privilegios> citasAprobadas = new ArrayList<>();
    private Boolean sCitasAprobadas = false;

//Pantalla Citas Pendientes
    private List<Privilegios> citasPendientes = new ArrayList<>();
    private Boolean sCitasPendientes = false;

//*******************************Menu Insumos **********************************
//Pantalla Gestionar Insumos
    private List<Privilegios> gestionarInsumos = new ArrayList<>();
    private Boolean sGestionarInsumos = false;

//*******************************Menu Promociones ******************************
//Pantalla Listado de Promociones 
    private List<Privilegios> listadoPromociones = new ArrayList<>();
    private Boolean sListadoPromociones = false;

//********************************Menu Administracions  ************************
//Pantalla Gestionar Sucursales 
    private List<Privilegios> gestionarSucursales = new ArrayList<>();
    private Boolean sGestionarSucursales = false;

//Pantalla Gestionar Medicos
    private List<Privilegios> gestionarMedicos = new ArrayList<>();
    private Boolean sGestionarMedicos = false;

//Pantalla Gestionar Tratamientos 
    private List<Privilegios> gestionarTratamientos = new ArrayList<>();
    private Boolean sGestionarTratamientos = false;

//Pantalla Gestionar Patologias
    private List<Privilegios> gestionarPatologias = new ArrayList<>();
    private Boolean sGestionarPatologias = false;

//Pantalla GestionarTipoInsumo 
    private List<Privilegios> gestionarTipoInsumo = new ArrayList<>();
    private Boolean sGestionarTipoInsumo = false;

//Pantalla Gestionar Unidades de Medida 
    private List<Privilegios> gestionarUnidadMedida = new ArrayList<>();
    private Boolean sGestionarUnidadMedida = false;

//****************************************************************************//
//                  Métodos para obtener listas por entidades                 //
//****************************************************************************//
    //Usado en: [cat_roles_listado.xhtml]
    public List<Roles> todosRolesActivos() {
        return getRolesFacade().findAll();
    }

    public List<Menus> todosMenus() {
        return getMenusFacades().findAll();
    }

    public List<Submenus> subMenusPorMenu(Integer menu_id) {
        return getSubMenusFacades().subMenuPorMenu(menu_id);
    }

    public List<Privilegios> permisosPorSubMenu(int submenu_id) {
        return getPrivilegiosFacade().privilegiosPorSubmenu(submenu_id);
    }

    public List<Dashboard> dashboardPermitidos() {
        return dashboardFacade.dashboardPermitidos();
    }

//****************************************************************************//
//                 Métodos Get para obtener datos de entidades                //
//****************************************************************************//    
    
    public BitacoraFacade getBitacoraFacade() {
        return bitacoraFacade;
    }

    public RolesFacade getRolesFacade() {
        return rolesFacade;
    }

    public MenusFacade getMenusFacades() {
        return menusFacades;
    }

    public SubmenusFacade getSubMenusFacades() {
        return subMenusFacades;
    }

    public PrivilegiosFacade getPrivilegiosFacade() {
        return privilegiosFacade;
    }

    public DashboardFacade getDashboardFacade() {
        return dashboardFacade;
    }

//****************************************************************************//
//                             Métodos Get y SET                              //
//****************************************************************************// 
    public int getRol_id() {
        return rol_id;
    }

    public void setRol_id(int rol_id) {
        this.rol_id = rol_id;
    }
    
    public Roles getRolConsultar() {
        return rolConsultar;
    }

    public void setRolConsultar(Roles rolConsultar) {
        this.rolConsultar = rolConsultar;
    }

    public Roles getRolEditar() {
        return rolEditar;
    }

    public void setRolEditar(Roles rolEditar) {
        this.rolEditar = rolEditar;
    }

    
    public Roles getRolNuevo() {
        return rolNuevo;
    }

    public void setRolNuevo(Roles rolNuevo) {
        this.rolNuevo = rolNuevo;
    }

    public List<Submenus> getSubmenu1() {
        return submenu1;
    }

    public void setSubmenu1(List<Submenus> submenu1) {
        sCitasAprobadas = false;
        sCitasPendientes = false;
        for (Submenus submenus : submenu1) {
            switch (submenus.getSubmenuId()) {
                case 2:
                    sCitasAprobadas = true;
                    break;
                case 3:
                    sCitasPendientes = true;
                    break;
            }
        }
        this.submenu1 = submenu1;
    }

    public List<Submenus> getSubmenu2() {
        return submenu2;
    }

    public void setSubmenu2(List<Submenus> submenu2) {
        this.submenu2 = submenu2;
    }

    public List<Submenus> getSubmenu3() {
        return submenu3;
    }

    public void setSubmenu3(List<Submenus> submenu3) {
        sGestionarInsumos = false;
        for (Submenus submenus : submenu3) {
            if (submenus.getSubmenuId() == 11) {
                sGestionarInsumos = true;
            }
        }
        this.submenu3 = submenu3;
    }

    public List<Submenus> getSubmenu4() {
        return submenu4;
    }

    public void setSubmenu4(List<Submenus> submenu4) {
        sListadoPromociones = false;
        for (Submenus submenus : submenu4) {
            if (submenus.getSubmenuId() == 17) {
                sListadoPromociones = true;
            }
        }
        this.submenu4 = submenu4;
    }

    public List<Submenus> getSubmenu5() {
        return submenu5;
    }

    public void setSubmenu5(List<Submenus> submenu5) {
        this.submenu5 = submenu5;
    }

    public List<Submenus> getSubmenu6() {
        return submenu6;
    }

    public void setSubmenu6(List<Submenus> submenu6) {
        sGestionarSucursales = false;
        sGestionarMedicos = false;
        sGestionarTratamientos = false;
        sGestionarPatologias = false;
        sGestionarTipoInsumo = false;
        sGestionarUnidadMedida = false;
        for (Submenus submenus : submenu6) {
            switch (submenus.getSubmenuId()) {
                case 31:
                    sGestionarSucursales = true;
                    break;
                case 32:
                    sGestionarMedicos = true;
                    break;
                case 33:
                    sGestionarTratamientos = true;
                    break;
                case 34:
                    sGestionarPatologias = true;
                    break;
                case 35:
                    sGestionarTipoInsumo = true;
                    break;
                case 36:
                    sGestionarUnidadMedida = true;
                    break;
            }
        }
        this.submenu6 = submenu6;
    }

    public List<Submenus> getSubmenu7() {
        return submenu7;
    }

    public void setSubmenu7(List<Submenus> submenu7) {
        this.submenu7 = submenu7;
    }

    public List<Submenus> getSubmenu8() {
        return submenu8;
    }

    public void setSubmenu8(List<Submenus> submenu8) {
        this.submenu8 = submenu8;
    }

    //Pantalla Citas Aprobadas
    public List<Privilegios> getCitasAprobadas() {
        return citasAprobadas;
    }

    public void setCitasAprobadas(List<Privilegios> citasAprobadas) {
        this.citasAprobadas = citasAprobadas;
    }

    public Boolean getsCitasAprobadas() {
        return sCitasAprobadas;
    }

    public void setsCitasAprobadas(Boolean sCitasAprobadas) {
        this.sCitasAprobadas = sCitasAprobadas;
    }

    //Pantalla Citas Pendientes 
    public List<Privilegios> getCitasPendientes() {
        return citasPendientes;
    }

    public void setCitasPendientes(List<Privilegios> citasPendientes) {
        System.out.println("Entra a set citas pendiente");
        this.citasPendientes = citasPendientes;
    }

    public Boolean getsCitasPendientes() {
        return sCitasPendientes;
    }

    public void setsCitasPendientes(Boolean sCitasPendientes) {
        this.sCitasPendientes = sCitasPendientes;
    }

    //Pantalla Gestionar Insumo 
    public List<Privilegios> getGestionarInsumos() {
        return gestionarInsumos;
    }

    public void setGestionarInsumos(List<Privilegios> gestionarInsumos) {
        this.gestionarInsumos = gestionarInsumos;
    }

    public Boolean getsGestionarInsumos() {
        return sGestionarInsumos;
    }

    public void setsGestionarInsumos(Boolean sGestionarInsumos) {
        this.sGestionarInsumos = sGestionarInsumos;
    }

    //Pantalla Listado Promociones 
    public List<Privilegios> getListadoPromociones() {
        return listadoPromociones;
    }

    public void setListadoPromociones(List<Privilegios> listadoPromociones) {
        this.listadoPromociones = listadoPromociones;
    }

    public Boolean getsListadoPromociones() {
        return sListadoPromociones;
    }

    public void setsListadoPromociones(Boolean sListadoPromociones) {
        this.sListadoPromociones = sListadoPromociones;
    }

    //Pantalla Gestionar Sucursales 
    public List<Privilegios> getGestionarSucursales() {
        return gestionarSucursales;
    }

    public void setGestionarSucursales(List<Privilegios> gestionarSucursales) {
        this.gestionarSucursales = gestionarSucursales;
    }

    public Boolean getsGestionarSucursales() {
        return sGestionarSucursales;
    }

    public void setsGestionarSucursales(Boolean sGestionarSucursales) {
        this.sGestionarSucursales = sGestionarSucursales;
    }

    public AppSession getAppSession() {
        return appSession;
    }

    public void setAppSession(AppSession appSession) {
        this.appSession = appSession;
    }

    // Pantalla Gestionar Medicos 
    public List<Privilegios> getGestionarMedicos() {
        return gestionarMedicos;
    }

    public void setGestionarMedicos(List<Privilegios> gestionarMedicos) {
        this.gestionarMedicos = gestionarMedicos;
    }

    public Boolean getsGestionarMedicos() {
        return sGestionarMedicos;
    }

    public void setsGestionarMedicos(Boolean sGestionarMedicos) {
        this.sGestionarMedicos = sGestionarMedicos;
    }

    //Pantalla Gestionar Tratamientos 
    public List<Privilegios> getGestionarTratamientos() {
        return gestionarTratamientos;
    }

    public void setGestionarTratamientos(List<Privilegios> gestionarTratamientos) {
        this.gestionarTratamientos = gestionarTratamientos;
    }

    public Boolean getsGestionarTratamientos() {
        return sGestionarTratamientos;
    }

    public void setsGestionarTratamientos(Boolean sGestionarTratamientos) {
        this.sGestionarTratamientos = sGestionarTratamientos;
    }

    //Pantalla Gestionar Patologia
    public List<Privilegios> getGestionarPatologias() {
        return gestionarPatologias;
    }

    public void setGestionarPatologias(List<Privilegios> gestionarPatologias) {
        this.gestionarPatologias = gestionarPatologias;
    }

    public Boolean getsGestionarPatologias() {
        return sGestionarPatologias;
    }

    public void setsGestionarPatologias(Boolean sGestionarPatologias) {
        this.sGestionarPatologias = sGestionarPatologias;
    }

    //Pantalla Gestionar Tipo Insumo
    public List<Privilegios> getGestionarTipoInsumo() {
        return gestionarTipoInsumo;
    }

    public void setGestionarTipoInsumo(List<Privilegios> gestionarTipoInsumo) {
        this.gestionarTipoInsumo = gestionarTipoInsumo;
    }

    public Boolean getsGestionarTipoInsumo() {
        return sGestionarTipoInsumo;
    }

    public void setsGestionarTipoInsumo(Boolean sGestionarTipoInsumo) {
        this.sGestionarTipoInsumo = sGestionarTipoInsumo;
    }

    //Pantalla Gestionar Unidad de Medida
    public List<Privilegios> getGestionarUnidadMedida() {
        return gestionarUnidadMedida;
    }

    public void setGestionarUnidadMedida(List<Privilegios> gestionarUnidadMedida) {
        this.gestionarUnidadMedida = gestionarUnidadMedida;
    }

    public Boolean getsGestionarUnidadMedida() {
        return sGestionarUnidadMedida;
    }

    public void setsGestionarUnidadMedida(Boolean sGestionarUnidadMedida) {
        this.sGestionarUnidadMedida = sGestionarUnidadMedida;
    }

    public Bitacora getBitacoraNueva() {
        return bitacoraNueva;
    }
    public void setBitacoraNueva(Bitacora bitacoraNueva) {
        this.bitacoraNueva = bitacoraNueva;
    }

//****************************************************************************//
//                                  Métodos                                   //
//****************************************************************************//    
    
    //Método para guardar en la Bitacora.
    public void guardarBitacora(String transaccion) {
        try {
            bitacoraNueva.setBitacoraFechaHora(new Date());
            bitacoraNueva.setBitacoraUsuario(appSession.getUsuario().getUsuarioUsuario());
            bitacoraNueva.setBitacoraTransaccion(transaccion);
            getBitacoraFacade().create(bitacoraNueva);
        } catch (Exception e) {
            mensajeError("Se detuvo el proceso en el método: guardarBitacora.");
        }
    }

    //Usado en: [cat_roles_nuevo.xhtml]
    public void guardarRol() {
        try {
            List<Submenus> temp = new ArrayList<>();
            List<Menus> tempMenu = new ArrayList<>();
            List<Privilegios> tempPrivilegios = new ArrayList<>();
            //Menu: Agenda
            if (!submenu1.isEmpty()) {
                for (Submenus list : submenu1) {
                    //Pantalla: Citas Aprobadas
                    if (list.getSubmenuId() == 2) {
                        for (Privilegios pri : citasAprobadas) {
                            tempPrivilegios.add(pri);
                        }
                    }
                    //Pantalla: Cita Pendiente
                    if (list.getSubmenuId() == 3) {
                        for (Privilegios pri : citasPendientes) {
                            tempPrivilegios.add(pri);
                        }
                    }
                    temp.add(list);
                }
                tempMenu.add(getMenusFacades().find(submenu1.get(0).getMenuId().getMenuId()));
            }
            //Menu: Paciente
            if (!submenu2.isEmpty()) {
                for (Submenus list : submenu2) {
                    temp.add(list);
                }
                tempMenu.add(getMenusFacades().find(submenu2.get(0).getMenuId().getMenuId()));
            }
            //Menu: Insumos
            if (!submenu3.isEmpty()) {
                for (Submenus list : submenu3) {
                    //Pantalla: Gestionar Insumos
                    if (list.getSubmenuId() == 11) {
                        for (Privilegios pri : gestionarInsumos) {
                            tempPrivilegios.add(pri);
                        }
                    }
                    temp.add(list);
                }
                tempMenu.add(getMenusFacades().find(submenu3.get(0).getMenuId().getMenuId()));
            }
            //Menu: Promociones
            if (!submenu4.isEmpty()) {
                for (Submenus list : submenu4) {
                    //Pantalla: Listado de Promociones
                    if (list.getSubmenuId() == 17) {
                        for (Privilegios pri : listadoPromociones) {
                            tempPrivilegios.add(pri);
                        }
                    }
                    temp.add(list);
                }
                tempMenu.add(getMenusFacades().find(submenu4.get(0).getMenuId().getMenuId()));
            }
            //Menu: Reportes 
            if (!submenu5.isEmpty()) {
                for (Submenus list : submenu5) {
                    temp.add(list);
                }
                tempMenu.add(getMenusFacades().find(submenu5.get(0).getMenuId().getMenuId()));
            }
            //Menu 6: Administracion
            if (!submenu6.isEmpty()) {
                for (Submenus list : submenu6) {
                    //Pantalla: Gestionar Sucursales
                    if (list.getSubmenuId() == 31) {
                        for (Privilegios pri : gestionarSucursales) {
                            tempPrivilegios.add(pri);
                        }
                    }
                    //Pantalla: Gestionar Medicos
                    if (list.getSubmenuId() == 32) {
                        for (Privilegios pri : gestionarMedicos) {
                            tempPrivilegios.add(pri);
                        }
                    }
                    //Pantalla: Gestionar Tratamientos
                    if (list.getSubmenuId() == 33) {
                        for (Privilegios pri : gestionarTratamientos) {
                            tempPrivilegios.add(pri);
                        }
                    }
                    //Pantalla: Gestionar Tipo de Insumo
                    if (list.getSubmenuId() == 34) {
                        for (Privilegios pri : gestionarPatologias) {
                            tempPrivilegios.add(pri);
                        }
                    }
                    //Pantalla: Gestionar Tipo de Insumo
                    if (list.getSubmenuId() == 35) {
                        for (Privilegios pri : gestionarTipoInsumo) {
                            tempPrivilegios.add(pri);
                        }
                    }
                    //Pantalla: Gestionar Tipo de Insumo
                    if (list.getSubmenuId() == 36) {
                        for (Privilegios pri : gestionarUnidadMedida) {
                            tempPrivilegios.add(pri);
                        }
                    }
                    temp.add(list);
                }
                tempMenu.add(getMenusFacades().find(submenu6.get(0).getMenuId().getMenuId()));
            }
            //Menu Configuracion
            if (!submenu7.isEmpty()) {
                for (Submenus list : submenu7) {
                    temp.add(list);
                }
                tempMenu.add(getMenusFacades().find(submenu7.get(0).getMenuId().getMenuId()));
            }

            if (!submenu8.isEmpty()) {
                for (Submenus list : submenu8) {
                    temp.add(list);
                }
                tempMenu.add(getMenusFacades().find(submenu8.get(0).getMenuId().getMenuId()));
            }

            rolNuevo.setMenusList(tempMenu);
            rolNuevo.setSubmenusList(temp);
            rolNuevo.setPrivilegiosList(tempPrivilegios);
            rolNuevo.setRolFechaCreacion(new Date());

            if (getAppSession().getUsuario() != null) {
                rolNuevo.setRolUsuarioCreacion(getAppSession().getUsuario().getUsuarioUsuario());
            }
            getRolesFacade().create(rolNuevo);
            guardarBitacora("Creó un rol (" + rolNuevo.getRolNombre() + ").");
            mensajeGuardado("El rol fue guardado.");
            limpiandoNuevoRol();
            limpiandoPrivilegios();
            limpiarPrivilegiosBooleanos();
        } catch (Exception e) {
            mensajeError("Error al guardar el rol.");
            System.out.println("controllers.AdministracionBean.guardarRol() ");
            System.err.println(e);
        }
    }

    //Establece los valores del rol a la pantalla
    //Usado en: cat_roles_listado.xhtml
    public void establecerPrivilegiosRolEditar() {
        System.out.println("veamos que tiene" + rolEditar);
        rolEditar = getRolesFacade().find(rol_id);
        System.out.println("veamos que tiene tomar el id" + rolEditar);
        if (rolEditar != null) {
            limpiandoPantallas();
            limpiandoPrivilegios();
            limpiarPrivilegiosBooleanos();

            if (!rolEditar.getSubmenusList().isEmpty()) {
                for (Submenus item : rolEditar.getSubmenusList()) {
                    switch (item.getMenuId().getMenuId()) {
                        case 1:
                            //Booleanos para mostrar las acciones
                            switch (item.getSubmenuId()) {
                                case 2:
                                    sCitasAprobadas = true;
                                    break;
                                case 3:
                                    sCitasPendientes = true;
                                    break;
                            }
                            submenu1.add(item);
                            break;
                        case 2:
                            submenu2.add(item);
                            break;
                        case 3:
                            switch (item.getSubmenuId()) {
                                case 11:
                                    sGestionarInsumos = true;
                                    break;
                            }
                            submenu3.add(item);
                            break;
                        case 4:
                            switch (item.getSubmenuId()) {
                                case 17:
                                    sListadoPromociones = true;
                                    break;
                            }
                            submenu4.add(item);
                            break;
                        case 5:
                            submenu5.add(item);
                            break;
                        case 6:
                            switch (item.getSubmenuId()) {
                                case 32:
                                    sGestionarSucursales = true;
                                    break;
                                case 33:
                                    sGestionarMedicos = true;
                                    break;
                                case 34:
                                    sGestionarTratamientos = true;
                                    break;
                                case 35:
                                    sGestionarPatologias = true;
                                    break;
                                case 38:
                                    sGestionarTipoInsumo = true;
                                    break;
                                case 36:
                                    sGestionarUnidadMedida = true;
                                    break;
                            }
                            submenu6.add(item);
                            break;
                        case 7:
                            submenu7.add(item);
                            break;
                        case 8:
                            submenu8.add(item);
                            break;
                    }
                }
            }

            //Recorriendo los privilegios
            for (Privilegios privilegio : rolEditar.getPrivilegiosList()) {
                switch (privilegio.getPrivilegiosPK().getPrivilegioId()) {
                    case 1:
                    case 2:
                    case 3:
                        citasAprobadas.add(privilegio);
                        break;
                    case 4:
                    case 5:
                    case 6:
                        citasPendientes.add(privilegio);
                        break;
                    case 7:
                    case 8:
                    case 9:
                        gestionarInsumos.add(privilegio);
                        break;
                    case 10:
                    case 11:
                    case 12:
                        listadoPromociones.add(privilegio);
                        break;
                    case 13:
                    case 14:
                    case 15:
                        gestionarSucursales.add(privilegio);
                        break;
                    case 16:
                    case 17:
                    case 18:
                        gestionarMedicos.add(privilegio);
                        break;
                    case 19:
                    case 20:
                        gestionarTratamientos.add(privilegio);
                        break;
                    case 21:
                    case 22:
                        gestionarPatologias.add(privilegio);
                        break;
                    case 23:
                    case 24:
                        gestionarTipoInsumo.add(privilegio);
                        break;
                    case 25:
                    case 26:
                        gestionarUnidadMedida.add(privilegio);
                        break;
                }
            }
        }
    }

    //Metodo usado en la tabla de listas roles, en la opcion de consultar.
    public void establecerPrivilegiosRolConsultar() {
        if (rolConsultar != null) {
            limpiandoPantallas();

            if (!rolConsultar.getSubmenusList().isEmpty()) {

                for (Submenus item : rolConsultar.getSubmenusList()) {
                    switch (item.getMenuId().getMenuId()) {
                        case 1:
                            submenu1.add(item);
                            break;
                        case 2:
                            submenu2.add(item);
                            break;
                        case 3:
                            submenu3.add(item);
                            break;
                        case 4:
                            submenu4.add(item);
                            break;
                        case 5:
                            submenu5.add(item);
                            break;
                        case 6:
                            submenu6.add(item);
                            break;
                        case 7:
                            submenu7.add(item);
                            break;
                        case 8:
                            submenu8.add(item);
                            break;
                    }
                }
            }
        }
    }

    //Metodo usado en configuracion_roles_nuevo.xhtml
    //Estado: Prueba
    //Nota: Puede ser sustituido si se pasa a un controlador view.
    public void limpiandoNuevoRol() {
        //Limpiando SubMenus
        submenu1.clear();
        submenu2.clear();
        submenu3.clear();
        submenu4.clear();
        submenu5.clear();
        submenu6.clear();
        submenu7.clear();
        submenu8.clear();

        rolNuevo = new Roles();
    }

    //Fecha: 20/febrero/2019
    //Estado : Prueba
    //Esado en: AdministracionBean.java
    //Limpiar la lista de pantallas
    public void limpiandoPantallas() {
        submenu1.clear();
        submenu2.clear();
        submenu3.clear();
        submenu4.clear();
        submenu5.clear();
        submenu6.clear();
        submenu7.clear();
        submenu8.clear();
    }

    //Fecha: 20/febrero/2019
    //Estado: Prueba
    //Limpiar los privilegios 
    //Usado en: ?
    public void limpiandoPrivilegios() {
        //Menu Agenda
        citasAprobadas.clear();
        citasPendientes.clear();
        //Menu Insumos
        gestionarInsumos.clear();
        //Menu Promociones
        listadoPromociones.clear();
        //Menu Administracion
        gestionarSucursales.clear();
        gestionarMedicos.clear();
        gestionarTratamientos.clear();
        gestionarPatologias.clear();
        gestionarTipoInsumo.clear();
        gestionarUnidadMedida.clear();
    }

    //Objetivo Limpiando los Booleanos de los privilegios
    //Estado: Prueba;
    public void limpiarPrivilegiosBooleanos() {
        //Menu: Agenda
        sCitasAprobadas = false;
        sCitasPendientes = false;
        //Menu: Insumos
        sGestionarInsumos = false;
        //Menu: Promociones
        sListadoPromociones = false;
        //Menu: Administracion
        sGestionarSucursales = false;
        sGestionarMedicos = false;
        sGestionarTratamientos = false;
        sGestionarPatologias = false;
        sGestionarTipoInsumo = false;
        sGestionarUnidadMedida = false;
    }

    //Objetivo: Guarda los submenus y privilegios
    //Metodo usado en cat_roles_editar.xhtml
    public void editarRol() {
        try {
            System.out.println("Este rol por " + rol_id);
            System.out.println("Rol al iniciar" + rolEditar);
            System.out.println("Rol al iniciar ID" + rolEditar.getRolId());
            List<Submenus> temp = new ArrayList<>();
            List<Menus> tempMenu = new ArrayList<>();
            List<Privilegios> tempPrivilegios = new ArrayList<>();

            //Menu: Agenda
            if (!submenu1.isEmpty()) {
                for (Submenus list : submenu1) {
                    switch (list.getSubmenuId()) {
                        case 2: //Pantalla: Citas Aprobadas
                            System.out.println("Citas pendientes entradno antes del for");
                            for (Privilegios p : citasAprobadas) {
                                System.out.println("Citas aprobadas entrando");
                                tempPrivilegios.add(p);
                            }
                            break;
                        case 3: //Pantalla: Cita Pendiente
                            System.out.println("Citas pendientes entradno antes del for");
                            for (Privilegios pri : citasPendientes) {
                                System.out.println("Citas pendientes entradno");
                                tempPrivilegios.add(pri);
                            }
                            break;
                    }
                    temp.add(list);
                }
                tempMenu.add(getMenusFacades().find(submenu1.get(0).getMenuId().getMenuId()));
            }

            //Menu: Paciente
            if (!submenu2.isEmpty()) {
                for (Submenus list : submenu2) {
                    temp.add(list);
                }
                tempMenu.add(getMenusFacades().find(submenu2.get(0).getMenuId().getMenuId()));
            }

            //Menu: Insumos
            if (!submenu3.isEmpty()) {
                for (Submenus list : submenu3) {
                    //Pantalla: Gestionar Insumos
                    if (list.getSubmenuId() == 11) {
                        for (Privilegios pri : gestionarInsumos) {
                            tempPrivilegios.add(pri);
                        }
                    }
                    temp.add(list);
                }
                tempMenu.add(getMenusFacades().find(submenu3.get(0).getMenuId().getMenuId()));
            }

            //Menu: Promociones
            if (!submenu4.isEmpty()) {
                for (Submenus list : submenu4) {
                    //Pantalla: Listado de Promociones
                    if (list.getSubmenuId() == 17) {
                        for (Privilegios pri : listadoPromociones) {
                            tempPrivilegios.add(pri);
                        }
                    }
                    temp.add(list);
                }
                tempMenu.add(getMenusFacades().find(submenu4.get(0).getMenuId().getMenuId()));
            }

            //Reportes
            if (!submenu5.isEmpty()) {
                for (Submenus list : submenu5) {
                    temp.add(list);
                }
                tempMenu.add(getMenusFacades().find(submenu5.get(0).getMenuId().getMenuId()));
            }

            //Menu 6: Administracion
            if (!submenu6.isEmpty()) {
                for (Submenus list : submenu6) {
                    switch (list.getSubmenuId()) {
                        case 31: //Pantalla: Gestionar Sucursales
                            for (Privilegios pri : gestionarSucursales) {
                                tempPrivilegios.add(pri);
                            }
                            break;
                        case 32: //Pantalla: Gestionar Medicos
                            for (Privilegios pri : gestionarMedicos) {
                                tempPrivilegios.add(pri);
                            }
                            break;
                        case 33: //Pantalla: Gestionar Tratamientos
                            for (Privilegios pri : gestionarTratamientos) {
                                tempPrivilegios.add(pri);
                            }
                            break;
                        case 34: //Pantalla: Gestionar Patologia 
                            for (Privilegios pri : gestionarPatologias) {
                                tempPrivilegios.add(pri);
                            }
                            break;
                        case 35: //Pantalla: Gestionar Tipo de Insumo
                            for (Privilegios pri : gestionarTipoInsumo) {
                                tempPrivilegios.add(pri);
                            }
                            break;
                        case 36: //Pantalla: Gestionar Unidad de Medida 
                            for (Privilegios pri : gestionarUnidadMedida) {
                                tempPrivilegios.add(pri);
                            }
                            break;
                    }
                    temp.add(list);
                }
                tempMenu.add(getMenusFacades().find(submenu6.get(0).getMenuId().getMenuId()));
            }

            //Menu Configuracion
            if (!submenu7.isEmpty()) {
                for (Submenus list : submenu7) {
                    temp.add(list);
                }
                tempMenu.add(getMenusFacades().find(submenu7.get(0).getMenuId().getMenuId()));
            }

            if (!submenu8.isEmpty()) {
                for (Submenus list : submenu8) {
                    temp.add(list);
                }
                tempMenu.add(getMenusFacades().find(submenu8.get(0).getMenuId().getMenuId()));
            }
            /*rolNuevo.setMenusList(tempMenu);
            rolNuevo.setSubmenusList(temp);
            rolNuevo.setPrivilegiosList(tempPrivilegios);
            rolNuevo.setRolFechaCreacion(new Date());

            if (getAppSession().getUsuario() != null) {
                rolNuevo.setRolUsuarioCreacion(getAppSession().getUsuario().getUsuarioUsuario());
            }
            getRolesFacade().create(rolNuevo);*/
            rolEditar.getPrivilegiosList().clear();
            //rolEditar.setPrivilegiosList(null);
            rolEditar.getSubmenusList().clear();
            rolEditar.getMenusList().clear();
            rolEditar.setMenusList(tempMenu);
            rolEditar.setSubmenusList(temp);
            rolEditar.setPrivilegiosList(tempPrivilegios);
            rolEditar.setRolFechaModificacion(new Date());
            if (getAppSession().getUsuario() != null) {
                rolEditar.setRolUsuarioModificacion(getAppSession().getUsuario().getUsuarioUsuario());
            }
            System.out.println("Rol " + rolEditar);
            getRolesFacade().edit(rolEditar);
            guardarBitacora("Editó un rol (" + rolEditar.getRolNombre() + ").");
            mensajeGuardado("Rol actualizado adecuadamente.");
        } catch (Exception e) {
            mensajeError("Error al actualizar rol.");
            System.err.println("Error" + e);
        }
    }

    //Método para mostrar mensaje de guardado/actualizado.
    public void mensajeGuardado(String mensaje) {
        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_INFO, "Mensaje", mensaje);
        RequestContext.getCurrentInstance().showMessageInDialog(message);
    }

    //Método para mostrar mensaje de error en el sistema.
    public void mensajeError(String mensaje) {
        FacesMessage message = new FacesMessage(FacesMessage.SEVERITY_ERROR, "¡Error!", mensaje);
        RequestContext.getCurrentInstance().showMessageInDialog(message);
    }

    //Metodo para ocultar los roles por defecto:[Administrador/a, Asistente, Director/a, Doctor/a, Paciente]
    //Usado en: cat_roles_listado.xhtml
    public Boolean rolesFijos(Roles rol) {
        return !(rol.getRolId() >= 1 && rol.getRolId() <= 5);
    }
}
