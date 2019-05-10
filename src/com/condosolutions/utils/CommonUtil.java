package com.condosolutions.utils;

/**
 * 
 * @author Shiva Bhalla
 * 
 */
import com.condosolutions.connection.DBConnection;
import java.sql.Connection;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.condosolutions.utils.StringUtils;

public class CommonUtil 
{
	private Statement statement=null;
	private ResultSet resultSet=null;
	private Connection con=null;
	
	public CommonUtil()
	{
		try 
		{
			con=DBConnection.getInstance().getConnection();			
		}
		catch(Exception ex)
		{
			System.out.println("Exception while creating connection for CommonUtil "+ex.getMessage());
		}
	}
	
	public boolean checkUserNameExists(String username)
	{

		System.out.println("Inside common Util method");
		
		boolean result=false;
		StringBuffer query=new StringBuffer("select USERNAME from USER WHERE 1=1 ");

		if(StringUtils.isValidString(username))
		{
			query.append(" AND USERNAME='"+username+"' ");
		try 
		{
			statement=con.createStatement();
			resultSet=statement.executeQuery(query.toString());
			if(resultSet.next())
			{
				result=true;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Exception while creating statement from connection in checkUserNameExists method of CommonUtil "+e.getMessage());
		}
		}
		return result;
	}
	public int updateShiftLogs(String shiftLogs,String username,String todayDate)
	{
		int res=0;
		
		StringBuffer query=new StringBuffer("UPDATE USER_SHIFT_LOGS SET LOGS='"+shiftLogs+"',UPDATION_DATE=now() WHERE 1=1 ");
		if(StringUtils.isValidString(username))
		{
			query.append(" AND USER_ID='"+username+"'");
		}
		if(StringUtils.isValidString(todayDate))
		{
			query.append(" AND DATE(CREATION_DATE)='"+todayDate+"'");
		}
		
		try 
		{
			statement=con.createStatement();
			res=statement.executeUpdate(query.toString());
		}
		catch(SQLException e)
		{
			System.out.println("Exception while updating shift logs "+e.getMessage());
		}

		return res;
	}

	
	
}
