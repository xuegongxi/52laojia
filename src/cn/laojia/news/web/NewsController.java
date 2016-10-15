package cn.laojia.news.web;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import cn.laojia.common.CtrlUtils;
import cn.laojia.common.ImagesUtil;
import cn.laojia.common.PageModel;
import cn.laojia.news.model.News;
import cn.laojia.news.model.NewsApprove;
import cn.laojia.news.service.NewsService;
import cn.laojia.user.model.User;
import cn.laojia.utils.DictEnum;



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
		String jsonStr = JSONObject.fromObject(map).toString();
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
	@RequestMapping(params = "method=getNewsListByAdmin")
	public void getNewsListByAdmin(HttpServletRequest request,HttpServletResponse res,ModelMap modelMap){
		String url_parameters="";
		try {
			System.out.println("on参数列表-----------------------"+pageSize);
			Map<String,String[]> map = request.getParameterMap();
			for(Map.Entry<String,String[]> entry :map.entrySet()){
					String key = entry.getKey();
					System.out.print("key:"+key);
					String str = new String(request.getParameter(key).getBytes("ISO-8859-1"),"UTF-8");
                    if(key.equals("url_param")){
                    	url_parameters=str;
					}
					System.out.println("---value:"+str);
			}
			System.out.println("end参数列表-----------------------");
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//keywords=为&news_person=额为为&approve_status=&news_type=0&is_delte=1&start_date=2016-08-30&end_date=2016-08-31
		//1.先按照&拆分
		HashMap<String,String> map_parameter = new HashMap<String,String>();
		if (StringUtils.isNotEmpty(url_parameters)&&!url_parameters.equals("null")&&url_parameters!="") {
			String[] split = url_parameters.split("&");
			for (int i = 0; i < split.length; i++) {
				String str_split=split[i];
				   String[] split_2 = str_split.split("=");
				   String key =split_2[0];
				   if(split_2.length>1){
					   String value =split_2[1];
					   map_parameter.put(key, value);
				   }else{
					   map_parameter.put(key, "");
				   }
			}
			
		}
		
		PageModel info = new PageModel();
		info.setPageSize(10);
		info.setCurrPageNumberFormRequest(request);

		info = newsService.getNewsListByAdmin(info,map_parameter);
		Map map1 = new HashMap();
		map1.put("pageCount", info.getPageCount());
		map1.put("result", info.getDatas());
		String jsonStr = JSONObject.fromObject(map1).toString();
		System.out.println(jsonStr);
		CtrlUtils.writeStrRes(jsonStr, res);
		
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
	public String save(HttpServletRequest request, HttpServletResponse response,ModelMap modelMap){
		//获取用户信息
		HttpSession session = request.getSession();// 防止创建Session
	    User user = (User) session.getAttribute("user");
		
		String news_content = request.getParameter("editorValue");
		
		
		//项目路径
		String path =request.getRealPath("/") ;
		String imgstr=null;
		System.out.println(path);
		//获取上传图片的路径
		List imgstr_list =this.getImgSrc(news_content);
		if(imgstr_list!=null&&imgstr_list.size()>0){
			 imgstr=(String) imgstr_list.get(0);
		}
		//原始图片地址
		String imgPath=path+imgstr;
		//压缩后图片地址
		String img_change=ImagesUtil.ChangeFileNameByPath(imgstr);
		String imgPath_change=path+img_change;
		//压缩图片
		ImagesUtil.zipImageFile(new File(imgPath),new File(imgPath_change),200,0,0.7f);  

		
		String news_title = request.getParameter("news_title");
		String news_summary = request.getParameter("news_summary");
		String news_type = request.getParameter("news_type");
		String news_from = request.getParameter("news_from");
		String province =request.getParameter("S1");
		String city =request.getParameter("S2");
		String county =request.getParameter("S3");
		String town =request.getParameter("S4");
		String village =request.getParameter("S5");
		News news = new News();
		news.setImg_path(img_change);
		news.setNews_person(user.getUsername());
		news.setNews_title(news_title);
		news.setNews_summary(news_summary);
		news.setNews_from(news_from);
		news.setNews_content(news_content.getBytes());
		news.setNews_type(news_type);
		news.setNews_address(village);
		news.setCreate_time(new Date());
		news.setIs_delete(0);
		
		boolean save_yes=true;
		try {
			 newsService.saveNews(news,user);
		} catch (Exception e) {
			save_yes=false;
		    e.printStackTrace();
		}
		//返回信息
		response.setContentType("text/html;charset=gb2312");
	    try {
			PrintWriter out = response.getWriter();
			if(save_yes){
			out.print("<script language=\"javascript\">alert('添加成功！');</script>");
			return "/view/messageList";
			}else{
			  out.print("<script language=\"javascript\">alert('添加失败！');history.go(-1);</script>");
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public List<String> getImgSrc(String htmlStr) {
		String img = "";
		Pattern p_image;
		Matcher m_image;
		List<String> pics = new ArrayList<String>();
		// String regEx_img = "<img.*src=(.*?)[^>]*?>"; //图片链接地址
		String regEx_img = "<img.*src\\s*=\\s*(.*?)[^>]*?>";
		p_image = Pattern.compile(regEx_img, Pattern.CASE_INSENSITIVE);
		m_image = p_image.matcher(htmlStr);
		while (m_image.find()) {
			img = img + "," + m_image.group();
			// Matcher m =
			// Pattern.compile("src=\"?(.*?)(\"|>|\\s+)").matcher(img); //匹配src
			Matcher m = Pattern.compile("src\\s*=\\s*\"?(.*?)(\"|>|\\s+)")
					.matcher(img);
			while (m.find()) {
				pics.add(m.group(1));
			}
		}
		return pics;
	}
	
	@RequestMapping(params = "method=del")
	public void del(@RequestParam("id") String id, HttpServletResponse response){
		try{
			News news = newsService.findNewsById(Integer.valueOf(id));
			news.setIs_delete(1);//逻辑删除
			newsService.delete(news);
			response.getWriter().print("{\"del\":\"true\"}");
		}
		catch(Exception e){
			log.error(e.getMessage());
			e.printStackTrace();
		}
	}
	
	@RequestMapping(params = "method=approveNews")
	public void approveNews(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response){
		boolean approve_success=true;
		//获取用户信息
		HttpSession session = request.getSession();// 防止创建Session
		User user = (User) session.getAttribute("user");
		
		String approve_status=request.getParameter("approve_status");
		String news_comment=request.getParameter("news_comment");
		try{
			NewsApprove approve = new  NewsApprove();
			approve.setApprove_time(new Date());
			approve.setApprove_state(approve_status);
			approve.setApprove_opinion(news_comment);
			approve.setNews_approve_userid(user.getUserid());
			newsService.approveNews(approve,id);
		}
		catch(Exception e){
			approve_success=false;
			log.error(e.getMessage());
			e.printStackTrace();
		}
		
		try {
			if(approve_success){
				response.getWriter().print("{\"approve\":\"true\"}");
			}else{
				response.getWriter().print("{\"approve\":\"false\"}");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	
	
}
