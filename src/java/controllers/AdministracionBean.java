package controllers;

import dao.MenusFacade;
import dao.PrivilegiosFacade;
import dao.RolesFacade;
import dao.SubmenusFacade;
import entities.Menus;
import entities.Privilegios;
import entities.Roles;
import entities.Submenus;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import javax.ejb.EJB;
import javax.enterprise.context.SessionScoped;
import javax.faces.application.FacesMessage;
import javax.faces.model.SelectItem;
import javax.faces.model.SelectItemGroup;
import javax.inject.Named;
import org.primefaces.context.RequestContext;

/*
Notas de Actualizacion:
-Fecha: 19/febrero/2019
-Metodos faltantes
 */
@Named(value = "AdministracionBean")
@SessionScoped
public class AdministracionBean implements Serializable {
//****************************************************************************//
//                          Declaración de variables                          //
//****************************************************************************//

    @EJB
    private RolesFacade rolesFacade;
    private Roles rolNuevo = new Roles();
    private Roles rolConsultar = new Roles();
    private Roles rolEditar = new Roles();

    @EJB
    private MenusFacade menusFacades;

    @EJB
    private SubmenusFacade subMenusFacades;
    private List<SelectItem> privilegios = new ArrayList<SelectItem>();

    @EJB
    private PrivilegiosFacade privilegiosFacade;

//*************************SubMenus *******************************************//
    private List<Submenus> submenu1 = new ArrayList<>();
    private List<Submenus> submenu2 = new ArrayList<>();
    private List<Submenus> submenu3 = new ArrayList<>();
    private List<Submenus> submenu4 = new ArrayList<>();
    private List<Submenus> submenu5 = new ArrayList<>();
    private List<Submenus> submenu6 = new ArrayList<>();
    private List<Submenus> submenu7 = new ArrayList<>();
    private List<Submenus> submenu8 = new ArrayList<>();

//*******************************Permisos **************************************
//*******************************Menu Agenda ***********************************
//*******************************Pantalla Citas Aprobadas***********************
    private List<Privilegios> citasAprobadas = new ArrayList<>();
    private Boolean sCitasAprobadas = false;

//*******************************Pantalla Citas Pendientes**********************
    private List<Privilegios> citasPendientes = new ArrayList<>();
    private Boolean sCitasPendientes = false;

//*******************************Menu Insumos **********************************
//*******************************Pantalla Gestionar Insumos*********************
    private List<Privilegios> gestionarInsumos = new ArrayList<>();
    private Boolean sGestionarInsumos = false;

//*******************************Menu Promociones ******************************
//*******************************Pantalla Listado de Promociones ***************
    private List<Privilegios> listadoPromociones = new ArrayList<>();
    private Boolean sListadoPromociones = false;

//********************************Menu Administracions  ************************
//********************************Pantalla Gestionar Sucursales ****************
    private List<Privilegios> gestionarSucursales = new ArrayList<>();
    private Boolean sGestionarSucursales = false;

//********************************Pantalla Gestionar Medicos *******************
    private List<Privilegios> gestionarMedicos = new ArrayList<>();
    private Boolean sGestionarMedicos = false;

//********************************Pantalla Gestionar Tratamientos **************
    private List<Privilegios> gestionarTratamientos = new ArrayList<>();
    private Boolean sGestionarTratamientos = false;

//******************************** Pantalla Gestionar Patologias ***************
    private List<Privilegios> gestionarPatologias = new ArrayList<>();
    private Boolean sGestionarPatologias = false;

//********************************Pantalla GestionarTipoInsumo *****************
    private List<Privilegios> gestionarTipoInsumo = new ArrayList<>();
    private Boolean sGestionarTipoInsumo = false;

//*******************************Pantalla Gestionar Unidades de Medida *********
    private List<Privilegios> gestionarUnidadMedida = new ArrayList<>();
    private Boolean sGestionarUnidadMedida = false;

//****************************************************************************//
//                  Métodos para obtener listas por entidades                 //
//****************************************************************************//
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

//****************************************************************************//
//                 Métodos Get para obtener datos de entidades                //
//****************************************************************************//    
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

//****************************************************************************//
//                             Métodos Get y SET                              //
//****************************************************************************// 
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
            if (submenus.getSubmenuId() == 2) {
                sCitasAprobadas = true;
            }

