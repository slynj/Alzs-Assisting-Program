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


String program;

void setup() {
  //screen set up
  size(1200, 800);
  background(255);

  //for high quality text 
  pixelDensity(displayDensity());

  //textbox initial setup
  textboxSetup();

  //variable assigning
  program = "login";  //program state is login
}

void draw() {    
  if (program == "login") {

    //loginScene funciton that sets the log in page up (buttons, graphics, shapes ...)
    loginScene();
  } else if ( program == "patient") {
    patientScene();
  }else if ( program == "doctor") {
    text("doctor", 0, 0);
  }
}
