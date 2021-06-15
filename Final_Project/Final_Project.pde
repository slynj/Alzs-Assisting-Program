/*
 Name:        Program Name
 Purpose:     Program Description
 
 Author:      Your Name
 Created:     XX-Dec-2020
 Updated:     XX-Dec-2020
 
 Don't forget to use the reference when programming
 https://processing.org/reference/
 ---------------------------------------------
 I think this project deserves a XXXXXX because ...
 
 Features Added:
 ...
 ...
 ...
 
 --------------------------------------------- 
 
 //*/

//prgram state
String program;
//fonts
PFont SDGothic;
PFont AvenirUL;
PFont AvenirR;
PFont AvenirI;
PFont OratorR;
PFont SDLight;
PFont ChapR;
//images
PImage Grandpa;
PImage Hospital;
PImage Welcome;
PImage Colouring;
PImage Card;
PImage Puzzle;


//determind if user clicked or not
boolean click;

void setup() {
  //screen set up
  size(1200, 800);
  //size(300, 200);


  //fonts set up and import
  SDGothic = loadFont("AppleSDGothicNeo-Heavy-48.vlw");
  SDLight = loadFont("AppleSDGothicNeo-Light-48.vlw");
  AvenirUL = loadFont("AvenirNext-UltraLight-48.vlw");
  AvenirI = loadFont("AvenirNext-Italic-48.vlw");
  AvenirR = loadFont("AvenirNext-Regular-48.vlw");
  OratorR = loadFont("OratorStd-48.vlw");
  ChapR = loadFont("ChaparralPro-Regular-48.vlw");
  
  //image import
  Grandpa = loadImage("grandpa.png");
  Hospital = loadImage("hospital.png");
  Welcome = loadImage("welcome.png");
  Colouring = loadImage("colouring.png");
  Card = loadImage("card.png");
  Puzzle = loadImage("puzzle.png");

  //for high quality text 
  pixelDensity(displayDensity());

  //textbox for the texbox class — initial setup
  textboxSetup();

  //variable assigning
  program = "patient";  //program state is login
}

void draw() {    
  if (program == "login") {
    //loginScene funciton that sets the log in page up (buttons, graphics, shapes ..
    loginScene();
  } else if ( program == "patient") {
    patientScene();
  } else if ( program == "doctor") {
    text("doctor", 0, 0);
  }
}

void mousePressed() {
  //always running
  //click = true;

  //only if its login state
  if (program == "login") {
    for (TEXTBOX t : textboxes) {
      t.PRESSED(mouseX, mouseY);
    }
  }
}

void mouseReleased() {
  click = false;
}
