import processing.serial.*;
import ddf.minim.*;

Minim cadena;  
Serial myPort;  // Crear objeto de la clase Serial
int index;      // Variable para guardar los datos recibidos de Arduino
PImage fondo;
AudioPlayer doNota,reNota,miNota,faNota,solNota,laNota,siNota,doSosNota;



void setup() 
{
  size(1000, 600);
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600); //Se inicializa el puerto y se establece el tamaño de la ventana
  this.fondo = loadImage("/img/teclado.png");  
  background(this.fondo);
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

void draw()
{
  while ( myPort.available() > 0) {  // Si el puerto está disponible
    index = myPort.read();       // Leer y guardar los datos  
  println(index);  
  if(index==2){
    doNota.play();
    fill(255,0,0);
    rect(92,160,100,400);
    fill(0,0,0);
    rect(175,160,40,320);
  }
  if(index==3){
    reNota.play();
    fill(255,155,4);
    rect(197,160,100,400);
    fill(0,0,0);
    rect(175,160,40,320);
    fill(0,0,0);
    rect(275,160,40,320);
  }
  if(index==4){
    miNota.play();
    fill(255,248,14);
    rect(302,160,100,400);
    fill(0,0,0);
    rect(275,160,40,320);
  }
  if(index==5){
    faNota.play();
    fill(0,141,23);
    rect(405,160,100,400);
    fill(0,0,0);
    rect(485,160,40,320);
  }
  if(index==6){
    solNota.play();
    fill(67,250,0);
    rect(510,160,100,400);
    fill(0,0,0);
    rect(485,160,40,320);
    fill(0,0,0);
    rect(590,160,40,320);
  }
  if(index==7){
    laNota.play();
    fill(17,0,250);
    rect(615,160,100,400);
    fill(0,0,0);
    rect(590,160,40,320);
    fill(0,0,0);
    rect(700,160,40,320);
  }
   if(index==8){
    siNota.play();
    fill(7,198,255);
    rect(720,160,100,400);
    fill(0,0,0);
    rect(700,160,40,320);
  }
  if(index==9){
    doSosNota.play();
    fill(198,7,255);
    rect(823,160,100,400);
  }
  }
}