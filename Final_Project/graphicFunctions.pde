//boolean buttonClicked;
boolean hover;

//font function
void font(PFont s, float f, int colour) {
  //font kind and text size
  textFont(s);
  textSize(f);
  fill(colour);
}

//hover function
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
