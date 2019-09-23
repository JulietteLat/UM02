
//backgroud colour
int c=0;
int initc=1;
//balls
int k=0;
Ball b;
int nbballs=7;
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
