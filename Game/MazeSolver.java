import java.io.*;
import java.io.FileNotFoundException;
import java.util.*;


public class MazeSolver{
    private String[] board;

    FrontierPriorityQueue f;
    private int row, col;
    Location e;
    Location start;
    private boolean astar;

    public MazeSolver(String[] b, Location end, Location s){
	board = b;
	e = end;
	start = s;
	row = b.length;
	col = b[0].length();
    }
    public void solve(){
       f = new FrontierPriorityQueue();
       f.add(start);
	go();
	
    }
    private void set(int r, int c, char a){
	String s = board[r];
	board[r] = s.substring(0,c) + a + s.substring(c + 1);
    }
    private boolean inBound(int r, int c){
	if(r >= 1 && c >= 1 && r < row - 1 && c < col - 1){
	    return board[r].charAt(c) == '.' || board[r].charAt(c) =='*' || board[r].charAt(c) ==' ';
	}
	return false;
    }
    public String toString(){
	String ans = "";
	for(int x = 0; x < board.length; x ++){
	    for(int y = 0; x < board[x].length();y ++){
		ans += board[x].charAt(y);
	    }
	    ans+= "\n";
	}
	return ans;
    }
    private void go(){
	int er = e.getr();
	int ec = e.getc();
	while(f.getSize() != 0){
	    Location l = f.next();
	    int r = l.getr();
	    int c = l.getc();
	    set(r,c,'-');
	    if(inBound(r - 1, c)){
		if(r - 1 == er && c == ec){
		    set(r - 1,c,'@');
		    back(l);
		    break;
		}
		else {
		    int d = Math.abs(er - (r - 1)) + Math.abs(ec - c);
		    set(r - 1,c,'?');
		    Location n = new Location(r - 1,c,l,l.gets() + 1, d);
		    f.add(n);
		}
	    }
	    if(inBound(r, c - 1)){
		if(r == er && c - 1 == ec){
		    set(r,c - 1,'@');
		    back(l);
		    break;
		}
		else {
		    int d = Math.abs(er - r) + Math.abs(ec - (c - 1));
		    set(r,c - 1,'?');
		    Location n = new Location(r,c - 1,l,l.gets() + 1, d);
		    f.add(n);
		}
	    }
	    if(inBound(r + 1, c)){
		if(r + 1 == er && c == ec){
		    set(r + 1,c,'@');
		    back(l);
		    break;
		}
		else {
		    int d = Math.abs(er - (r + 1)) + Math.abs(ec - c);
		    set(r + 1,c,'?');
		    Location n = new Location(r + 1,c,l,l.gets() + 1, d);
		    f.add(n);
		}
	    }
	    if(inBound(r, c + 1)){
		if(r == er && c + 1 == ec){
		    set(r,c + 1,'@');
		    back(l);
		    break;
		}
		else {
		    int d = Math.abs(er - r) + Math.abs(ec - (c + 1));
		    set(r,c + 1,'?');
		    Location n = new Location(r,c + 1,l,l.gets() + 1, d);
		    f.add(n);
		}
	    }
	} 
    }
    private void back(Location l){
	if(l.prev() != null){
	    set(l.getr(),l.getc(),'@');
	    back(l.prev());
	}

    }
}