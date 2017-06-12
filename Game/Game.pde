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
pacman pac = new pacman(500, 735,Maze);
ghostred Blinky = new ghostred(425, 400,Maze);
ghostpink Pinky = new ghostpink(450, 400, Maze);
ghostblue Inky = new ghostblue(475, 400, Maze);
ghostorange Clyde = new ghostorange(500, 400, Maze);

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
  pac.setup();
  Blinky.setup();
  Pinky.setup();
  Inky.setup();
  Clyde.setup();
}

  void draw(){
     if (copy[(pac.yPos-113)/27].charAt((pac.xPos-113)/27) == '.'){
       copy[(pac.yPos-113)/27] = copy[(pac.yPos-113)/27].substring(0, (pac.xPos-113)/27) + "_" + copy[(pac.yPos-113)/27].substring((pac.xPos-113)/27 +1);
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
      }
  }
  }
     fill(255,255,0);
     noStroke();
     pac.draw();
     Blinky.draw();
     Pinky.draw();
     Inky.draw();
     Clyde.draw();
  }
  
  void keyPressed(){
    pac.keyPressed();
  }
  