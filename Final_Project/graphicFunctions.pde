//boolean buttonClicked;
boolean hover;

void font(PFont s, float f) {
  textFont(s);
  textSize(f);
}

void hover(float x, float y, float w, float h, int colour, int r) {
  if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
    fill(colour);
    rectMode(CORNER);
    rect(x, y, w, h, r);//over = true;
    hover = true;
  } else {hover = false;}
}

//public class Button {
//  float x;
//  float y;
//  float w;
//  float h;
//  int r;
//  color c;
//  boolean clicked;

//  public float getX() {
//    return x;
//  }

//  public void setX(float x) {
//    this.x = x;
//  }

//  public float getY() {
//    return y;
//  }

//  public void setY(float y) {
//    this.y = y;
//  }

//  public float getW() {
//    return w;
//  }

//  public void setW(float w) {
//    this.w = w;
//  }

//  public float getH() {
//    return h;
//  }

//  public void setH(float h) {
//    this.h = h;
//  }

//  public int getR() {
//    return r;
//  }

//  public void setR(int r) {
//    this.r = r;
//  }

//  public color getC() {
//    return c;
//  }

//  public void setH(color c) {
//    this.c = c;
//  }

//  void clicked(float mouseX, float mouseY) {
//      if (mouseX > x && mouseX < x + w && mouseY > y && mouseY < y + h) {
//         clicked = true;
//      } else {
//         clicked = false;
//      }
//   }
//}
