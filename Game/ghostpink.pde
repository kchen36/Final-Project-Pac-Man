public class ghostpink{
  int x = 0;
  int y = 0;
  int eyex = 0;
  int eyey = 0;
  int header = 1;
  MazeSolver a;
String [] maze2;
String[] maze;
PGraphics pink;
 public ghostpink(int xPos, int yPos, String[] m){
   x = xPos;
   y = yPos;
   maze = m;
   maze2 = m;
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
  pink = createGraphics(1000, 1000);
}
 
  void draw() {
    pink.beginDraw();
    pink.background(0);
    pink.clear();
    pink.noStroke();
    pink.fill(255, 192, 203);
       
    pink.rect(-6+x,-1+y,1,9);
    pink.rect(-5+x,-4+y,1,13);
    pink.rect(-4+x,-5+y,1,14);
    pink.rect(-3+x,-6+y,1,14);
    pink.rect(-2+x,-6+y,1,13);
    pink.rect(-1+x,-7+y,1,15);
    pink.rect(0+x,-7+y,1,16);
    pink.rect(1+x,-7+y,1,16);
    pink.rect(2+x,-7+y,1,15);
    pink.rect(3+x,-6+y,1,13);
    pink.rect(4+x,-6+y,1,14);
    pink.rect(5+x,-5+y,1,14);
    pink.rect(6+x,-4+y,1,13);
    pink.rect(7+x,-1+y,1,9);
       
    //left eye
    pink.fill(255);
    pink.rect(-5+x, -3+y, 1, 3);
    pink.rect(-4+x, -4+y, 1, 5);
    pink.rect(-3+x, -4+y, 1, 5);
    pink.rect(-2+x, -3+y, 1, 3);
    //right eye
    pink.rect(1+x, -3+y, 1, 3);
    pink.rect(2+x, -4+y, 1, 5);
    pink.rect(3+x, -4+y, 1, 5);
    pink.rect(4+x, -3+y, 1, 3);
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
    pink.fill(0, 0, 255);
    pink.rect(-4+ eyex +x, -2 + eyey + y, 2, 2);
    pink.rect(2 + eyex + x, -2 + eyey + y, 2, 2);
    if(maze2[y/27 - 1].charAt(x/27) == '@'){
      y -=1;
    }else if(maze2[y/27 + 1].charAt(x/27) == '@'){
      y+= 1;
    }else if(maze2[y/27].charAt(x/27 + 1) == '@'){
      x+= 1;
    }else if(maze2[y/27].charAt(x/27 - 1) == '@'){
      y-= 1;
    }
    pink.endDraw();
    image(pink, 0, 0);
  }
}