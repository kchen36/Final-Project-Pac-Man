public class Wall{
  int row;
  int col;

  public Wall(int r, int c){
    row = r;
    col = c;
    rect(row, col, 26, 26);
  }
  
  void setup(){
    rect(row, col, 50, 50);
  }
}