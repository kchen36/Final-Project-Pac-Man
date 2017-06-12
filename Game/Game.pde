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
                   "#     .   #      #   .     #",
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
                   
String[] copy =   {"############################",
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
                   "#     .   #      #   .     #",
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
int ppeaten;
int eaten;
int score = 0;

pacman pac = new pacman(500, 735,Maze);
ghostred Blinky = new ghostred(410, 410,Maze);
ghostpink Pinky = new ghostpink(450, 491, Maze);
ghostblue Inky = new ghostblue(477, 491, Maze);
ghostorange Clyde = new ghostorange(504, 491, Maze);

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
 int counter =0;
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

     
       Location e = new Location((pac.yPos-113)/27,(pac.xPos-113)/27,null,0,0);
       if (counter % 9 == 0){
       Blinky.getpath(e);
       }
     

     Blinky.draw(counter);
     Pinky.draw();
     Inky.draw();
     Clyde.draw();
     counter ++;
     score = (eaten * 10) + (ppeaten * 50);
     fill(255);
     textSize(32);
     text("Score:" + Integer.toString(score), 600, 80);
     if ((Math.abs(((pac.xPos - 113) / 27) - ((Blinky.x - 113) / 27))) == 1 && (Math.abs(((pac.yPos - 113) / 27) - ((Blinky.y - 113) / 27))) == 1){
       GameOver();
       noLoop();
     }
  }
  
  void GameOver(){
    background(0);
    fill(255);
    textSize(100);
    text("GAME OVER!!!", 200, 300);
    text("Your Final Score Was:" + Integer.toString(score), 0, 500);
    text(Integer.toString(score), 450, 700);
  }
  
  void keyPressed(){
    pac.keyPressed();
  }
  