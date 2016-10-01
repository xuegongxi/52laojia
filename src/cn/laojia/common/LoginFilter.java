package cn.laojia.common;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * 检查用户是否登录
 */
@WebFilter("/LoginFilter")
public class LoginFilter implements Filter {

    /**
     * Default constructor. 
     */
    public LoginFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest req =(HttpServletRequest)request;  
        HttpServletResponse res =(HttpServletResponse)response;  
        HttpSession session=req.getSession(true);  
 
        //从session里取的用户名信息  
        String username = (String)session.getAttribute("username");  
        //判断如果没有取到用户信息,就跳转到登陆页面  
        if(username==null||"".equals(username)){ 
            //跳转到登陆页面  
        	 
        	String webName=request.getServletContext().getContextPath();
        	//System.out.println(webName);
            res.sendRedirect("http://"+req.getHeader("Host")+webName+"/index.jsp");  
        }  
        else   {  
            //已经登陆,继续此次请求  
            chain.doFilter(request,response);  
        }  
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
