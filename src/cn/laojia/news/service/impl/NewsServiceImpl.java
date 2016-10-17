package cn.laojia.news.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.laojia.common.PageModel;
import cn.laojia.news.dao.NewsDao;
import cn.laojia.news.model.News;
import cn.laojia.news.model.NewsApprove;
import cn.laojia.news.service.NewsService;
import cn.laojia.user.model.User;
import cn.laojia.utils.DictEnum;

@Service
public class NewsServiceImpl implements NewsService {

	@Resource//@Autowired
	private NewsDao newsDao;
	
	public NewsServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	public PageModel getNewsList(PageModel model,User user) {
		return newsDao.getNewsList(model,user);
	}
	
	public PageModel getNewsListByAdmin(PageModel model,HashMap<String,String> map_parameter) {
		return newsDao.getNewsListByAdmin(model,map_parameter);
	}
	
	//根据信息ID，获取信息
	public News findNewsById(int id){
		return newsDao.findNewsById(id);
	}
	/**
	 * 事务 起作用
	 */
	@Transactional
	public void saveNews(News news, User user){
		try {
			//1.保存新闻信息
			int news_id=(int) newsDao.save(news);
			//2.保存信息审核信息
			NewsApprove approve = new  NewsApprove();
			approve.setCreate_time(new Date());
			approve.setNews_create_userid(user.getUserid());
			approve.setNews_id(news_id);
			approve.setApprove_state(DictEnum.News_Approve.NEWS_APPROVE_NOSTART);
			newsDao.save(approve);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new RuntimeException();
		}
		
	}
	@Transactional
	public void delete(Object obj){
		newsDao.delete(obj);
	}

    /**
     * 根据用户名和密码查找用户是否存在
    */
	public List<News> getListUsers(News news) {
		return newsDao.getListUsers(news);
	}

	/**
	 * 根据用户名查找用户是否存在
	 */
	public boolean findUserByName(String username) {
		return newsDao.findUserByName(username);
	}

	/**
	 * 获取省的列表
	 * @return
	 */
	public List getProvince() {
		// TODO Auto-generated method stub
		return newsDao.getProvince();
	}
     
	/**
	 * 获取市的列表
	 * @return
	 */
	public List getCity(String provice_id) {
		// TODO Auto-generated method stub
		return newsDao.getCity(provice_id);
	}
	/**
	 * 获取区的列表
	 * @return
	 */
	public List getCounty(String city_id) {
		// TODO Auto-generated method stub
		return newsDao.getCounty(city_id);
	}
	/**
	 * 获取镇的列表
	 * @return
	 */
	public List getTown(String countyID) {
		// TODO Auto-generated method stub
		return newsDao.getTown(countyID);
	}
	
	/**
	 * 获取村的列表
	 * @return
	 */
	public List getVillage(String town_id) {
		// TODO Auto-generated method stub
		return newsDao.getVillage(town_id);
	}
	
	/**
	 * 根据家乡的ID，获取家乡的地址
	 * @param village_id
	 * @return
	 */
	public String getHomeTownAddress(String village_id){
		return newsDao.getHomeTownAddress(village_id);
	}

	/**
	 * 审核信息
	 * @param approve
	 * @param news_id
	 */
	public void approveNews(NewsApprove approve,String news_id){
		newsDao.approveNews(approve,news_id);
	}
}
