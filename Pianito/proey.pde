DoReMusic drm;
PanelInicio inicio;
boolean showMenu;

void setup(){
  size(1000,600);
  smooth();
  drm = new DoReMusic();
  //drm.readFile();
  inicio = new PanelInicio();
  showMenu = false;
}

void draw(){
}

//Para poner el menú de cargar archivo
void mouseClicked(){
  if(mouseX>850 && mouseX<910 && mouseY>80 && mouseY<140 && !showMenu){
    showMenu = true;
    fill(91,206,245);
    stroke(91,206,245);
    rect(700,140,210,50);
    PFont pf;
    pf = createFont("Arial Rounded MT Bold", 40,true);
    textFont(pf,25);
    fill(255,255,255);
    text("Cargar Archivo", 710,175);
  }
  else if(mouseX>700 && mouseX<910 && mouseY>140 && mouseY<190 && showMenu){
      selectInput("Select a file to process:", "fileSelected");  
      inicio = new PanelInicio();
      showMenu = false;
   }
  else if(mouseX>850 && mouseX<910 && mouseY>80 && mouseY<140 && showMenu){
    showMenu = false;
    inicio = new PanelInicio();
  }
}

//Abrir el file chooser
void fileSelected(File selection) {
  if (selection == null) {
    println("Window was closed or the user hit cancel.");
  } else {
    println("User selected " + selection.getAbsolutePath());
   drm.readFile(selection);
   drm.setPanels();
  }
}
 