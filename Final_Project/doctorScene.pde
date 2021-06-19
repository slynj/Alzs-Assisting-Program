String menuState = "score";


void doctorScene() {
  doctorInit();      //graphic set up for patient scene
  signoutButton();    //button for signout (goes back to login scene)
  menuButton();     //header buttons (home, assesment, game, contact, help) hover feature + changes header state
  backgroundC();       //bakcground (ivory rect)

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
    if (mouseX > menuX && mouseX < menuX + menuW) {
      fill(0);
      text("score", menuX + menuW/2, rectY);
      if (mousePressed == true) {
        menuState = "score";
      }
    } else if (mouseX > x1 && mouseX < x1 + menuW) {
      fill(0);
      text("time", x1 + menuW/2, rectY);
      if (mousePressed == true) {
        menuState = "time";
      }
    } else if (mouseX > x2 && mouseX < x2 + menuW) {
      fill(0);
      text("average", x2 + menuW/2, rectY);
      if (mousePressed == true) {
        menuState = "average";
      }
    } else if (mouseX > x3 && mouseX < x3 + menuW) {
      fill(0);
      text("table", x3 + menuW/2, rectY);
      if (mousePressed == true) {
        menuState = "table";
      }
    } else if (mouseX > x4 && mouseX < x4 + menuW) {
      fill(0);
      text("help", x4 + menuW/2, rectY);
      if (mousePressed == true) {
        menuState = "help";
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


ArrayList<Float> scoreData = new ArrayList<Float>();
ArrayList<Float> timeData = new ArrayList<Float>();
float[] data;

float graphRectX;
float graphRectY;
float graphRectW;
float graphRectH;
float graphRectBY;  //bottom Y of the background rectangle (where graph is drawn on)
float graphRectRX;  //right X of the background rectangel(where graph is drawn on)

void scorePage() {
  graphRect();
  
  graphTitle("score", "in percentage");

  graph(scoreData);
}



void timePage() {
  graphRect();
  
  graphTitle("time", "in minutes");
  
  graph(timeData);
}

void graphRect() {
  graphRectX = width/20;
  graphRectY = height/6.7 + width/7;
  graphRectW = width - width/10;
  graphRectH = height-height/6.7 - width/5;
  graphRectBY = graphRectY + graphRectH;

  fill(#B7ADA1);
  rect(graphRectX, graphRectY, graphRectW, graphRectH, 10);
}

void graphLabel(String half, String full, String sign) {
  font(AvenirR, height/50, 0);
  text(half, graphRectX - graphRectH/30, graphRectBY - graphRectH/2);
  text(full, graphRectX - graphRectH/30, graphRectBY - graphRectH);
  
  fill(#4B463F);
  text(sign, graphRectX - graphRectH/12, graphRectBY - graphRectH/2);
}

void graphTitle(String title, String subtitle) {
  titleHigher(title);
  font(AvenirI, height/40, #5A5244);
  textAlign(CENTER, CENTER);
  text(subtitle, width/2, height*0.3);
}


void averagePage() {
  title("average");
}



void tablePage() {
  title("table");
}



void helpPage() {
  title("help");
}



void graph(ArrayList<Float> dataList) {
  readFile();
  drawGraph(dataList);
} 

void readFile() {
  BufferedReader reader = createReader("score.txt");
  String line = null;


  try {
    scoreData.add(0.);
    timeData.add(0.);
    while ((line = reader.readLine()) != null) {
      String[] data = split(line, ",");
      scoreData.add(float(data[0]));
      timeData.add(float(data[1]));
    }
    reader.close();
  } 
  catch (IOException e) {
    e.printStackTrace();
  }
}



void drawGraph(ArrayList<Float> dataList) {

  //stroke setup
  strokeWeight(3);
  stroke(255);

  float lineWidth = graphRectW/(scoreData.size()-1);
  float lineHeight = 0;

  if (dataList == scoreData) {
    lineHeight = graphRectH/100;
    graphLabel("50", "100", "%");
  } else if (dataList == timeData) {
    lineHeight = graphRectH/20;
    graphLabel("10", "20", "(m)");
  }

  font(AvenirR, height/50, 0);
  textAlign(CENTER, CENTER);
  text("0", graphRectX - graphRectH/50, graphRectBY + graphRectH/50);
  text((scoreData.size()-1)/2, graphRectX + graphRectW/2, graphRectBY + graphRectH/30);
  text(scoreData.size()-1, graphRectX + graphRectW, graphRectBY + graphRectH/30);

  fill(#4B463F);
  text("trial #", width/2, graphRectBY + graphRectH/13);
  
  for (int i = 0; i < scoreData.size()-1; i++) {
    line(i*lineWidth+graphRectX, graphRectBY - (dataList.get(i)*lineHeight), (i+1)*lineWidth + graphRectX, graphRectBY - (dataList.get(i+1)*lineHeight));
  }

  scoreData.clear();
  timeData.clear();
}

//void graph() {
//  BufferedReader reader = createReader("score.txt");
//  String line = null;


//  try {
//    scoreData.add(0.);
//    timeData.add(0.);
//    while ((line = reader.readLine()) != null) {
//      String[] data = split(line, ",");
//      scoreData.add(float(data[0]));
//      timeData.add(float(data[1]));
//    }
//    reader.close();
//  } 
//  catch (IOException e) {
//    e.printStackTrace();
//  }

//  //stroke setup
//  strokeWeight(3);
//  stroke(255);

//  float lineWidth = graphRectW/(scoreData.size()-1);
//  float lineHeight = graphRectH/100;

//  for (int i = 0; i < scoreData.size()-1; i++) {
//  line(i*lineWidth+graphRectX, graphRectBY - (scoreData.get(i)*lineHeight), (i+1)*lineWidth + graphRectX, graphRectBY - (scoreData.get(i+1)*lineHeight));
//  }

//  font(AvenirR, height/50, 0);
//  textAlign(CENTER, CENTER);
//  text(scoreData.size()/2, graphRectX + graphRectW/2, graphRectBY + graphRectH/30);
//  text(scoreData.size(), graphRectX + graphRectW, graphRectBY + graphRectH/30);

//  fill(#4B463F);
//  text("trial #", width/2, graphRectBY + graphRectH/13);

//  scoreData.clear();
//  timeData.clear();
//} 
