
   
    public class PanelPremio{
      PImage londonBridge;  
      PImage pianoDeColores;
      int numFrames = 8;  // The number of frames in the animation
      int currentFrame = 0;
      PImage[] images = new PImage[numFrames];
      PFont myFont;
      
 
    public PanelPremio(){
      londonBridge = loadImage("/img/LondonBGif.gif");  
      pianoDeColores = loadImage("/img/GifPianoBn.gif");
      myFont = createFont("/img/FREESCPT.TTF",35);
      textFont(myFont);
 
    }
    
    public void drawMyPanelPremio(Gif myGif, Gif myOtherGif){
      textFont(myFont);
      background (0,0,0);
      fill(255,255,255);
      textSize(48);
      text("Presiona rojo para tocar una canción o morado para tocar el piano estilo libre", 30,80);
      textSize(50);
      text("El Puente de Londres", 160, 500);
      text("Estilo Libre", 680, 500);
      rect(95,180,410,250);
      rect(545,180,410,255);
      image(myGif,100, 190);
      image(myOtherGif,550, 185);
      
    }
    
    public int selectNextPanel(int index){
      if(index==2){
        return 1;
      }else if (index==9){
        return 2;
    }
    return 0;    
    }


}