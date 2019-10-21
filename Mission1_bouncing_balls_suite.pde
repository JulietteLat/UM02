
//backgroud colour
  int c=0;
  int initc=1;

//balls
  int k=0;
  int l=0;
  int pagesize;
  Ball b;
  int nbballs=10;
  ArrayList<Ball> balls = new ArrayList<Ball>();
  
  Table table;

//nameball
  PFont font;
  int ligne1;
  int ligne2;
  String name;
  String firstname;
  String lastname;
  int index;



void setup() {
  size (700,500);
  background(000,100,100);
  
  //appeler et trier la table dans l'ordre des scores décroissants
  table = loadTable ("GOT.csv", "header");
  table.sortReverse ("score");
  
  
  for (int k=0; k<nbballs; k++){
    balls.add(new Ball());
  }
}
 



void draw() {
  changingcolourbackground ();
  for (int k = 0; k < balls.size(); k++) {
    wikipagesize (k);
    Ball part = balls.get(k);
    part.bouncingball();
    nameball () ;
    linkballs();
  
  }
}

void mouseDragged() {
  for (int k = 0; k < balls.size(); k++) {
    Ball part = balls.get(k);
    if (dist(mouseX,mouseY,part.i,part.j)<50) {
      part.i=mouseX;
      part.j=mouseY;
    }
  }
}
void changingcolourbackground () {
  background(c,50,100);
  //Permet d'avoir un fond elternant entre le rose et le bleu en dégradé.
  /*c+=initc;
  if (c==300) {
    initc=-1;
  }
  if (c==0) {
    initc=1;
  }*/
}

void linkballs (){
      for (int k=0; k < balls.size(); k++){
        Ball part1 = balls.get(k);
          for (int l=k+1; l < balls.size(); l++){
             Ball part2 = balls.get(l);
             if (dist(part1.i, part1.j, part2.i, part2.j)<80) {
              line (part1.i, part1.j, part2.i, part2.j);
             }
          }
       }
}

void nameball () {

    
    font = loadFont ("AdobeFangsongStd-Regular-10.vlw");
    textFont (font, 11);
    for (int k=0; k < balls.size(); k++){
      Ball partk = balls.get(k);
      
      //Permet de changer la couleur du nom en fonction de la catégorie mentioned/appears/POV.
      /*if ( table.getString (k, "category").equals ("mentioned")) {
      fill(0);
      }
      else {
        if ( table.getString (k, "category").equals ("POV")) {
        fill(255);
        }
        else {
        fill(200);
        }
      }*/
      
      name = table.getString (k, "common_name");
      index = name.indexOf(" ");
      firstname = name.substring (0,index);
      lastname = name.substring (index);
      ligne1 = firstname.length() ;
      ligne2 = lastname.length() ;
      text (firstname, partk.i-2.7*ligne1, partk.j-4);
      text (lastname, partk.i-2.8*ligne2, partk.j+12);
    }
}

//cette fonctionnalité est en cours de test directement dans la définition des balls
void wikipagesize(int k){
  pagesize = table.getInt (k, "awoif_page_size") ;
}

 
