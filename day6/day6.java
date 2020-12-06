import java.io.File;
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.Scanner;

public class day6 {

    public static void main(String[] args) {
        readFile();
        countLetters();
        countLetters2();
    }


    public static HashMap<Integer, ArrayList<String>> groups = new HashMap<>();  
    static void readFile(){

    try {
        File file = new File("day6.txt");    	
        Scanner sc = new Scanner(file);
        int i = 0;
        while (sc.hasNext()) {
          String line = sc.nextLine();
          if(line.equals(""))
            i++;
        
            if(groups.containsKey(i))
                groups.get(i).add(line);
            else
                groups.put(i,new ArrayList<>(Arrays.asList(line)));         
            
        }
        sc.close();
      } catch (FileNotFoundException e) {
        System.out.println("Invalid file");
        e.printStackTrace();
     }

    }

    static void countLetters(){
        int count = 0;

        for(int i = 0; i< groups.size();i++){
            ArrayList<String> group = new ArrayList<>(groups.get(i));
            HashSet<Character> hashSet = new HashSet<>();

            for(String s: group){
                for(char c:s.toCharArray()){
                    hashSet.add(c);
                }
            }

            count+=hashSet.size();

        }
        System.out.println(count);
    }

    static void countLetters2(){
        int count = 0;

        for(int i = 0; i< groups.size();i++){
            ArrayList<String> group = new ArrayList<>(groups.get(i));

            HashMap<Character,Integer> counts = new HashMap<>();
            for(String s: group){
                for(char c:s.toCharArray()){
                    if(counts.containsKey(c))
                        counts.put(c, counts.get(c) + 1);
                    else
                        counts.put(c,1);

                }
            }
   
            for(int j: counts.values()){
                if(j >= group.size() - 1) count++;
            }
        }
        System.out.println(count);
    }
}