import java.util.*;
public class Location implements Comparable<Location>{
    private int row,col;
    private int distToStart;
    private int distToGoal;
    private Location previous;
    public Location(int r,int c, Location prev, int start, int goal){
	row = r;
	col = c;
	previous = prev;
	distToStart = start;
	distToGoal = goal;
    }
    public int getr(){
	return row;
    } 
    public int getc(){
	return col;
    }
    public int getg(){
	return distToGoal;
    }
    public int gets(){
	return distToStart;
    }
    public Location prev(){
	return previous;
    }
    public int compareTo(Location other){
	    Integer a = new Integer(distToGoal + distToStart);
	    Integer b = new Integer(other.getg() + other.gets());
	    return a.compareTo(b);
    }
}
