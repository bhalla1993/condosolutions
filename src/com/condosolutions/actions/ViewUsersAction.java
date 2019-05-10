package com.condosolutions.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.condosolutions.beans.User;
import com.condosolutions.dao.UserDAO;
import com.condosolutions.managers.UserManager;
import com.opensymphony.xwork2.ActionSupport;
import java.util.HashMap;

public class ViewUsersAction extends ActionSupport 
{
	
	private UserDAO userDao=null;

	public String execute()
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		User user=null;
		
		String fromWhere=request.getParameter("fromWhere");
		
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
			}
			request.setAttribute("message",request.getAttribute("message"));			
			userDao=UserManager.getInstance().getUserDAO();
			HashMap<String,User> userMap=null;
			if("filterUsers".equals(fromWhere))
			{
				String filterName,filterDate;
				
				filterName=request.getParameter("filterName");
				filterDate=request.getParameter("filterDate");
				
				System.out.println("Filter name: "+filterName+" \t filterDate: "+filterDate);				
				userMap=userDao.getAllUsers(null,filterName,filterDate);
				request.setAttribute("isFilter", "Y");
				request.setAttribute("filterName", filterName);
				request.setAttribute("filterDate", filterDate);				
			}
			else
			{
			userMap=userDao.getAllUsers();
			}
			request.setAttribute("userMap", userMap);
			
			
		}
		catch(Exception e)
		{
			System.out.println("Exception while creating connection in ViewUserAction file"+e.getMessage());
			e.printStackTrace();
		}
		
		return SUCCESS;
	}
}
