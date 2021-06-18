
//header state (init, home, assesment, game, resources, help, quiz, quiz result, game1, game2)
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
  } else if (headerState == "quiz") {                    //start self assess quiz logged in
    quiz();
  } else if (headerState == "quizResult") {                    //result page of the quiz
    quizResult();
  } else if (headerState == "pickGame") {                    //pick and click game
    game();
  } else if (headerState == "init") {                    //first logged in
    startPage();
  }
}

//initial set up for patient scene
void patientInit() {
  background(255);

  logo();  //draws the logo (function written in doctorScene)

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

//when help is clicked
void clickHelp() {
  //title text
  title("Labels");

  imageMode(CENTER);
  Help.resize(int(width*0.6), 0);
  image(Help, width/2, height/1.6);
}
