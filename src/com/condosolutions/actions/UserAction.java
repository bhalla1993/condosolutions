package com.condosolutions.actions;
/**
 * 
 * @author Shiva Bhalla
 *
 */

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.opensymphony.xwork2.ActionSupport;
import com.condosolutions.beans.User;
import com.condosolutions.dao.UserDAO;
import com.condosolutions.managers.UserManager;
import com.condosolutions.utils.Constants;


public class UserAction extends ActionSupport
{
	
	/**
	 * @author Shiva Bhalla
	 */
	private static final long serialVersionUID = 2657414422820058366L;
	private String returnPage="success";
	private String username;
	private String password;
	
	private UserDAO userDao=null;
	
	public String execute()
	{
		HttpServletRequest request = ServletActionContext.getRequest();
		HttpSession session=request.getSession();
		User user=null;
		
		String fromWhere=request.getParameter("fromWhere");
		
		try 
		{
			if(session!=null && !"proceedLogin".equals(fromWhere))
			{
				user=(User)session.getAttribute("user");
				if(user==null)
				{
					request.setAttribute("errorMessage", "Login is required to perform this action.");
					return "login";
				}
				else if("showProfile".equals(fromWhere))
				{
					return returnPage;
				}
			}
			
		
		
		username=request.getParameter("username");
		password=request.getParameter("password");
		
		userDao=UserManager.getInstance().getUserDAO();
		
		User newUserInstance=null;
		
		newUserInstance=userDao.isValidUser(username, password);
		
		if(newUserInstance==null)
		{
			request.setAttribute("errorMessage", "Invalid Username or Password. Please try again with correct credentials!");
			return "login";
		}
		else
		{
			if(session==null)
			{
				session.setAttribute("user", newUserInstance);
			}
			else
			{
				session.removeAttribute("user");
				session.setAttribute("user", newUserInstance);
			}
		}
		}
		catch(Exception ex)
		{
			request.setAttribute("errorMessage", "Exception while processing UserAction"+ex.getMessage());
			session.removeAttribute("user");
			returnPage="error";		
		}
		
		return returnPage;
	}
		
}
