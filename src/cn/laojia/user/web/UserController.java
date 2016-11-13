package cn.laojia.user.web;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.hsqldb.lib.MD5;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cn.laojia.common.CtrlUtils;
import cn.laojia.common.PageModel;
import cn.laojia.news.model.News;
import cn.laojia.user.model.User;
import cn.laojia.user.service.UserService;
import cn.laojia.utils.MD5Util;

@Controller
@SessionAttributes({"username","user"})//将ModelMap中属性名字为u的再放入session中。这样，request和session中都有了。
@RequestMapping("/user.do")
public class UserController {
	protected final transient Log log = LogFactory
	.getLog(UserController.class);
	@Autowired
	public UserService userService;
	public UserController(){
		
	}
	
	@RequestMapping
	public String load(ModelMap modelMap){
		List<User> list = userService.getListUsers();
		modelMap.put("list", list);
		return "user";
	}
	
	@RequestMapping(params = "method=index")
	public String index(HttpServletRequest request, ModelMap modelMap,RedirectAttributes ra){
	    /*RedirectView redirect = new RedirectView("/success/");
		 redirect.setExposeModelAttributes(false);
		 return redirect;*/
		return "redirect:index.jsp";  
	}
	
	
	@RequestMapping(params = "method=login")
	public String login(HttpServletRequest request, ModelMap modelMap){
		String username = (String) request.getParameter("username");
		String psw = (String) request.getParameter("password");
		if(StringUtils.isEmpty(username)||StringUtils.isEmpty(psw)){
			modelMap.put("loginerror", "用户名或密码为空，请重新登录！");
	    	return "login";
		}
		User st = new User();
		st.setUsername(username);
		st.setPassword(MD5Util.string2MD5(psw));
	    List<User> list=userService.getListUsers(st);
	    if(list!=null&&list.size()>0){
	    	modelMap.addAttribute("username",username);  //将u放入request作用域中，这样转发页面也可以取到这个数据。
	    	User user = list.get(0);
	    	String village_id=user.getVillage();
	    	String hometownAddress=userService.getHomeTownAddress(village_id);
	    	user.setVillage(hometownAddress);
	    	modelMap.addAttribute("user", user);
	    	//return "view/person_main";
	    	//判断是否是管理员
	    	if(username.equals("xuegongxi")){
	    		return "redirect:view/admin/admin_main.jsp";   
	    	}else{
	    		return "redirect:view/person_main.jsp";   
	    	}
	 
	    }else{
	    	modelMap.put("loginerror", "用户名或密码错误，请重新登录！");
	    	return "login";
	    }
	}
	/**
	 * 用户退出登录
	 * @param request
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(params = "method=loginout")
	public String loginout(HttpServletRequest request, ModelMap modelMap){
		String username = (String) request.getParameter("username");
		if(StringUtils.isNotEmpty(username)){
			HttpSession session = request.getSession();// 防止创建Session
			if (session == null) {
				return "index";
			}
			session.removeAttribute(username);
			session.removeAttribute("user");
			modelMap.addAttribute("username","");
			session.invalidate();
			return "redirect:user.do?method=index";
			//return "index";
			
		}else{
			return "error";
		}
		
	}
	/**
	 * 点击用户名时，检查用户是否已经登录，如果登录跳转到个人主页，如果已经注销，跳转到主页。
	 * @param request
	 * @param modelMap
	 * @return
	 */
	
	@RequestMapping(params = "method=checklogin")
	public String checklogin(HttpServletRequest request, ModelMap modelMap){
		String username = (String) request.getParameter("username");
		if(StringUtils.isNotEmpty(username)){
			HttpSession session = request.getSession();// 防止创建Session
			if (session == null) {
				return "index";
			}else{
			 String name=(String) session.getAttribute("username");
			 if(StringUtils.isNotEmpty(name)){
				 return "view/person_main";
			 }else{
				return "index"; 
			 }
			}
		}else{
			return "index";
		}
		
	}
	
	
	@RequestMapping(params = "method=add")
	public String add(HttpServletRequest request, ModelMap modelMap) throws Exception{
		
//	     return "forward:index.jsp";
	     return "forward:user.do?method=save1"; //转发
        //return "redirect:user.do?method=save";  //重定向
	}
	
