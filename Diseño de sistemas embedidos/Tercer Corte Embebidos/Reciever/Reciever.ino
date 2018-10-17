/*
RECEPTOR
 
Apaga el LED 13 si recibe el mensaje "Apagar"
Enciende el LED 13 si recibe el mensaje "Encender"
 
Escrito por Nano en beneficio de los seres humanos
www.robologs.net
*/
 
#include <VirtualWire.h>
 
//Creamos un mensaje
//La constante VW_MAX_MESSAGE_LEN viene definida en la libreria
byte message[VW_MAX_MESSAGE_LEN];
byte messageLength = VW_MAX_MESSAGE_LEN;
 
void setup()
{
  pinMode(4, OUTPUT); //Configuramos el pin 13
  
  Serial.begin(9600);//Iniciamos el Serial
  Serial.println("Iniciando...");
  
  vw_setup(2000);
  vw_rx_start();
}
void loop()
{
  if (vw_get_message(message, &messageLength))
  {
      if(comparar("Encender") == 0){
        digitalWrite(4, HIGH);
        Serial.write("LED Encendido\n");
      }
      else if(comparar("Apagar") == 0)
      {
        digitalWrite(4,LOW);
        Serial.write("LED Apagado\n");
      }
  
  }
}
 
char comparar(char* cadena) {
  //Esta funcion compara el string cadena con el mensaje recibido.
  //Si son iguales, devuelve 1. Si no, devuelve 0.
  
  for(int i = 0; i<messageLength; i++)
  {
    if(message[i] != cadena[i])
    {
      return 1;
    }
  }
 
    return 0;
}
