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
       
    orange.rect(25/5+x,35/5+y,5/5,45/5);
    orange.rect(30/5+x,20/5+y,5/5,65/5);
    orange.rect(35/5+x,15/5+y,5/5,70/5);
    orange.rect(40/5+x,10/5+y,5,70/5);
    orange.rect(45/5+x,10/5+y,5/5,65/5);
    orange.rect(50/5+x,5/5+y,5/5,75/5);
    orange.rect(55/5+x,5/5+y,5/5,80/5);
    orange.rect(60/5+x,5/5+y,5/5,80/5);
    orange.rect(65/5+x,5/5+y,5/5,75/5);
    orange.rect(70/5+x,10/5+y,5/5,65/5);
    orange.rect(75/5+x,10/5+y,5/5,70/5);
    orange.rect(80/5+x,15/5+y,5/5,70/5);
    orange.rect(85/5+x,20/5+y,5/5,65/5);
    orange.rect(90/5+x,35/5+y,5/5,45/5);
       
    //left eye
    orange.fill(255);
    orange.rect(30/5+x, 25/5+y, 5/5, 15/5);
    orange.rect(35/5+x, 20/5+y, 5/5, 25/5);
    orange.rect(40/5+x, 20/5+y, 5/5, 25/5);
    orange.rect(45/5+x, 25/5+y, 5/5, 15/5);
    //right eye
    orange.rect(60/5+x, 25/5+y, 5/5, 15/5);
    orange.rect(65/5+x, 20/5+y, 5/5, 25/5);
    orange.rect(70/5+x, 20/5+y, 5/5, 25/5);
    orange.rect(75/5+x, 25/5+y, 5/5, 15/5);
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
    orange.rect(35/5+ eyex +x, 30/5 + eyey + y, 10/5, 10/5);
    orange.rect(65/5 + eyex + x, 30/5 + eyey + y, 10/5, 10/5);
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