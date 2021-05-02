import java.util.*;

import java.sql.*;

public class SQLiteJDBC {
    private Connection c = null;
    private String dbName;
    private boolean isConnected = false;
    private ArrayList<Tables> tables = new ArrayList<Tables>();

	private SQLiteJDBC() {
        tables.add(new Tables("Product", "maker char(30), model decimal(10), type char(30)"));
        tables.add(new Tables("PC", "model DECIMAL(4,4), speed FLOAT,ram DECIMAL(4,4), hd DECIMAL(4,4), price DECIMAL(4,4)"));
        tables.add(new Tables("Laptop", "model DECIMAL(4,4), speed DECIMAL(4,4), ram DECIMAL(4,4), hd DECIMAL(4,4),screen DECIMAL(4,4), price DECIMAL(4,4)"));
        tables.add(new Tables("Printer", "model DECIMAL(4,4), color char(30), type char(30), price DECIMAL(4,4)"));
        System.out.println("Size of tables " + tables.size());
    }
    private void openConnection(String _dbName) {
        dbName = _dbName;

        if (false == isConnected) {
            System.out.println("Open database: " + _dbName);

            try {
                String connStr = new String("jdbc:sqlite:");
                connStr = connStr + _dbName;

                // STEP: Register JDBC driver
                Class.forName("org.sqlite.JDBC");

                // STEP: Open a connection
                c = DriverManager.getConnection(connStr);

                // STEP: Disable auto transactions
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
    private void closeConnection() {
        if(isConnected) {
            
            try {
                System.out.println("Closing database...\n");
                c.close();
                isConnected = false;
                dbName = "";
                System.out.println("Successful close DB! \n\n\n");
            }
            catch (Exception e) {
                System.err.println(e.getClass().getName() + " : " + e.getMessage());
                System.exit(0);
            }
            System.out.println("+++++++++++++++++++++++++++++++++++++");
        }
    }
    private void createTables() {
        System.out.println("Creating tables...\n\n\n");
    
        try {
            //Statements cannot exist without a connection.
            //So for a connection c, we create a statement.
            Statement stmt = c.createStatement();

            for (Tables i : tables) {
                stmt.executeUpdate(i.getTable());
            }

        
            //At this point, the table is not committed, because of 
            //the c.setAutoCommit(false) statement. So we still need to commit
            c.commit();
            stmt.close();
            System.out.println("Successful create tables!");
            System.out.println("+++++++++++++++++++++++++++++++++++++");
        } 
        
        catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
            try{
                c.rollback();
            } 
            catch (Exception e1) {
                System.err.println(e1.getClass().getName() + ": " + e1.getMessage());
            }
        }
    }
    public void dropTables() {
        System.out.println("Dropping tables...");

        try {
            Statement stmt = c.createStatement();
            
            for (Tables j : tables) {
                stmt.executeUpdate(j.dropTable()); 
            }

            

            c.commit();
            System.out.println("Successful drop!");
            System.out.println("+++++++++++++++++++++++++++++++++++++");
        } 
        catch (Exception e) {
            System.err.println(e.getClass().getName() + ": " + e.getMessage());
            
            try{
                c.rollback();
            } 
            catch (Exception e1) {
                System.err.println(e1.getClass().getName() + ": " + e1.getMessage());
            }
        }
        
    }
    
    //Method A to populate tables
    public void populateTable_Product(){
        System.out.println("Populate PRODUCT");
        try {
            String sql = "INSERT INTO Product VALUES(?, ?, ?)";
            PreparedStatement stmt = c.prepareStatement(sql);

            stmt.setString(1, "A");
            stmt.setInt(2, 1001);
            stmt.setString(3, "pc");
            stmt.addBatch();

            stmt.executeBatch();

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
    }

    //Method B part 1 to populate tables (nested shit)
    public void populateTable_PC(){
        insert_PC(1001, 2.66, 1024, 250, 2114);
    }
    ////Method B part 2 to populate tables (nested shit)
    public void insert_PC(int model, double speed, int ram, int hd, int price){
        System.out.println("Insert PC");
        try {
            String sql = "INSERT INTO PC(model, speed, ram, hd, price) VALUES(?, ?, ?, ?, ?)";
            PreparedStatement stmt = c.prepareStatement(sql);

            stmt.setInt(1, model);
            stmt.setDouble(2, speed);
            stmt.setInt(3, ram);
            stmt.setInt(4, hd);
            stmt.setInt(5, price);
    
            stmt.executeUpdate();

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
    }

    public void populateTables(){
        populateTable_Product();
        populateTable_PC();
    }
    public static void main(String[] args) {

        // open connection to database
        // close connection to database
        SQLiteJDBC project = new SQLiteJDBC();
        project.openConnection("data.sqlite");
        project.createTables();
        // project.dropTables();
        project.populateTables();
        project.closeConnection();

    }
};
