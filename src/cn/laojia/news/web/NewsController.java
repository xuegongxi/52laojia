package cn.laojia.news.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang3.StringUtils;
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
	public String getNewsList(ModelMap modelMap){
		List<News> list = newsService.getNewsList();
		/*if(list!=null&&list.size()>0){
			for (int i = 0; i < list.size(); i++) {
				News news = list.get(i);
				String s=news.getContent();
				System.out.println(s);
				
				
				
			}
			
		}*/
		
		modelMap.put("list", list);
		return "view/messageList";
	}
	
	@RequestMapping(params = "method=news_detail")
	public String news_detail(HttpServletRequest request, ModelMap modelMap){
		String news_id= request.getParameter("news_id");
		News  news=null;
		if(StringUtils.isNotBlank(news_id)){
			  news = newsService.findNewsById(Integer.valueOf(news_id));
		}
		
		modelMap.put("newscontent",news.getContent());
	  
		return "/view/news_detail";  
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
		news.setNews_content(news_content.getBytes());
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
		 return "redirect:news.do?method=getNewsList";
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
