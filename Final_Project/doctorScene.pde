void doctorScene() {
  doctorInit();      //graphic set up for patient scene
  signoutButton();    //button for signout (goes back to login scene)
  headerButton();     //header buttons (home, assesment, game, contact, help) hover feature + changes header state
  backgroundC();       //bakcground (ivory rect)
}

//initial graphic set (draws the buttons, logos, menus)
void doctorInit() {
  logo();
  basicGraphic();
}

//draws the logo
void logo() {
  background(255);

  //logo text
  font(SDGothic, height/20, #32bdba);  //font funtion deteminds font, text size, and colour (in graphicFunctions tab)
  textAlign(LEFT, TOP);
  text("Alz's", width/100, width/100);
}

//draws the basic rect of the page
void basicGraphic() {
  //header rect (besides the logo)
  rectMode(RIGHT);
  fill(#efece5);  //dark beige
  noStroke();
  rect(width - width/100, width/100, width/10, height/18, 5);

  //menu — base rect (header rectangle)
  rectMode(CENTER);
  fill(#f9ad29);  //yellow
  noStroke();
  rect(width/2, height/9, width, height/13);
}
