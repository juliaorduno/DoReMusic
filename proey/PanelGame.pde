public class PanelGame{
  PImage fondo;
  PImage[] imgBn = {loadImage("/img/rojo.png"), loadImage("/img/naranja.png"), loadImage("/img/amarillo.png"), loadImage("/img/verde.png"), loadImage("/img/verdecito.png"),
      loadImage("/img/azul.png"), loadImage("/img/azulito.png"), loadImage("/img/violeta.png")};
  String[] options;
  boolean visible;
  PImage mascota;
  
  public PanelGame(){
    this.fondo = loadImage("/img/fondo.png");
    this.visible = false;
  }
  
  public PImage[] getimg(){
    return this.imgBn;
  }
 
  public void setVisible(boolean visible){
    this.visible = visible;
  }
  
  public boolean getVisible(){
    return this.visible;
  }
  
  public void setMascota(PImage mascota){
    this.mascota = mascota;
  }
  
  public void dibujar(int num){
    fill(255,255,255);
    PFont pf;
    pf = createFont("Arial Rounded MT Bold", 40,true);
    textFont(pf,40);                
    background(this.fondo);
    int xIni = 150;
    int yIni = 230;
    int xJump = 0;
    int yJump = 0;
    for (int i = 0; i < this.imgBn.length; i++) {
      if (i == 4) {
        xJump = 600;
        yJump = 260;
      }
      image(imgBn[i], xIni * (i + 1) - xJump - 30, yIni + yJump - 100, 100, 150);
      text(this.options[i], xIni * (i + 1) - xJump, yIni + yJump);
    }
    fill(71,158,55);
    stroke(71,158,55);
    rect(0,0,1000,100);
    fill(255,255,255);
    text(this.options[8],300,40);
    text(this.options[9],380,90);
    image(this.mascota, 700,200);
     xIni = 750;
    int x = 35;
    xJump = 0;
    yJump = 0;
    for (int i = 0; i < num; i++) {
      if (i >= 5) {
        xJump=180;
       image(loadImage("/img/amarillo.png"), xIni+(i*x)-xJump, 50, 35, 45);
      }
      else{
      image(loadImage("/img/amarillo.png"), xIni+(i*x), 5, 35, 45);
      }
    }
  }
  
  public void setOpciones(String[] arreglo){
    this.options = arreglo;
  }
  
  public String[] getOpciones(){
    return this.options;
  }
 }