	@RequestMapping(params = "method=save")
	public String save(HttpServletRequest request, ModelMap modelMap){
		String username = (String) request.getParameter("username");
		String nickname = (String) request.getParameter("nickname");
		String psw = (String) request.getParameter("password");
		String password2 = (String) request.getParameter("password2");
		String phone = (String) request.getParameter("phone");
		String email = (String) request.getParameter("email");
		String province =request.getParameter("S1");
		String city =request.getParameter("S2");
		String county =request.getParameter("S3");
		String town =request.getParameter("S4");
		String village =request.getParameter("S5");
		User st = new User();
		st.setUsername(username);
		st.setNickname(nickname);
		st.setPassword(MD5Util.string2MD5(psw));
		st.setEmail(email);
		st.setPassword2(MD5Util.string2MD5(password2));
		st.setPhone(phone);
		st.setProvince(province);
		st.setCity(city);
		st.setCounty(county);
		st.setTown(town);
		st.setVillage(village);
		st.setCreate_time(new Date());
		//1.首先检查用户是否存在
		boolean is_exist=userService.findUserByName(username);
		 if(is_exist){
			 modelMap.put("registererror", "该用户已存在！，请更换用户名继续注册!"); 
			 return "register";
		 }else{
			 try{
					userService.save(st);
					String village_id=st.getVillage();
			    	String hometownAddress=userService.getHomeTownAddress(village_id);
			    	st.setVillage(hometownAddress);
					modelMap.addAttribute("user", st);
					modelMap.put("addstate", true);
					modelMap.addAttribute("username",username);
				}
				catch(Exception e){
					e.printStackTrace();
					modelMap.put("addstate", false);
				} 
		 }
		 return "register_success";
		//return "forward:index.jsp";
	}
	
	@RequestMapping(params = "method=getUserList")
	public void getUserList(HttpServletRequest request,HttpServletResponse res,ModelMap modelMap){
		PageModel info = new PageModel();
		info.setPageSize(10);
		info.setCurrPageNumberFormRequest(request);

		info = userService.getUserList(info);
		Map map = new HashMap();
		map.put("pageCount", info.getPageCount());
		map.put("result", info.getDatas());
		String jsonStr = JSONObject.fromObject(map).toString();
		System.out.println(jsonStr);
		CtrlUtils.writeStrRes(jsonStr, res);
	}
	/**
	 * 删除用户
	 * @param id
	 * @param response
	 */
	@RequestMapping(params = "method=del")
	public void del(@RequestParam("id") String id, HttpServletResponse response){
		try{
			User st = new User();
			st.setUserid(Integer.valueOf(id));
			st.setIs_delete(1);
			userService.delete(st);
			response.getWriter().print("{\"del\":\"true\"}");
		}
		catch(Exception e){
			log.error(e.getMessage());
			e.printStackTrace();
		}
	}
	
	/**
	 * 重置密码
	 * @param id
	 * @param response
	 */
	
	@RequestMapping(params = "method=resetPassword")
	public void resetPassword(@RequestParam("id") String id, HttpServletResponse response){
		try{
			User st = userService.findUserById(Integer.valueOf(id));
			st.setUserid(Integer.valueOf(id));
			//重置密码为111111
			String resetPassword ="111111";
			st.setPassword(MD5Util.string2MD5(resetPassword));
			st.setPassword2(MD5Util.string2MD5(resetPassword));
			userService.update(st);
			response.getWriter().print("{\"reset\":\"true\"}");
		}
		catch(Exception e){
			log.error(e.getMessage());
			e.printStackTrace();
		}
	}
	
