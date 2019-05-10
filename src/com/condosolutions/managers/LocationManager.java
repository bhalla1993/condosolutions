package com.condosolutions.managers;

import com.condosolutions.dao.LocationDAO;

public class LocationManager {

	private static LocationManager instance;
    private LocationDAO locationDao;
	
	public LocationDAO getLocationDAO() {
        return locationDao;
    }
	
    public LocationManager() {    
    	try 
    	{
    	this.locationDao=new LocationDAO();
    	}
    	catch(Exception e)
    	{
    		System.out.println("Exception while creating LocationDao instance in LocationManager constructor");
    	}
    }
	
    public static LocationManager getInstance() throws Exception 
    {
        if (instance == null) 
        {
            instance = new LocationManager();
        }        
        return instance;
    }    
}

