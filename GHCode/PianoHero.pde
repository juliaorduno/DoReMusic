
public class PianoHero{
  PImage fondo, btnSalir;
  HashMap<String,Integer> pianoMap;
  String sequence;
  String toPlay;
  String titleSong;
  int tracker, score;
  boolean songDone, visible;
 
public PianoHero(){
  this.fondo = loadImage("/img/teclado.png");  
  this.btnSalir = loadImage("/img/exit.png");
  tracker=0;
  score=0;
  songDone=false;
  sequence = "";
  titleSong="Twinkle Twinkle Star";
  toPlay = "22667765544332665544322667765544332";
  /*do=2
  re=3
  mi=4
  fa=5
  sol=6
  la =7
  si=8
  dosos=9*/
  textFont(createFont("AgencyFB-Reg-48", 30));
  background(this.fondo);
  image(btnSalir,820, 55);
}
 
public void drawPianoHero(int index){
  fill(200,0,200);
  text("To Play: " + toPlay, 15, 30);
    while(tracker < toPlay.length()){
      fill(0,200,200);
      text("To Play: " + toPlay.substring(0, tracker), 15, 30); // progress of player
      text("Now Playing: " + sequence, 15, 70);
      text("Score: " + score, 15, 120);
      int toBePlay=int(toPlay.substring(tracker,tracker+1));
      paintTile(toBePlay);
      sequence+=str(index);
      if(toBePlay==index){
        score++;
        tracker++; 
      }
    }
    
}
       

public void paintTile(int index){
    background(this.fondo);
    image(btnSalir,820, 55);
   if(index==2){
    fill(255,0,0);
    rect(92,160,100,400);
    fill(0,0,0);
    rect(175,160,40,320);
  }
  else if (index!=2){
    fill(255,255,255);
    rect(92,160,100,400);
    fill(0,0,0);
    rect(175,160,40,320);
  }
  if(index==3){
    fill(255,155,4);
    rect(197,160,100,400);
    fill(0,0,0);
    rect(175,160,40,320);
    fill(0,0,0);
    rect(275,160,40,320);
  }
  else if(index!=3){
    fill(255,255,255);
    rect(197,160,100,400);
    fill(0,0,0);
    rect(175,160,40,320);
    fill(0,0,0);
    rect(275,160,40,320);
  }
  if(index==4){
    fill(255,248,14);
    rect(302,160,100,400);
    fill(0,0,0);
    rect(275,160,40,320);
  }
  if(index!=4){
    fill(255,255,255);
    rect(302,160,100,400);
    fill(0,0,0);
    rect(275,160,40,320);
  }
  if(index==5){
    fill(0,141,23);
    rect(405,160,100,400);
    fill(0,0,0);
    rect(485,160,40,320);
  }
  else if(index!=5){
    fill(255,255,255);
    rect(405,160,100,400);
    fill(0,0,0);
    rect(485,160,40,320);
  }
  if(index==6){
    fill(67,250,0);
    rect(510,160,100,400);
    fill(0,0,0);
    rect(485,160,40,320);
    fill(0,0,0);
    rect(590,160,40,320);
  }
  else if(index!=6){
    fill(255,255,255);
    rect(510,160,100,400);
    fill(0,0,0);
    rect(485,160,40,320);
    fill(0,0,0);
    rect(590,160,40,320);
  }
  if(index==7){
    fill(17,0,250);
    rect(615,160,100,400);
    fill(0,0,0);
    rect(590,160,40,320);
    fill(0,0,0);
    rect(700,160,40,320);
  }
  if(index!=7){
    fill(255,255,255);
    rect(615,160,100,400);
    fill(0,0,0);
    rect(590,160,40,320);
    fill(0,0,0);
    rect(700,160,40,320);
  }
   if(index==8){
    fill(7,198,255);
    rect(720,160,100,400);
    fill(0,0,0);
    rect(700,160,40,320);
  }
  if(index!=8){
    fill(255,255,255);
    rect(720,160,100,400);
    fill(0,0,0);
    rect(700,160,40,320);
  }
  if(index==9){
    fill(198,7,255);
    rect(823,160,100,400);
  }
   else if(index!=9){
    fill(255,255,255);
    rect(823,160,100,400);
  }
  }
}