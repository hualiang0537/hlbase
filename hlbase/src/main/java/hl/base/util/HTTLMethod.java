package hl.base.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpServletRequest;

public class HTTLMethod {
	/**
	 * Logger for this class
	 */
	private static final Logger logger = LoggerFactory.getLogger(HTTLMethod.class);

	public static String getContextPath(HttpServletRequest request){
		return request.getContextPath();
	}
	
	public static boolean contains(String s,String s2){
		return s.contains(s2);
	}


}
