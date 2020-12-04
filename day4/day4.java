import java.io.File;  
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Scanner;

public class day4 {
    public static void main(String[] args) {
        readFile();
        System.out.println(printArr());
    }

    public static ArrayList<String> path = new ArrayList<>();
    static void readFile(){

    try {
        File dict_file = new File("day4.txt");    	
        Scanner sc = new Scanner(dict_file);
        while (sc.hasNext()) {
          String line = sc.nextLine();
          path.add(line);
        }
        sc.close();
      } catch (FileNotFoundException e) {
        System.out.println("Invalid file");
        e.printStackTrace();
     }
}


 static int printArr(){
     
    int counter = 0;
    int final_counter = 0;
    for(String s: path){
         if(s.equals("")){
            if(counter >= 7)
            final_counter++;
            counter = 0;

         }
         
         
         if(s.contains("byr")) {
            try{
                int i = Integer.parseInt(s.substring(s.indexOf("byr")+ 4,s.indexOf("byr") +8));
                if(i >= 1920 && i <= 2002)
                counter++;

            }catch(Exception e){

            }
         } if(s.contains("iyr")){
            try{
                int i = Integer.parseInt(s.substring(s.indexOf("iyr")+ 4,s.indexOf("iyr") +8));
                if(i >= 2010 && i <= 2020)
                counter++;

            }catch(Exception e){

            }

         } if(s.contains("eyr")){
            try{
                int i = Integer.parseInt(s.substring(s.indexOf("eyr")+ 4,s.indexOf("eyr") +8));
                if(i >= 2020 && i <= 2030)
                counter++;

            }catch(Exception e){

            }

         } 
         if(s.contains("hgt")){
            if(s.contains("cm") && s.indexOf("cm") > s.indexOf("hgt")){
             int x = Integer.parseInt(s.substring(s.indexOf("hgt") + 4,s.indexOf("cm")));
             if(x >=150 && x<=193)
             counter++;
            }

            if(s.contains("in") && s.indexOf("in") > s.indexOf("hgt")){
                int x = Integer.parseInt(s.substring(s.indexOf("hgt") + 4,s.indexOf("in")));
                if(x >=59 && x<=76)
                counter++;
               }

         }if(s.contains("hcl")){

            if(s.charAt(s.indexOf("hcl") + 4) == '#'){
                if(s.indexOf("hcl") + 4 + 7 <= s.length()){
                    if(s.substring(s.indexOf("hcl") + 1 + 4,s.indexOf("hcl") + 4 + 7).matches("^[a-z0-9]*$"))
                        counter++;
                 }

            }

        } if(s.contains("ecl")){
            String str = s.substring(s.indexOf("ecl") + 4, s.indexOf("ecl") + 7);

            switch(str){
                case "amb":
                case "blu":
                case "brn":
                case "gry":
                case "grn":
                case "hzl":
                case "oth":
                    counter++;
                    break;
            }

        } if(s.contains("pid")){
            if(s.length() >=  s.indexOf("pid") + 4 + 9){
                try{
                    Integer.parseInt(s.substring(s.indexOf("pid") + 4, s.indexOf("pid") + 4 + 9));
                    counter++;
                }catch(Exception e){

                }
            }
        }  
     }
     return final_counter;
 }
}
