import ddf.minim.*;
import processing.serial.*;

Serial myPort;  // Crear objeto de la clase Serial
int index;      // Variable para guardar los datos recibidos de Arduino
AudioPlayer doNota,reNota,miNota,faNota,solNota,laNota,siNota,doSosNota;
Minim cadena; 
String sequence;
String toPlay;
int tracker = 0;
boolean songDone = false;
int score = 0;
PImage fondo, btnSalir;
 
void setup()
{
  this.fondo = loadImage("/img/teclado.png");  
  this.btnSalir = loadImage("/img/exit.png");
  cadena = new Minim(this);
  size(1000,600);
  smooth();
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
   cadena= new Minim(this);
   doNota=cadena.loadFile("/img/Do.wav");
   reNota=cadena.loadFile("/img/Re.wav");
   miNota=cadena.loadFile("/img/Mi.wav");
   faNota=cadena.loadFile("/img/Fa.wav");
   solNota=cadena.loadFile("/img/Sol.wav");
   laNota=cadena.loadFile("/img/La.wav");
   siNota=cadena.loadFile("/img/Si.wav");
   doSosNota=cadena.loadFile("/img/DoA.wav");
   sequence = "";
  // Silent night
  toPlay = "GAGEGAGEDDBCCGAACBAGAGEDDFDBCECGEGFDC".toLowerCase();
  // Twinkle Twinkle Star (also ABC song)
  //toPlay = "CCGGAAGFFEEDDCGGFFEEDGGFFEEDCCGGAAGFFEEDDC".toLowerCase();
 
  textFont(createFont("AgencyFB-Reg-48", 30));
      background(this.fondo);
    image(btnSalir,820, 55);
}
 
void draw()
{
  background(this.fondo);
  image(btnSalir,820, 55);
   
  fill(200,0,200);
  text("To Play: " + toPlay, 15, 30);
  text("Now Playing: " + sequence, 15, 70);
   
  fill(0,200,200);
  text("To Play: " + toPlay.substring(0, tracker), 15, 30); // progress of player
  text("Score: " + score, 15, 120); // progress of player
  
     while ( myPort.available() > 0) {  // Si el puerto está disponible
    index = myPort.read();     // Leer y guardar los datos
    paintTile(index);
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
} }

 
 
void playKey(AudioPlayer pianoKey)
{
  //checks if song is done
    if(tracker == toPlay.length())
      songDone = true;
       
       
    pianoKey.play();
    pianoKey.rewind();
    String keyPlayed = pianoKey.getMetaData().title();
     
    sequence += keyPlayed;
     
    if(!songDone)
    {
      checkIt(keyPlayed);
      tracker++;
    }
     
     
}
 
// This function checks the current key against the song and changes background
 
void checkIt(String played)
{
   if(toPlay.substring(tracker,tracker+1).equals(played))
     score++;   
   else
     score /= 2; 
      
}

public void paintTile(int index){
   if(index==2){
    fill(255,0,0);
    rect(92,160,100,400);
    fill(0,0,0);
    rect(175,160,40,320);
  }
  else if(index==3){
    fill(255,155,4);
    rect(197,160,100,400);
    fill(0,0,0);
    rect(175,160,40,320);
    fill(0,0,0);
    rect(280,160,40,320);
  }
  else if(index==4){
    fill(255,248,14);
    rect(302,160,100,400);
    fill(0,0,0);
    rect(280,160,40,320);
  }
  else if(index==5){
    fill(0,141,23);
    rect(405,160,100,400);
    fill(0,0,0);
    rect(485,160,40,320);
  }
  else if(index==6){
    fill(67,250,0);
    rect(510,160,100,400);
    fill(0,0,0);
    rect(485,160,40,320);
    fill(0,0,0);
    rect(590,160,40,320);
  }
  else if(index==7){
    fill(17,0,250);
    rect(615,160,100,400);
    fill(0,0,0);
    rect(590,160,40,320);
    fill(0,0,0);
    rect(700,160,40,320);
  }
   else if(index==8){
    fill(7,198,255);
    rect(720,160,100,400);
    fill(0,0,0);
    rect(700,160,40,320);
  }
  else if(index==9){
    fill(198,7,255);
    rect(823,160,100,400);
  }
  }