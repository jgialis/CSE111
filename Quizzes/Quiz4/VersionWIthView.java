// STEP: Import required packages
import java.sql.*;
import java.util.*;


import java.io.FileWriter;
import java.io.FileReader;
import java.io.BufferedReader;
import java.io.PrintWriter;
import java.io.File;

public class Quiz_4 {
    private Connection c = null;
    private String dbName;
    private boolean isConnected = false;
    private ArrayList<String> makers = new ArrayList<String>();
    private ArrayList<String> types = new ArrayList<String>();


    //Default constructor to populatr Array lists...
    public Quiz_4(){
        makers.add("A");
        makers.add("B");
        makers.add("C");
        makers.add("D");
        makers.add("E");
        makers.add("F");
        makers.add("G");
        makers.add("H");
    }
    private void openConnection(String _dbName) {
        dbName = _dbName;

        if (false == isConnected) {
            System.out.println("++++++++++++++++++++++++++++++++++");
            System.out.println("Open database: " + _dbName);

            try {
                String connStr = new String("jdbc:sqlite:");
                connStr = connStr + _dbName;

                // STEP: Register JDBC driver
                Class.forName("org.sqlite.JDBC");

                // STEP: Open a connection
                c = DriverManager.getConnection(connStr);

                // STEP: Diable auto transactions
                c.setAutoCommit(false);

                isConnected = true;
                System.out.println("success");
            } catch (Exception e) {
                System.err.println(e.getClass().getName() + ": " + e.getMessage());
                System.exit(0);
            }

            System.out.println("++++++++++++++++++++++++++++++++++");
        }
    }


    private void createTable() {
                System.out.println("++++++++++++++++++++++++++++++++++");
                System.out.println("Create table");
                try {
                    Statement stmt = c.createStatement();
        
                    // STEP: Execute update statement
                    String sql = "CREATE TABLE PriceRange ( " +
                                    "maker char(32)," +
                                    "type varchar(20)," +
                                    "minPrice decimal(7,2)," +
                                    "maxPrice decimal(7,2));";
        
                    stmt.execute(sql);
                    c.commit();
                    stmt.close();
                    System.out.println("success");
                }
                    catch (Exception e) {
                        System.err.println(e.getClass().getName() + ": " + e.getMessage());
                        try {
                            c.rollback();
                        } catch (Exception e1) {
                            System.err.println(e1.getClass().getName() + ": " + e1.getMessage());
                        }
                    }
                System.out.println("++++++++++++++++++++++++++++++++++");
            }
    private void dropTable() {
        System.out.println("++++++++++++++++++++++++++++++++++");
        System.out.println("Drop tables");

        try {
            Statement stmt = c.createStatement();

            // STEP: Execute update statement
            String sql = "DROP TABLE PriceRange;";
            stmt.execute(sql);

            // sql = "DROP TABLE Laptop;";
            // stmt.execute(sql);
            // sql = "DROP TABLE PC;";
            // stmt.execute(sql);
            // sql = "DROP TABLE Printer;";
            // stmt.execute(sql);
            // sql = "DROP TABLE Product;";
            // stmt.execute(sql);
            // STEP: Commit transaction
            c.commit();

            stmt.close();
            System.out.println("success");
        } catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
            try {
                c.rollback();
            } catch (Exception e1) {
                System.err.println(e1.getClass().getName() + ": " + e1.getMessage());
            }
        }