            if (submenus.getSubmenuId() == 3) {
                sCitasPendientes = true;
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
            if (submenus.getSubmenuId() == 13) {
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
            if (submenus.getSubmenuId() == 19) {
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
            if (submenus.getSubmenuId() == 34) {
                sGestionarSucursales = true;
            }

            if (submenus.getSubmenuId() == 35) {
                sGestionarMedicos = true;
            }

            if (submenus.getSubmenuId() == 36) {
                sGestionarTratamientos = true;
            }

            if (submenus.getSubmenuId() == 37) {
                sGestionarPatologias = true;
            }

            if (submenus.getSubmenuId() == 38) {
                sGestionarTipoInsumo = true;
            }

            if (submenus.getSubmenuId() == 39) {
                sGestionarUnidadMedida = true;
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

    //********************** Pantalla Citas Aprobadas **************************
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

    //********************** Pantalla Citas Pendientes *************************
    public List<Privilegios> getCitasPendientes() {
        return citasPendientes;
    }

    public void setCitasPendientes(List<Privilegios> citasPendientes) {
        this.citasPendientes = citasPendientes;
    }

    public Boolean getsCitasPendientes() {
        return sCitasPendientes;
    }

    public void setsCitasPendientes(Boolean sCitasPendientes) {
        this.sCitasPendientes = sCitasPendientes;
    }

    //********************** Pantalla Gestionar Insumo *************************
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

    //********************** Pantalla Listado Promociones **********************
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

    //********************** Pantalla Gestionar Sucursales *********************
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

    //********************** Pantalla Gestionar Medicos ************************
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

    //**********************Pantalla Gestionar Tratamientos ********************
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

    //********************** Pantalla Gestionar Patologia **********************
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

    //********************** Pantalla Gestionar Tipo Insumo ********************
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

    //********************** Pantalla Gestionar Unidad de Medida ***************
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

//****************************************************************************//
//                                  Métodos                                   //
//****************************************************************************//    
    //Metodo usado en configuracion_roles_nuevo.xhtml
    //Estado:
    public void guardarRol() {
        try {
            List<Submenus> temp = new ArrayList<>();
            List<Menus> tempMenu = new ArrayList<>();

            if (!submenu1.isEmpty()) {
                for (Submenus list : submenu1) {
                    temp.add(list);
                }
                tempMenu.add(getMenusFacades().find(submenu1.get(0).getMenuId().getMenuId()));
            }

            if (!submenu2.isEmpty()) {
                for (Submenus list : submenu2) {
                    temp.add(list);
                }
                tempMenu.add(getMenusFacades().find(submenu2.get(0).getMenuId().getMenuId()));
            }

            if (!submenu3.isEmpty()) {
                for (Submenus list : submenu3) {
                    temp.add(list);
                }
                tempMenu.add(getMenusFacades().find(submenu3.get(0).getMenuId().getMenuId()));
            }

            if (!submenu4.isEmpty()) {
                for (Submenus list : submenu4) {
                    temp.add(list);
                }
                tempMenu.add(getMenusFacades().find(submenu4.get(0).getMenuId().getMenuId()));
            }

            if (!submenu5.isEmpty()) {
                for (Submenus list : submenu5) {
                    temp.add(list);
                }
                tempMenu.add(getMenusFacades().find(submenu5.get(0).getMenuId().getMenuId()));
            }

            if (!submenu6.isEmpty()) {
                for (Submenus list : submenu6) {
                    temp.add(list);
                }
                tempMenu.add(getMenusFacades().find(submenu6.get(0).getMenuId().getMenuId()));
            }

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
            System.out.println("Curisoso");

            System.out.println("Curisoso");
            rolNuevo.setMenusList(tempMenu);
            rolNuevo.setSubmenusList(temp);
            System.out.println("Curisoso");
            getRolesFacade().create(rolNuevo);
            mensajeGuardado("El rol fue guardado.");
            limpiandoNuevoRol();
        } catch (Exception e) {
            mensajeError("Error al guardar el rol.");
            System.out.println("controllers.AdministracionBean.guardarRol()" + e);
        }
    }

    //Establece los valores del rol a la pantalla
    //Estado: Activo
    //Usado en: cat_roles_listado.xhtml
    public void establecerPrivilegiosRolEditar() {
        if (rolEditar != null) {
            submenu1.clear();
            submenu2.clear();
            submenu3.clear();
            submenu4.clear();
            submenu5.clear();
            submenu6.clear();
            submenu7.clear();
            submenu8.clear();

            if (!rolEditar.getSubmenusList().isEmpty()) {

                for (Submenus item : rolEditar.getSubmenusList()) {
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
            sCitasAprobadas = false;
            sCitasPendientes = false;
            sGestionarInsumos = false;
            sListadoPromociones = false;
            sGestionarSucursales = false;
            sGestionarMedicos = false;
            sGestionarTratamientos = false;
            sGestionarPatologias = false;
            sGestionarTipoInsumo = false;
            sGestionarUnidadMedida = false;
            /*for (Privilegios privilegio : rolEditar.getPrivilegiosList()) {
                System.out.println("Privilegio" + privilegio.getPrivilegiosPK().getPrivilegioId());
            }*/
            //Recorriendo los privilegios
            for (Privilegios privilegio : rolEditar.getPrivilegiosList()) {
                switch (privilegio.getPrivilegiosPK().getPrivilegioId()) {
                    case 1:
                    case 2:
                    case 3:
                        sCitasAprobadas = true;
                        citasAprobadas.add(privilegio);
                    case 4:
                    case 5:
                    case 6:
                        sCitasPendientes = true;
                        citasPendientes.add(privilegio);
                        break;
                    case 13:
                    case 14:
                    case 15:
                        sGestionarInsumos = true;
                        gestionarInsumos.add(privilegio);
                    case 16:
                    case 17:
                    case 18:
                        sListadoPromociones = true;
                        listadoPromociones.add(privilegio);
                        break;
                    case 19:
                    case 20:
                    case 21:
                        sGestionarSucursales = true;
                        gestionarSucursales.add(privilegio);
                        break;
                    case 22:
                    case 23:
                    case 24:
                        sGestionarMedicos = true;
                        gestionarMedicos.add(privilegio);
                        break;
                    case 25:
                    case 26:
                        sGestionarTratamientos = true;
                        gestionarTratamientos.add(privilegio);
                        break;
                    case 27:
                    case 28:
                        sGestionarPatologias = true;
                        gestionarPatologias.add(privilegio);
                        break;
                    case 29:
                    case 30:
                        sGestionarTipoInsumo = true;
                        gestionarTipoInsumo.add(privilegio);
                        break;
                    case 31:
                    case 32:
                        sGestionarUnidadMedida = true;
                        gestionarUnidadMedida.add(privilegio);
                        break;
                }
            }

        }
    }

    //Metodo usado en la tabla de listas roles, en la opcion de consultar.
    public void establecerPrivilegiosRolConsultar() {
        if (rolConsultar != null) {
            submenu1.clear();
            submenu2.clear();
            submenu3.clear();
            submenu4.clear();
            submenu5.clear();
            submenu6.clear();
            submenu7.clear();
            submenu8.clear();

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
    public void limpiandoNuevoRol() {
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

    //Objetivo: Guarda los submenus y privilegios
    //Metodo usado en cat_roles_editar.xhtml
    //Estado: Usado
    public void editarRol() {
        try {
            List<Submenus> temp = new ArrayList<>();
            List<Menus> tempMenu = new ArrayList<>();
            List<Privilegios> tempPrivilegios = new ArrayList<>();

            //Menu: Agenda
            if (!submenu1.isEmpty()) {
                for (Submenus list : submenu1) {
                    //Pantalla: Citas Aprobadas
                    if (list.getSubmenuId() == 2) {
                        for (Privilegios p : citasAprobadas) {
                            tempPrivilegios.add(p);
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
                    if (list.getSubmenuId() == 13) {
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
                    if (list.getSubmenuId() == 19) {
                        for (Privilegios pri : listadoPromociones) {
                            tempPrivilegios.add(pri);
                        }
                    }
                    temp.add(list);
                }
                tempMenu.add(getMenusFacades().find(submenu4.get(0).getMenuId().getMenuId()));
            }

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
                    if (list.getSubmenuId() == 34) {
                        for (Privilegios pri : gestionarSucursales) {
                            tempPrivilegios.add(pri);
                        }
                    }
                    //Pantalla: Gestionar Medicos
                    if (list.getSubmenuId() == 35) {
                        for (Privilegios pri : gestionarMedicos) {
                            tempPrivilegios.add(pri);
                        }
                    }
                    //Pantalla: Gestionar Tratamientos
                    if (list.getSubmenuId() == 36) {
                        for (Privilegios pri : gestionarTratamientos) {
                            tempPrivilegios.add(pri);
                        }
                    }
                    //Pantalla: Gestionar Tipo de Insumo
                    if (list.getSubmenuId() == 37) {
                        for (Privilegios pri : gestionarPatologias) {
                            tempPrivilegios.add(pri);
                        }
                    }
                    //Pantalla: Gestionar Tipo de Insumo
                    if (list.getSubmenuId() == 38) {
                        for (Privilegios pri : gestionarTipoInsumo) {
                            tempPrivilegios.add(pri);
                        }
                    }
                    //Pantalla: Gestionar Tipo de Insumo
                    if (list.getSubmenuId() == 39) {
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
            rolEditar.getMenusList().clear();
            rolEditar.getSubmenusList().clear();
            rolEditar.getPrivilegiosList().clear();
            rolEditar.setMenusList(tempMenu);
            rolEditar.setSubmenusList(temp);
            rolEditar.setPrivilegiosList(tempPrivilegios);
            //  rolEditar.setPrivilegiosList(tempPrivilegios);

            getRolesFacade().edit(rolEditar);
            mensajeGuardado("Rol actualizado adecuadamente.");
        } catch (Exception e) {
            mensajeError("Error al actualizar rol.");
            System.err.println("" + e);
        }
    }

    public List<SelectItem> privilegios() {
        List<Menus> menus = getMenusFacades().findAll();
        privilegios.clear();
        for (Menus menu : menus) {
            List<Submenus> submenus = subMenusPorMenu(menu.getMenuId());
            if (!submenus.isEmpty()) {
                SelectItemGroup grupoNuevo = new SelectItemGroup(menu.getMenuNombre());
                SelectItem[] items = new SelectItem[submenus.size()];
                for (int i = 0; i < submenus.size(); i++) {
                    System.out.println("Entraa" + submenus.get(i).getSubmenuId());
                    items[i] = new SelectItem(submenus.get(i).getSubmenuId(), submenus.get(i).getSumbenuNombre());
                }

                for (int i = 0; i < items.length; i++) {
                    System.out.println("items " + items[i].getLabel());
                }
                grupoNuevo.setSelectItems(items);
                privilegios.add(grupoNuevo);
            }

        }
        return privilegios;
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

}
