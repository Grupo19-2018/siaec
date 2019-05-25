
import java.util.Date;
import util.CorreoPlantilla;



/**
 *
 * @author erick
 */
public class plantilla {
    public static void main(String[] args) {
        CorreoPlantilla cp = new CorreoPlantilla();
        
        System.out.println(cp.msjCita(new Date(), new Date(), "San Jose"));
        
    }
    
}
