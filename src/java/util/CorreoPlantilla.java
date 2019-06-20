package util;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

public class CorreoPlantilla {

    private static Locale espanyol = new Locale("es");

    public CorreoPlantilla() {
    }

    public String plantillaN1(String mensaje) {
        String body = "<div style=\"margin-top: 0px;\">"
                + "      <h1 style=\"text-align: center; background: #0B6EAC; color: white\">Clinica Dental Smiling</h1>    "
                + "    </div>"
                + "    <div>"
                + "    " + mensaje
                + "    </div>"
                + "    <div style=\"background-color:#0B6EAC; color: white;\">"
                + "      <div style=\"text-align: right\">"
                + "         <p>Horario de lunes a viernes de 8:00 a.m. a 6:00 p.m.<br/>"
                + "            Sabádo de 8:00 a.m. a 2:30 p.m. <br/>"
                + "            Diagonal Dr Arturo Romero edificio 444 local # 4 Edificio del Subway . Col medica.<br/>"
                + "         </p>"
                + "      </div>"
                + "         <div style=\"padding:5px; text-align: center; border-top: 1px double white\">"
                + "              © 2019 <b>SIAEC</b> Todos los Derechos Reservados."
                + "         </div> "
                + "      </div>";
        return body;
    }

    public String plantillaN2(String mensaje) {
        String body = "<div style=\"margin-top: 0px; margin-bottom: 35px;\">"
                + "      <h1 style=\"text-align: center; background: #0B6EAC; color: white\">Clinica Dental Smiling</h1>    "
                + "    </div>"
                + "    <div style=\"margin-top: 10px; margin-bottom: 60px;\">"
                + "      <p>"
                + "          <br/>" + mensaje + "<br/>"
                + "      </p>"
                + "    </div>"
                + "    <div style=\"background-color:#0B6EAC; color: white;\">"
                + "      <div style=\"text-align: right\">"
                + "         <p>Horario de lunes a viernes de 8:00 a.m. a 6:00 p.m.<br/>"
                + "            Sabádo de 8:00 a.m. a 2:30 p.m. <br/>"
                + "            Diagonal Dr Arturo Romero edificio 444 local # 4 Edificio del Subway . Col medica.<br/>"
                + "         </p>"
                + "      </div>"
                + "         <div style=\"padding:5px; text-align: center; border-top: 1px double white\">"
                + "              © 2019 <b>SIAEC</b> Todos los Derechos Reservados."
                + "         </div> "
                + "      </div>";
        return body;
    }

    public String msjCita(Date fecha, Date hora, String sucursal) {

        SimpleDateFormat fechaFormato = new SimpleDateFormat("'Lo esperamos el dia' dd 'de' MMMM 'de' yyyy", espanyol);
        SimpleDateFormat horaFormato = new SimpleDateFormat("hh:mm aa");
        String mensaje = "<div>\n"
                + "           <h1>Su cita a sido confirmada</h1>\n"
                + "           <p>\n"
                + "            " + fechaFormato.format(fecha) + "<br/>\n"
                + "            A las " + horaFormato.format(hora) + "<br/>\n"
                + "            En la sucursal " + sucursal + "<br/>\n"
                + "              \n"
                + "           </p>\n"
                + "       </div> ";
        return mensaje;
    }
}
