package com.condosolutions.interceptors;

import java.util.Map;

import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.Interceptor;

import com.condosolutions.beans.User;

public class AuthenticationInterceptor implements Interceptor{

	/**
	 * @author Shiva Bhalla
	 */
	private static final long serialVersionUID = 1L;

	@Override
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void init() {
		// TODO Auto-generated method stub
		
	}

	@Override
	public String intercept(ActionInvocation actionInvocation) throws Exception {
		// TODO Auto-generated method stub
		Map<String,Object> session=actionInvocation.getInvocationContext().getSession();
		User user=(User)session.get("user");
		if(user==null)
		{
			return "login";
		}
		return actionInvocation.invoke();
		
	}
	

}
