package com.condosolutions.dao;
import com.condosolutions.beans.ShiftLog;
import com.condosolutions.beans.User;
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

import freemarker.template.utility.StringUtil;
import java.util.HashMap;

/**
 * 
 * @author Shiva Bhalla
 *
 */
public class UserDAO 
{
	private Statement statement=null;
	private ResultSet resultSet=null;
	private Connection con=null;
	
	public UserDAO()
	{
		try 
		{
			con=DBConnection.getInstance().getConnection();			
		}
		catch(Exception ex)
		{
			System.out.println("Exception while creating connection for UserDAO "+ex.getMessage());
		}
	}
	
	public User isValidUser(String username,String password)
	{
		StringBuffer query=new StringBuffer("select ID,USERNAME,FIRST_NAME,LAST_NAME,SEX,DATE_OF_BIRTH,EMAIL,PHONE,ADDRESS,CREATION_DATE,UPDATION_DATE from USER WHERE 1=1 ");
		User user=null;
		if(StringUtils.isValidString(username) && StringUtils.isValidString(password))
		{
			query.append(" AND USERNAME='"+username+"' AND PASSWORD='"+password+"'");
		try 
		{
			statement=con.createStatement();
			resultSet=statement.executeQuery(query.toString());
			if(resultSet.next())
			{
				user=new User();
				user.setID(Integer.parseInt(resultSet.getString("ID")));
				user.setUsername(resultSet.getString("USERNAME"));
				user.setFirstName(resultSet.getString("FIRST_NAME"));
				user.setLastName(resultSet.getString("LAST_NAME"));
			
				StringBuffer fullName=new StringBuffer(user.getFirstName());
				if(StringUtils.isValidString(user.getLastName()))
				{
					fullName.append(" ").append(user.getLastName());
				}
				
				user.setFullName(fullName.toString());
				user.setSex(resultSet.getString("SEX"));
				user.setDateOfBirth(resultSet.getString("DATE_OF_BIRTH"));
				user.setEmail(resultSet.getString("EMAIL"));
				user.setPhone(resultSet.getString("PHONE"));
				user.setAddress(resultSet.getString("ADDRESS"));
				user.setCreationDate(resultSet.getString("CREATION_DATE"));
				user.setUpdationDate(resultSet.getString("UPDATION_DATE"));
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Exception while creating statement from connection in isValidUser method of UserDAO "+e.getMessage());
		}
		}
		return user;
	}
	public HashMap<String,User> getAllUsers()
	{
		return getAllUsers(null);
	}
	public HashMap<String,User> getAllUsers(String username)
	{
		return getAllUsers(username,null,null);
	}
	public HashMap<String,User> getAllUsers(String username,String filterName,String filterDate)
	{
		StringBuffer query=new StringBuffer("select ID,USERNAME,FIRST_NAME,LAST_NAME,SEX,DATE_OF_BIRTH,EMAIL,PHONE,ADDRESS,CREATION_DATE,UPDATION_DATE,ACTIVATE from USER WHERE 1=1 ");
		User user=null;
		HashMap<String,User> userMap=new HashMap<String,User>();
		
		if(StringUtils.isValidString(username))
		{
			query.append(" AND USERNAME='"+username+"'");
		}
		if(StringUtils.isValidString(filterName))
		{
			query.append(" AND FIRST_NAME LIKE '%"+filterName+"%' OR LAST_NAME LIKE '%"+filterName+"%'");
		}
		if(StringUtils.isValidString(filterDate))
		{
			query.append(" AND DATE(CREATION_DATE)='"+filterDate+"'");
		}
		System.out.println("Query for user:"+query);
		
		try 
		{
			statement=con.createStatement();
			resultSet=statement.executeQuery(query.toString());
			int i=0;
			while(resultSet.next())
			{
				user=new User();
				user.setID(Integer.parseInt(resultSet.getString("ID")));
				user.setUsername(resultSet.getString("USERNAME"));
				user.setFirstName(resultSet.getString("FIRST_NAME"));
				user.setLastName(resultSet.getString("LAST_NAME"));
			
				StringBuffer fullName=new StringBuffer(user.getFirstName());
				if(StringUtils.isValidString(user.getLastName()))
				{
					fullName.append(" ").append(user.getLastName());
				}
				
				user.setFullName(fullName.toString());
				user.setSex(resultSet.getString("SEX"));
				user.setDateOfBirth(resultSet.getString("DATE_OF_BIRTH"));
				user.setEmail(resultSet.getString("EMAIL"));
				user.setPhone(resultSet.getString("PHONE"));
				user.setAddress(resultSet.getString("ADDRESS"));
				user.setCreationDate(resultSet.getString("CREATION_DATE"));
				user.setUpdationDate(resultSet.getString("UPDATION_DATE"));
				user.setIsActivate(resultSet.getString("ACTIVATE"));
				
				userMap.put(i+"", user);
				i++;
			}
		}
		 catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println("Exception while creating statement from connection in isValidUser method of UserDAO "+e.getMessage());
		}		
		return userMap;
	}
	public int updateUser(String firstName,String lastName,String sex,String dob,String email,String phone,String address,String userForEdit) 
	{
		int res=0;
		StringBuffer query=new StringBuffer("UPDATE USER SET FIRST_NAME='"+firstName+"',LAST_NAME='"+lastName+"',SEX='"+sex+"',DATE_OF_BIRTH='"+dob+"',EMAIL='"+email+"',PHONE='"+phone+"',ADDRESS='"+address+"',UPDATION_DATE=now() WHERE 1=1 ");
		query.append(" AND USERNAME='"+userForEdit+"' ");
		
		System.out.println("Update Query is: "+query);
		try 
		{
			statement=con.createStatement();
			res=statement.executeUpdate(query.toString());
		}
		catch(SQLException e)
		{
			System.out.println("Exception while creating statement from connection in updateUser  User method of UserDAO "+e.getMessage());
		}
		
		return res;
		
	}
	public int insertUser(String username,String password,String firstName,String lastName,String sex,String dob,String email,String phone,String address) 
	{
		int res=0;
		StringBuffer query=new StringBuffer("INSERT INTO USER(USERNAME,PASSWORD,FIRST_NAME,LAST_NAME,SEX,DATE_OF_BIRTH,EMAIL,PHONE,ADDRESS,CREATION_DATE,UPDATION_DATE) "
				+ "VALUES('"+username+"','"+password+"','"+firstName+"','"+lastName+"','"+sex+"','"+dob+"','"+email+"','"+phone+"','"+address+"',now(),now())");
		
		System.out.println("Query is: "+query);
		
		try 
		{ 
			statement=con.createStatement();
			res=statement.executeUpdate(query.toString());
		}
		catch(SQLException e)
		{
			System.out.println("Exception while creating statement from connection in insertUser User method of UserDAO "+e.getMessage());
		}

		return res;
	}
	
