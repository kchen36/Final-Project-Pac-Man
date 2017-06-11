public class pacman{

  
int header = 0;
boolean b = true;
int val = 0;
int xPos = 200;
int yPos = 200;
PGraphics pacLayer;
  
  
  
  pacman(int x, int y){
     xPos = x;
     yPos = y;
  }

void setup(){
  pacLayer = createGraphics(1000, 1000);
  pacLayer.beginDraw();
  pacLayer.smooth();
  pacLayer.background(0);
  pacLayer.stroke(0);
  pacLayer.fill(255,255,0);
  pacLayer.endDraw();
  
}

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      header = 1;
    } else if (keyCode == DOWN) {
      header = 3;
    } else if(keyCode == RIGHT) {
      header = 0;
    } else if(keyCode == LEFT) {
      header = 2;
    }
  }
}
 


 void draw(){
  pacLayer.beginDraw();
  pacLayer.background(0);
  pacLayer.clear();
  if(b){
    val += 1;
    if(val == 20){
      b= false;
    }
  }
  else{
    val -= 1;
    if(val == 0){
      b = true;
    }
  }
  if(header == 0){
    pacLayer.fill(0);
    pacLayer.arc(xPos - 1,yPos,25 ,25,PI * (20 - val)/80, PI + PI *(60 + val)/80);
    pacLayer.fill(255,255,0);
    pacLayer.arc(xPos,yPos,25 ,25,PI * (20 - val)/80, PI + PI *(60 + val)/80);
    xPos = xPos + 1;
  }
  if(header == 1){
    pacLayer.fill(0);
    pacLayer.arc(xPos,yPos + 1,25 ,25, PI * (140 - val)/80, 2 * PI + PI *(100 + val)/80);
    pacLayer.fill(255,255,0);
    pacLayer.arc(xPos,yPos,25 ,25, PI * (140 - val)/80, 2 * PI + PI *(100 + val)/80);
    yPos = yPos - 1;
  }
  if(header == 2){
    pacLayer.fill(0);
    pacLayer.arc(xPos + 1,yPos,25 ,25,PI * (20 - val)/80 - PI, PI *(60 + val)/80);
    pacLayer.fill(255,255,0);
    pacLayer.arc(xPos,yPos,25 ,25,PI * (20 - val)/80 - PI, PI *(60 + val)/80);
    xPos = xPos - 1;
  }
  if(header == 3){
    pacLayer.fill(0);
    pacLayer.arc(xPos,yPos - 1,25 ,25,PI * (60 - val)/80, 2 * PI + PI *(20 + val)/80);
    pacLayer.fill(255,255,0);
    pacLayer.arc(xPos,yPos,25 ,25,PI * (60 - val)/80, 2 * PI + PI *(20 + val)/80);
    yPos = yPos + 1;
  }
  pacLayer.endDraw();
  image(pacLayer, 0, 0);
}
}