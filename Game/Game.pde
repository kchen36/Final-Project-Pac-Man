import java.util.*;
import java.io.*;


  String[] Maze = {"############################",
                   "#............##............#",
                   "#.####.#####.##.#####.####.#",
                   "#*####.#####.##.#####.####*#",
                   "#.####.#####.##.#####.####.#",
                   "#..........................#",
                   "#.####.##.########.##.####.#",
                   "#.####.##.########.##.####.#",
                   "#......##....##....##......#",
                   "######.##### ## #####.######",
                   "######.##### ## #####.######",
                   "######.##          ##.######",
                   "######.## ######## ##.######",
                   "######.## #      # ##.######",
                   "      .   #      #   .      ",
                   "######.## #      # ##.######",
                   "######.## ######## ##.######",
                   "######.##          ##.######",
                   "######.## ######## ##.######",
                   "######.## ######## ##.######",
                   "#............##............#",
                   "#.####.#####.##.#####.####.#",
                   "#.####.#####.##.#####.####.#",
                   "#*..##.......  .......##..*#",
                   "###.##.##.########.##.##.###",
                   "###.##.##.########.##.##.###",
                   "#......##....##....##......#",
                   "#.##########.##.##########.#",
                   "#.##########.##.##########.#",
                   "#..........................#",
                   "############################"};
                   
String[] copy = Maze;
int ppeaten;
int eaten;
int score = 0;
ghostred red = new ghostred(477,735,Maze);
pacman pac = new pacman(500, 735,Maze);
ghostred Blinky = new ghostred(425, 400,Maze);
ghostpink Pinky = new ghostpink(450, 400, Maze);
ghostblue Inky = new ghostblue(475, 400, Maze);
ghostorange Clyde = new ghostorange(500 , 400, Maze);

void setup(){
  size(1000, 1000);
  background(0);

  for (int row = 0; row < 28; row++){
    for (int col = 0; col < 31; col++){
      char car = Maze[col].charAt(row);
      if (car == '.'){
        stroke(255);
        fill(255);
        new Dot(row * 27 + 113,col * 27 + 113);
      }
      if (car == '#'){
        stroke(0, 150, 255);
        fill(0);
        new Wall(row * 27 + 100, col * 27 + 100);
      }
      if (car == '*'){
        stroke(255);
        fill(255);
        new PowerPellet(row * 27 + 113, col * 27 + 113);
      }
    }
  }
  fill(255);
  pac.setup();
  Blinky.setup();
  Pinky.setup();
  Inky.setup();
  Clyde.setup();
}

  void draw(){
     stroke(0);
     fill(0);
     rect(600, 40, 250, 80);
     ppeaten = 0;
     eaten = 0;
     if (copy[(pac.yPos-113)/27].charAt((pac.xPos-113)/27) == '.'){
       copy[(pac.yPos-113)/27] = copy[(pac.yPos-113)/27].substring(0, (pac.xPos-113)/27) + "_" + copy[(pac.yPos-113)/27].substring((pac.xPos-113)/27 +1);
     }
     if (copy[(pac.yPos-113)/27].charAt((pac.xPos-113)/27) == '*'){
       copy[(pac.yPos-113)/27] = copy[(pac.yPos-113)/27].substring(0, (pac.xPos-113)/27) + "=" + copy[(pac.yPos-113)/27].substring((pac.xPos-113)/27 +1);
     }
     for (int row = 0; row < 28; row++){
     for (int col = 0; col < 31; col++){
      char car = copy[col].charAt(row);
      if (car == '.'){
        stroke(255);
        fill(255);
        new Dot(row * 27 + 113,col * 27 + 113);
      }
      if (car == '#'){
        stroke(0, 150, 255);
        fill(0);
        new Wall(row * 27 + 100, col * 27 + 100);
      }
      if (car == '*'){
        stroke(255);
        fill(255);
        new PowerPellet(row * 27 + 113, col * 27 + 113);
      }
      if (car == '_'){
        stroke(0);
        fill(0);
        new Dot(row * 27 + 113,col * 27 + 113);
        eaten++;
      }
        if (car == '='){
        stroke(0);
        fill(0);
        ellipse(row, col, 20, 20);
        ppeaten++;
      }
  }
  }
     fill(255,255,0);
     noStroke();
     pac.draw();

     if(counter % 9 == 0){
       Location e = new Location((pac.yPos-113)/27,(pac.xPos-113)/27,null,0,0);
       Blinky.getpath(e);
<<<<<<< HEAD
       Clyde.getpath(e);
     }
=======
>>>>>>> origin/branch
     Blinky.draw();
     Pinky.draw();
     Inky.draw();
     Clyde.draw();
     score = (eaten * 10) + (ppeaten * 50);
     fill(255);
     textSize(32);
     text("Score:" + Integer.toString(score), 600, 80);
  }
  
  void keyPressed(){
    pac.keyPressed();
  }
  