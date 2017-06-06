void setup(){
  size (400,400);
  smooth();
  background(0);
  noStroke();
  fill(255,255,0);
  
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
int header = 0;
boolean b = true;
int val = 0;
int xPos = 200;
int yPos = 200; 
void draw(){
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
  background(0);
  if(header == 0){
    arc(xPos,yPos,25 ,25,PI * (20 - val)/80, PI + PI *(60 + val)/80);
    xPos = xPos + 1;
  }
  if(header == 1){
    arc(xPos,yPos,25 ,25, PI * (140 - val)/80, 2 * PI + PI *(100 + val)/80);
    yPos = yPos - 1;
  }
  if(header == 2){
    arc(xPos,yPos,25 ,25,PI * (20 - val)/80 - PI, PI *(60 + val)/80);
    xPos = xPos - 1;
  }
  if(header == 3){
    arc(xPos,yPos,25 ,25,PI * (60 - val)/80, 2 * PI + PI *(20 + val)/80);
    yPos = yPos + 1;
  }
}