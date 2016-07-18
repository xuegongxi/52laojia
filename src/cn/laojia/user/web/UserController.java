package cn.laojia.user.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.mvc.support.RedirectAttributesModelMap;

import cn.laojia.user.model.User;
import cn.laojia.user.service.UserService;

@Controller
@SessionAttributes({"username"})//��ModelMap����������Ϊu���ٷ���session�С�������request��session�ж����ˡ�
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
		User st = new User();
		st.setUsername(username);
		st.setPassword(psw);
	    List<User> list=userService.getListUsers(st);
	    if(list!=null&&list.size()>0){
	    	modelMap.addAttribute("username",username);  //��u����request�������У�����ת��ҳ��Ҳ����ȡ��������ݡ�
	    	User user = list.get(0);
	    	modelMap.addAttribute("email", user.getEmail());
	    	modelMap.addAttribute("phone", user.getPhone());
	    	//return "view/person_main";
	    	return "redirect:view/person_main.jsp";   
	    }else{
	    	modelMap.put("loginerror", "�û�����������������µ�¼��");
	    	return "login";
	    }
	}
	/**
	 * �û��˳���¼
	 * @param request
	 * @param modelMap
	 * @return
	 */
	@RequestMapping(params = "method=loginout")
	public String loginout(HttpServletRequest request, ModelMap modelMap){
		String username = (String) request.getParameter("username");
		if(StringUtils.isNotEmpty(username)){
			HttpSession session = request.getSession();// ��ֹ����Session
			if (session == null) {
				return "index";
			}
			//session.removeAttribute(username);
			modelMap.addAttribute("username","");
			//session.invalidate();
			return "redirect:user.do?method=index";
			//return "index";
			
		}else{
			return "error";
		}
		
	}
	/**
	 * ����û���ʱ������û��Ƿ��Ѿ���¼�������¼��ת��������ҳ������Ѿ�ע������ת����ҳ��
	 * @param request
	 * @param modelMap
	 * @return
	 */
	
	@RequestMapping(params = "method=checklogin")
	public String checklogin(HttpServletRequest request, ModelMap modelMap){
		String username = (String) request.getParameter("username");
		if(StringUtils.isNotEmpty(username)){
			HttpSession session = request.getSession();// ��ֹ����Session
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
	     return "forward:user.do?method=save1"; //ת��
        //return "redirect:user.do?method=save";  //�ض���
	}
	
	@RequestMapping(params = "method=save")
	public String save(HttpServletRequest request, ModelMap modelMap){
		String username = (String) request.getParameter("username");
		String psw = (String) request.getParameter("password");
		String password2 = (String) request.getParameter("password2");
		String phone = (String) request.getParameter("phone");
		String email = (String) request.getParameter("email");
		User st = new User();
		st.setUsername(username);
		st.setPassword(psw);
		st.setEmail(email);
		st.setPassword2(password2);
		st.setPhone(phone);
		//1.���ȼ���û��Ƿ����
		boolean is_exist=userService.findUserByName(username);
		 if(is_exist){
			 modelMap.put("registererror", "���û��Ѵ��ڣ���������û�������ע��!"); 
			 return "register";
		 }else{
			 try{
					userService.save(st);
					modelMap.put("addstate", "ע��ɹ���");
					modelMap.addAttribute("username",username);
				}
				catch(Exception e){
					log.error(e.getMessage());
					modelMap.put("addstate", "ע��ʧ�ܣ�");
				} 
		 }
		 return "register_success";
		//return "forward:index.jsp";
	}
	
	
	
	@RequestMapping(params = "method=del")
	public void del(@RequestParam("id") String id, HttpServletResponse response){
		try{
			User st = new User();
			st.setUserid(Integer.valueOf(id));
			userService.delete(st);
			response.getWriter().print("{\"del\":\"true\"}");
		}
		catch(Exception e){
			log.error(e.getMessage());
			e.printStackTrace();
		}
	}
}