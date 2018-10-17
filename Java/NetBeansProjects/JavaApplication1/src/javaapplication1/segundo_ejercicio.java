
package javaapplication1;
import javax.swing.JOptionPane;
        
/**
 *
 * @author Ricardo Buriticá
 */
public class segundo_ejercicio {
public static void main (String [] arg)
{
  double n1,n2,n3,def=0;
  n1 = Double.parseDouble(JOptionPane.showInputDialog("Digite nota1: "));
  n2 = Double.parseDouble(JOptionPane.showInputDialog("Digite nota2: "));
  n3 = Double.parseDouble(JOptionPane.showInputDialog("Digite nota3: "));

  def = n1*0.3+n2*0.3+n3*0.4;
 
  if(def<3){
JOptionPane.showMessageDialog(null," ¡deficiente! "); 
}
  else if ((def>=3)&&(def<3.9)){
      JOptionPane.showMessageDialog(null,"Aceptable,debes mejorar");
  }
  else {
  JOptionPane.showMessageDialog(null,"Excelente,keep going");
  }

}
}