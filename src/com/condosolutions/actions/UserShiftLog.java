package com.condosolutions.actions;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.struts2.ServletActionContext;

import com.condosolutions.beans.ShiftLog;
import com.condosolutions.beans.User;
import com.condosolutions.dao.UserDAO;
import com.condosolutions.managers.UserManager;
import com.condosolutions.utils.StringUtils;
import com.opensymphony.xwork2.ActionSupport;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
/**
 * 
 * @author Shiva Bhalla
 *
 */

public class UserShiftLog extends ActionSupport
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
				if(!StringUtils.isValidString(fromWhere))
				{
					//Check whether any shift already created by user for today.
					try {
						UserDAO userDAO=UserManager.getInstance().getUserDAO();
						shift=userDAO.isShiftOpen(todayDate, user.getUsername());
						
						request.setAttribute("shiftLog", shift);
						
					} catch (Exception e) {
						// TODO Auto-generated catch block
						//e.printStackTrace();
					System.out.println("Exception while creating userDAO instance and connection in UserShiftLogAction file ");
						
					}
				}
				if("cancelForm".equals(fromWhere))
				{
					return "cancel";
				}
				if("startShiftLogs".equals(fromWhere))
				{
					String startTime,endTime,relieved,relievedBy,equipments,userId;
					startTime=request.getParameter("startTime");
					endTime=request.getParameter("endTime");
					relieved=request.getParameter("relieved");
					relievedBy=request.getParameter("relievedBy");
					equipments=request.getParameter("equipReceived");
					userId=user.getUsername();
					
					System.out.println("\n Start Time: "+startTime+" \t end Time: "+endTime+" \t relieved: "+relieved+" \trelievedBy: "+relievedBy+" \t equipments: "+equipments+" \t User: "+userId);
	
					ShiftLog shiftLog=new ShiftLog();
					try 
					{
						shiftLog.setStartTime(startTime);
						shiftLog.setEndTime(endTime);
						shiftLog.setRelieved(relieved);
						shiftLog.setRelievedBy(relievedBy);
						shiftLog.setEquipments(equipments);
						shiftLog.setShiftLogFor(userId);
						
						UserDAO userDAO=UserManager.getInstance().getUserDAO();
						
						int res =userDAO.startShiftLog(shiftLog);

						if(res>0)
						{
							shift=userDAO.isShiftOpen(todayDate, user.getUsername());
							request.setAttribute("shiftLog", shift);
						}
						
					} catch (Exception e) {
					System.out.println("Exception while creating userDAO instance and connection in UserShiftLogAction file ");
						
					}
				}
			}
		}
		
		return SUCCESS;
	}
}