	@RequestMapping(params = "method=getposition")
	public void getposition(HttpServletRequest request, HttpServletResponse response){
		response.setHeader("Content-Type", "text/html;charset=UTF-8");
		String type=request.getParameter("type");
		String provinceID=request.getParameter("provinceID");
		String cityID=request.getParameter("cityID");
		String countyID=request.getParameter("countyID");
		String townID=request.getParameter("townID");
		try {
			if (StringUtils.isNotEmpty(type)) {
				if (type.equals("province")) {
					String province_str =this.select1();
					response.getWriter().print(province_str);
				} else if (type.equals("city")) {
					String city_str =this.select2(provinceID);
					response.getWriter().print(city_str);
				} else if (type.equals("county")) {
					String county_str =this.select3(cityID);
					response.getWriter().print(county_str);
				}else if (type.equals("town")) {
					String town_str =this.select4(countyID);
					response.getWriter().print(town_str);
				}else if (type.equals("village")) {
					String village_str =this.select5(townID);
					response.getWriter().print(village_str);
				}
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	 public String select1() {
	        StringBuffer sb = new StringBuffer();
	        sb.append("[");
	        
	        List<Map<String, Object>> list = userService.getProvince();
			for(Map<String, Object> m : list)
			{
			 String provice_id=m.get("provice_id").toString();
			 String provice_name=(String) m.get("provice_name");
			 sb.append("{");
	         sb.append("\"ProvinceID\":\"" + provice_id + "\",\"ProvinceName\":\"" + provice_name + "\"");
	         sb.append("},");
			}
			sb.delete((sb.length()-1), sb.length());
			sb.append("]");
			String str=sb.toString();
	        return str;
	    }


	    public String  select2 (String  provice_id ) {
	    	if(StringUtils.isEmpty(provice_id)||provice_id.equals("0")){
	    		return null;
	    	}
	        StringBuffer sb = new StringBuffer();
	        List<Map<String, Object>> list = userService.getCity(provice_id);
	        sb.append ( "[" );
	    	for(Map<String, Object> m : list) {
	    		 String city_id=m.get("city_id").toString();
				 String city_name=(String) m.get("city_name");
	            sb.append ( "{" );
	            sb.append ( "\"CityID\":\"" + city_id + "\",\"CityName\":\"" + city_name + "\"" );
	            sb.append ( "}," );
	        }
	    	sb.delete((sb.length()-1), sb.length());
			sb.append("]");
	        return sb.toString();
	    }
	    
	    public String select3(String city_id) {
	    	if(StringUtils.isEmpty(city_id)||city_id.equals("0")){
	    		return null;
	    	}
	        StringBuffer sb = new StringBuffer();
	        List<Map<String, Object>> list = userService.getCounty(city_id);
	      
	        sb.append("[");
	        for(Map<String, Object> m : list)
	        {
	        	 String county_id=m.get("county_id").toString();
				 String county_name=(String) m.get("county_name");
	            sb.append("{");
	            sb.append("\"county_id\":\"" + county_id + "\",\"county_name\":\"" + county_name + "\"");
	            sb.append("},");
	        }
	    	sb.delete((sb.length()-1), sb.length());
			sb.append("]");
	        return sb.toString();
	    }
	
	    public String select4(String countyID) {
	    	if(StringUtils.isEmpty(countyID)||countyID.equals("0")){
	    		return null;
	    	}
	        StringBuffer sb = new StringBuffer();
	        List<Map<String, Object>> list = userService.getTown(countyID);
	      
	        sb.append("[");
	        for(Map<String, Object> m : list)
	        {
	        	 String town_id=m.get("town_id").toString();
				 String town_name=(String) m.get("town_name");
	            sb.append("{");
	            sb.append("\"town_id\":\"" + town_id + "\",\"town_name\":\"" + town_name + "\"");
	            sb.append("},");
	        }
	    	sb.delete((sb.length()-1), sb.length());
			sb.append("]");
	        return sb.toString();
	    }
	
	    public String select5(String town_id) {
	    	if(StringUtils.isEmpty(town_id)||town_id.equals("0")){
	    		return null;
	    	}
	        StringBuffer sb = new StringBuffer();
	        List<Map<String, Object>> list = userService.getVillage(town_id);
	      
	        sb.append("[");
	        for(Map<String, Object> m : list)
	        {
	        	 String village_id=m.get("village_id").toString();
				 String village_name=(String) m.get("village_name");
	            sb.append("{");
	            sb.append("\"village_id\":\"" + village_id + "\",\"village_name\":\"" + village_name + "\"");
	            sb.append("},");
	        }
	    	sb.delete((sb.length()-1), sb.length());
			sb.append("]");
	        return sb.toString();
	    }
	
	
}
