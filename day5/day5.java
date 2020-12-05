import java.io.File;  
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Scanner;

public class day5 {

    public static void main(String[] args) {
    readFile();
      int max = 0, min = 999999;
      ArrayList<Integer> IDs = new ArrayList<>();
      for(String s: data){
          int ID = getRow(s)*8 + getCol(s); 
          if(ID > max)
            max = ID;
          if(min > ID)
            min = ID;
          IDs.add(ID);
      }

      System.out.println(String.format("min: %d, max: %d (also the answer to part 1)", min,max));
      for(int i = min; i<max;i++){
          if(!IDs.contains(i)){
            System.out.println("Part 2 answer:" + i);
            break;
          }
      }
    }
    public static ArrayList<String> data = new ArrayList<>();

    static void readFile(){

        try {
            File file = new File("day5.txt");    	
            Scanner sc = new Scanner(file);
            while (sc.hasNext()) {
              String line = sc.nextLine();
              data.add(line);
            }
            sc.close();
          } catch (FileNotFoundException e) {
            System.out.println("Invalid file");
            e.printStackTrace();
         }
    }

    static int getRow(String s){
        int max = 127, min = 0;
        
        for(int i = 0; i<7;i++){
            int diff = (max - min)/2 + 1; 
            if(s.charAt(i) == 'F') 
                max -= diff;
            else
                min += diff;
        }

    return max;
    }

    static int getCol(String s){
        int start = 0, end = 7;

        for(int i = 7; i<10;i++){
            int diff = (end - start)/2 + 1; 
            if(s.charAt(i) == 'L') 
                end -= diff;
            else
                start += diff;
        }
        return start;
    }
}
