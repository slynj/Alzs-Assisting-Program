//boolean buttonClicked;
boolean hover;

//font function
void font(PFont s, float f) {
  //font kind and text size
  textFont(s);
  textSize(f);
}

//hover function
void hover(float x, float y, float w, float h, int colour, int r) {
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
