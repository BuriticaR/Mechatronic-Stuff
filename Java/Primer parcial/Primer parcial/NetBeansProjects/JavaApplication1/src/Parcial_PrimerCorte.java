 /*1. un obrero si trabaja 40 horas o menos se le pagara, a quincelmil pesos por hora,pero si trabaja mas de cuarenta horas  se le pagara 15 mil por cada hora de las primeras 
   , y veinte mil por cada hora extra* hallar el total a pagar 
 
 
*/
import javax.swing.JOptionPane;
public class Parcial_PrimerCorte {

    
    public static void main (String [] arg){
       double horas_semanal,horas_extra,salario_semanal=0;
        horas_semanal = Double.parseDouble(JOptionPane.showInputDialog("Digite horas semanales trabajadas: "));
        horas_extra = Double.parseDouble(JOptionPane.showInputDialog("Digite horas extras trabajadass: "));
       
       
       
        if(horas_semanal>40){
         salario_semanal = horas_semanal*15000 + horas_extra*20000;
        JOptionPane.showMessageDialog(null," Esta semana usted gano " +salario_semanal);   
       }
        
        else{
        salario_semanal = horas_semanal*15000;    
        JOptionPane.showMessageDialog(null," Esta semana usted gano " +salario_semanal);
    } 
      



















}    
    
}
