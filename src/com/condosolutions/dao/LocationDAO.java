package com.condosolutions.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import com.condosolutions.beans.Location;
import com.condosolutions.connection.DBConnection;
import com.condosolutions.utils.Constants;

public class LocationDAO {

	private Statement statement=null;
	private ResultSet resultSet=null;
	private Connection con=null;
	
	public LocationDAO()
	{
		try 
		{
			con=DBConnection.getInstance().getConnection();			
		}
		catch(Exception ex)
		{
			System.out.println("Exception while creating connection for LocationDao "+ex.getMessage());
		}
	}
	
	
	public int insertLocation(Location loc) 
	{
		int res=0;

		StringBuffer query=new StringBuffer("INSERT INTO "
				+ "LOCATIONS(LOCATION_NAME,LOCATION_ADDRESS,CREATION_DATE,UPDATION_DATE,IS_SUPERVISOR)"
				+ " VALUES('"+loc.getLocationName()+"','"+loc.getLocationAddress()+"','"+loc.getCreationDate()+"','"+loc.getUpdationDate()+"','"+loc.getIsSupervisor()+"')");
				

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
	
	public HashMap<String,List<Location>> getLocations(String username)
	{
		HashMap<String,List<Location>> locationMap=null;
		
		StringBuffer query=new StringBuffer("select L.ID,L.LOCATION_NAME,L.LOCATION_ADDRESS,L.CREATION_DATE,L.UPDATION_DATE,L.IS_SUPERVISOR from LOCATIONS L");
		
	    if(Constants.ADMIN_USER_NAME.equals(username)) 
	    {
	    	query.append(" WHERE 1=1 ");
		}
	    else
	    {
	    	query.append(" JOIN LOCATION_USER_MAPPING LU WHERE L.ID=LU.LOCATION_ID AND LU.USER_ID='"+username+"'");
	    }
		
	    System.out.println("Get Location query:"+query);
	    try {
		statement=con.createStatement();
		resultSet=statement.executeQuery(query.toString());
	    
		if(resultSet!=null)
		{
			List<Location> locList=new ArrayList<Location>();
			locationMap=new HashMap<String,List<Location>>();
			int i=0;//Key for hash map
			
			while(resultSet.next())
			{
				Location l=new Location();
				l.setID(resultSet.getInt("ID"));
				l.setLocationName(resultSet.getString("LOCATION_NAME"));
				l.setLocationAddress(resultSet.getString("LOCATION_ADDRESS"));
				l.setCreationDate(resultSet.getString("CREATION_DATE"));
				l.setUpdationDate(resultSet.getString("UPDATION_DATE"));
				l.setIsSupervisor(resultSet.getString("IS_SUPERVISOR"));
				locList.add(l);
				i++;
			}
			locationMap.put(i+"", locList);
		}
		
	    }
		catch(Exception e)
	    {
	    	
	    	System.out.println("Exception in getLocations method while getting locations from database"+e.getMessage());
	    	
	    }
		return locationMap;
	}

	
}
