package com.condosolutions.utils;
/**
 * 
 * @author Shiva Bhalla
 *
 */
public class StringUtils 
{
	public static boolean isValidString(String val)
	{
		if(val!=null && val.length()>0 && val!="")
			return true;
		else
			return false;
	}


}
