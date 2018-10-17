
#include <VirtualWire.h>

const int buttonpin = 5;
const int buttonpin2 = 6;

int buttonstate = 0;
int buttonstate2 = 0;
void setup()
{
  //Iniciamos el Serial y la comunicacion por radio
  Serial.begin(9600);
  Serial.write("Sistema encendido\n");
  vw_setup(2000);
  digitalWrite(buttonpin,LOW);
  pinMode(buttonpin,INPUT);
  pinMode(buttonpin2,INPUT);
}
void loop()
{
buttonstate = digitalRead(buttonpin);
if(buttonstate == HIGH)
{
send("Encender"); //Enviamos ENCENDER
 delay(1000);      //Esperamos 1 segundo 
}
  else {
    send("Apagar");   //Enviamos APAGAR
     delay(1000);      //Esperamos 1 segundo
     digitalWrite(buttonpin,LOW);
  }
 
}
 
//Funcion para enviar el mensaje
void send (char *message)
{
  vw_send((uint8_t *)message, strlen(message)); //Envia el mensaje
  vw_wait_tx(); //Espera hasta que se haya acabado de transmitir todo
  
  Serial.println(message); //Muestra el mensaje por Serial
}
