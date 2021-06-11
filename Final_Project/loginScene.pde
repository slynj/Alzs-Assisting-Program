//String id = "";
//String password = "";

//ArryList to put it the id/password values
ArrayList<TEXTBOX>   textboxes = new ArrayList<TEXTBOX>();
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

  background(255);

  //base rectangel X, Y, Width, and Height. (benchmark points)
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
  font(SDGothic, height/10);
  textAlign(CENTER);
  fill(0);
  text("Alz's", baseX, baseY - baseW/6);

  //ID and PASSWORD text
  font(AvenirUL, height/16);
  textAlign(RIGHT);
  fill(0);
  text("ID:  ", baseX, baseY - baseH/35);
  text("PASSWORD:  ", baseX, baseY + baseH/8);

  //Help button rect
  rectMode(CENTER);
  fill(255);
  noStroke();
  rect(baseX, baseY + baseH/2.6, baseW/6, baseH/10, 100);
  //Help button text
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
  if (logged == "patientSuccess") {
    program = "patient";
  } else if (logged == "doctorSuccess") {
    program = "doctor";
  } else if (logged == "fail") {
    fill(#BF5443);
    text("wrong ID or PASSWORD, please try again", (width - textWidth("wrong ID or PASSWORD, please try again")) / 2, baseY + baseW/6);
  }
}


//checks if the id and password is correct. if it is, logged is true
void check() {

  //if patient id and password;
  if (textboxes.get(0).Text.equals("patient") && textboxes.get(1).Text.equals("alz")) {
    //logged status is patientSucess (changes program state to patient)
    logged = "patientSuccess";
    //text box reset (erases the text and the text length(
    textboxes.get(0).Text = "";
    textboxes.get(1).Text = "";
    textboxes.get(0).TextLength = 0;
    textboxes.get(1).TextLength = 0;
    //if doctor id and password;
  } else if (textboxes.get(0).Text.equals("doctor") && textboxes.get(1).Text.equals("alz0523")) {
    //logged status is doctorSuccess (changes program state to doctor)
    logged = "doctorSuccess";
    //text box reset (erases the text and the text length(
    textboxes.get(0).Text = "";
    textboxes.get(1).Text = "";
    textboxes.get(0).TextLength = 0;
    textboxes.get(1).TextLength = 0;
  } else {
    //else if id and password is wrong, change program state to fail (prints text)
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
