package com.condosolutions.managers;

import com.condosolutions.dao.UserShiftLogDAO;

public class UserShiftLogManager {


	private static UserShiftLogManager instance;
    private UserShiftLogDAO userShiftLogDao;
	
	public UserShiftLogDAO getuserShiftLogDAO() {
        return userShiftLogDao;
    }
	
    public UserShiftLogManager()
    {
    	try 
    	{
    	this.userShiftLogDao=new UserShiftLogDAO();
    	}
    	catch(Exception e)
    	{
    		System.out.println("Exception while creating User Dao instance in UserrShiftLogManager constructor");
    	}
    }
	
    public static UserShiftLogManager getInstance() throws Exception 
    {
        if (instance == null) 
        {
            instance = new UserShiftLogManager();
        }        
        return instance;
    }
    

}
