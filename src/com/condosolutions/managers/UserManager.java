package com.condosolutions.managers;


import com.condosolutions.dao.UserDAO;

public class UserManager {

	private static UserManager instance;
    private UserDAO userDao;
	
	public UserDAO getUserDAO() {
        return userDao;
    }
	
    public UserManager()
    {
    	try 
    	{
    	this.userDao=new UserDAO();
    	}
    	catch(Exception e)
    	{
    		System.out.println("Exception while creating User Dao instance in UserManager constructor");
    	}
    }
	
    public static UserManager getInstance() throws Exception 
    {
        if (instance == null) 
        {
            instance = new UserManager();
        }        
        return instance;
    }
    
}

