/*
 Name:        Alz's
 Purpose:     Alz's is a program made to help:
                - people with Alzheimer's disease
                - elders who have a high potential of getting the disease 
                - doctors and medical related workers that needs patient's data
              
              This program has 3 main parts to meet the purposes mentioned above:
                - assessing
                - monitoring
                - preventing
              
              These features are mentioned in detail on the features added section down below.
 
 Author:      Lyn Jeong
 Created:     09-Jun-2021
 Updated:     18-Jun-2021
 
 Don't forget to use the reference when programming
 https://processing.org/reference/
 ---------------------------------------------
 I think this project deserves a 4+ because I meet all the level 3 and 4 critirias, and did extra work to improve my program.
 1. Documentation & Commits
   My code and functions are fully commented with proper header, and is formatted/indented correctly.
   I also avoided repeating code by creating functions with APIs or settings that I use a lot(ex. font() in graphicFunction) with parameters. 
   I at leasted commited 1 - 2 times a day making my total commits for this project being 50!
 2. User Interface
   I used quite a bit of time working on the UI of this project, to make it easier for anybody (especially seniors) to use.
   I tried to have features that normal websites would usally have (ex. login, butotn hover, menu bar) so it is familiar and intuitive for any users.
 3. My Goals & Levels
   I met up all my goals that I set up for level 4!
        - Playable Games Made
        - Excellent looking graphics (VISUALLY APPEALING)
        - Has a login page with error messages under certain circumstances
        - Includes a doctor version with graphs and analysis
        - All buttons functioning correctly with hover features (or mouse cursor change)
    Moreover, I made extra feautres for the "Doctor Page" which I did not plan to do on the planning stage.  
 
 Features Added:
1. Login Feature
    - login page with 2 sets of id/password that leads to the main page of alz's
    - those 2 different id/password leads the user to distinct pages: doctor and patient page
    - logout button that brings the user back to "login" state
    - if not correct id or password, it gives a message to try again
2. Hover
    - hover feature for all of the buttons to better the user interaction and also to make sure users know it is a button
3. State
    - use of state makes users be able to go back and forth with the menus
4. Assesment
    - self assessment quiz where users can ask them selfs questions and answer it.
    - the answer is recorded to assess the user's health and gives advices
5. Game
    - serious game that checks the user's cognitive ability which is an ability easy to lose if you are a potential or even already is Alzheimer's patient.
    - records users score and time it took to finish the game in a txt file
    - everytime user plays the game, the data appends to the file (even when the program is closed, the file is remained)
6. Resources
    - links to help activate patient's brain
    - online activites that are known to help Alzheimer's patients
7. Graphs
    - visual line graphs to show how the score and time is changing every trial
    - for doctors and medical workers: so they can easily catch and monitor patient's status
    - becuase it keeps on appending on 1 txt file, it is easy to compare current data with previous ones
    - fake datas put it to show how doctors would see it (the time increasing, and score decreasing)
    - to easily see the data appending, erase the score.txt file in data directory and run the program. It will create a new socre.txt file. Play games several
      times to have datas in the file
8. Average
    - gets the average of all datas collected until now
    - has a button beneath it to easily go to the graph
9. Contacts
    - links to reliable & known associations, groups website to know more about alzhemier's.
    - easily connected through buttons
    - if clicked, it opens the link on a tab
10. Help
    - explains what each things does (to help users)
 
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
