//when game is clicked
void clickGame() {
  headerState = "game2";
  title("Excercise You Brain! Play Games");  //title

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

String box[] = {null, null, null, null, null, null, null, null, null, null, null, null};

void game1() {
  title("game1");  //title

  rectMode(CORNER);
  fill(#CBC5BD);    //hover #B7ADA1
  rect(width*0.13, height*0.3, height/5, height/5, height/30);
  rect(width*0.33, height*0.3, height/5, height/5, height/30);
  rect(width*0.53, height*0.3, height/5, height/5, height/30);
  rect(width*0.73, height*0.3, height/5, height/5, height/30);
  rect(width*0.13, height*0.53, height/5, height/5, height/30);
  rect(width*0.33, height*0.53, height/5, height/5, height/30);
  rect(width*0.53, height*0.53, height/5, height/5, height/30);
  rect(width*0.73, height*0.53, height/5, height/5, height/30);
  rect(width*0.13, height*0.76, height/5, height/5, height/30);
  rect(width*0.33, height*0.76, height/5, height/5, height/30);
  rect(width*0.53, height*0.76, height/5, height/5, height/30);
  rect(width*0.73, height*0.76, height/5, height/5, height/30);

  String fruits[] = {"apple", "grape", "pear", "pineapple", "strawberry", "watermelon"};
}




//variable declaration (used for picking game only)
int count = 0;    //the question # (starting from 0) used to change the string in the gameState 
String gameState = "pickGame0";    //gameState that changes the questions (the int of the pickGame is determined by count)
int i;
boolean nextQ = false;

void game2() {


  String[] apple = {"red", "apple", "round", "banana"};
  String[] grape = {"grape", "purple", "rectangle", "round"};
  String[] pear = {"yellow", "green", "leaf", "pear"};
  String[] pineapple = {"fruit", "purple", "yellow", "round"};
  String[] strawberry = {"red", "seed", "leaf", "vegetable"};
  String[] watermelon = {"red", "square", "seed", "green"};

  if (gameState == "pickGame0") {
    pickGame(Apple, "unrelated", apple, 3);
    
  } else if (gameState.equals ("pickGame1")) {
    pickGame(Grape, "unrelated", grape, 2);
    
  } else if (gameState.equals ("pickGame2")) {
    pickGame(Pear, "unrelated", pear, 0);
    
  } else if (gameState.equals ("pickGame3")) {
    pickGame(Pineapple, "unrelated", pineapple, 1);
    
  } else if (gameState.equals ("pickGame4")) {
    pickGame(Strawberry, "unrelated", strawberry, 3);
    
  } else if (gameState.equals ("pickGame5")) {
    pickGame(Watermelon, "unrelated", watermelon, 1);
  }
}


float buttonY; //button Y coordinate
float buttonS;  //button Side
int buttonC;  //button Corner
int answer;


void pickGame(PImage image, String instruction, String[] choice, int ans) {
  answer = ans;
  buttonY = height*0.6;  //button Y coordinate
  buttonS = height/4;  //button Side
  buttonC = height/30;  //button Corner
  float buttonTY = buttonY + buttonS/2;  //button text (the label) Y setted 


  if (instruction == "unrelated") {
    instruction = "choose one unrelated word";
  } else if (instruction == "related") {
    instruction = "choose one related word";
  }

  imageMode(CENTER);  //image coordinate based on the center of the image
  image.resize(0, int(height/4));  //image resize
  image(image, width/2, height/3);  //draw image

  font(SDLight, height/30, 0);  //font & text size for content
  textAlign(CENTER);
  text(instruction, width/2, height/1.9);

  i = 0;
  pickGameButton(width*0.13);  //button draw + text preset of the button (gets the X and draws the button)
  text(choice[i], width*0.13 + buttonS/2, buttonTY);
  pickGameAns();

  i = 1;
  pickGameButton(width*0.33);  //button draw + text preset of the button (gets the X and draws the button)
  text(choice[i], width*0.33 + buttonS/2, buttonTY);
  pickGameAns();

  i = 2;
  pickGameButton(width*0.53);  //button draw + text preset of the button (gets the X and draws the button)
  text(choice[i], width*0.53 + buttonS/2, buttonTY);
  pickGameAns();

  i = 3;
  pickGameButton(width*0.73);  //button draw + text preset of the button (gets the X and draws the button)
  text(choice[i], width*0.73 + buttonS/2, buttonTY);
  pickGameAns();


  println(count);
}


//button text only for the picking game (preset)
void pickGameButton(float X) { //X coordinate of the button
  fill(#CBC5BD);  //not hovered button colour 
  buttonHover(X, buttonY, buttonS, buttonS, #B7ADA1, buttonC);  //button hover feature + draw button
  font(AvenirI, height/20, 0);  //font & text size for content
  textAlign(CENTER, CENTER);
}

//checks the answer, manipulates the socre and changes to next question
void pickGameAns() {
  if (hover == true && mousePressed == true) {
    if (i == answer) {
      score++;
      mousePressed = false;
    } 
    nextQ = true;
  }

  if (nextQ == true) {
    gameState = "pickGame" + str(++count);
    println(gameState);
    nextQ = false;
  }
}


boolean mouseDragged;
void mouseDragged() {
  if (headerState == "game2") {
    mouseDragged = true;
  }
}
