public class Dot{
  int row;
  int col;

  public Dot(int r, int c){
    row = r;
    col = c;
    ellipse(row, col, 5, 5);
  }
  
  void setup(){
    ellipse(row, col, 5, 5);
  }
}