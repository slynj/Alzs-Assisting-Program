//when game is clicked
void clickGame() {
  title("Play Games");  //title

  //buttons x, y, and side
  float trueX = width/7;  //true bttn x
  float falseX = width/2 + width/100;  //false bttn x
  float tfY = height/2.5;  //both bttns y
  float tfS = height/2;  //both bttns side

  //buttons setting
  rectMode(CORNER);
  noStroke();

  //true and false button hover
  //funciton in graphicFunctions (changes the button colour and makes hover = true when hovered)
  fill(255);  //white before hover
  buttonHover(trueX, tfY, tfS, tfS, #C9C3B7, 100);  //true bttn
  //if button clicked, 
  if (hover == true && mousePressed == true) {  
    headerState = "game1";
    mousePressed = false;  //unpress the button (the user might hold on to the button and slide through the buttons)
  }

  fill(255);  //white before hover
  buttonHover(falseX, tfY, tfS, tfS, #C9C3B7, 100);  //false bttn
  //if button clicked, 
  if (hover == true && mousePressed == true) {
    headerState = "game2";
    mousePressed = false;  //unpress the button (the user might hold on to the button and slide through the buttons)
  }

  //button texts
  textAlign(CENTER, CENTER);
  font(AvenirUL, height/10, 0);    //font, size, colour (function in graphiFunctions)
  text("game1", trueX*2.15, tfY + tfS/2);
  text("game2", falseX*1.33, tfY + tfS/2);
}

void game1() {
  title("game1");  //title
}







void game2() {
  title("game2");  //title
}
