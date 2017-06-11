public class ghostblue{
  int x = 0;
  int y =0;
  int eyex = 0;
  int eyey = 0;
  int header = 1;
  MazeSolver a;
String [] maze2;
String[] maze;
 public ghostblue(int xPos, int yPos, String[] m){
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
  size(200, 200);
  noStroke();
}
   
  void draw() {
    fill(0, 225, 255);
    background(255);
       
    rect(25/5+x,35/5+y,5/5,45/5);
    rect(30/5+x,20/5+y,5/5,65/5);
    rect(35/5+x,15/5+y,5/5,70/5);
    rect(40/5+x,10/5-+y,5,70/5);
    rect(45/5+x,10/5+y,5/5,65/5);
    rect(50/5+x,5/5+y,5/5,75/5);
    rect(55/5+x,5/5+y,5/5,80/5);
    rect(60/5+x,5/5+y,5/5,80/5);
    rect(65/5+x,5/5+y,5/5,75/5);
    rect(70/5+x,10/5+y,5/5,65/5);
    rect(75/5+x,10/5+y,5/5,70/5);
    rect(80/5+x,15/5+y,5/5,70/5);
    rect(85/5+x,20/5+y,5/5,65/5);
    rect(90/5+x,35/5+y,5/5,45/5);
       
    //left eye
    fill(255);
    rect(30/5+x, 25/5-y, 5/5, 15/5);
    rect(35/5+x, 20/5-y, 5/5, 25/5);
    rect(40/5+x, 20/5-y, 5/5, 25/5);
    rect(45/5+x, 25/5-y, 5/5, 15/5);
    //right eye
    rect(60/5+x, 25/5-y, 5/5, 15/5);
    rect(65/5+x, 20/5-y, 5/5, 25/5);
    rect(70/5+x, 20/5-y, 5/5, 25/5);
    rect(75/5+x, 25/5-y, 5/5, 15/5);
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
    fill(0, 0, 255);
    rect(35/5+ eyex +x, 30/5 + eyey + y, 10/5, 10/5);
    rect(65/5 + eyex + x, 30/5 + eyey + y, 10/5, 10/5);
    if(maze2[y/27 - 1].charAt(x/27) == '@'){
      y -=1;
    }else if(maze2[y/27 + 1].charAt(x/27) == '@'){
      y+= 1;
    }else if(maze2[y/27].charAt(x/27 + 1) == '@'){
      x+= 1;
    }else if(maze2[y/27].charAt(x/27 - 1) == '@'){
      y-= 1;
    }
  }
}