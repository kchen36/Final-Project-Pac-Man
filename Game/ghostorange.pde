public class ghostorange{
  int x = 0;
  int y = 0;
  int eyex = 0;
  int eyey = 0;
  int header = 1;
  MazeSolver a;
String [] maze2;
String[] maze;
PGraphics orange;
 public ghostorange(int xPos, int yPos, String[] m){
   x = xPos;
   y = yPos;
   maze = m;
   maze2 = m;
 }
 public void getpath(Location e){
   maze2 = maze;
   int d = Math.abs(e.getr() -(y-113)/27) + Math.abs(e.getc() - (x-113)/27);
   if(d < 8){
      d = Math.abs(30 -(y-113)/27) + Math.abs(27 - (x-113)/27);
     Location s = new Location((y-113)/27,(x-113)/27,null,0,d);
     Location end = new Location (30,27,null,0,0);
     a = new MazeSolver(maze2,end,s);
   }else{
     Location s = new Location((y-113)/27,(x-113)/27,null,0,d);
     a = new MazeSolver(maze2,e,s);
   }
   a.solve();
   maze2 = a.ans();
 }
void setup() {
  orange = createGraphics(1000, 1000);
}
 
  void draw() {
    orange.beginDraw();
    orange.background(0);
    orange.clear();
    orange.noStroke();
    orange.fill(255, 165, 0);
       
    orange.rect(-6+x,-1+y,1,9);
    orange.rect(-5+x,-4+y,1,13);
    orange.rect(-4+x,-5+y,1,14);
    orange.rect(-3+x,-6+y,1,14);
    orange.rect(-2+x,-6+y,1,13);
    orange.rect(-1+x,-7+y,1,15);
    orange.rect(0+x,-7+y,1,16);
    orange.rect(1+x,-7+y,1,16);
    orange.rect(2+x,-7+y,1,15);
    orange.rect(3+x,-6+y,1,13);
    orange.rect(4+x,-6+y,1,14);
    orange.rect(5+x,-5+y,1,14);
    orange.rect(6+x,-4+y,1,13);
    orange.rect(7+x,-1+y,1,9);
       
    //left eye
    orange.fill(255);
    orange.rect(-5+x, -3+y, 1, 3);
    orange.rect(-4+x, -4+y, 1, 5);
    orange.rect(-3+x, -4+y, 1, 5);
    orange.rect(-2+x, -3+y, 1, 3);
    //right eye
    orange.rect(1+x, -3+y, 1, 3);
    orange.rect(2+x, -4+y, 1, 5);
    orange.rect(3+x, -4+y, 1, 5);
    orange.rect(4+x, -3+y, 1, 3);
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
    orange.fill(0, 0, 255);
    orange.rect(-4+ eyex +x, -2 + eyey + y, 2, 2);
    orange.rect(2 + eyex + x, -2 + eyey + y, 2, 2);
    if(maze2[(y-113)/27 - 1].charAt((x-113)/27) == '@'){
      y -=1;
    }else if(maze2[(y-113)/27 + 1].charAt((x-113)/27) == '@'){
      y+= 1;
    }else if(maze2[(y-113)/27].charAt((x-113)/27 + 1) == '@'){
      x+= 1;
    }else if(maze2[(y-113)/27].charAt((x-113)/27 - 1) == '@'){
      y-= 1;
    }
    orange.endDraw();
    image(orange, 0, 0);
  }
}