package com.condosolutions.actions;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.condosolutions.beans.ShiftLog;
import com.condosolutions.beans.User;
import com.condosolutions.dao.UserDAO;
import com.condosolutions.managers.UserManager;
import com.condosolutions.utils.StringUtils;
import com.opensymphony.xwork2.ActionSupport;

public class ShiftLogAction extends ActionSupport
{

	HttpServletRequest request = ServletActionContext.getRequest();
	HttpSession session=request.getSession();
	User user=null;
	
	String fromWhere=request.getParameter("fromWhere");
	
	@Override
	public String execute()
	{
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
		LocalDateTime now = LocalDateTime.now();
		
		System.out.println("Today Date : "+dtf.format(now)); 
		
		String todayDate=dtf.format(now);
		ShiftLog shift=null;
		
		if(session!=null)
		{
			user=(User)session.getAttribute("user");
			
			if(user==null)
			{
				request.setAttribute("errorMessage", "Login is required to perform this action.");
				return "login";
			}
			else
			{
				
				
			}
		}
		return SUCCESS;
	}
}