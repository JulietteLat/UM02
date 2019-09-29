
//backgroud colour
int c=0;
int initc=1;
//balls
int k=0;
int l=0;
Ball b;
int nbballs=20;
ArrayList<Ball> balls = new ArrayList<Ball>();



void setup() {
  size (400,500);
  background(000,100,100);
  for (int k=0; k<nbballs; k++){
    balls.add(new Ball());
  }
}
 



void draw() {
  changingcolourbackground ();
  for (int k = 0; k < balls.size(); k++) {
    Ball part = balls.get(k);
    part.bouncingball();
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
  c+=initc;
  if (c==300) {
    initc=-1;
  }
  if (c==0) {
    initc=1;
  }
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
