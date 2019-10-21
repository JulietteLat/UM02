//balls
  int k=0;
  int l=0;
  int pagesize;
  Ball b;
  int nbballs=15;
  ArrayList<Ball> balls = new ArrayList<Ball>();

//GOT
  Table table;
  StringList nameslist;
  IntList pagesizelist;
  PFont font;


void setup() {
  size (700,500);
  background(000,100,100);
  
  //appeler et trier la table dans l'ordre des scores décroissants
    table = loadTable ("GOT.csv", "header");
    table.sortReverse ("score");
  
  //charger la police
    font = loadFont ("AdobeFangsongStd-Regular-10.vlw");
    textFont (font, 11);
  
  //Remplir la liste des noms
    nameslist = new StringList (nbballs);
    fillnameslist ();
  
  //Remplir la liste des tailles de page wiki
    pagesizelist = new IntList (nbballs);
    fillpagesizelist ();
  
  for (int k=0; k<nbballs; k++){
    balls.add(new Ball());
  }
}
 



void draw() {
  changingcolourbackground ();
  for (int k = 0; k < balls.size(); k++) {
    wikipagesize (k);
    Ball part = balls.get(k);
    linkballs();
    part.bouncingball(); 
    nameball (part) ;
    
    
  
  }
}
