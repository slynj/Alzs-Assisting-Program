
void patientScene() {
  background(255);

  //logo text
  font(SDGothic, height/20);  //font funtion deteminds font and text size (in graphicFunctions tab)
  textAlign(LEFT, TOP);
  fill(#32bdba);
  text("Alz's", width/100, width/100);

  //header rect (besides the logo)
  rectMode(RIGHT);
  fill(#efece5);
  noStroke();
  rect(width - width/100, width/100, width/10, height/18, 5);
  //  rect(width - width/100, width/100, 1000, height/18);



  //sign out rect
  rectMode(CORNER);
  fill(#CBC5BD);
  rect(width*0.87, height/43, width/10, height/40, 10);

  //if (mouseX > width*0.87 && mouseX < width*0.87 + width/10 && mouseY > height/43 && mouseY < height/43 + height/40) {
  //  fill(0);
  //  rect(width*0.87, height/43, width/10, height/40, 10);
  //  if (mousePressed == true) {
  //    logged = "init";
  //    program = "login";
  //  }
  //}

  //hover functions changes the colour when hovered
  hover(width*0.87, height/43, width/10, height/40, 0, 10);
  //if mouse hovered and mouse is pressed, button is clicked
  if (hover == true && mousePressed == true) {
    //reset the logged variable to init(it was previously success)
    logged = "init";
    //change the program state to login
    program = "login";
  }

  //sign out text
  font(AvenirI, height/50);
  textAlign(CENTER, TOP);
  fill(255);
  text("sign out", width*0.87, height/43);

  //menu — base rect
  rectMode(CENTER);
  fill(#f9ad29);
  noStroke();
  rect(width/2, height/9, width, height/13);
}
