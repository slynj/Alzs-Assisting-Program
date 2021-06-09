String id = "";
String password = "";
PFont SDGothic;
PFont Avenir;

//ArryList to put it the id/password values
ArrayList<TEXTBOX> textboxes = new ArrayList<TEXTBOX>();
//not logged in
String logged = "init";

void textboxSetup() {
  TEXTBOX id = new TEXTBOX();
  //id text box
  id.X = width/2;
  id.Y = height/2 - height*0.66/10;
  id.W = width*0.66/2.5;
  id.H = height*0.66/10;

  //password textbox
  TEXTBOX password = new TEXTBOX(width/2, height/2 + height*0.66/20, width*0.66/2.5, height*0.66/10);
  password.BorderWeight = 1;
  password.BorderEnable = true;

  textboxes.add(id);
  textboxes.add(password);
}

void loginScene() {
  SDGothic = loadFont("AppleSDGothicNeo-Heavy-48.vlw");
  Avenir = loadFont("AvenirNext-UltraLight-48.vlw");

  float baseX = width/2;
  float baseY = height/2;
  float baseW = width*0.66;
  float baseH = height*0.66;
  //background box
  rectMode(CENTER);
  fill(221);
  noStroke();
  rect(baseX, baseY, baseW, baseH, 30);

  textFont(SDGothic);
  textSize(height/10);
  textAlign(CENTER);
  fill(0);
  text("Alz's", baseX, baseY - baseW/6);

  textFont(Avenir);
  textAlign(RIGHT);
  textSize(height/16);
  fill(0);
  text("ID:  ", baseX, baseY - baseH/35);
  text("PASSWORD:  ", baseX, baseY + baseH/8);

  rectMode(CENTER);
  fill(255);
  noStroke();
  rect(baseX, baseY + baseH/3, baseW/6, baseH/10, 100);
  textAlign(CENTER, CENTER);
  fill(0);
  textSize(height/26);
  text("HELP", baseX, baseY + baseH/3);

  textFont(SDGothic);
  textSize(36);
  textAlign(LEFT, CENTER);
  fill(0);
  text(id, baseX, baseY - baseH/10, baseW/2.5, baseH/10);

  //draws the text boxes
  for (TEXTBOX t : textboxes) {  //enhanced for loop for arrays
    t.DRAW();
  }

  //if password and id is correct, patient scene
  if (logged == "success") {
    fill(250, 250, 250);
    text("YOU ARE LOGGED IN!", (width - textWidth("YOU ARE LOGGED IN")) / 2, 230);
  } else if (logged == "fail") {
    text("fail", (width - textWidth("fail")) / 2, 230);
  }
}

void mousePressed() {
  for (TEXTBOX t : textboxes) {
    t.PRESSED(mouseX, mouseY);
  }
}

//checks if the id and password is correct. if it is, logged is true
void check() {
  if (textboxes.get(0).Text.equals("patient")) {
    if (textboxes.get(1).Text.equals("alz")) {
      logged = "success";
    } else {
      logged = "fail";
    }
  } else {
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
