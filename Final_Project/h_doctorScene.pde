String menuState = "average";


void doctorScene() {
  doctorInit();      //graphic set up for patient scene
  signoutButton();    //button for signout (goes back to login scene)
  menuButton();     //header buttons (home, assesment, game, contact, help) hover feature + changes header state
  backgroundC();       //bakcground (ivory rect)

  //run each function when the menuState is changed by clicking on the bttns
  if (menuState == "init") {
    startPage(Doctor);
  } else if (menuState == "score") {
    scorePage();
  } else if (menuState == "time") {
    timePage();
  } else if (menuState == "average") {
    averagePage();
  } else if (menuState == "table") {
    tablePage();
  } else if (menuState == "help") {
    helpPage();
  }
}

//initial graphic set (draws the buttons, logos, menus)
void doctorInit() {
  logo();

  //logo button feature
  if (mouseY > width/100 && mouseY < width/100 + height/25 && mouseX > width/100 && mouseX < width/100 + textWidth("Alz's")) {
    fill(#22A7A4);  //green
    text("Alz's", width/100, width/100);
    if (mousePressed == true) {  //if clicked
      menuState = "init";  //the welcome page
    }
  }

  basicGraphic();  //draws the  backgroundrectnagles
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
void menuButton() {
  //varable x y w h for text
  float menuX = width/35;
  float menuY = height/9 - height/26;
  float menuW = width/7;
  float menuH = height/13;
  float widthInc = width/5;
  float rectY = height/9;

  //increasing x for the headers
  float x1 = menuX + widthInc;
  float x2 = x1 + widthInc;
  float x3 = x2 + widthInc;
  float x4 = x3 + widthInc;

  //text setup
  font(OratorR, height/20, 255);
  textAlign(CENTER, CENTER);

  //menu text
  text("score", menuX + menuW/2, rectY);
  text("time", x1 + menuW/2, rectY);
  text("average", x2 + menuW/2, rectY);
  text("table", x3 + menuW/2, rectY);
  text("help", x4 + menuW/2, rectY);

  //if mouse hovers, change text colour (header text)
  if (mouseY > menuY && mouseY < menuY + menuH) {
    if (mouseX > menuX && mouseX < menuX + menuW) {  //if score bttn is hovered,
      fill(0);
      text("score", menuX + menuW/2, rectY);
      if (mousePressed == true) {    //if clicked,
        menuState = "score";  //change menu state to score (change the screen)
      }
    } else if (mouseX > x1 && mouseX < x1 + menuW) {  //if time bttn is hovered,
      fill(0);  //change colour to balck
      text("time", x1 + menuW/2, rectY);  //redraw the text
      if (mousePressed == true) {  //if clicked,
        menuState = "time";  //change menu state to time (change the screen)
      }
    } else if (mouseX > x2 && mouseX < x2 + menuW) {  //if average bttn is hovered,
      fill(0);  //change colour to balck
      text("average", x2 + menuW/2, rectY);  //redraw the text
      if (mousePressed == true) {  //if clicked,
        menuState = "average";    //change menu state to average (change the screen)
      }
    } else if (mouseX > x3 && mouseX < x3 + menuW) {  //if table bttn is hovered,
      fill(0);  //change colour to balck
      text("table", x3 + menuW/2, rectY);  //redraw the text
      if (mousePressed == true) {  //if clicked,
        menuState = "table";  //change menu state to table (change the screen)
      }
    } else if (mouseX > x4 && mouseX < x4 + menuW) {  //if help bttn is hovered,
      fill(0);  //change colour to balck
      text("help", x4 + menuW/2, rectY);  //redraw the text
      if (mousePressed == true) {  //if clicked,
        menuState = "help";  //change menu state to help (change the screen)
      }
    }
  }
}

//draws the background rectangle (beige colour)
void backgroundC() {
  //background rect
  fill(#efece5);
  rect(width/100, height/6.7 + width/100, width - width/50, height-height/6.7 - width/50, 5);
}


//when user first logs in + when logo is clicked, the welcome image + 1 image(chosen through the parmeter) is shown
void startPage(PImage image) {
  //draw image 
  image.resize(width - width/50, 0);  //resize image
  image(image, width/2, height/6.7 + width/100 + height-height/6.7 - width/50 - image.height/2);  //draw image

  //dramw welcome image
  imageMode(CENTER);  //coordinates from the image centre
  Welcome.resize(0, height/6);  //resize image
  image(Welcome, width/2, height/3.5);  //draw image
}


//shows the graph of the score
void scorePage() {    //all functions used written in the graph tab
  graphRect();  //draws the rectangle the graph is drawn on

  graphTitle("score", "in percentage");  //draws the title & subtitle text

  graph(scoreData);  //draw the graph with floats from scoreData ArrayList
}


//shows the graph of the time
void timePage() {    //all functions used written in the graph tab
  graphRect();  //draws the rectangle the graph is drawn on

  graphTitle("time", "in minutes");  //draws the title & subtitle text

  graph(timeData);  //draw the graph with floats from timeData ArrayList
}



void averagePage() {
  readFile();  //to get scoreAvg & timeAvg; (because the getAvg(written in Average tab) is inside the readFile function)
  
  drawAvgText();  //draws the texts and title on the page
  
  graphBttn();  //draws the bttn
 
}




void tablePage() {
  title("table");
}



void helpPage() {
  title("help");
}
