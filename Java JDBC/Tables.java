import java.util.*;
import java.io.*;


   
public class Tables {
    public String tableName = "";
    public String body = "";
    public ArrayList<String> attributes = new ArrayList<String>();
    public Scanner scan = new Scanner(System.in);
    public boolean manualEntry = false;

    //Constructor to manually input information
    public Tables(String tableName) {
        int i = 1;
        manualEntry = true;
        this.tableName = tableName;
        
        System.out.print("\nSpecify number of attributes for " + tableName + ": ");
        int num = scan.nextInt();
        while (i <= num) {
            
                System.out.print("Enter name of attribute " + i + "/" + num + " for " + tableName + ": ");
                String input1 = scan.next();
                System.out.print("Enter type of attribute " + i + "/" + num + " for " + tableName + ": ");
                String input2 = scan.next();
                scan.nextLine();
                System.out.print("Enter attribute " + i + "/" + num + " behavior for " + tableName + ": ");
                String input3 = scan.nextLine();
                if(i < num)
                    attributes.add(input1 + " " + input2.toUpperCase() + " " + input3.toUpperCase() + ", ");
                else if (i == num)
                    attributes.add(input1 + " " + input2.toUpperCase() + " " + input3.toUpperCase());
                 i++; 
            } 
        }

    //Automatic constructor, preloaded info
    public Tables(String tableName, String body){
        this.tableName = tableName;
        this.body = body;
    }
    
    public String getTable(){
        String sql = "";
        sql = "CREATE TABLE " + tableName + " (";
        if (manualEntry){
            for (String attr : attributes) {
                sql = sql + attr;
            }
            sql = sql + ")";
            return sql;
        }
        sql = sql + body + ")";
        return sql;
    }

    public String dropTable() {
        return "DROP TABLE " + tableName;
    }


}
