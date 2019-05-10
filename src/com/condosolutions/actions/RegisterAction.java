package com.condosolutions.actions;

import com.opensymphony.xwork2.ActionSupport;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.condosolutions.beans.User;
import com.condosolutions.dao.UserDAO;
import com.condosolutions.managers.UserManager;
/**
 * 
 * @author Shiva Bhalla
 *
 */
public class RegisterAction extends ActionSupport {

	private String returnPage="success";
	private String fromWhere;
	HttpServletRequest request = ServletActionContext.getRequest();
	HttpServletResponse response=ServletActionContext.getResponse();
	HttpSession session=request.getSession();
	User user=null;
	

	public String execute() 
	{
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
			
		fromWhere=request.getParameter("fromWhere");
		UserDAO userDAO=UserManager.getInstance().getUserDAO();

		
		if("openRegisterPage".equals(fromWhere))
		{
			System.out.println("From profile : "+request.getParameter("fromProfile"));
			System.out.println("For Edit: "+request.getParameter("forEdit"));
			System.out.println("For user edit: "+request.getParameter("userForEdit"));
			
			if(request.getParameter("forEdit")!=null && request.getParameter("userForEdit")!=null)
			{
				String forEdit=(String)request.getParameter("forEdit");
				String userForEdit=(String)request.getParameter("userForEdit");
				
				HashMap<String,User> userMap=userDAO.getAllUsers(userForEdit);
					
				if(userMap!=null)
				{
					request.setAttribute("userForEdit", userMap.get("0"));
				}
				if(request.getParameter("fromProfile")!=null)
					request.setAttribute("fromProfile", request.getParameter("fromProfile"));
				
			}
			
			returnPage="openRegisterForm";
		}
		else if("processRegistration".equals(fromWhere))
		{
			
			String username,password,firstName,lastName,sex,dob,email,phone,address;
			
			username=request.getParameter("username");
			password=request.getParameter("password");
			
			firstName=request.getParameter("firstName");
			lastName=request.getParameter("lastName");
			sex=request.getParameter("sex");
			dob=request.getParameter("dateOfBirth");
			email=request.getParameter("emailAddress");
			phone=request.getParameter("phoneNumber");
			address=request.getParameter("address");
			
			/*System.out.println("\nusername:"+username
					+ "\tpassword"+password+"/tfirstName"+firstName+"\tlastName"+lastName+"\tsex"+sex
					+"\tdob"+dob+"\temail:"+email+"\tphone:"+phone+"\taddress:"+address);
			*/
			
			int res=0;
			
			if("yes".equals(request.getParameter("forEdit")) && request.getParameter("userForEdit")!=null)
			{
				String userForEdit=(String)request.getParameter("userForEdit");
				res=userDAO.updateUser(firstName, lastName, sex, dob, email, phone, address,userForEdit);
			}
			else
			{
			res=userDAO.insertUser(username, password, firstName, lastName, sex, dob, email, phone, address);
			}
			if(res>0)
			{
				request.setAttribute("message", "Changes have been saved!");

				if("yes".equals(request.getParameter("fromProfile")))
					returnPage="profile-success";
					else
				returnPage="success";
			}
			else
				returnPage="error";
			
		}
		}
		catch(Exception ex)
		{
			System.out.println("Exception while processing RegisterAction "+ex.getMessage());
			returnPage="error";
		}
		
		return returnPage;
	}
}