	public ShiftLog isShiftOpen(String currentDate,String userId)
	{
	
		StringBuffer query=new StringBuffer("select * from USER_SHIFT_LOGS WHERE 1=1 ");
		
		ShiftLog shift=null; 
		
		if(StringUtils.isValidString(userId))
		{
			query.append(" AND USER_ID='"+userId+"'");
		}
		
		if(StringUtils.isValidString(currentDate))
		{
			query.append(" AND DATE(CREATION_DATE)='"+currentDate+"'");
		}
		System.out.println("Query in isShiftOpen method : "+query);
		
		try 
		{
			
			statement=con.createStatement();
			resultSet=statement.executeQuery(query.toString());
			if(resultSet.next())
			{
				shift=new ShiftLog();
				shift.setID(resultSet.getInt("ID"));
				shift.setStartTime(resultSet.getString("START_TIME"));
				shift.setEndTime(resultSet.getString("END_TIME"));
				shift.setEquipments(resultSet.getString("EQUIPMENTS"));
				shift.setRelieved(resultSet.getString("RELIEVED"));
				shift.setRelievedBy(resultSet.getString("RELIEVED_BY"));
				shift.setCreationDate(resultSet.getString("CREATION_DATE"));
				shift.setUpdationDate(resultSet.getString("UPDATION_DATE"));
				shift.setLogText(resultSet.getString("LOGS"));
				shift.setShiftLogFor(resultSet.getString("USER_ID"));
			}
			
		} catch (SQLException e) {
			System.out.println("Exception while getting data from shift logs table");
			e.printStackTrace();
		}
		
		return shift;
	}
	public int startShiftLog(ShiftLog s)
	{
		int res=0;
		
		if(s!=null)
		{
		StringBuffer query=new StringBuffer("INSERT INTO USER_SHIFT_LOGS(START_TIME,END_TIME,RELIEVED,RELIEVED_BY,EQUIPMENTS,CREATION_DATE,UPDATION_DATE,LOGS,USER_ID) "
				+ "VALUES('"+s.getStartTime()+"','"+s.getEndTime()+"','"+s.getRelieved()+"','"+s.getRelievedBy()+"','"+s.getEquipments()+"',now(),now(),'','"+s.getShiftLogFor()+"')");
		
		System.out.println("Query is: "+query);
		
		try 
		{
			statement=con.createStatement();
			res=statement.executeUpdate(query.toString());
		}
		catch(SQLException e)
		{
			System.out.println("Exception while creating statement from connection in startShiftLog User method of UserDAO "+e.getMessage());
		}
		}
		return res;
	}
}
