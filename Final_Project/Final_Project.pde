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


void setup() {
  //screen set up
  size(1200, 800);
  background(255);

  //for high quality text 
  pixelDensity(displayDensity());
  
  //textbox initial setup
  textboxSetup();
}

void draw() {    
  loginScene();
}


void keyTyped() {
  //
  //id += key;
}
