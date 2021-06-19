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

//PUBLIC VARIABLES DECLARATION

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
PImage QuizR;
PImage Help;
PImage Apple;
PImage Grape;
PImage Pear;
PImage Pineapple;
PImage Strawberry;
PImage Watermelon;
PImage Shoes;
PImage Pencil;
PImage Lamp;
PImage Vacum;
PImage Ac;
PImage Phone;
PImage Rice;
PImage Iron;
PImage Mixer;
PImage Fridge;
PImage Doctor;
PImage Asc;
PImage Adi;
PImage As;
PImage HelpDoctor;


//determind if user clicked or not
boolean click;

void setup() {
  //screen set up
  size(1200, 800);
  //size(600, 400);


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
  QuizR = loadImage("result.png");
  Help = loadImage ("help.png");
  Apple = loadImage("apple.png");
  Grape = loadImage("grape.png");
  Pear = loadImage("pear.png");
  Pineapple = loadImage("pineapple.png");
  Strawberry = loadImage("strawberry.png");
  Watermelon = loadImage("watermelon.png");
  Shoes = loadImage("shoes.png");
  Pencil = loadImage("pencil.png");
  Lamp = loadImage("lamp.png");
  Vacum = loadImage("vacum.png");
  Ac = loadImage("ac.png");
  Phone = loadImage("phone.png");
  Rice = loadImage("rice.png");
  Iron = loadImage("iron.png");
  Mixer = loadImage("mixer.png");
  Fridge = loadImage("fridge.png");
  Doctor = loadImage("doctor.png");
  Asc = loadImage("asc.png");
  Adi = loadImage("adi.png");
  As = loadImage("as.png");
  HelpDoctor = loadImage("helpDoctor.png");

  //for high quality text 
  pixelDensity(displayDensity());

  //textbox for the texbox class — initial setup
  textboxSetup();

  //variable assigning
  program = "login";  //program state is login
}

void draw() {    
  if (program == "login") {
    //loginScene funciton that sets the log in page up (buttons, graphics, shapes ..
    loginScene();
  } else if ( program == "patient") {
    patientScene();
  } else if ( program == "doctor") {
    doctorScene();
  }
}

void mousePressed() {
  //only if its login state
  if (program == "login") {
    for (TEXTBOX t : textboxes) {
      t.PRESSED(mouseX, mouseY);
    }
  }
}
