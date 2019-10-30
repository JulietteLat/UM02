int nbcharac = 30;
float originx;
float originy;
Table table;
float d ;
float l ;
float L ;
float prevL;
PFont font1;
PFont font2;
PFont font3;

void setup() {
  size (1000,1000);
  background (255);
  globalInitialization ();
  fillLists();
  adaptTextSize ();

}

void draw() {
  background (255);
  originx = 80;                                            //initializes x and y origins
  originy = 150;
  L = table.getFloat(0, "score")*height/4;   
  textAlign (CENTER);
  fill (0);
  textFont (font2);
  text ("GoT real more important characters", width/2, 40);
  textFont(font3);
  text ("Chart of the importance of each character calculated thanks to AWOIF in 2019,", width/2, 60);
  text ("considering the number of interactions of one character with others in the 5 first books of J.R.R.Martin.", width/2, 80);
  drawAxeY ();
  drawRectangles ();
  horizontalLine();
}




void drawAxeY () {
float espace;
int graduations;


 line (originx-d, originy, originx-d, originy+L); //axe y
 graduations = nbcharac/5;
 espace = L/graduations;
 textFont (font3,11);
 fill (0);
 for (int k=0; k<graduations+1; k++) {
   line (originx-3*d/2, originy+k*espace, originx-d, originy+k*espace); //graduation rectangle le plus haut
   text (table.getFloat(0, "score")-k*table.getFloat(0, "score")/graduations, originx-40, originy+d+k*espace);
   }
}


void horizontalLine () {
  Float x;
  Float y;

  for (int k=0; k<nbcharac; k++) {
    x = originxList.get(k);
    y = originyList.get(k);
    if (mouseX>x && mouseX<x+l && mouseY>y && mouseY<y+L) {
      line (80-d, y, originx+l, y);
      fill(255);
      rect (width-80-300, 150, 300-d, 130);
      fill (0);
      textAlign (CENTER);
      textFont (font2, 20);
      text (shortNamesList.get(k), width-380+150, 200);
      textFont (font3);
      text ("Score", width-380+50, 250);
      text (table.getFloat(k, "score"), width-380+100, 250);
      text ("Rank", width-380+200, 250); 
      text (k, width-380+250, 250);
  }
  }
}

void legend (){
}
