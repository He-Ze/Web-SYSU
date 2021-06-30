package Action;

import java.sql.Connection;
import java.sql.DriverManager;

public class database {
    public static Connection getConnection() {
        String URL = "jdbc:mysql://localhost:3306/boke18340046?useSSL=false";
        String username = "user";
        String password = "123";
        try {
            Class.forName("com.mysql.jdbc.Driver");
            return DriverManager.getConnection(URL, username, password);
        } catch (Exception e) {
            System.out.println("Database.getConnection() Error --" + e.getMessage());
            return null;
        }
    }
}

