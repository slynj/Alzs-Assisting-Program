
//variable declaration for average
float scoreSum;
float timeSum;
int scoreAvg;
int timeAvg;

//gets the average value of scoreData and timeData (in the readFile of Graph tab to get the value after it is setted)
void getAvg() {
  //variable assign
  scoreSum = 0;
  timeSum = 0;
  for (float value : scoreData) {  //enhanced for loop (gets indexs form scoreData and puts it into value)
    scoreSum += value;    //all the values in scoreData added
  }
  for (float value : timeData) {
    timeSum += value;  //all the values in timeData added
  }

  //average is the sum divided by the ArrayList size - 1 (-1 becuase there is an initial value of 0)
  scoreAvg = int(scoreSum/(scoreData.size()-1));
  timeAvg = int(timeSum/(timeData.size()-1));
}


//draws the title &  average # on the average page  
void drawAvgText() {
  titleHigher("average");  //title
  
  //set string arrays
  String[] avgS = {"Average Score:", str(scoreAvg)};
  String[] avgT = {"Average Time:", str(timeAvg)};
  
  //draw texts
  font(AvenirI, height/30, 0);
  textAlign(CORNER, CENTER);
  text(avgS[0], width/2 - textWidth(avgS[0]), height/2.5);
  text(avgT[0], width/2 - textWidth(avgT[0]), height/1.5); 
  text("percent", width/2 + textWidth(avgS[1])*3.5, height/2.5);
  text("minutes", width/2 + textWidth(avgT[1])*5, height/1.5);
  
  println(scoreAvg, timeAvg);
  
  font(SDLight, height/20, 0);
  text(avgS[1], width/2 + textWidth(avgS[1]), height/2.5);
  text(avgT[1], width/2 + textWidth(avgT[1]), height/1.5);
}



void graphBttn() {
  //rect setup
  rectMode(CORNER);
  fill(#CBC5BD);

  //hover function draws the button changes the colour when hovered
  buttonHover(width*0.45, height/2.1, width/10, height/25, #B7ADA1, 10);
  //if mouse hovered and mouse is pressed, button is clicked
  if (hover == true && mousePressed == true) {
    menuState = "score";
  }
  
  fill(#CBC5BD);
  buttonHover(width*0.45, height/1.35, width/10, height/25, #B7ADA1, 10);
  //if mouse hovered and mouse is pressed, button is clicked
  if (hover == true && mousePressed == true) {
    menuState = "time";
  }

  //view graph text
  font(AvenirI, height/50, 255);
  textAlign(CENTER, TOP);
  text("view graph", width*0.45 + width/20, height/2.05);
  text("view graph", width*0.45 + width/20, height/1.33);
}
