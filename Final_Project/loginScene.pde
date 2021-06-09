String message = "";
PFont SDGothic;
PFont Avenir;

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
  
  rectMode(CORNER);
  fill(255);
  stroke(180);
  rect(baseX, baseY - baseH/10, baseW/2.5, baseH/10, 10);
  rect(baseX, baseY + baseH/20, baseW/2.5, baseH/10, 10);
  
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
  text("NEXT", baseX, baseY + baseH/3);

    //
    //textFont(SDGothic);
    //textSize(36);
    //fill(0);
    //text(message, 25, 150);
}
