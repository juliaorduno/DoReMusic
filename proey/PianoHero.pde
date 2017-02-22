
public class PianoHero{
  PImage fondo, btnSalir;
  HashMap<String,Integer> pianoMap;
  String titleSong, toPlay, played;
  int tracker, posx, textSize;
  boolean songDone, visible;
  int[] toBePlay = {6,7,6,5,4,5,6,3,4,5,4,5,6,6,7,6,5,4,5,6,3,6,4,2};
  String[] mySong= {"Do ","Re ","Mi ","Fa ", "Sol ", "La ", "Si ", "Do* "};
  String[] myPlayedNotes= new String[toBePlay.length];
  //int[] sequence = new int[toBePlay.length];
  PFont myFont;
  NotaDeColor[] notasDeColores = new NotaDeColor[toBePlay.length];
  
  
 
public PianoHero(){
  this.fondo = loadImage("/img/teclado.png");  
  //this.btnSalir = loadImage("/img/exit.png");
  tracker=0;
  songDone=false;
  myFont = createFont("/img/FREESCPT.TTF",35);
  textFont(myFont);
  posx=100;
  textSize=39;
  pianoMap = new HashMap<String,Integer>();
  pianoMap.put("Do", 2);
  pianoMap.put("Re", 3);
  pianoMap.put("Mi", 4);
  pianoMap.put("Fa", 5);
  pianoMap.put("Sol", 6);
  pianoMap.put("La", 7);
  pianoMap.put("Si", 8);
  pianoMap.put("DoSos", 2);
  titleSong="El puente de Londres se va a caer";
  toPlay="Sol La Sol Fa Mi Fa Sol Re Mi Fa Mi Fa Sol Sol La Sol Fa Mi Fa Sol Re Sol Mi Do";
  for (int i=0;i<toBePlay.length; i++){
    notasDeColores[i]=new NotaDeColor(mySong[toBePlay[i]-2], color(250,250,250), posx,50);
    posx+=textWidth(mySong[toBePlay[i]-2]);
  }
 //played="";
  /*
  6,7,6,5,4,5,6,3,4,5,4,5,6,6,7,6,5,4,5,6,3,6,4,2
  titleSong="Twinkle Twinkle Star";
  toPlay="2,2,6,6,7,7,6,5,5,4,4,3,3,2,6,5,5,4,4,3,2,2,6,6,7,7,6,5,5,4,4,3,3,2";
  do=2
  re=3
  mi=4
  fa=5
  sol=6
  la =7
  si=8
  dosos=9
  textFont(createFont("AgencyFB-Reg-48", 30));
  so|, la so| fa mi fa so| ----- El puente de Londres se va a caer,
remifa mifaso| ----- se va a caer, se va a caer
so|, la so| fa mi fa so| ----- El puente de Londres se va a caer,
re__ so|__ mi do ----- se va a caer, se va a caer.
  */
  this.visible=false;
}
 
public void drawPianoHero(){
  paintTile(toBePlay[tracker]);
  background(this.fondo); 
  //image(btnSalir,840, 75);
  this.visible=true;
  //fill(250,250,250);
  //textSize(35);
 //text(toPlay, 100, 50);
  fill(250,250,250);
  text(titleSong, 400, 120);
  //toBePlay=int(toPlay.substring(tracker,tracker+1));
}
 
public void play(int index){
 // toBePlay=int(toPlay.substring(tracker,tracker+1));
 if(tracker<=toBePlay.length-1){
    background(this.fondo);
    paintTile(toBePlay[tracker]);
    textSize(60);
    fill(250,250,250);
  //text(titleSong, 410, 130);
    //image(btnSalir,855, 75);
    textSize(textSize);
    for (int i=0;i<toBePlay.length; i++){
    notasDeColores[i].pintarNotas(); 
    }
    //text(toPlay.substring(tracker), posx, 50);
    //fill(200,0,200);
    //text(toPlay, 100, 50);
    //fill(250,250,250);
    //text(toPlay.substring(tracker), posx, 50); // progress of player
      //text("To Play: " + toPlay[tracker], 15, 20);
    //text(played, 100, 50);
    //sequence[tracker]=index;
      if(index==toBePlay[tracker]){
        notasDeColores[tracker].setMiColor(paintNotes(index));
        tracker++; 
        //played+=mySong[index-2]+" ";
      }
      }
     
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
    fill(0,171,17);
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
  
  public color paintNotes(int index){
   if(index==2){
    return color(255,0,0);
  }
  else if(index==3){
    return color(255,155,4);
  }
  else if(index==4){
    return color(255,248,14);
  }
  else if(index==5){
   return color (0,171,17);
  }
  else if(index==6){
    return color(67,250,0);
  }
  else if(index==7){
    return color(17,0,250);
  }
   else if(index==8){
    return color(7,198,255);
  }
  else if(index==9){
    return color(198,7,255);
  }
  return color(250,250,250);
  
  }
  
  public void printToBePlay(int i1, int i2){
     textSize(textSize);
     fill(0,0,0);
     text(toPlay.substring(0, i1), 100, 50);
    text(toPlay.substring(i2), posx, 50);
  
  }
  //hacer que se pongan blancas de nuevo
  //que el serial deje de mandar continuamente números, que lo haga sólo cuando se pica
}      