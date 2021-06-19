//when game is clicked
void clickGame() {
  title("Excercise You Brain! Play Games");  //title
  font(SDLight, height/30, #50483C);
  text("Research proves that brain-stimulating activities"
  + "and habits can help stave off Alzheimer's.\n\n Not surprisingly,"
  + "the brain can benefit from a good workout just as the body does.\n\n" 
  + "Engaging in mentally stimulating activities such as reading, writing"
  + "and playing games can improve brain health.", width/2, height/2.5);
  

  //buttons x, y, and side
  float bttnS = height/4;  //bttn side length
  float bttnX = width/2 - bttnS/2;  //bttn x
  float bttnY = height/1.5;  //bttn y

  //buttons setting
  rectMode(CORNER);
  noStroke();


  fill(255);  //white before hover
  buttonHover(bttnX, bttnY, bttnS, bttnS, #C9C3B7, 50);  //false bttn
  //if button clicked, 
  if (hover == true && mousePressed == true) {
    pickGameInit();  //resets the game variables
    headerState = "pickGame";  //pick game
    mousePressed = false;  //unpress the button (the user might hold on to the button and slide through the buttons)
  }

  //button text
  textAlign(CENTER, CENTER);
  font(AvenirUL, height/30, 0);    //font, size, colour (function in graphiFunctions)
  text("pick & click!\ngame start", bttnX*1.2, bttnY + bttnS/2);
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
float start = 0;  //time it took to start the game
float end = 0;  //time it took to finish the game
boolean gameOn = true;  //if the game ended or not (true: not ended, false: ended)


//the pickingGame function decides what to draw on the screen (what texts, the answer, chocies etc.) and changes the questions when the gameState is changed. 
void game() {
  //the question choices (multiple choice) each array is 1 question and the strings are the choices(buttons)
  String[] apple = {"red", "apple", "round", "banana"};
  String[] grape = {"grape", "purple", "rectangle", "round"};
  String[] pear = {"yellow", "green", "leaf", "pear"};
  String[] pineapple = {"fruit", "purple", "yellow", "round"};
  String[] strawberry = {"red", "seed", "leaf", "vegetable"};
  String[] watermelon = {"red", "square", "seed", "green"};
  String[] shoes = {"eye", "feet", "face", "ears"};
  String[] pencil = {"write", "fly", "sleep", "eat"};
  String[] lamp = {"paper", "book", "light", "plastic"};
  String[] vacum = {"fan", "dog", "timer", "dust"};
  String[] ac = {"cold", "hot", "warm", "clear"};
  String[] phone = {"roll", "call", "punch", "kick"};
  String[] rice = {"food", "rock", "sky", "grass"};
  String[] iron = {"cold", "hot", "bug", "leg"};
  String[] mixer = {"throw", "pull", "push", "mix"};
  String[] fridge = {"hot", "food", "oven", "green"};


  //the questions that changes when the gameState changes
  if (gameState == "pickGame0") {    //question #1
    start = millis();    //get the time started (to calculated the time it took later)
    pickGame(Apple, "unrelated", apple, 3);  //draw the buttons, image, check the answer
  } else if (gameState.equals ("pickGame1")) {    //question #2
    pickGame(Grape, "unrelated", grape, 2);  //draw the buttons, image, check the answer
  } else if (gameState.equals ("pickGame2")) {    //question #3
    pickGame(Pear, "unrelated", pear, 0);  //draw the buttons, image, check the answer
  } else if (gameState.equals ("pickGame3")) {    //question #4
    pickGame(Pineapple, "unrelated", pineapple, 1);  //draw the buttons, image, check the answer
  } else if (gameState.equals ("pickGame4")) {    //question #5
    pickGame(Strawberry, "unrelated", strawberry, 3);  //draw the buttons, image, check the answer
  } else if (gameState.equals ("pickGame5")) {    //question #6
    pickGame(Watermelon, "unrelated", watermelon, 1);  //draw the buttons, image, check the answer
  } else if (gameState.equals ("pickGame6")) {
    pickGame(Shoes, "related", shoes, 1);
  } else if (gameState.equals ("pickGame7")) {
    pickGame(Pencil, "related", pencil, 0);
  } else if (gameState.equals ("pickGame8")) {
    pickGame(Lamp, "related", lamp, 2);
  } else if (gameState.equals ("pickGame9")) {
    pickGame(Vacum, "related", vacum, 3);
  } else if (gameState.equals ("pickGame10")) {
    pickGame(Ac, "related", ac, 0);
  } else if (gameState.equals ("pickGame11")) {
    pickGame(Phone, "related", phone, 1);
  } else if (gameState.equals ("pickGame12")) {
    pickGame(Rice, "related", rice, 0);
  } else if (gameState.equals ("pickGame13")) {
    pickGame(Iron, "related", iron, 1);
  } else if (gameState.equals ("pickGame14")) {
    pickGame(Mixer, "related", mixer, 3);
  } else if (gameState.equals ("pickGame15")) {
    pickGame(Fridge, "related", fridge, 2);
    end = millis();     //get the time ended(to calculated the time it took later)
    gameOn = false;    //last question, so it changes to game on to false, getting all the data and putting it in to the file
  } else if (gameState.equals ("pickGame16")) {    //question #7
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

//resets the value of the variables when started over
void pickGameInit() {
  count = 0;    //the question # (starting from 0) used to change the string in the gameState 
  gameState = "pickGame0";    //gameState that changes the questions (the int of the pickGame is determined by count)
  score = 0;  //score of the player
  gameOn = true;
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

//graphics and buttons to show when the game is ended (+ add data to the file)
void gameEnd() {
  //variable declaration
  float scorePer = (score/16.)*100;  //score in percentage
  float time = (end - start)/6000;  //time it took to finish the game in minutes

  //if game is ended (on the last question)
  if (gameOn == false) {
    appendText(filename, scorePer, time);    //append to the text file (add score percentage and time)
    gameOn = true;  //change the state back to true (so it doest write over and over)
  }

  //end screen text
  title("Score");  //presetted title font, size, position
  textAlign(CENTER, CENTER);
  font(SDLight, height/30, #22A7A4);  //font, size, colour for the text
  text("your score is:", width/2, height/2.2);
  font(AvenirUL, height/5, #f9ad29);  //font, size, colour for the text
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
