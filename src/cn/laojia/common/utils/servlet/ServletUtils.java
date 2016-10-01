package cn.laojia.common.utils.servlet;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import cn.laojia.common.utils.string.StringUtils;

/**
 * @Author:xuegongxi
 * @Date:2016-5-15
 * @Version:1.0
 * @Descript:
 */
public class ServletUtils {
	/**
	 * 
	 * @param request
	 * @return
	 */
	public static String getBasePath(HttpServletRequest request)
	{
		String path = request.getContextPath();
		String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
		return basePath;
	}

	
	
	/**
	 * 获得会话对象变量值
	 */
	public static Object getSessionValue(HttpServletRequest request, String key)
	{
		// 返回值
		Object sessionValue = null;
		// 验证参数
		if (StringUtils.isEmpty(key))
		{
			HttpSession httpSession = request.getSession();
			sessionValue = httpSession.getAttribute(key);
		}
		// 返回结果
		return sessionValue;
	}

	/**
	 * 获得请求对象中的变量值
	 */
	public static String getRequestValue(HttpServletRequest request, String key)
	{
		// 返回值
		String requestValue = null;
		// 验证参数
		if (StringUtils.isEmpty(key))
		{
			requestValue = request.getParameter(key);
		}
		// 返回结果
		return requestValue;
	}



	/**
	 * 获得请求对象中的变量值
	 */
	public static String[] getRequestValues(HttpServletRequest request, String key)
	{
		// 返回值
		String[] requestValues = null;
		// 验证参数
		if (StringUtils.isEmpty(key))
		{
			requestValues = request.getParameterValues(key);
		}
		// 返回结果
		return requestValues;
	}


	/**
	 * 在请求对象中设置属性
	 */
	public static void setRequestValue(HttpServletRequest request, String key, Object value)
	{
		request.setAttribute(key, value);
	}

	/**
	 * 从请求中获得根域名，形如:..com
	 */
	public static String getRootDoamin(HttpServletRequest request)
	{
		// 返回变量
		String doamin = "";
		// 定义临时变量
		String serverName = "";
		int serverNameLength = 0;
		// 获得域名
		serverName = request.getServerName();
		serverName = (serverName != null) ? serverName : "";
		serverNameLength = serverName.length();
		if (serverNameLength > 0)
		{
			int pos;
			pos = serverName.indexOf(".");
			if (pos > 0)
			{
				doamin = serverName.substring(pos, serverNameLength);
			}
		}
		// 返回
		return doamin;
	}


	/**
	 * 从请求中获得端口，形如:80
	 */
	public static int getPort(HttpServletRequest request)
	{
		// 返回变量
		int serverPort;
		// 端口
		serverPort = request.getServerPort();
		// 返回
		return serverPort;
	}

	/**
	 * 从请求中获得请求前缀，形如:..com:80
	 */
	public static String getUrlPrefix(HttpServletRequest request)
	{
		// 返回变量
		String urlPrefix = "";
		// 定义临时变量
		String serverName = "";
		int serverPort = 0;
		String joinSybol = ":";
		// 请求前缀
		serverName = getRootDoamin(request);
		serverPort = getPort(request);
		urlPrefix = serverName + joinSybol + serverPort;
		// 返回
		return urlPrefix;
	}

	/**
	 * 从请求中获得请求上下文路径,形如：/
	 */
	public static String getContextPath(HttpServletRequest requqest)
	{
		// 定义变量
		String contentPath = "";
		contentPath = requqest.getContextPath();
		// 返回
		return contentPath;
	}


	/**
	 * 从请求中获得请求上下文路径,形如：/
	 */
	public static String getPath(HttpServletRequest requqest)
	{
		// 定义变量
		String url = "";
		// 定义临时变量
		String urlPrefix = "";
		String contextPath = "";
		urlPrefix = getUrlPrefix(requqest);
		contextPath = requqest.getContextPath();
		// 返回
		url = urlPrefix + contextPath;
		return url;
	}

	/**
	 * 获取客户端ip
	 * 
	 * @param request
	 * @return
	 */
	public static String getIpAddr(HttpServletRequest request)
	{
		String ip = request.getHeader("x-forwarded-for");
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip))
		{
			ip = request.getHeader("Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip))
		{
			ip = request.getHeader("WL-Proxy-Client-IP");
		}
		if (ip == null || ip.length() == 0 || "unknown".equalsIgnoreCase(ip))
		{
			ip = request.getRemoteAddr();
		}
		return ip;
	}
}