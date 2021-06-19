//boolean buttonClicked;
boolean hover;

//font function
void font(PFont s, float f, int colour) {
  //font kind and text size
  textFont(s);  //font kind
  textSize(f);  //size
  fill(colour);  //colour
  
  //if (s == null) {
  //}
}

//hover function (takes x, y, w, h, colour when hovered, and corner radius)
void buttonHover(float x, float y, float w, float h, int colour, int r) {
  hover = false;
  //draw rect
  rect(x, y, w, h, r);
  //collision detection
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    //change colour
    fill(colour);
    //redraw rectangle
    rectMode(CORNER);
    rect(x, y, w, h, r);
    //change hover to true
    hover = true;
  } else {hover = false;}
}

//title font function (preset) (mostly used for page titles)
void title(String str) {
  textAlign(CENTER);
  font(ChapR, height/15, 0);
  text(str, width/2, height/3.5);
}

//higher version of the title function (mostly used for graph/game titles)
void titleHigher(String str) {
    textAlign(CENTER);
  font(ChapR, height/15, 0);
  text(str, width/2, height/3.8);
}
