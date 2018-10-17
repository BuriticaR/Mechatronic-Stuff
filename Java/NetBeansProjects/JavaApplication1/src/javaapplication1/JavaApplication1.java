
package javaapplication1;

/**
 *
 * @author Ricardo Buriticá
 */
import javax.swing.JOptionPane;
public class JavaApplication1 {

    public static void main(String[] args) {
     double n1,n2,suma,resta,multi,divide;
     
     n1= Double.parseDouble(JOptionPane.showInputDialog("Ingrese #1"));
     n2 = Double.parseDouble(JOptionPane.showInputDialog("Ingrese el # 2"));
     suma = n1 + n2;
     resta = n1 - n2;
     multi = n1*n2;
     divide = n1/n2;
     JOptionPane.showMessageDialog(null,"La suma es : " +suma);
     JOptionPane.showMessageDialog(null, "La resta es: " +resta);
     JOptionPane.showMessageDialog(null,"La multiplicacion es: "+multi);
     JOptionPane.showMessageDialog(null,"La division es: "+divide);
     
     
     
    }
    
}
