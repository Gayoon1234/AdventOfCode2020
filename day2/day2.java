import java.io.File;  
import java.io.FileNotFoundException;  
import java.util.Scanner;


public class day2 {
    

    public static void main(String[] args) {
      readFile();
    }

    static void readFile(){

        int counter1 = 0, counter2 = 0;
        try {
            File dict_file = new File("day2_passwords.txt");    	
            Scanner sc = new Scanner(dict_file);
            while (sc.hasNext()) {
              String password = sc.nextLine();

              if(validate(password))
                counter1++;
              if(validate(password,true))
                counter2++;
            }
            sc.close();
          } catch (FileNotFoundException e) {
            System.out.println("Invalid file");
            e.printStackTrace();
         }
    
         System.out.printf("Part 1: %d\nPart 2: %d", counter1, counter2);
    }

    static boolean validate(String s){
        return validate(s, false);
    }

    static boolean validate(String s, Boolean isPart2){
        int lowest = Integer.parseInt(s.substring(0,s.indexOf('-')));
        int highest = Integer.parseInt(s.substring(s.indexOf('-') + 1,s.indexOf(' ')));

       char c = s.charAt(s.indexOf(":") - 1);
       String testword = s.substring(s.indexOf(':') + 2);

       if(isPart2)
       return count2(testword, c, lowest, highest);
       else
       return count(testword, c, lowest, highest);

    }

    static boolean count(String s, char c, int low, int high){
        
        int counter = 0;
        
        for(char ch:s.toCharArray()){
            if(ch == c){
                counter++;
                if(counter > high)
                    return false;
            }
        }
        if(counter < low)
            return false;
        
        return true;
    }

    static boolean count2(String s, char c, int low, int high){
       return (s.charAt(low -1) == c && !(s.charAt(high -1 ) == c))
       || (!(s.charAt(low -1) == c) && (s.charAt(high - 1) == c));
        
    }
}
