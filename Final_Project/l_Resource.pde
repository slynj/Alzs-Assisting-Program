void contactGraphic() {
  //x and y coordinates for the image buttons
  float img2X = width*0.39;
  float img1X = img2X - Asc.width - width/20;
  float img3X = img2X + Asc.width + width/20;
  float baseImgY = height/2.5;

  //title text
  titleHigher("need more info?");

  //image settings
  imageMode(CORNER);  //coordinates from the image centre
  Asc.resize(0, height/3);  //resize image
  Adi.resize(0, height/3);  //resize image
  As.resize(0, height/3);  //resize image

  //button #1 (colouring page)
  String ascLink = "https://alzheimer.ca/en";  //link to the Alzheimer Society of Canada website
  contactButton(img1X, ascLink);  //hover function; collision detectoin and darkens the button(function at the bottom)
  image(Asc, img1X, baseImgY);  //asc image

  String adiLink = "https://www.alzint.org/";  //link to the Alzheimer Disease International website
  contactButton(img2X, adiLink);
  image(Adi, img2X, baseImgY);  //colouring image

  String asLink = "https://www.alz.org/";  //link to the alzheimer's association website
  contactButton(img3X, asLink);
  image(As, img3X, baseImgY);  //puzzle image

  font(SDLight, height/35, 0);
  //titles
  String s1 = "alzheimer society of canada";
  String s2 = "alzheimer disease international";
  String s3 = "alzheimer's association";
  //title array
  String[] title = {s1, s2, s3};
  //changing x value of the text
  float Width = width/4.5;
  //for loop that draws the 3 strings
  for (int i = 0; i < 3; i++) {
    text(title[i], Width, height*0.8);
    Width += width/3.6;
  }
}

//hover detecting funciton only for the resource button (because it uses the tint API and darkens the image it self + leads to a website
void contactButton(float X, String url) {
  float baseImgY = height/2.5;  //the y coord. for all 3 buttons (since they are all aligned)
  noTint();  //resets the tint (org. image)
  if (mouseY > baseImgY && mouseY < baseImgY + Asc.height && mouseX > X && mouseX < X + Asc.height) {  //collision detection
    tint(200);  //makes the image darker
    if (mousePressed == true) {  //button clicked
      link(url);  //lead to url (in the parameter)
    }
  }
}
