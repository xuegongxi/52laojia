package cn.laojia.news.web;

import java.util.HashMap;
import java.util.Map;

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

import cn.laojia.common.CtrlUtils;
import cn.laojia.common.PageModel;
import cn.laojia.news.model.News;
import cn.laojia.news.service.NewsService;
import cn.laojia.user.model.User;

import com.zzh.json.Json;

@Controller
@RequestMapping("/news.do")
public class NewsController {
	protected final transient Log log = LogFactory
	.getLog(NewsController.class);
	@Autowired
	public NewsService newsService;
	public NewsController(){
		
	}
	private static Integer NUM = 100;
	private Map json = new HashMap(); 
	private Integer toPage;
	private Integer pageSize;
	private String keyword;

	@RequestMapping
	public void getNewsList(HttpServletRequest request,HttpServletResponse res,ModelMap modelMap){
		PageModel info = new PageModel();
		info.setPageSize(10);
		info.setCurrPageNumberFormRequest(request);

		info = newsService.getNewsList(info);
		Map map = new HashMap();
		map.put("pageCount", info.getPageCount());
		map.put("result", info.getDatas());
		String jsonStr = Json.toJson(map);
		System.out.println(jsonStr);
		CtrlUtils.writeStrRes(jsonStr, res);
		/*
      List<String []> list = new ArrayList<String []>();
		
		for(int i=0;i<NUM;i++){
			list.add(new String[]{"公司" + i,"www.add"+i + ".com","1"+i,"2"+i});
		}
		if(toPage < 1){
			toPage = 1;
		}
		if(pageSize < 1){
			pageSize = 10;
		}
		
		Integer start = (toPage - 1)*pageSize;
		Integer end = toPage*pageSize;
		int c = 0 ;
		for (Iterator iterator = list.iterator(); iterator.hasNext();) {
			String[] strings = (String[]) iterator.next();
			if(keyword != null && strings[0].indexOf(keyword) == -1){
				c ++;
				iterator.remove();
			}
		}
		String[][] data = null;

		if(start > NUM -c){
			json.put("data", data);
			json.put("totalRecord", 0);
			return "view/messageList";
		}
		
		if(end > NUM -c)end = NUM -c;
		List<String []> list1 = list.subList(start, end);
		
		data = list1.toArray(new String[list1.size()][4]);
		
		json.put("data", data);
		json.put("totalRecord", NUM - c);
		modelMap.put("list", json);*/
		
		
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
		
		//获取用户信息
		HttpSession session = request.getSession();// 防止创建Session
		 User user = (User) session.getAttribute("user");
		 try{
				 newsService.save(news,user);
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
