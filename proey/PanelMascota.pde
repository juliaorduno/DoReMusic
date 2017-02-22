public class PanelMascota{
  PImage chango;
  PImage changa;
  PImage fondo;
 boolean visible, dibujar;


  public PanelMascota(){
    this.chango = loadImage("/img/chango.png.png");
    this.changa = loadImage("/img/changa.png.png");
    this.fondo = loadImage("/img/fondo.png");
    this.visible = false;
    this.dibujar = false;
  }
  
  public void dibujarChangos(){
    background(this.fondo);
    image(this.chango, 150, 150, 300, 350);
    image(this.changa, 525,150,300,375);
    PFont pf;
    pf = createFont("Arial Rounded MT Bold", 40,true);
    textFont(pf,40);  
    fill(71,158,55);
    stroke(71,158,55);
    rect(0,0,1000,100);
    fill(255,255,255);
    text("Presiona rojo para Julio y morado para Cony",50,70);
    this.dibujar=true;
    this.visible=true;
  }
  
  public void setVisible(boolean visible){
    this.visible = visible;
  }
  
  public boolean getVisible(){
    return this.visible;
  }
  
  public PImage getChango(){
    return this.chango;
  }
  
  public PImage getChanga(){
    return this.changa;
  }
 
}