package cn.laojia.index.web;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.lang3.StringUtils;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cn.laojia.common.CtrlUtils;
import cn.laojia.common.PageModel;
import cn.laojia.index.service.IndexService;
import cn.laojia.news.model.News;
import cn.laojia.news.service.NewsService;

@Controller
@RequestMapping("/index.do")
public class IndexController {

	protected final transient Log log = LogFactory.getLog(IndexController.class);
	@Autowired
	public IndexService indexService;
	@Autowired
	public NewsService newsService;
	public IndexController() {

	}
	@RequestMapping
	public String index(HttpServletRequest request,HttpServletResponse res,ModelMap modelMap){
		
	Map map =	indexService.getEnum();
	//家乡动态
	/* <li><a href="index.do?method=newsList&enum_code=1001-0" title="" target="_blank">家乡动态</a></li>
	    <li><a href="index.do?method=newsList&enum_code=1001-4" title="" target="_blank">图说家乡</a></li>
	    <li><a href="index.do?method=newsList&enum_code=1001-3" title="" target="_blank">风土人情</a></li>
	    <li><a href="index.do?method=newsList&enum_code=1001-1" title="" target="_blank">家乡美食</a></li>
	    <li><a href="index.do?method=newsList&enum_code=1001-2" title="" target="_blank">家乡特产</a></li>*/
	  List<News> list= newsService.getNewListByType("1001-0");
	   if(list!=null&&list.size()>0){
		   News n1=list.get(0);
		   modelMap.put("jxdt_n1", n1);
		   list.remove(0);
		   modelMap.put("jxdt_list", list);
	   }
	  //家乡美食
	   List<News> jxms_list= newsService.getNewListByType("1001-1");
	   if(jxms_list!=null&&jxms_list.size()>0){
		   News n2=jxms_list.get(0);
		   modelMap.put("jxms_n2", n2);
		   jxms_list.remove(0);
		   modelMap.put("jxms_list", jxms_list);
	   }
	   
	   //家乡特产
	   List<News> jxtc_list= newsService.getNewListByType("1001-2");
	   if(jxtc_list!=null&&jxtc_list.size()>0){
		   News n3=jxtc_list.get(0);
		   modelMap.put("jxtc_n3", n3);
		   jxtc_list.remove(0);
		   modelMap.put("jxtc_list", jxtc_list);
	   }
	   //风土人情
	   List<News> jxfs_list= newsService.getNewListByType("1001-3");
	   if(jxfs_list!=null&&jxfs_list.size()>0){
		   News n4=jxfs_list.get(0);
		   modelMap.put("jxfs_n4", n4);
		   jxfs_list.remove(0);
		   modelMap.put("jxfs_list", jxfs_list);
	   }
		
	   //>图说家乡
	   List<News> tsjx_list= newsService.getNewListByType("1001-4");
	   if(tsjx_list!=null&&tsjx_list.size()>0){
		   News n5=tsjx_list.get(0);
		   modelMap.put("tsjx_n5", n5);
		   tsjx_list.remove(0);
		   modelMap.put("tsjx_list", tsjx_list);
	   }
		
		return "index";  
		
	}

	@RequestMapping(params = "method=newsList")
	public String indexMessage(HttpServletRequest request, ModelMap modelMap,RedirectAttributes ra){
		String enum_code=request.getParameter("enum_code");
	    /*RedirectView redirect = new RedirectView("/success/");
		 redirect.setExposeModelAttributes(false);
		 return redirect;*/
		modelMap.put("enum_code", enum_code);
		return "newsList";  
	}
	
	@RequestMapping(params = "method=getNewsList")
	public void getNewsList(HttpServletRequest request,HttpServletResponse res,ModelMap modelMap){
		String enum_code=request.getParameter("enum_code");
		HashMap<String,String> map_parameter =new HashMap<String,String>();
		map_parameter.put("enum_code", enum_code);
		PageModel info = new PageModel();
		info.setPageSize(10);
		info.setCurrPageNumberFormRequest(request);

		info = indexService.getNewsList(info,map_parameter);
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

		//info = newsService.getNewsListByAdmin(info,map_parameter);
		Map map1 = new HashMap();
		map1.put("pageCount", info.getPageCount());
		map1.put("result", info.getDatas());
		String jsonStr = JSONObject.fromObject(map1).toString();
		System.out.println(jsonStr);
		CtrlUtils.writeStrRes(jsonStr, res);
		
	}
}
