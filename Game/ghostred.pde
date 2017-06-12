public class ghostred {
int x = 0;
int y = 0;
int eyex = 0;
int eyey = 0;
int c = color(255,0,0);
int header = 1;
MazeSolver a;
String[] maze2 = new String[31];
String[] maze;
PGraphics red;
 
 public ghostred(int xPos, int yPos, String[] m){
   x = xPos;
   y = yPos;
   maze = m;
 }
 
  
 public void getpath(Location e){
   for (int i = 0; i<31; i++){
     maze2[i] = maze[i];
   }
   int d = Math.abs(e.getr() -(y- 113)/27) + Math.abs(e.getc() - (x - 113)/27);
   Location s = new Location((y- 113)/27,(x - 113)/27,null,0,d);
   a = new MazeSolver(maze2,e,s);
   a.solve();
   maze2 = a.ans();
   /*for(int z = 0; z < 31; z++){
     System.out.println(maze2[z]);
   }
   System.out.println("\n");*/
 }
void setup() {
  red = createGraphics(1000,1000);
}
 int direction= 0;
void draw(int counter) {
  red.beginDraw();
  red.background(0);
  red.clear();
  red.noStroke();
  red.fill(255,0,0);
    red.rect(-6+x,-1+y,1,9);
    red.rect(-5+x,-4+y,1,13);
    red.rect(-4+x,-5+y,1,14);
    red.rect(-3+x,-6+y,1,14);
    red.rect(-2+x,-6+y,1,13);
    red.rect(-1+x,-7+y,1,15);
    red.rect(0+x,-7+y,1,16);
    red.rect(1+x,-7+y,1,16);
    red.rect(2+x,-7+y,1,15);
    red.rect(3+x,-6+y,1,13);
    red.rect(4+x,-6+y,1,14);
    red.rect(5+x,-5+y,1,14);
    red.rect(6+x,-4+y,1,13);
    red.rect(7+x,-1+y,1,9);
       
    //left eye
    red.fill(255);
    red.rect(-5+x, -3+y, 1, 3);
    red.rect(-4+x, -4+y, 1, 5);
    red.rect(-3+x, -4+y, 1, 5);
    red.rect(-2+x, -3+y, 1, 3);
    //right eye
    red.rect(1+x, -3+y, 1, 3);
    red.rect(2+x, -4+y, 1, 5);
    red.rect(3+x, -4+y, 1, 5);
    red.rect(4+x, -3+y, 1, 3);
    //pupils
    if(header == 0){
      eyex = 1;
      eyey = 0;
    }
    if(header == 1){
      eyex = 0;
      eyey = -1;
    }
    if(header == 2){
      eyex = -1;
      eyey = 0;
    }
    if(header == 3){
      eyex = 0;
      eyey = 1;
    }
    red.fill(0, 0, 255);
    red.rect(-4+ eyex +x, -2 + eyey + y, 2, 2);
    red.rect(2 + eyex + x, -2 + eyey + y, 2, 2);
<<<<<<< HEAD
    if(counter % 9 == 0){
    if(maze2[(y-113)/27 - 1].charAt((x-113)/27) == '@'){
      red.fill(0);
      red.rect(x - 6, y + 10, 14, 17);
      y -=3;
      direction = 1;
    }else if(maze2[(y-113)/27 + 1].charAt((x-113)/27) == '@'){
      red.fill(0);
      red.rect(x - 6, y - 23, 14, 17);
      y+= 3;
      direction = 3;
    }else if(maze2[(y-113)/27].charAt((x-113)/27 + 1) == '@'){
      red.fill(0);
      red.rect(x - 19, y - 7, 14, 17);
      x+= 3;
      direction = 0;
    }else if(maze2[(y-113)/27].charAt((x-113)/27 - 1) == '@'){
      red.fill(0);
      red.rect(x + 6, y - 7, 14, 17);
      x-= 3;
      direction = 2;
    }
    }
    else if (direction == 0){
      red.fill(0);
      red.rect(x - 19, y - 7, 14, 17);
      x+= 3;
    }
    else if(direction == 1){
      red.fill(0);
      red.rect(x - 6, y + 10, 14, 17);
      y -=3;
    }
    else if(direction == 2){
      red.fill(0);
      red.rect(x + 6, y - 7, 14, 17);
      x-= 3;
    }else if(direction == 3){
      red.fill(0);
      red.rect(x - 6, y - 23, 14, 17);
      y +=3;
    }
    red.endDraw();
    image(red, 0, 0);
  }
}
