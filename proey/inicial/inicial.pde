DoReMusic drm;
 
import ddf.minim.*;
import processing.serial.*;

Serial myPort;  // Crear objeto de la clase Serial
int index;      // Variable para guardar los datos recibidos de Arduino
AudioPlayer doNota,reNota,miNota,faNota,solNota,laNota,siNota,doSosNota;
Minim cadena; 
  
void setup(){
   size(1000,600);
   smooth();
   String portName = Serial.list()[0];
   myPort = new Serial(this, portName, 9600);
   drm = new DoReMusic();
   drm.setPanels();
   cadena= new Minim(this);
   doNota=cadena.loadFile("/img/Do.wav");
   reNota=cadena.loadFile("/img/Re.wav");
   miNota=cadena.loadFile("/img/Mi.wav");
   faNota=cadena.loadFile("/img/Fa.wav");
   solNota=cadena.loadFile("/img/Sol.wav");
   laNota=cadena.loadFile("/img/La.wav");
   siNota=cadena.loadFile("/img/Si.wav");
   doSosNota=cadena.loadFile("/img/DoA.wav");
}

void draw(){
   while ( myPort.available() > 0) {  // Si el puerto está disponible
    index = myPort.read();     // Leer y guardar los datos
    drm.checkAnswer(index);
    if(index==2){
      doNota.play();
      if(doNota.position() == doNota.length()){
        doNota.rewind();
      }
    }
    else if (index==3){
    reNota.play();
      if(reNota.position() == reNota.length()){
        reNota.rewind();
      }
  }
  else if(index==4){
    miNota.play();
      if(miNota.position() == miNota.length()){
        miNota.rewind();
      }
  }
  else if(index==5){
    faNota.play();
      if(faNota.position() == faNota.length()){
        faNota.rewind();
      }
  }
  else if(index==6){
    solNota.play();
      if(solNota.position() == solNota.length()){
        solNota.rewind();
      }
  }
  else if(index==7){
    laNota.play();
      if(laNota.position() == laNota.length()){
        laNota.rewind();
      }
  }
  else if(index==8){
    siNota.play();
      if(siNota.position() == siNota.length()){
        siNota.rewind();
      }
  }
  else if(index==9){
    doSosNota.play();
      if(doSosNota.position() == doSosNota.length()){
        doSosNota.rewind();
}
}
   }
   
}