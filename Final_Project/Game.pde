//when game is clicked
void clickGame() {
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
    pickGameInit();  //resets the game variables
    headerState = "pickGame";  //pick game
    mousePressed = false;  //unpress the button (the user might hold on to the button and slide through the buttons)
  }

  //button texts
  textAlign(CENTER, CENTER);
  font(AvenirUL, height/10, 0);    //font, size, colour (function in graphiFunctions)
  //game titles
  text("game1", trueX*2.15, tfY + tfS/2);
  font(AvenirUL, height/20, 0);    //font, size, colour (function in graphiFunctions)
  text("pick & click! game", falseX*1.33, tfY + tfS/2);
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
int i;    //the # of the buttons (in each questions there are 4 buttons)
boolean nextQ = false;    //boolean that changes the scene to go to the next question
float buttonY; //button Y coordinate
float buttonS;  //button Side
int buttonC;  //button Corner
int answer;  //answer index of the question (in the array)

//the pickingGame function decides what to draw on the screen (what texts, the answer, chocies etc.) and changes the questions when the gameState is changed. 
void pickingGame() {
  //the question choices (multiple choice) each array is 1 question and the strings are the choices(buttons)
  String[] apple = {"red", "apple", "round", "banana"};
  String[] grape = {"grape", "purple", "rectangle", "round"};
  String[] pear = {"yellow", "green", "leaf", "pear"};
  String[] pineapple = {"fruit", "purple", "yellow", "round"};
  String[] strawberry = {"red", "seed", "leaf", "vegetable"};
  String[] watermelon = {"red", "square", "seed", "green"};

  //the questions that changes when the gameState changes
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
    
  } else if (gameState.equals ("pickGame6")) {
    gameEnd();
  }
}




//the actual game function where it gets values from the parameter and draws the game
void pickGame(PImage image, String instruction, String[] choice, int ans) {    //image of the question, instruction, question array, and the answer index of the array
  //variable declaration (only used in pickGame)
  answer = ans;  //answer is equal to ans (the answer chosen by parameter goes in to the variable answer so that it can be used outside of this function)
  //choices button variables
  buttonY = height*0.6;  //button Y coordinate
  buttonS = height/4;  //button Side
  buttonC = height/30;  //button Corner
  float buttonTY = buttonY + buttonS/2;  //button text (the label) Y setted 

  //2 types of the questions unrelated and related (chosen by the string written in the parameter)
  if (instruction == "unrelated") {
    instruction = "choose one unrelated word";
  } else if (instruction == "related") {
    instruction = "choose one related word";
  }
  
  //draws the image
  imageMode(CENTER);  //image coordinate based on the center of the image
  image.resize(0, int(height/4));  //image resize
  image(image, width/2, height/3);  //draw image
  
  //draws the instruction text
  font(SDLight, height/30, 0);  //font & text size for content
  textAlign(CENTER);
  text(instruction, width/2, height/1.9);  //text x y
  
  //the first button (1st choice)
  i = 0;  //index 0 for the question array
  pickGameButton(width*0.13);  //function: button draw + text preset of the button (gets the X and draws the button)
  text(choice[i], width*0.13 + buttonS/2, buttonTY);  //draw the text
  pickGameAns();   //check if this button is clicked (if it is, go to next Q). also checks the answer and changes score variable
  
  //the second button (2nd choice)
  i = 1;  //index 1 for the question array
  pickGameButton(width*0.33);  //function: button draw + text preset of the button (gets the X and draws the button)
  text(choice[i], width*0.33 + buttonS/2, buttonTY);  //draw the text
  pickGameAns();   //check if this button is clicked (if it is, go to next Q). also checks the answer and changes score variable
  
  //the thrid button (3rd choice)
  i = 2;  //index 2 for the question array
  pickGameButton(width*0.53);  //function: button draw + text preset of the button (gets the X and draws the button)
  text(choice[i], width*0.53 + buttonS/2, buttonTY);  //draw the text
  pickGameAns();   //check if this button is clicked (if it is, go to next Q). also checks the answer and changes score variable
  
  //the fourth button (4th choice)
  i = 3;  //index 3 for the question array
  pickGameButton(width*0.73);  //function: button draw + text preset of the button (gets the X and draws the button)
  text(choice[i], width*0.73 + buttonS/2, buttonTY);  //draw the text
  pickGameAns();   //check if this button is clicked (if it is, go to next Q). also checks the answer and changes score variable

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
  if (hover == true && mousePressed == true) {  //if this button is clicked (because its hovered and mouse is clicked)
    if (i == answer) {    //and if the index of this question(choice#) is equal to the answer (= if the answer is correct)
      score++;    //add 1 to the score
    }
    mousePressed = false;  //"unpress" the mouse (preventing it from clicking things multiple times when mouse is in click&hold state)
    nextQ = true;  //go to next question(doesn't matter if the answer is correct or not)
  }

  if (nextQ == true) {    //if the user clicked the button and nextQ becomes true
    gameState = "pickGame" + str(++count);    //add 1 to the count and add it to the string pickGame so it becomes pickGame(the next #)
    nextQ = false;  //change the nextQ to false to only slide 1 question
  }
}

//resets the value of the variables when started over
void pickGameInit() {
  count = 0;    //the question # (starting from 0) used to change the string in the gameState 
  gameState = "pickGame0";    //gameState that changes the questions (the int of the pickGame is determined by count)
  score = 0;  //score of the player
}  


void gameEnd() {
  title("Score");
  textAlign(CENTER, CENTER);
  font(SDLight, height/30, #22A7A4);
  text("your score is:", width/2, height/2.2);
  font(AvenirUL, height/5, #f9ad29);
  text(score, width/2, height/1.7);
  
  //go home button  x, y, w, h
  float goHomeX = width/2.25;
  float goHomeY = height*0.78;
  float goHomeW = width*0.66;
  float goHomeH = height*0.66;  

  //go home button rect preset
  rectMode(CORNER);
  noStroke();
  fill(255);

  //go home button hover
  buttonHover(goHomeX, goHomeY, goHomeW/6, goHomeH/10, #C9C3B7, 100);  //funciton in graphicFunctions (changes the button colour and makes hover = true when hovered)
  //if start button clicked
  if (hover == true && mousePressed == true) {  
    headerState = "init";  //go to welcomepage
    mousePressed = false;  //unpress the mousepressed (prevent the situation where user click and hold)
  }

  //go home button text
  textAlign(CENTER, CENTER);
  font(AvenirUL, height/26, 0);
  text("HOME", goHomeX*1.12, goHomeY + goHomeH/20);

}
