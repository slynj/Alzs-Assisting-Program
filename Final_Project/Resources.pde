//when contact is clicked
void clickResources() {
  //x and y coordinates for the image buttons
  float img2X = width*0.39;
  float img1X = img2X - Colouring.width - width/20;
  float img3X = img2X + Colouring.width + width/20;
  float baseImgY = height/2.5;

  //title text
  title("Board? Try These Out!");

  //image settings
  imageMode(CORNER);  //coordinates from the image centre
  Colouring.resize(0, height/3);  //resize images
  Card.resize(0, height/3);  //resize image
  Puzzle.resize(0, height/3);  //resize image

  //button #1 (colouring page)
  String colourLink = "https://www.thecolor.com/";  //link to the colouring website
  resourceButton(img1X, colourLink);  //hover function; collision detectoin and darkens the button(function at the bottom)
  image(Colouring, img1X, baseImgY);  //colouring image

  String cardLink = "https://www.solitr.com/";  //link to the card game website
  resourceButton(img2X, cardLink);
  image(Card, img2X, baseImgY);  //colouring image

  String puzzleLink = "https://www.digipuzzle.net/main/kids/";  //link to the puzzle website
  resourceButton(img3X, puzzleLink);
  image(Puzzle, img3X, baseImgY);  //puzzle image

  font(SDLight, height/30, 0);
  //titles
  String s1 = "colouring page";
  String s2 = "card game/sudoku";
  String s3 = "jigsaw  puzzle";
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
void resourceButton(float X, String url) {
  float baseImgY = height/2.5;  //the y coord. for all 3 buttons (since they are all aligned)
  noTint();  //resets the tint (org. image)
  if (mouseY > baseImgY && mouseY < baseImgY + Colouring.height && mouseX > X && mouseX < X + Colouring.height) {  //collision detection
    tint(200);  //makes the image darker
    if (mousePressed == true) {  //button clicked
      link(url);  //lead to url (in the parameter)
    }
  }
}
