package com.condosolutions.actions;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.condosolutions.beans.User;
import com.condosolutions.beans.Location;
import com.condosolutions.dao.LocationDAO;
import com.condosolutions.managers.LocationManager;
import com.condosolutions.managers.UserManager;
import com.opensymphony.xwork2.ActionSupport;
import java.util.List;

public class LocationsAction extends ActionSupport
{
	
	@Override 
	public String execute()
	{
		
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		User user=null;
		LocationDAO locationDao=null;
		
		String fromWhere=request.getParameter("fromWhere");
		
		String username="";
		try 
		{
			if(session!=null)
			{
				user=(User)session.getAttribute("user");
				
				if(user==null)
				{
					request.setAttribute("errorMessage", "Login is required to perform this action.");
					return "login";
				}
				username=user.getUsername();
			}
			
			locationDao=LocationManager.getInstance().getLocationDAO();
			
			HashMap<String,List<Location>> locMap=locationDao.getLocations(username);
			request.setAttribute("locationMap", locMap);
		
		}
		catch(Exception e)
		{
			System.out.println("Exception in LocationsAction"+e.getMessage());
		}
			
		return SUCCESS;
	}
}
