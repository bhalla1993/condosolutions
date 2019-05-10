package com.condosolutions.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.condosolutions.beans.User;
import com.opensymphony.xwork2.ActionSupport;
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
		return SUCCESS;
	}
}
