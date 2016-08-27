package cn.laojia.news.service.impl;

import java.util.Date;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.laojia.common.PageModel;
import cn.laojia.news.dao.NewsDao;
import cn.laojia.news.model.News;
import cn.laojia.news.model.NewsApprove;
import cn.laojia.news.service.NewsService;
import cn.laojia.user.model.User;

@Service
public class NewsServiceImpl implements NewsService {

	@Resource//@Autowired
	private NewsDao newsDao;
	
	public NewsServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	public PageModel getNewsList(PageModel model) {
		return newsDao.getNewsList(model);
	}
	//根据信息ID，获取信息
	public News findNewsById(int id){
		return newsDao.findNewsById(id);
	}
	/**
	 * 事务 没有起作用
	 */
	public void save(News news, User user){
		//1.保存新闻信息
		int news_id=(int) newsDao.save(news);
		//2.保存信息审核信息
		NewsApprove approve = new  NewsApprove();
		approve.setCreate_time(new Date());
		approve.setNews_create_userid(user.getUserid());
		approve.setNews_id(news_id);
		newsDao.save(approve);
		
	}
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
}
