
//array lists that holds the data of the score / time
ArrayList<Float> scoreData = new ArrayList<Float>();
ArrayList<Float> timeData = new ArrayList<Float>();
//data array that holds both score and thime (read by line from the txt file)
float[] data;

//graph rect(where graph is drawn on) x, y, w, h, bottom y, right x
float graphRectX;
float graphRectY;
float graphRectW;
float graphRectH;
float graphRectBY;  //bottom Y of the background rectangle (where graph is drawn on)
float graphRectRX;  //right X of the background rectangel(where graph is drawn on)

//reads the file and draws the graph with the ArrayList given by the parmeter
void graph(ArrayList<Float> dataList) {
  readFile();  //reads the txt file
  drawGraph(dataList);  //draws the graph with the data from the ArrayList Given
} 


//reads the txt file and save it as array & ArrayList
void readFile() {
  BufferedReader reader = createReader("score.txt");  //create 'reader' that reads the file txt file
  String line = null;  //


  try {
    //add 0 to both arrays to have a starting value of 0
    scoreData.clear();
    timeData.clear();
    
    scoreData.add(0.);  
    timeData.add(0.);
    while ((line = reader.readLine()) != null) {  //
      String[] data = split(line, ",");  //split the numbers by comma and put them in data array line by line
      scoreData.add(float(data[0]));  //in each data arrays, the number in 0th index goes in to scoreData ArrayList
      timeData.add(float(data[1]));  //number in 1st index goes in to timeData ArrayList
    }
    reader.close();  //close the reader file
  } 
  catch (IOException e) {  //if there's an error, trace it
    e.printStackTrace();
  }
  getAvg();  //get the average now that the ArrayLists own value (for the average page)
}


//draw the actual graph given the ArrayList(parameter)
void drawGraph(ArrayList<Float> dataList) {

  //stroke setup
  strokeWeight(3);
  stroke(255);

  //line width and height that decides how many pixels is 1 unit of the graph
  float lineWidth = graphRectW/(scoreData.size()-1);
  float lineHeight = 0;
  
  //different lineHeight value and labels for each graph (score, time)
  if (dataList == scoreData) {
    lineHeight = graphRectH/100;  //1 unit is the graph rect divided by 100 because it is in percentage
    graphLabel("50", "100", "%"); //y label
  } else if (dataList == timeData) {
    lineHeight = graphRectH/20;  //1 unit is the graph rect divided by 20 because 20 is the max. min
    graphLabel("10", "20", "(m)");  //y label
  }
  
  //draw the x labels (always the same0
  font(AvenirR, height/50, 0);
  textAlign(CENTER, CENTER);
  text("0", graphRectX - graphRectH/50, graphRectBY + graphRectH/50);
  text((scoreData.size()-1)/2, graphRectX + graphRectW/2, graphRectBY + graphRectH/30);
  text(scoreData.size()-1, graphRectX + graphRectW, graphRectBY + graphRectH/30);

  fill(#4B463F);
  text("trial #", width/2, graphRectBY + graphRectH/13);
  
  //draws the lines (actual graph part)
  for (int i = 0; i < scoreData.size()-1; i++) {  //repeat until i is 1 less then the ArrayList size (because the x2 y2 draws the point of i+1)
    line(i*lineWidth+graphRectX, graphRectBY - (dataList.get(i)*lineHeight), (i+1)*lineWidth + graphRectX, graphRectBY - (dataList.get(i+1)*lineHeight));
  }
  
  
  
  //clear all the values in the ArrayLists to prevent calculations with ArrayLists changing every frame
  scoreData.clear();
  timeData.clear();
}


//draws the rectangle that graph is drawn on
void graphRect() {
  //variable assign
  graphRectX = width/20;
  graphRectY = height/6.7 + width/7;
  graphRectW = width - width/10;
  graphRectH = height-height/6.7 - width/5;
  graphRectBY = graphRectY + graphRectH;

  fill(#B7ADA1);  //dark beige colour
  rect(graphRectX, graphRectY, graphRectW, graphRectH, 10);  //draw
}


//graph label of the y axis (because it changes depending on the graph)
void graphLabel(String half, String full, String sign) {  //gets the 3 string to draw
  font(AvenirR, height/50, 0);
  text(half, graphRectX - graphRectH/30, graphRectBY - graphRectH/2);
  text(full, graphRectX - graphRectH/30, graphRectBY - graphRectH);
  
  fill(#4B463F);
  text(sign, graphRectX - graphRectH/12, graphRectBY - graphRectH/2);
}


//title and subtitle of the graph
void graphTitle(String title, String subtitle) {  //gets 2 strings title & subtitle
  titleHigher(title);  //title funciotn from graphicFunctions
  font(AvenirI, height/40, #5A5244);
  textAlign(CENTER, CENTER);
  text(subtitle, width/2, height*0.3);
}
