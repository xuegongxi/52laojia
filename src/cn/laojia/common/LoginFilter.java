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
 * ����û��Ƿ��¼
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
 
        //��session��ȡ���û�����Ϣ  
        String username = (String)session.getAttribute("username");  
        //�ж����û��ȡ���û���Ϣ,����ת����½ҳ��  
        if(username==null||"".equals(username)){ 
            //��ת����½ҳ��  
        	 
        	String webName=request.getServletContext().getContextPath();
        	//System.out.println(webName);
            res.sendRedirect("http://"+req.getHeader("Host")+webName+"/index.jsp");  
        }  
        else   {  
            //�Ѿ���½,�����˴�����  
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
