//when home is clicked
void clickHome() {
  //CONTENT
  font(ChapR, height/15, 0);  //font & text size & colour for title
  textAlign(CENTER);
  text("What is Alzheimer's Disease?", width/2, height/3.5); //title
  font(SDLight, height/30, 0);  //font & text size for content
  textAlign(LEFT, CORNER);
  textLeading(width/20);  // Set leading to 40 (when screen is 1200 by 800)
  String s = "- Alzheimer’s disease is the most common type of dementia.\n\n"  //content
    + "- It is a progressive disease beginning with mild memory loss and possibly leading to loss of the ability to carry on a conversation and respond to the environment.\n\n"
    + "- Alzheimer’s disease involves parts of the brain that control thought, memory, and language.\n\n"
    +  "- It can seriously affect a person’s ability to carry out daily activities.";
  text(s, width/2.5, height/3, width*0.57, height*0.66);  //draw text
  imageMode(CENTER);  //image coordinate based on the center of the image
  Grandpa.resize(0, int(height/2.1));  //image resize
  image(Grandpa, width/5, height/1.75);  //draw image

  //url
  String url = "https://www.cdc.gov/aging/aginginfo/alzheimers.htm#:~:text=Alzheimer's%20disease%20is%20the%20most,thought%2C%20memory%2C%20and%20language.";  //link
  fill(#5D79B2);  //blue 
  textAlign(CENTER, CENTER);   //text align
  textSize(width/80);  //text size
  if (mouseY > height*0.914 && mouseY < height*0.914 + height/30 && mouseX > width/12.6 && mouseX < width/12.6 + textWidth(url)) {  //collision detection
    fill(#3D5486);    //dark blue
    if (mousePressed == true) {
      link(url);
    }
  }
  text(url, width/2, height*0.93);  //draw the text
}
