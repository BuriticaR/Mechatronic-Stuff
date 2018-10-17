//Presentado por: Ricardo David Buriticá Romero
//Ingeniería Mecátronica 2018-3
//Modulo: Robotica I
//Primer Parcial


int sensorPot = A1;    // Entrada analogica del potenciometro      
const int Inicio_Programa = 2; //Pulsador De inicio del sistema
const int Parada_Programa = 3; //Pulsadador de parada del sistema
int Estado_pulsador=0; 
void setup() {
  pinMode(Inicio_Programa,INPUT); 
  pinMode(Parada_Programa,INPUT);
  pinMode(4, OUTPUT); //Led Azul #1
  pinMode(5, OUTPUT); //Led Azul #2
  pinMode(6, OUTPUT); //Led Azul #3
  pinMode(7, OUTPUT); //Led Azul #4
  pinMode(8, OUTPUT); //Led Azul #5
  pinMode(9, OUTPUT); //Led Azul #6
  pinMode(10, OUTPUT); //Led Azul #7
  Serial.begin(9600);
  
  }

void loop() {
 
  //El valor 777 será el que verificará y entrará a trabajar todo el sistema 
  if(digitalRead(Inicio_Programa) == HIGH){
    Estado_pulsador =777;
    }
  //Cambio de valor en el estado del pulsador para que el sistema pueda deternerse.
   if(digitalRead(Parada_Programa) == HIGH){
    Estado_pulsador =778;
    }
    // Pulsador pulsado y con el valor de 777 para el inicio del sistema
  if(Estado_pulsador == 777){
    Serial.println(analogRead(sensorPot)); //En está línea se imprime en el monitor serial el valor que se encuentra en el potenciometro
    if(analogRead(sensorPot)>=200){
     digitalWrite(4,HIGH);
      }
      else{
        digitalWrite(4,LOW);
        }

    if(analogRead(sensorPot)>=300){
     digitalWrite(5,HIGH);
      }
      else{
        digitalWrite(5,LOW);
        }

    if(analogRead(sensorPot)>=400){
     digitalWrite(6,HIGH);
      }
      else{
        digitalWrite(6,LOW);
        }

    if(analogRead(sensorPot)>=500){
     digitalWrite(7,HIGH);
      }
      else{
        digitalWrite(7,LOW);
        }

    if(analogRead(sensorPot)>=600){
     digitalWrite(8,HIGH);
      }
      else{
        digitalWrite(8,LOW);
        }

    if(analogRead(sensorPot)>=700){
     digitalWrite(9,HIGH);
      }
      else{
        digitalWrite(9,LOW);
        }

     if(analogRead(sensorPot)>=800){
     digitalWrite(10,HIGH);
      }
      else{
        digitalWrite(10,LOW);
        }

 
  }
//En la siguiente línea se colocará una condición else-if para detener el sistema.
else if(Estado_pulsador==778){
  digitalWrite(4,LOW);
  digitalWrite(5,LOW);
  digitalWrite(6,LOW);
  digitalWrite(7,LOW);
  digitalWrite(8,LOW);
  digitalWrite(9,LOW);
  digitalWrite(10,LOW);
  
    
  }
    }
