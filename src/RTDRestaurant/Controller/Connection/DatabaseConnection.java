//
package RTDRestaurant.Controller.Connection;



import java.io.FileInputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.Properties;
import javax.swing.JOptionPane;

public class DatabaseConnection {
 
    /**
     * Get database connection
     *
     * @return a Connection object
     * @throws SQLException
     */
    public static Connection getConnection() throws SQLException {

        Connection conn = null;  // Initialize the connection to null
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/restaurant";
            String username = "root";
            String password = "0101032909Ngan@";
            conn = DriverManager.getConnection(url, username, password);
            if(conn!=null){
                System.out.println("connect successfully");
            }
        } catch (ClassNotFoundException | SQLException e) {
            // Display a message to the user or log the exception
            JOptionPane.showMessageDialog(null, "Error connecting to the database:\n" + e.getMessage());
            e.printStackTrace();  // Log the exception (you may want to replace this with proper logging)
        }

        return conn;  // Return the connection (might be null if an error occurred)
    }
 
}