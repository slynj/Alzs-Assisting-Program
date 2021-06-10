String id = "";
String password = "";
PFont SDGothic;
PFont AvenirUL;
PFont AvenirR;
PFont AvenirI;

//ArryList to put it the id/password values
ArrayList<TEXTBOX> textboxes = new ArrayList<TEXTBOX>();
//not logged in
String logged = "init";

//sets up the textboxes
void textboxSetup() {
  //id text box
  TEXTBOX id = new TEXTBOX(width/2, height/2 - height*0.66/10, width*0.66/2.5, height*0.66/10);

  //password textbox
  TEXTBOX password = new TEXTBOX(width/2, height/2 + height*0.66/20, width*0.66/2.5, height*0.66/10);
  
  //add objects
  textboxes.add(id);
  textboxes.add(password);
}

//graphics (buttons, texts, text boxes ...)
void loginScene() {
  //fonts set up
  SDGothic = loadFont("AppleSDGothicNeo-Heavy-48.vlw");
  AvenirUL = loadFont("AvenirNext-UltraLight-48.vlw");
  AvenirI = loadFont("AvenirNext-Italic-48.vlw");
  AvenirR = loadFont("AvenirNext-Regular-48.vlw");
  
  //base x, y, width, height variables
  float baseX = width/2;
  float baseY = height/2;
  float baseW = width*0.66;
  float baseH = height*0.66;
  
  //background box (base)
  rectMode(CENTER);
  fill(#efece5);
  noStroke();
  rect(baseX, baseY, baseW, baseH, 30);
  
  //the title text
  textFont(SDGothic);
  textSize(height/10);
  textAlign(CENTER);
  fill(0);
  text("Alz's", baseX, baseY - baseW/6);
  
  //ID and PASSWORD text
  textFont(AvenirUL);
  textAlign(RIGHT);
  textSize(height/16);
  fill(0);
  text("ID:  ", baseX, baseY - baseH/35);
  text("PASSWORD:  ", baseX, baseY + baseH/8);
  
  //Help button
  rectMode(CENTER);
  fill(255);
  noStroke();
  rect(baseX, baseY + baseH/2.6, baseW/6, baseH/10, 100);
  textAlign(CENTER, CENTER);
  fill(0);
  textSize(height/26);
  text("HELP", baseX, baseY + baseH/2.6);
  

  //draws the text boxes
  for (TEXTBOX t : textboxes) {  //enhanced for loop for arrays
    textFont(AvenirI);
    t.DRAW();
  }

  //if password and id is correct, patient scene
  if (logged == "success") {
    program = "patient";
  } else if (logged == "fail") {
    fill(#BF5443);
    text("wrong ID or PASSWORD, please try again", (width - textWidth("wrong ID or PASSWORD, please try again")) / 2, baseY + baseW/6);
  }
}

void mousePressed() {
  for (TEXTBOX t : textboxes) {
    t.PRESSED(mouseX, mouseY);
  }
}

//checks if the id and password is correct. if it is, logged is true
void check() {
  
  if (textboxes.get(0).Text.equals("patient") && textboxes.get(1).Text.equals("alz")) {
    logged = "success";
  } else if (textboxes.get(0).Text.equals("doctor") && textboxes.get(1).Text.equals("alz0523")) {
    logged = "success";
  }
  else {
    logged = "fail";
  }
}

void keyPressed() {
  for (TEXTBOX t : textboxes) {
    //get the value entered and check if it is correct
    if (t.KEYPRESSED(key, (int)keyCode)) {
      check();
    }
  }
}
