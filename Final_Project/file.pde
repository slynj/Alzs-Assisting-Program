//library import
import java.io.BufferedWriter;
import java.io.FileWriter;

//file name to create
String filename = "score.txt";

//appends text to the end of a text file located in the data directory, creates the file if it does not exist.
void appendText (String filename, float scorePer, float time){
  File f = new File(dataPath(filename));    //f is score.txt file in the data folder
  if(!f.exists()){  //if score.txt does not exist,
    createFile(f);  // create the file
  }
  try {  //run this, but if there is an error (continued in catch part)
    //open the writer file with called the filename(score.txt)
    PrintWriter Score = new PrintWriter(new BufferedWriter(new FileWriter(f, true)));
    Score.printf("%5.2f, %5.2f\n", scorePer, time);  //add the data to the file with formating (float has max of 2 digits)
    Score.close();  //close the file
  }catch (IOException e){  //during input or output,
      e.printStackTrace();  //show what happened
      exit();  //exit the game
  }
}


//Creates a new file including all subfolders
void createFile(File f){
  File parentDir = f.getParentFile();
  try{
    parentDir.mkdirs();   //in the parent directory, make another directory
    f.createNewFile();    //create the file
  }catch(Exception e){  //any errors,
    e.printStackTrace();  //trace it
    exit();    //close the program
  }
}   
