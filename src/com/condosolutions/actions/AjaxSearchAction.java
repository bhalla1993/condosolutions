package com.condosolutions.actions;

import com.opensymphony.xwork2.ActionSupport;

import java.io.ByteArrayInputStream;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.charset.StandardCharsets;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import com.condosolutions.utils.CommonUtil;

public class AjaxSearchAction extends ActionSupport {

	private StringBuffer returnValue=new StringBuffer();;
	private HttpServletRequest request= ServletActionContext.getRequest();
	//private HttpServletResponse response=ServletActionContext.getResponse();
	
	private String dataSet;
	private String param;
	private String username;
	
	
	private String returnPage="success";
	
	public String execute() 
	{
		try 
		{	
		param=request.getParameter("param");
		dataSet=request.getParameter("dataSet");
		username=request.getParameter("username");
		System.out.println("\n In Ajax search \n Param is:"+param+"\t\t dataSet is: "+dataSet);
		
		if("checkUsernameExists".equals(dataSet))
		{
			boolean res=new CommonUtil().checkUserNameExists(param);
			
			if(res)
				returnValue.append("true");
			else
				returnValue.append("false");
		}
		if("updateShiftLogs".equals(dataSet))
		{
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy-MM-dd");
			LocalDateTime now = LocalDateTime.now();
			
			String todayDate=dtf.format(now);
			
			int res=new CommonUtil().updateShiftLogs(param,username,todayDate);
			
			if(res>0)
				returnValue.append("true");
			else
				returnValue.append("false");
			
		}
		request.setAttribute("returnValue", returnValue.toString());
		}
		catch(Exception ex)
		{
			returnPage="error";
		}
		
		return returnPage;
	}
}
