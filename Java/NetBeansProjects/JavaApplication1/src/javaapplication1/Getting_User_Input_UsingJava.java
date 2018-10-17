/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package javaapplication1;

import java.util.Scanner;

public class Getting_User_Input_UsingJava {
   public static void main(String[] args){
   
   Scanner scan= new Scanner (System.in);
   System.out.println("Ingrese cualquier numero");
   int user_input_number= scan.nextInt();
   
   System.out.println("El valor ingresado es");
   System.out.print(user_input_number);
   }
}
   
   
   
   
   
   
   
   
 
