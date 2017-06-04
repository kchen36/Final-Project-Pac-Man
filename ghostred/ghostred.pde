int x = 0;
int c = color(255,0,0);
 
void setup() {
  size(200, 200);
  noStroke();
   
}
 
void draw() {
  fill(255,0,0);
  background(255);
   
  rect(25+x,35,5,45);
  rect(30+x,20,5,65);
  rect(35+x,15,5,70);
  rect(40+x,10,5,70);
  rect(45+x,10,5,65);
  rect(50+x,5,5,75);
  rect(55+x,5,5,80);
  rect(60+x,5,5,80);
  rect(65+x,5,5,75);
  rect(70+x,10,5,65);
  rect(75+x,10,5,70);
  rect(80+x,15,5,70);
  rect(85+x,20,5,65);
  rect(90+x,35,5,45);
   
  //left eye
  fill(255);
  rect(30+x, 25, 5, 15);
  rect(35+x, 20, 5, 25);
  rect(40+x, 20, 5, 25);
  rect(45+x, 25, 5, 15);
  //right eye
  rect(60+x, 25, 5, 15);
  rect(65+x, 20, 5, 25);
  rect(70+x, 20, 5, 25);
  rect(75+x, 25, 5, 15);
  //pupils
  fill(0, 0, 255);
  rect(30+x, 30, 10, 10);
  rect(60+x, 30, 10, 10);
}