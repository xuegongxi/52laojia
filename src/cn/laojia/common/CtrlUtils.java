package cn.laojia.common;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

public class CtrlUtils {

	public CtrlUtils() {
		// TODO Auto-generated constructor stub
	}
	
	/**
	 * Ò³ÃæÊä³öjson
	 * @param jsonStr
	 * @param res
	 */
	public static void writeStrRes(String jsonStr, HttpServletResponse res){
		res.setContentType("text/html");
		res.setContentType("text/html;charset=UTF-8");
		try {
			res.getWriter().print(jsonStr);
		} catch (IOException e) {
			throw new IllegalArgumentException(e.getMessage());
		}
		
	}
	

}
