  public class DoReMusic{

  String[] opciones1 = {"vol","voll","ból","bor","bob","bol","vor","vól","Completa la palabra","Ár___"};
  String[] opciones2= {"ba","vah","bah","va","vá","bá","bam","vo","Completa la palabra","Sel__"};
  String[] opciones3= {"ple","plo","plá","pla","plas","pal","plal","pló","Completa la palabra","___tanos"};
  String[] opciones4= {"lo","lol","yo","yio","llio","lló","llo","yó","Completa la palabra","Amari___"};
  String[] opciones5= {"za","sa","ca","sca","csa","zá","ssa","zsa","Completa la palabra","Naturale__"};
  String[] opciones6= {"6","7","5","10","9","4","11","8","Realiza la operación","3+5="};
  String[] opciones7= {"10","15","12","13","1","9","17","14","Realiza la operación","7+6="};
  String[] opciones8= {"4","6","15","17","19","20","22","18","Realiza la operación","12+8="};
  String[] opciones9= {"16","23","14","17","15","22","10","9","Realiza la operación","19-4="};
  String[] opciones10= {"25","26","24","20","19","28","27","23","Realiza la operación","15+11"};
  int[] respuestas = {7,5,4,8,2,9,5,7,6,3};
  String[][] totalOpt = {opciones1, opciones2, opciones3, opciones4, opciones5, opciones6, opciones7, opciones8, opciones9, opciones10};
  
  private PanelGame[] pnlGame;
  private PanelMascota pnlChango;
  private PImage mascota;
  
  public DoReMusic(){
    this.pnlGame = new PanelGame[10];
    this.pnlChango = new PanelMascota();
  }
  
  
  public void setPanels(){
    for(int i = 0; i<pnlGame.length; i++){
      this.pnlGame[i] = new PanelGame();
      this.pnlGame[i].setOpciones(totalOpt[i]);
    }
    this.pnlChango.dibujarChangos();
    this.pnlChango.setVisible(true);
  }
  
  public void checkAnswer(int key){
    if(this.pnlChango.getVisible()){
      if(key == 2){
        this.mascota = this.pnlChango.getChango();
      }
      else if (key == 9){
        this.mascota = this.pnlChango.getChanga();
      }
      this.pnlChango.setVisible(false);
      this.pnlGame[0].setMascota(this.mascota);
      this.pnlGame[0].dibujar();
      this.pnlGame[0].setVisible(true);
    }
    else{
        
        for(int i = 0; i < this.pnlGame.length; i++){
          int intento = 0;
            if(this.pnlGame[i].getVisible() && i<this.pnlGame.length-1){
              if(key == this.respuestas[i]){
                this.pnlGame[i].setVisible(false);
                this.pnlGame[i+1].setVisible(true);
                this.pnlGame[i+1].setMascota(this.mascota);
                this.pnlGame[i+1].dibujar();
              }
              else{
                intento++;
                if(i==0){
                  this.pnlGame[i].getimg()[key] = loadImage("/img/gris.png");
                  this.pnlGame[i].dibujar();
                }
                else if(i>0 && key != this.respuestas[i-1] && intento>0){
                  this.pnlGame[i].getimg()[key] = loadImage("/img/gris.png");
                  this.pnlGame[i].dibujar();
                }
                
              }
          }
          else if(i == 9 && this.pnlGame[i].getVisible()){
            this.pnlGame[i].setVisible(false);
          }
        }
      }
    }
  }