
//header state (init, home, assesment, game, resources, help, quiz, quiz result, game1, game2)
String headerState = "init";

//logged in as patient
void patientScene() {

  patientInit();      //graphic set up for patient scene
  signoutButton();    //button for signout (=goes back to login scene) (written in the doctorScene tab)
  headerButton();     //header buttons (home, assesment, game, contact, help) hover feature + changes header state
  backgroundC();       //bakcground (ivory rect) (written in the doctorScene tab)

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
  } else if (headerState == "pickGame") {                    //pick and click game
    game();
  } else if (headerState == "init") {                    //first logged in, show the welcome + hospital image (function is written in the doctorScene tab)
    startPage(Hospital);
  }
}

//initial set up for patient scene
void patientInit() {
  background(255);

  logo();  //draws the logo + collision detection and click feature(function written in doctorScene)

  //logo button feature
  if (mouseY > width/100 && mouseY < width/100 + height/25 && mouseX > width/100 && mouseX < width/100 + textWidth("Alz's")) {
    fill(#22A7A4);  //green
    text("Alz's", width/100, width/100);
    if (mousePressed == true) {  //if clicked
      headerState = "init";  //the welcome page
    }
  }

  basicGraphic(); //draws the header rect (besides the logo) and the menu rect (the yellow bar)
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


//when help is clicked, show the text and the image
void clickHelp() {
  //title text
  title("Labels");

  imageMode(CENTER);
  Help.resize(int(width*0.6), 0);
  image(Help, width/2, height/1.6);
}
