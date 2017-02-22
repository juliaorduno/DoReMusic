  public class DoReMusic{

  String[] opciones1 = {"vol","voll","ból","bor","bob","bol","vor","vól","Completa la palabra","Ár___","'Árbol"};
  String[] opciones2= {"ba","vah","bah","va","vá","bá","bam","vo","Completa la palabra","Sel__","Selva"};
  String[] opciones3= {"ple","plo","plá","pla","plas","pal","plal","pló","Completa la palabra","___tanos","Plátanos"};
  String[] opciones4= {"lo","lol","yo","yio","llio","lló","llo","yó","Completa la palabra","Amari___","Amarillo"};
  String[] opciones5= {"za","sa","ca","sca","csa","zá","ssa","zsa","Completa la palabra","Naturale__","Naturaleza"};
  String[] opciones6= {"6","7","5","10","9","4","11","8","Realiza la operación","3+5=","3+5=8"};
  String[] opciones7= {"10","15","12","13","1","9","17","14","Realiza la operación","7+6=","7+6=13"};
  String[] opciones8= {"4","6","15","17","19","20","22","18","Realiza la operación","12+8=","12+8=20"};
  String[] opciones9= {"16","23","14","17","15","22","10","9","Realiza la operación","19-4=","19-4=15"};
  String[] opciones10= {"25","26","24","20","19","28","27","23","Realiza la operación","15+11","15+11=26"};
  char[] respuestas = {'6','4','3','7','1','8','4','6','5','2'};
  //array answers para el proceso readFile
  String[] answers = new String[10];
  String[][] totalOpt = {opciones1, opciones2, opciones3, opciones4, opciones5, opciones6, opciones7, opciones8, opciones9, opciones10};
  
  private PanelGame[] pnlGame;
  private PanelMascota pnlChango;
  private PImage mascota;
  
  public DoReMusic(){
    this.pnlGame = new PanelGame[10];
    this.pnlChango = new PanelMascota();
  }
  
  //Leer archivo
   public void readFile(File file){
    String lines[] = loadStrings(file);
    for (int i = 0 ; i < 10; i++) {
      totalOpt[i] = splitTokens(lines[i],",");
    }
    answers = splitTokens(lines[10],",");
    for (int i = 0 ; i < 10; i++) {
      respuestas[i] = int(answers[i]);
    }
  }
  
  public void setPanels(){
    for(int i = 0; i<pnlGame.length; i++){
      this.pnlGame[i] = new PanelGame();
      this.pnlGame[i].setOpciones(totalOpt[i]);
    }
    this.pnlChango.dibujarChangos();
    this.pnlChango.setVisible(true);
  }
  
  public void checkAnswer(char key){
    if(this.pnlChango.getVisible()){
      if(key == '1'){
        this.mascota = this.pnlChango.getChango();
      }
      else if (key == '2'){
        this.mascota = this.pnlChango.getChanga();
      }
      this.pnlChango.setVisible(false);
      this.pnlGame[0].setMascota(this.mascota);
      this.pnlGame[0].dibujar(0);
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
                this.pnlGame[i+1].dibujar(i+1);
              }
              else{
                intento++;
                int num;
                println(key);
                num = int(key-48);
                if(i==0){
                  this.pnlGame[i].getimg()[num-1] = loadImage("/img/gris.png");
                  this.pnlGame[i].dibujar(i);
                }
                else if(i>0 && key != this.respuestas[i-1] && intento>0){
                  this.pnlGame[i].getimg()[key-2] = loadImage("/img/gris.png");
                  this.pnlGame[i].dibujar(i);
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