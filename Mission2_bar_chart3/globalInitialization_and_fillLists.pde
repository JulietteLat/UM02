FloatList rectLList;
FloatList originxList;
FloatList originyList;
StringList shortNamesList;
  String shortName;



void globalInitialization () {                              //To be repeated one time in the setup, the again each "draw" round
  
  table = loadTable ("GOT.csv", "header");                  //Loads Got table
  table.sortReverse ("score");
  
  rectLList = new FloatList (nbcharac);                     //Defines 4 lists
  originxList = new FloatList (nbcharac);
  originyList = new FloatList (nbcharac);
  shortNamesList = new StringList (nbcharac);
  
  font1 = loadFont ("Calibri-20.vlw");                       //Loads font
  font2 = loadFont ("FelixTitlingMT-30.vlw");
  font3 = loadFont ("FelixTitlingMT-12.vlw");
  fill(0);
  
  originx = 80;                                            //initializes x and y origins
  originy = 150;
   
  l = (width-2*originx)/(nbcharac*1.5);                                //Adapts the graph's width to the window
  d = (width-2*originx)/(nbcharac*3);
   
  L = table.getFloat(0, "score")*height/4;                 //initializes L

}


void fillLists(){                                           //to be executed one time in the setup
  for (int k=0; k<nbcharac; k++) {
    prevL = L;
    L = table.getFloat(k, "score")*height/4;   
    originy = originy+prevL-L;
    shortName = table.getString(k, "short_name");
    rectLList.append (L);
    originxList.append (originx);
    originyList.append (originy);
    shortNamesList.append (shortName);
    
    originx = originx+l+d;   
    println (originxList);
    println (originyList);
    println (shortNamesList);
    
  }
}
