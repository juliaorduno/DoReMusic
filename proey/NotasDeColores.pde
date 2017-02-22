public class NotaDeColor{
    String nota;
    color miColor;
    int posx;
    int posy;
    
    public NotaDeColor(String nota, color miColor, int posx, int posy){
      this.nota=nota;
      this.miColor=miColor;
      this.posx=posx;
      this.posy=posy;
    }
    
    public void pintarNotas(){
      fill(miColor);
      text(nota,posx,posy);
    }
    
    public void setMiColor(color miColor){
      this.miColor=miColor;
    }
    

}