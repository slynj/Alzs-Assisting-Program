
//header state (init, home, assesment, game, resources, help, quiz, quiz result, game1, game2)
String headerState = "quizResult";

//logged in as patient
void patientScene() {

  patientInit();      //graphic set up for patient scene
  signoutButton();    //button for signout (goes back to login scene)
  headerButton();     //header buttons (home, assesment, game, contact, help) hover feature + changes header state
  backgroundC();       //bakcground (ivory rect)

  //header state check (changes the page)
  if (headerState == "home") {                    //clicked home
    clickHome();
  } else if (headerState == "assessment") {        //clicked assessment
    clickAssessment();
  } else if (headerState == "game") {                  //clicked game
    clickGame();
  } else if (headerState == "resources") {                    //clicked contact
    clickResources();
  } else if (headerState == "help") {                      //clicked help
    clickHelp();
  } else if (headerState == "quiz") {                    //start self assess quiz logged in
    quiz();
  } else if (headerState == "quizResult") {                    //result page of the quiz
    quizResult();
  } else if (headerState == "init") {                    //first logged in
    startPage();
  }
}

//initial set up for patient scene
void patientInit() {
  background(255);

  //logo text
  font(SDGothic, height/20, #32bdba);  //font funtion deteminds font, text size, and colour (in graphicFunctions tab)
  textAlign(LEFT, TOP);
  text("Alz's", width/100, width/100);

  //logo button feature
  if (mouseY > width/100 && mouseY < width/100 + height/25 && mouseX > width/100 && mouseX < width/100 + textWidth("Alz's")) {
    fill(#22A7A4);
    text("Alz's", width/100, width/100);
    if (mousePressed == true) {
      headerState = "init";
    }
  }

  //header rect (besides the logo)
  rectMode(RIGHT);
  fill(#efece5);
  noStroke();
  rect(width - width/100, width/100, width/10, height/18, 5);

  //menu — base rect (header rectangle)
  rectMode(CENTER);
  fill(#f9ad29);
  noStroke();
  rect(width/2, height/9, width, height/13);
}

//button for signout (goes back to login scene)
void signoutButton() {
  //sign out rect setup
  rectMode(CORNER);
  fill(#CBC5BD);

  //hover function draws the button changes the colour when hovered
  buttonHover(width*0.87, height/43, width/10, height/40, #B7ADA1, 10);
  //if mouse hovered and mouse is pressed, button is clicked
  if (hover == true && mousePressed == true) {
    logged = "init";          //reset the logged variable to init(it was previously success)
    program = "login";        //change the program state to login
    headerState = "init";     //reset to the welcome page after logged back in
  }

  //sign out text
  font(AvenirI, height/50, 255);
  textAlign(CENTER, TOP);
  text("sign out", width*0.87 + width/20, height/40);
}

//header buttons (home, assesment, game, contact, help)
void headerButton() {
  //varable x y w h for text
  float headerX = width/35;
  float headerY = height/9 - height/26;
  float headerW = width/7;
  float headerH = height/13;
  float widthInc = width/5;
  float rectY = height/9;

  //increasing x for the headers
  float x1 = headerX + widthInc;
  float x2 = x1 + widthInc;
  float x3 = x2 + widthInc;
  float x4 = x3 + widthInc;

  //text setup
  font(OratorR, height/20, 255);
  textAlign(CENTER, CENTER);

  //header text
  text("home", headerX + headerW/2, rectY);
  text("assessment", x1 + headerW/2, rectY);
  text("game", x2 + headerW/2, rectY);
  text("resources", x3 + headerW/2, rectY);
  text("help", x4 + headerW/2, rectY);

  //if mouse hovers, change text colour (header text)
  if (mouseY > headerY && mouseY < headerY + headerH) {
    if (mouseX > headerX && mouseX < headerX + headerW) {
      fill(0);
      text("home", headerX + headerW/2, rectY);
      if (mousePressed == true) {
        headerState = "home";
      }
    } else if (mouseX > x1 && mouseX < x1 + headerW) {
      fill(0);
      text("assessment", x1 + headerW/2, rectY);
      if (mousePressed == true) {
        headerState = "assessment";
      }
    } else if (mouseX > x2 && mouseX < x2 + headerW) {
      fill(0);
      text("game", x2 + headerW/2, rectY);
      if (mousePressed == true) {
        headerState = "game";
      }
    } else if (mouseX > x3 && mouseX < x3 + headerW) {
      fill(0);
      text("resources", x3 + headerW/2, rectY);
      if (mousePressed == true) {
        headerState = "resources";
      }
    } else if (mouseX > x4 && mouseX < x4 + headerW) {
      fill(0);
      text("help", x4 + headerW/2, rectY);
      if (mousePressed == true) {
        headerState = "help";
      }
    }
  }
}


void backgroundC() {
  //background rect
  fill(#efece5);
  rect(width/100, height/6.7 + width/100, width - width/50, height-height/6.7 - width/50, 5);
}


//when home is clicked
void clickHome() {
  //CONTENT
  font(ChapR, height/15, 0);  //font & text size & colour for title
  textAlign(CENTER);
  text("What is Alzheimer's Disease?", width/2, height/3.5); //title
  font(SDLight, height/30, 0);  //font & text size for content
  textAlign(LEFT, CORNER);
  textLeading(width/20);  // Set leading to 40 (when screen is 1200 by 800)
  String s = "- Alzheimer’s disease is the most common type of dementia.\n\n"  //content
    + "- It is a progressive disease beginning with mild memory loss and possibly leading to loss of the ability to carry on a conversation and respond to the environment.\n\n"
    + "- Alzheimer’s disease involves parts of the brain that control thought, memory, and language.\n\n"
    +  "- It can seriously affect a person’s ability to carry out daily activities.";
  text(s, width/2.5, height/3, width*0.57, height*0.66);  //draw text
  imageMode(CENTER);  //image coordinate based on the center of the image
  Grandpa.resize(0, int(height/2.1));  //image resize
  image(Grandpa, width/5, height/1.75);  //draw image

  //url
  String url = "https://www.cdc.gov/aging/aginginfo/alzheimers.htm#:~:text=Alzheimer's%20disease%20is%20the%20most,thought%2C%20memory%2C%20and%20language.";  //link
  fill(#5D79B2);  //blue 
  textAlign(CENTER, CENTER);   //text align
  textSize(width/80);  //text size
  if (mouseY > height*0.914 && mouseY < height*0.914 + height/30 && mouseX > width/12.6 && mouseX < width/12.6 + textWidth(url)) {  //collision detection
    fill(#3D5486);    //dark blue
    if (mousePressed == true) {
      link(url);
    }
  }
  text(url, width/2, height*0.93);  //draw the text
}

//when assessment is clicked
void clickAssessment() {
  //symptoms text in array — [0] is left column, [1] is right column
  String symptoms[] = {"Symptoms may include:\n\n"
    + "- Increased memory loss and confusion.\n"
    + "- Inability to learn new things.\n"
    + "- Difficulty with language and problems with reading,\n    writing, and working with numbers.", 
    "\n\n- Difficulty organizing thoughts and thinking logically.\n"
    + "- Shortened attention span.\n"
    + "- Problems coping with new situations."};

  //text 
  textAlign(CENTER);
  font(ChapR, height/15, 0);
  text("Alzheimer's Assesment Quiz", width/2, height/3.5);
  font(AvenirI, height/25, #f9ad29);
  text("BEFORE YOU START:", width/2, height/2.3);
  font(SDLight, height/30, 0);
  text("This quiz is not 100% accurate. Please go visit the doctor if you have significant symtoms of Alzheimer's.", width/2, height/2);
  textSize(height/40);
  textAlign(LEFT);
  fill(#50483C);
  //draw symptoms text
  text(symptoms[0], width/6.5, height/1.8);
  text(symptoms[1], width/1.8, height/1.8);

  //reference link
  String url = "https://alzheimersprevention.org/alzheimers-info/memory-quiz/";    //refrence link
  fill(#5D79B2);  //blue 
  textAlign(CENTER, CENTER);   //text align
  textSize(width/80);  //text size

  //rect(width/3, height*0.914, textWidth(url), height/30);
  if (mouseY > height*0.914 && mouseY < height*0.914 + height/30 && mouseX > width/3 && mouseX < width/3 + textWidth(url)) {  //collision detection
    fill(#3D5486);    //dark blue
    if (mousePressed == true) {
      link(url);
    }
  }
  text(url, width/2, height*0.93);  //draw the text

  //start button  x, y, w, h
  float startX = width/2.25;
  float startY = height*0.78;
  float startW = width*0.66;
  float startH = height*0.66;  

  //start button
  rectMode(CORNER);
  noStroke();
  fill(255);

  //start button hover
  buttonHover(startX, startY, startW/6, startH/10, #C9C3B7, 100);  //funciton in graphicFunctions (changes the button colour and makes hover = true when hovered)
  //if start button clicked
  if (hover == true && mousePressed == true) {  
    next = false;    //next is false (prevents it from starting with #2)
    quizIndex = 0;   //reset question number
    score = 0;       //reset score
    headerState = "quiz";  //go to quiz
    mousePressed = false;  //unpress the mousepressed (prevent the situation where user click and hold)
  }

  //start button text
  textAlign(CENTER, CENTER);
  font(AvenirUL, height/26, 0);
  text("START", startX*1.12, startY + startH/20);
}

//variable declartioni (only used for quiz and quizResult Function)
int quizIndex = 0;    //question# to start is 0
int score = 0;    //score is also 0
boolean next = false;  //next is false (next changes the question #)

void quiz() {

  //the questions
  String questions[] = {"1. From time to time, I forget what day of the week it is.", 
    "2. Sometimes when I’m looking for something, I forget what it is that I’m looking for.", 
    "3. My friends and family seem to think I’m more forgetful now than I used to be.", 
    "4. Sometimes I forget the names of my friends.", 
    "5. It’s hard for me to add two-digit numbers without writing them down.", 
    "6. I frequently miss appointments because I forget them.", 
    "7. I rarely feel energetic.", 
    "8. Small problems upset me more than they once did.", 
    "9. It’s hard for me to concentrate for even an hour.", 
    "10. I often misplace my keys, and when I find them, I often can’t remember putting them there.", 
    "11. I frequently repeat myself.", 
    "12. Sometime I get lost, even when I’m driving somewhere I’ve been before.", 
    "13. Sometimes I forget the point I’m trying to make.", 
    "14. To feel mentally sharp, I depend upon caffeine.", 
    "15. It takes longer for me to learn things than it used to."};

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
    next = true;  //change to next question
    mousePressed = false;  //unpress the button (the user might hold on to the button and slide through the buttons)
    score ++;  //add 1 to the score (because it's true)
  }

  fill(255);  //white before hover
  buttonHover(falseX, tfY, tfS, tfS, #C9C3B7, 100);  //false bttn
  //if button clicked, 
  if (hover == true && mousePressed == true) {
    next = true;
    mousePressed = false;
  }

  //button texts
  textAlign(CENTER, CENTER);
  font(AvenirUL, height/10, 0);    //font, size, colour (function in graphiFunctions)
  text("TRUE", trueX*2.15, tfY + tfS/2);
  text("FALSE", falseX*1.33, tfY + tfS/2);


  if (next == true) {  //if the user sumbmitted the answer for the question
    font(AvenirR, height/30, 0);
    text(questions[quizIndex++], width/2, height/3.5);  //draw the question adding 1 to the quizIndex
    next = false;  //change next to false
    if (quizIndex > 14) {    //if user clicked the button, and the index is greater than 14, there are no more quesitons
      next = false;  //next is false
      headerState = "quizResult";  //go to showing result
    }
  } else {
    font(AvenirR, height/30, 0);    //when not clicked
    text(questions[quizIndex], width/2, height/3.5);  //draw the question that is not +1
  }
}

void quizResult() {
  font(ChapR, height/15, 0);
  textAlign(CENTER);
  text("Results", width/2, height/3.5);

  //results
  String results[] = {
    "Your brain is okay. Continue with the brain exercises and have healthy diet to maintain it.", 
    "Your brain is functioning okay. By learning to relax and maintain a healthy diet, your brain can function at even higher levels.", 
    "Your brain is in danger. Check your diet today. You can reduce brain drain and memory loss with vitamins, brain foods, herbs, yoga and meditation techniques, and appropriate medications.", 
    "Your brain is running on empty. You should see your doctor. You can refuel your brain and prevent further memory loss with food, vitamins, herbs, exercises, and medications."
  };

  font(SDLight, height/30, 0);
  if (score > 0) {
    text (results[0]);
    if (score > 4) {
      text (results[1]);
      if (score > 8) {
        text (results[2]);
        if (score > 12) {
          text (results[3]);
        }
      }
    }
  }
}

//when game is clicked
void clickGame() {
  textAlign(CENTER);
  fill(0);
  text("game", width/2, height/2);
}

//when contact is clicked
void clickResources() {
  //x and y coordinates for the image buttons
  float img2X = width*0.39;
  float img1X = img2X - Colouring.width - width/20;
  float img3X = img2X + Colouring.width + width/20;
  float baseImgY = height/2.5;

  //text
  font(ChapR, height/15, 0);
  textAlign(CENTER);
  text("Board? Try These Out!", width/2, height/3.5);

  //image settings
  imageMode(CORNER);  //coordinates from the image centre
  Colouring.resize(0, height/3);  //resize images
  Card.resize(0, height/3);  //resize image
  Puzzle.resize(0, height/3);  //resize image

  //button #1 (colouring page)
  String colourLink = "https://www.thecolor.com/";  //link to the colouring website
  resourceButton(img1X, colourLink);  //hover function; collision detectoin and darkens the button(function at the bottom)
  image(Colouring, img1X, baseImgY);  //colouring image

  String cardLink = "https://www.solitr.com/";  //link to the card game website
  resourceButton(img2X, cardLink);
  image(Card, img2X, baseImgY);  //colouring image

  String puzzleLink = "https://www.digipuzzle.net/main/kids/";  //link to the puzzle website
  resourceButton(img3X, puzzleLink);
  image(Puzzle, img3X, baseImgY);  //puzzle image

  font(SDLight, height/30, 0);
  //titles
  String s1 = "colouring page";
  String s2 = "card game/sudoku";
  String s3 = "jigsaw  puzzle";
  //title array
  String[] title = {s1, s2, s3};
  //changing x value of the text
  float Width = width/4.5;
  //for loop that draws the 3 strings
  for (int i = 0; i < 3; i++) {
    text(title[i], Width, height*0.8);
    Width += width/3.6;
  }
}

//hover detecting funciton only for the resource button (because it uses the tint API and darkens the image it self + leads to a website
void resourceButton(float X, String url) {
  float baseImgY = height/2.5;  //the y coord. for all 3 buttons (since they are all aligned)
  noTint();  //resets the tint (org. image)
  if (mouseY > baseImgY && mouseY < baseImgY + Colouring.height && mouseX > X && mouseX < X + Colouring.height) {  //collision detection
    tint(200);  //makes the image darker
    if (mousePressed == true) {  //button clicked
      link(url);  //lead to url (in the parameter)
    }
  }
}

//when help is clicked
void clickHelp() {
  textAlign(CENTER);
  fill(0);
  text("help", width/2, height/2);
}

//when user first logs in
void startPage() {
  //welcome image
  imageMode(CENTER);  //coordinates from the image centre
  Welcome.resize(0, height/6);  //resize image
  image(Welcome, width/2, height/3.5);  //draw image

  //hospital image
  Hospital.resize(width - width/50, 0);  //resize image
  image(Hospital, width/2, height/6.7 + width/100 + height-height/6.7 - width/50 - Hospital.height/2);  //draw image
}
