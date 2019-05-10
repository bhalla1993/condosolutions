package com.condosolutions.actions;

import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import com.condosolutions.beans.User;
import com.opensymphony.xwork2.ActionSupport;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
/**
 * 
 * @author SHIVA BHALLA
 *
 */
public class LogOutAction extends ActionSupport {


	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response=ServletActionContext.getResponse();
	HttpSession session=request.getSession();
	User user=null;

	@Override
	public String execute()
	{
		try {
			
			
		if(session!=null)
		{
			user=(User)session.getAttribute("user");
			
			if(user!=null)
			{
				session.invalidate();
				request.setAttribute("message", "You have logout successfully. Please login again to proceed!");
			}
			else
			{
					request.setAttribute("errorMessage", "You have already logout from application!");
					return "login";
			}					
		}
		}
		catch(Exception ex)
		{
			ex.printStackTrace();
		}
		return SUCCESS;
				
	}
}