        System.out.println("++++++++++++++++++++++++++++++++++");
    }

    private void closeConnection() {
        if (true == isConnected) {
            System.out.println("++++++++++++++++++++++++++++++++++");
            System.out.println("Close database: " + dbName);

            try {
                // STEP: Close connection
                c.close();

                isConnected = false;
                dbName = "";
                System.out.println("success");
            } catch (Exception e) {
                System.err.println(e.getClass().getName() + ": " + e.getMessage());
                System.exit(0);
            }

            System.out.println("++++++++++++++++++++++++++++++++++");
        }
    }


    public void insertPriceRange(String maker, String type, int minPrice, int maxPrice){
        try {
            String sql = "INSERT INTO PriceRange(maker, type, minPrice, maxPrice) " +
                "VALUES(?, ?, ?, ?)";
            PreparedStatement stmt = c.prepareStatement(sql);

            stmt.setString(1, maker);
            stmt.setString(2, type);
            stmt.setInt(3, minPrice);
            stmt.setInt(4, maxPrice);

            // STEP: Execute batch
            stmt.executeUpdate();

            // STEP: Commit transaction
            c.commit();

            stmt.close();
        } catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
            try {
                c.rollback();
            } catch (Exception e1) {
                System.err.println(e1.getClass().getName() + ": " + e1.getMessage());
            }
        }
    }
    private void populatePriceRange() {
        System.out.println("++++++++++++++++++++++++++++++++++");
        System.out.println("Populate PriceRange");

        
            
   
        try (Statement stmt = c.createStatement()) {
            String sql = "SELECT * FROM master;";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
         if(rs.getInt(3) != 0){
            insertPriceRange(rs.getString(1), rs.getString(2), rs.getInt(3), rs.getInt(4));
         }
                    
                }
            }
         catch (SQLException e) {
            
          }
    
        

        System.out.println("++++++++++++++++++++++++++++++++++");
    }














    private void printPriceRange() {
        System.out.println("\n\n\n+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++");
        System.out.println("Print PriceRange");
        try {
            System.out.printf("%-10s %-20s %20s %20s\n","maker", "product", "minPrice", "maxPrice");
            System.out.println("-------------------------------------------------------------------------");
            
            String sql = "SELECT * FROM master;";

            PreparedStatement stmt = c.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            while (rs.next()) {
                if(rs.getInt(3) != 0){
                    System.out.printf("%-10s %-20s %20s %20s\n",rs.getString(1), rs.getString(2), rs.getInt(3), rs.getInt(4));
                }
            }
                
            
            rs.close();
            stmt.close();
        } catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
        }
            System.out.println("+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++\n\n\n");
        }






































    private void insertPC(String _maker, int _model, double _speed,
        int _ram, int _hd, int _price) {
        System.out.println("++++++++++++++++++++++++++++++++++");
        System.out.printf("Insert PC (%s, %d, %f, %d, %d, %d)\n",
            _maker, _model, _speed, _ram, _hd, _price);

            try {
                String sql = "INSERT INTO PC(model, speed, ram, hd, price) " +
                    "VALUES(?, ?, ?, ?, ?);";
                PreparedStatement stmt = c.prepareStatement(sql);
        

                stmt.setInt(1, _model);
                stmt.setDouble(2, _speed);
                stmt.setInt(3, _ram);
                stmt.setInt(4, _hd);
                stmt.setInt(5, _price);
    
                stmt.executeUpdate();

                sql = "INSERT INTO Product(maker, model, type) " +
                    "VALUES(?, ?, ?);";
                stmt = c.prepareStatement(sql);
        
                String _type = "pc";
                stmt.setString(1, _maker);
                stmt.setInt(2, _model);
                stmt.setString(3, _type);
           
    
                stmt.executeUpdate();

                c.commit();
                stmt.close();
                
            } catch (Exception e) {
                System.err.println(e.getClass().getName() + ": " + e.getMessage());
                try {
                    c.rollback();
                } catch (Exception e1) {
                    System.err.println(e1.getClass().getName() + ": " + e1.getMessage());
                }
            }
        System.out.println("++++++++++++++++++++++++++++++++++");
    }





































    private void updatePrinter(int _model, int _price) {
        System.out.println("++++++++++++++++++++++++++++++++++");
        System.out.printf("Update Printer (%d, %d)\n", _model, _price);

        System.out.println("++++++++++++++++++++++++++++++++++");
    }









    private void deleteLaptop(int _model) {
        System.out.println("++++++++++++++++++++++++++++++++++");
        System.out.printf("Delete Laptop (%d)\n", _model);

        System.out.println("++++++++++++++++++++++++++++++++++");
    }


    public static void main(String args[]) {
        Quiz_4 sj = new Quiz_4();
        
        sj.openConnection("data.sqlite");
        sj.dropTable();
        sj.createTable();
        sj.populatePriceRange();
        sj.printPriceRange();

        try {
            File fn = new File("input.in");
            FileReader reader = new FileReader(fn);
            BufferedReader in = new BufferedReader(reader);

            String line = null;
            while ((line = in.readLine()) != null) {
                System.out.println(line);

                String[] tok = line.split("[ ]");
                if (tok[0].equals(new String("I"))) {
                    sj.insertPC(tok[2], Integer.parseInt(tok[3]),
                        Double.parseDouble(tok[4]), Integer.parseInt(tok[5]),
                        Integer.parseInt(tok[6]), Integer.parseInt(tok[7]));
                }
                else if (tok[0].equals(new String("U"))) {
                    sj.updatePrinter(Integer.parseInt(tok[2]),
                        Integer.parseInt(tok[3]));
                }
                else if (tok[0].equals(new String("D"))) {
                    sj.deleteLaptop(Integer.parseInt(tok[2]));
                }

                sj.printPriceRange();
            }

            in.close();
        } catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
        }

        sj.closeConnection();
    }
}
