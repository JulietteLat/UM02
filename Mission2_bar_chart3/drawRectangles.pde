void drawRectangles () {   
  int index;
  int i=0;
  Table colortable;
  String name;

  
  for (int k=0; k<nbcharac; k++) {
    colortable = loadTable ("houseColorTable.csv", "header");
    name = table.getString(k, "common_name");
    fill (150);
    index = -1;
    i = 0;
        while (i<9 && index==-1){
             index = name.indexOf (colortable.getString(i,"Name"));
             if (index>0){
                   fill (colortable.getInt(i,"R"), colortable.getInt(i,"V"), colortable.getInt(i,"B"));
             }
             i=i+1;
        }
    originx = originxList.get(k);
    originy = originyList.get(k);
    L = rectLList.get(k);
    noStroke ();
    rect (originx, originy, l, L);                                                                                   //draws the rectangle
    stroke(0);
    line (originx-d, originy+L, originx+l, originy+L);                                                               //makes axe x longer
    
    if (nbcharac<60){
      textAlign (LEFT);
      fill (255);
      translate (originx+1.5*d, originy+L-d);
      rotate (-PI/2);
      shortName = shortNamesList.get (k);                                                                            //writes the names inside the rectangles
      text (shortName, 0, 0);
      rotate (PI/2);
      translate (-originx-1.5*d, -originy-L+d);
    }
  }

}
