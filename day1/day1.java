import java.io.File;  
import java.io.FileNotFoundException;  
import java.util.ArrayList;
import java.util.Scanner; 

public class day1{

static ArrayList<Integer> numberlist = new ArrayList<>();
 public static void main(String[] args) {
     readFile();
    find_2020(); //part1
    find_2020_3(); //part2
   // find_2020_noob();
 }   

 static void readFile(){
    //int ttal = 0;
    try {
        File file = new File("./day1_numbers.txt");    	
        Scanner sc = new Scanner(file);
        while (sc.hasNextInt()) {
          int number = sc.nextInt();
          numberlist.add(number);
        }
        sc.close();
      } catch (FileNotFoundException e) {
        System.out.println("Invalid file");
        e.printStackTrace();
     }
}

static void find_2020(){
    for(int i:numberlist){
        for(int j:numberlist){
            if(i + j == 2020){
                System.out.println(i*j);
            }
        }
    }
}

static void find_2020_3(){
    for(int i = 0; i<numberlist.size();i++){
        for(int j = i + 1; j<numberlist.size(); j++){
            for(int k = j + 1; k<numberlist.size();k++){
                if(numberlist.get(i) + numberlist.get(j) + numberlist.get(k) == 2020)
                    System.out.println(numberlist.get(i) * numberlist.get(j) * numberlist.get(k));
            }
        }
    }
}

 //This is the same as find_2020_3() but less efficient
static void find_2020_noob(){
    for(int i : numberlist)
        for(int j:numberlist)
            for(int k:numberlist)
                if(i+j+k == 2020){
                    System.out.println(i*j*k);
                return;
                }
    }
}
