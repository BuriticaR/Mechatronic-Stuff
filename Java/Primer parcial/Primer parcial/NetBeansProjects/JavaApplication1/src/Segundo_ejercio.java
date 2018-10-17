/*
 -En una reunion familiar hay hombres mujeres y niños, lea el numero de hombres mujeres y niños y diga el porcentaje de hombres mujeres y niños que hay en la reunion
 */

/**
 *
 * @author estudiante
 */
import javax.swing.JOptionPane;
public class Segundo_ejercio {
    public static void main (String [] arg){
    double nHombres,Nmujeres,Nniños,porH,porM,porN,Npersonas=0;
    nHombres = Double.parseDouble(JOptionPane.showInputDialog("Digite numero de hombres: "));
    Nmujeres = Double.parseDouble(JOptionPane.showInputDialog("Digite numero de mujeres: "));
    Nniños = Double.parseDouble(JOptionPane.showInputDialog("Digite numero de niños: "));
    
    Npersonas = nHombres+Nmujeres+Nniños;
    porH = (nHombres/Npersonas)*100;
    porM = (Nmujeres/Npersonas)*100;
    porN = (Nniños/Npersonas)*100;
    
   
 JOptionPane.showMessageDialog(null," El porcentaje de hombres es: " +porH);
 JOptionPane.showMessageDialog(null," El porcentaje de mujeres es: " +porM);
JOptionPane.showMessageDialog(null," El porcentaje de niños es " +porN);  
    
   
     
        
        
        
        
    }
}
