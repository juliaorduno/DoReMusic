public class PanelFreePiano{   
  PImage fondo, btnSalir;
  
  PanelFreePiano(){
    this.fondo = loadImage("/img/teclado.png");  
    this.btnSalir = loadImage("/img/exit.png");
  }
  
  public void drawFreePiano(int index){  
  background(this.fondo);
  image(btnSalir,820, 55);//ponerle un evento onclick o algo por el estilo
  paintTile(index);
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
}