public class PanelInicio{ // Crear objeto de la clase Serial
  int index;      // Variable para guardar los datos recibidos de Arduino
  PImage fondo;
  boolean rojo, naranja, amarillo, verde, verdeB, azul, azulB, morado; 
  
  PanelInicio(){
    this.fondo = loadImage("/img/teclado.png");  
    image(loadImage("/img/bars.png"),850,80,60,60);
    background(this.fondo);
    this.index=0;
    rojo=false;
    naranja=false;
    amarillo=false;
    verde=false;
    verdeB=false;
    azul=false;
    azulB=false;
    morado=false;
  }
  
  public void drawPiano(int index){  
  this.index=index;
  image(loadImage("/img/bars.png"),850,80,60,60);
  if(index==2){
    fill(255,0,0);
    rect(92,160,100,400);
    fill(0,0,0);
    rect(175,160,40,320);
    rojo=true;
  }
  if(index==3){
    fill(255,155,4);
    rect(197,160,100,400);
    fill(0,0,0);
    rect(175,160,40,320);
    fill(0,0,0);
    rect(280,160,40,320);
    naranja=true;
  }
  if(index==4){
    fill(255,248,14);
    rect(302,160,100,400);
    fill(0,0,0);
    rect(280,160,40,320);
    amarillo=true;
  }
  if(index==5){
    fill(0,141,23);
    rect(405,160,100,400);
    fill(0,0,0);
    rect(485,160,40,320);
    verde=true;
  }
  if(index==6){
    fill(67,250,0);
    rect(510,160,100,400);
    fill(0,0,0);
    rect(485,160,40,320);
    fill(0,0,0);
    rect(590,160,40,320);
    verdeB=true;
  }
  if(index==7){
    fill(17,0,250);
    rect(615,160,100,400);
    fill(0,0,0);
    rect(590,160,40,320);
    fill(0,0,0);
    rect(700,160,40,320);
    azul=true;
  }
   if(index==8){
    fill(7,198,255);
    rect(720,160,100,400);
    fill(0,0,0);
    rect(700,160,40,320);
    azulB=true;
  }
  if(index==9){
    fill(198,7,255);
    rect(823,160,100,400);
    morado=true;
  }
 }
  
  public boolean changeClass(){ 
  if(rojo&&naranja&&amarillo&&verde&&verdeB&&azul&&azulB&&morado){
      return true;
  }
  else{
    return false;
  }
}
}