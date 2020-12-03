import java.io.File;  
import java.io.FileNotFoundException;
import java.util.ArrayList;
import java.util.Scanner;


public class day3 {

public static void main(String[] args) {
    readFile();
    System.out.println(checkPath(1,1)*checkPath(3,1)*checkPath(5,1)*checkPath(7,1)*checkPath(1,2));
}

public static ArrayList<String> path = new ArrayList<>();
static void readFile(){

    try {
        File dict_file = new File("day3PATH.txt");    	
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

static int checkPath(int h, int v ){
    int j = 0;
    int trees = 0;
    for(int i = 0; i<path.size();i += v){
        if(path.get(i).charAt(j%path.get(i).length()) == '#'){
            trees ++;
        }
        j += h;
    }
   return trees;
}



    
}
