package com.condosolutions.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import java.util.List;
import com.condosolutions.beans.ShiftLog;


import com.condosolutions.connection.DBConnection;

public class UserShiftLogDAO {

	private Statement statement=null;
	private ResultSet resultSet=null;
	private Connection con=null;
	
	public UserShiftLogDAO()
	{
		try 
		{
			con=DBConnection.getInstance().getConnection();			
		}
		catch(Exception ex)
		{
			System.out.println("Exception while creating connection for UserShiftLogDAO "+ex.getMessage());
		}
	}
	
	
	public HashMap<String,List<ShiftLog>> getShiftLogs()
	{
		
		
		return null;
		
	}
	
}
