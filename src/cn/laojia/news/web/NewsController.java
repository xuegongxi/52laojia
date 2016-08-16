package cn.laojia.news.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cn.laojia.news.model.News;
import cn.laojia.news.service.NewsService;
import cn.laojia.user.model.User;

@Controller
@RequestMapping("/news.do")
public class NewsController {
	protected final transient Log log = LogFactory
	.getLog(NewsController.class);
	@Autowired
	public NewsService newsService;
	public NewsController(){
		
	}
	
	@RequestMapping
	public String load(ModelMap modelMap){
		List<News> list = newsService.getListUsers();
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
	
	

	
	
	@RequestMapping(params = "method=save")
	public String save(HttpServletRequest request, ModelMap modelMap){
		String news_content = request.getParameter("editorValue");
		String news_title = request.getParameter("news_title");
		String news_type = request.getParameter("news_type");
		String news_from = request.getParameter("news_from");
		String province =request.getParameter("S1");
		String city =request.getParameter("S2");
		String county =request.getParameter("S3");
		String town =request.getParameter("S4");
		String village =request.getParameter("S5");
		News news = new News();
		news.setNews_title(news_title);
		news.setNews_from(news_from);
		news.setNews_content(news_content);
		news.setNews_type(news_type);
		news.setNews_address(village);
		 try{
				 newsService.save(news);
					modelMap.put("addstate", "添加成功！");
				}
				catch(Exception e){
					log.error(e.getMessage());
					modelMap.put("addstate", "添加失败！");
				} 
		 return "view/messageList";
		//return "forward:index.jsp";
	}
	
	
	
	@RequestMapping(params = "method=del")
	public void del(@RequestParam("id") String id, HttpServletResponse response){
		try{
			User st = new User();
			st.setUserid(Integer.valueOf(id));
			newsService.delete(st);
			response.getWriter().print("{\"del\":\"true\"}");
		}
		catch(Exception e){
			log.error(e.getMessage());
			e.printStackTrace();
		}
	}
	
	
	
}
