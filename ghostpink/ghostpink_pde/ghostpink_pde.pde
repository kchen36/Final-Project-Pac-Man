  int x = 0;
  int eyex = 0;
  int eyey = 0;
  int header = 1;
   
  void setup() {
    size(200, 200);
    noStroke();
     
  }
     
  void draw() {
    fill(255, 192, 203);
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
    if(header == 0){
      eyex = 5;
      eyey = 0;
    }
    if(header == 1){
      eyex = 0;
      eyey = 5;
    }
    if(header == 2){
      eyex = -5;
      eyey = 0;
    }
    if(header == 3){
      eyex = 0;
      eyey = -5;
    }
    fill(0, 0, 255);
    rect(35+ eyex, 30 - eyey, 10, 10);
    rect(65 + eyex, 30 - eyey, 10, 10);
  }