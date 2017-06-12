public class ghostblue{
  int x = 0;
  int y =0;
  int eyex = 0;
  int eyey = 0;
  int header = 1;
  MazeSolver a;
String [] maze2;
String[] maze;
PGraphics blue;
 public ghostblue(int xPos, int yPos, String[] m){
   x = xPos;
   y = yPos;
   maze = m;
   maze2 = m;
 }
 public void setv(int xPos, int yPos){
   x = xPos;
   y = yPos;
 }
 public void getpath(Location e){
   maze2 = maze;
   int d = Math.abs(e.getr() -y/27) + Math.abs(e.getc() - x/27); 
   Location s = new Location(y/27,x/27,null,0,d);
   a = new MazeSolver(maze2,e,s);
   a.solve();
   maze2 = a.ans();
 }
void setup() {
  blue = createGraphics(1000,1000);
}
   int direction = 0;
  void draw(int counter) {
    blue.beginDraw();
    blue.background(0);
    blue.clear();
    blue.noStroke();
    blue.fill(0, 225, 255);
       
    blue.rect(-6+x,-1+y,1,9);
    blue.rect(-5+x,-4+y,1,13);
    blue.rect(-4+x,-5+y,1,14);
    blue.rect(-3+x,-6+y,1,14);
    blue.rect(-2+x,-6+y,1,13);
    blue.rect(-1+x,-7+y,1,15);
    blue.rect(0+x,-7+y,1,16);
    blue.rect(1+x,-7+y,1,16);
    blue.rect(2+x,-7+y,1,15);
    blue.rect(3+x,-6+y,1,13);
    blue.rect(4+x,-6+y,1,14);
    blue.rect(5+x,-5+y,1,14);
    blue.rect(6+x,-4+y,1,13);
    blue.rect(7+x,-1+y,1,9);
       
    //left eye
    blue.fill(255);
    blue.rect(-5+x, -3+y, 1, 3);
    blue.rect(-4+x, -4+y, 1, 5);
    blue.rect(-3+x, -4+y, 1, 5);
    blue.rect(-2+x, -3+y, 1, 3);
    //right eye
    blue.rect(1+x, -3+y, 1, 3);
    blue.rect(2+x, -4+y, 1, 5);
    blue.rect(3+x, -4+y, 1, 5);
    blue.rect(4+x, -3+y, 1, 3);
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
    blue.fill(0, 0, 255);
    blue.rect(-4+ eyex +x, -2 + eyey + y, 2, 2);
    blue.rect(2 + eyex + x, -2 + eyey + y, 2, 2);
    if(counter >=1080){
    if(counter % 9 == 0){
    if(maze2[(y-113)/27 - 1].charAt((x-113)/27) == '@'){
      blue.fill(0);
      blue.rect(x - 6, y + 10, 14, 17);
      y -=3;
      direction = 1;
    }else if(maze2[(y-113)/27 + 1].charAt((x-113)/27) == '@'){
      blue.fill(0);
      blue.rect(x - 6, y - 23, 14, 17);
      y+= 3;
      direction = 3;
    }else if(maze2[(y-113)/27].charAt((x-113)/27 + 1) == '@'){
      blue.fill(0);
      blue.rect(x - 19, y - 7, 14, 17);
      x+= 3;
      direction = 0;
    }else if(maze2[(y-113)/27].charAt((x-113)/27 - 1) == '@'){
      blue.fill(0);
      blue.rect(x + 6, y - 7, 14, 17);
      x-= 3;
      direction = 2;
    }
    }
    else if (direction == 0){
      blue.fill(0);
      blue.rect(x - 19, y - 7, 14, 17);
      x+= 3;
    }
    else if(direction == 1){
     blue.fill(0);
      blue.rect(x - 6, y + 10, 14, 17);
      y -=3;
    }
    else if(direction == 2){
      blue.fill(0);
      blue.rect(x + 6, y - 7, 14, 17);
      x-= 3;
    }else if(direction == 3){
      blue.fill(0);
      blue.rect(x - 6, y - 23, 14, 17);
      y +=3;
    }}
    blue.endDraw();
    image(blue, 0, 0);
  }
}