
//header state (home, assesment, game, contact, help)
String headerState = "init";

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
  } else if (headerState == "init") {                    //first logged in
    startPage();
  }
}

//initial set up for patient scene
void patientInit() {
  background(255);

  //logo text
  font(SDGothic, height/20);  //font funtion deteminds font and text size (in graphicFunctions tab)
  textAlign(LEFT, TOP);
  fill(#32bdba);
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
  }

  //sign out text
  font(AvenirI, height/50);
  textAlign(CENTER, TOP);
  fill(255);
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
  fill(255);
  font(OratorR, height/20);
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
        //clickHome();
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
  font(ChapR, height/15);  //font & text size for title
  textAlign(CENTER);
  fill(0);  //colour is black
  text("What is Alzheimer's Disease?", width/2, height/4); //title
  font(SDLight, height/30);  //font & text size for content
  textAlign(LEFT, CORNER);
  textLeading(40);  // Set leading to 100
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
  textAlign(CENTER);
  fill(0);
  text("assess", width/2, height/2);
}

//when game is clicked
void clickGame() {
  textAlign(CENTER);
  fill(0);
  text("game", width/2, height/2);
}

//when contact is clicked
void clickResources() {
  textAlign(CENTER);
  fill(0);
  text("resources", width/2, height/2);
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
