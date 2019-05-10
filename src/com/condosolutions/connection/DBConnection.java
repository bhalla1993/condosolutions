package com.condosolutions.connection;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import com.condosolutions.utils.Constants;
/**
 * @author Shiva Bhalla
 */
public class DBConnection 
{
	private static DBConnection instance;
    private Connection connection;
    
    private String url = "jdbc:mysql://localhost:3306/"+Constants.DATABASE_NAME;
    
    private String username = Constants.DATABASE_USER_NAME;
    private String password = Constants.DATABASE_USER_PASSWORD;

    private DBConnection() throws SQLException 
    {
    	try 
    	{
            Class.forName("com.mysql.jdbc.Driver");
            this.connection = DriverManager.getConnection(url, username, password);
        } 
    	catch (ClassNotFoundException ex) 
    	{
            System.out.println("Exception while creating database connection : " + ex.getMessage());
        }
    }
    
    public Connection getConnection() {
        return connection;
    }
    
    public static DBConnection getInstance() throws SQLException 
    {
        if (instance == null) {
            instance = new DBConnection();
        } else if (instance.getConnection().isClosed()) {
            instance = new DBConnection();
        }
        return instance;
    }
    
}
