import ddf.minim.*;
import processing.serial.*;
import gifAnimation.*;

PanelMascota pnlChango;
PanelInicio pnlInicio;
DoReMusic drm;
Serial myPort;  // Crear objeto de la clase Serial
int index;      // Variable para guardar los datos recibidos de Arduino
AudioPlayer doNota,reNota,miNota,faNota,solNota,laNota,siNota,doSosNota;
Minim cadena; 
PanelFreePiano pnlFreePiano;
int programas; 
PianoHero pnlPianoHero;
PanelPremio pnlPremio;
Gif myLondonBridgeAnimation, myPianoAnimation;
boolean showMenu;
  
void setup(){
  size(1000,600);
  smooth();
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600);
   pnlInicio = new PanelInicio();
   pnlFreePiano = new PanelFreePiano();
   cadena= new Minim(this);
   doNota=cadena.loadFile("/img/Do.wav");
   reNota=cadena.loadFile("/img/Re.wav");
   miNota=cadena.loadFile("/img/Mi.wav");
   faNota=cadena.loadFile("/img/Fa.wav");
   solNota=cadena.loadFile("/img/Sol.wav");
   laNota=cadena.loadFile("/img/La.wav");
   siNota=cadena.loadFile("/img/Si.wav");
   doSosNota=cadena.loadFile("/img/DoA.wav");
   pnlChango = new PanelMascota();
   drm = new DoReMusic(pnlChango);
   drm.setPanels();
   programas=0;
   pnlPianoHero= new PianoHero();
   pnlPremio = new PanelPremio();
   myLondonBridgeAnimation = new Gif(this,"/img/LondonBGif.gif");
   myLondonBridgeAnimation.play();
   myPianoAnimation = new Gif(this,"/img/GifPianoBn.gif");
   myPianoAnimation.play();
   showMenu=false;
}

void draw(){
   while ( myPort.available() > 0) {  // Si el puerto está disponible
    //myPort.clear();
    index = myPort.read();  // Leer y guardar los datos
    playNote(index);
    if (programas==0){
      pnlInicio.drawPiano(index);
      boolean changeClass = pnlInicio.changeClass();
      if (changeClass){
       delay(1000);
       this.programas++;
      }
    }
    else if(programas==1){
      boolean changeClass = drm.checkAnswer(index);
      if (changeClass){
        this.programas++;
      }
    }
    else if (programas == 2){
      pnlPremio.drawMyPanelPremio(myLondonBridgeAnimation, myPianoAnimation);
      int selectedOption = pnlPremio.selectNextPanel(index);
      if (selectedOption==1){
        programas++;
      }
      else if(selectedOption==2){
        programas+=2;
      }
    }
    else if (programas == 3){
      if (!pnlPianoHero.visible){
        pnlPianoHero.drawPianoHero();
      }
      pnlPianoHero.play(index);
    }
    else if (programas==4){
      pnlFreePiano.drawFreePiano(index);
}
}
}
public void playNote(int index){
    if(index==2){
      if(doNota.position()<=doNota.length()-5){
            if(doNota.isPlaying()== false){
 
               doNota.play();
            }
          }else{
           doNota.rewind() ;
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
    if(doSosNota.position()<=doSosNota.length()-5){
            if(doSosNota.isPlaying()== false){
 
               doSosNota.play();
            }
          }else{
           doSosNota.rewind();
          }
  }
}

void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
   drm.readFile(selection);
   drm.setPanels();
  }
}

void mouseClicked(){
  if(mouseX>850 && mouseX<910 && mouseY>80 && mouseY<140 && !showMenu){
    showMenu = true;
    fill(91,206,245);
    stroke(91,206,245);
    rect(700,140,210,50);
    PFont pf;
    pf = createFont("Arial Rounded MT Bold", 40,true);
    textFont(pf,25);
    fill(255,255,255);
    text("Cargar Archivo", 710,175);
  }
  else if(mouseX>700 && mouseX<910 && mouseY>140 && mouseY<190 && showMenu){
      selectInput("Select a file to process:", "fileSelected");  
      //inicio = new PanelInicio();
      showMenu = false;
   }
  else if(mouseX>850 && mouseX<910 && mouseY>80 && mouseY<140 && showMenu){
    showMenu = false;
    //inicio = new PanelInicio();
  }
  
  


}
//checar como hacer que se espere
//hacer la cosa de leer archivos 
//agregar panel de seleccionar premio
//grabar y agregar voz
//aprender a hacer que la compu lea y reproduzca lo que leyó
//hacer piano hero 
//nota de voz para panelInicio