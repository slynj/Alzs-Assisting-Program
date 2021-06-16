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
  title("Alzheimer's Assesment Quiz");  //title text
  
  font(AvenirI, height/25, #f9ad29);
  text("BEFORE YOU START:", width/2, height/2.3);  //warning text 1
  
  font(SDLight, height/30, 0);
  text("This quiz is not 100% accurate. Please go visit the doctor if you have significant symtoms of Alzheimer's.", width/2, height/2);  //warning text 2
  
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
    if (mousePressed == true) {  //if clicked, go to the url
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

//draws the title text
void quizResult() {
  
  //title text
  title("Results");

  //image in the middle
  imageMode(CENTER);
  image(QuizR, width/2, height/1.7);  //colouring image
  resultText();  //draws the text result
  
}


//draws texts for the result
void resultText() {

  //results
  String results[] = {
    "Your brain is okay. Continue with the brain exercises and have healthy diet to maintain it.", 
    "Your brain is functioning okay. By learning to relax and maintain a healthy diet, your brain \n can function at even higher levels.", 
    "Your brain is in danger. Check your diet today. You can reduce brain drain and memory loss \n with vitamins, brain foods, herbs, yoga and meditation techniques, and appropriate medications.", 
    "Your brain is running on empty. You should see your doctor. You can refuel your brain and \n prevent further memory loss with food, vitamins, herbs, exercises, and medications.", 
    "EXCELLENT", 
    "GOOD", 
    "DANGER", 
    "EXTREME\nDANGER"
  };

  //text x, y
  float text1X = width/2;
  float text1Y = height*0.9;
  float text2X = width/1.98;
  float text2Y = height*0.74;
  
  //text setting
  textAlign(CENTER);
  font(SDLight, height/30, 0);  //font, size, colour
  textLeading(width/30);  // Set leading to 40 (when screen is 1200 by 800)
  
  //if the level is excellent (determined in the quizResult()
  if (score >= 0 && score < 5) {
    text (results[0], text1X, text1Y);    //description text
    font(AvenirUL, height/20, 0);      //change font
    text(results[4], text2X, text2Y);  //levle
    
  } else if (score >= 5 && score < 9) {    //if good
    text (results[1], text1X, text1Y);
    font(AvenirUL, height/20, 0);
    text(results[5], text2X, text2Y);
    
  } else if (score >= 9 && score < 12) {    //if dnager
    text (results[2], text1X, text1Y);
    font(AvenirUL, height/20, 0);
    text(results[6], text2X, text2Y);
    
  } else if (score >= 12 && score <= 15) {  //if extreme danger
    text (results[3], text1X, text1Y);
    font(AvenirUL, height/20, 0);
    text(results[7], text2X, height*0.71);
  }
}
