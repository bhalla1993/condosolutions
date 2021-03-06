package com.condosolutions.actions;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;


import com.condosolutions.beans.User;
import com.condosolutions.dao.UserDAO;
import com.condosolutions.managers.UserManager;
import com.opensymphony.xwork2.ActionSupport;
import java.util.HashMap;
/**
 * 
 * @author SHIVA BHALLA
 *
 */
public class HomeAction extends ActionSupport
{
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response=ServletActionContext.getResponse();
	HttpSession session=request.getSession();
	User user=null;
	private UserDAO userDao=null;
	
	@Override
	public String execute()
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
		HashMap<String,User> userMap=null;

		try {
			userDao=UserManager.getInstance().getUserDAO();
			userMap=userDao.getAllUsers(user.getUsername());
			
			request.setAttribute("userMap", userMap);
			
			request.setAttribute("message",request.getAttribute("message"));
		} catch (Exception e) {
			System.out.println("Exception while creating connection in HomeAction file"+e.getMessage());
			e.printStackTrace();
		}
		return SUCCESS;
	}
}
