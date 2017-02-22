int btnRed = 2;  
int btnOrange = 3;  
int btnYellow = 4;
int btnDarkGreen = 5;  
int btnLigthGreen = 6;  
int btnDarkBlue = 7; 
int btnLigthBlue= 8;  
int btnViolet = 9; 

void setup() {
  pinMode(btnRed, INPUT);  
  pinMode(btnOrange, INPUT);   
  pinMode(btnYellow, INPUT); 
  pinMode(btnDarkGreen, INPUT);  
  pinMode(btnLigthGreen, INPUT);   
  pinMode(btnDarkBlue, INPUT);
  pinMode(btnLigthBlue, INPUT);  
  pinMode(btnViolet, INPUT); 
  Serial.begin(9600);       
}

void loop() {
  if (digitalRead(btnRed) == HIGH){
    Serial.write(btnRed);  
  }
  else if(digitalRead(btnOrange) == HIGH) {  
    Serial.write(btnOrange);    

  } else if (digitalRead(btnYellow) == HIGH){                               
    Serial.write(btnYellow);    
       
  } else if (digitalRead(btnDarkGreen) == HIGH){                               
    Serial.write(btnDarkGreen);   
       
  } else if (digitalRead(btnLigthGreen) == HIGH){
    Serial.write(btnLigthGreen);         
  } else if (digitalRead(btnDarkBlue) == HIGH){                               
    Serial.write(btnDarkBlue);              
  } else if (digitalRead(btnLigthBlue) == HIGH){
    Serial.write(btnLigthBlue);            
  }else if (digitalRead(btnViolet) == HIGH){
    Serial.write(btnViolet);      
  }   
}                          

