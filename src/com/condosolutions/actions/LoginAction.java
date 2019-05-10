package com.condosolutions.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.condosolutions.beans.User;
import com.opensymphony.xwork2.ActionSupport;

public class LoginAction extends ActionSupport
{
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response=ServletActionContext.getResponse();
	HttpSession session=request.getSession();
	User user=null;
	
	@Override
	public String execute() throws Exception {
		// TODO Auto-generated method stub
	
		
		request.setAttribute("errorMessage", request.getAttribute("errorMessage"));
		request.setAttribute("message", request.getAttribute("message"));
		
		return "index";
	}
}
