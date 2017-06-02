void setup(){
  size (400,400);
  smooth();
  background(0);
  noStroke();
  fill(0,255,0);
}
boolean b = true;
int val = 0
void draw(){
  if(b){
    val += 1;
    if(b == 10){
      b= false;
    }
  }
  else{
    b -= 1;
    if( b == 0){
    	b = true;
    }
  }
  arc(50,50,25,25,PI * (10 - val)/80, PI + PI *(70 + val)/80);
}