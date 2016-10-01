package cn.laojia.news.service;

import java.util.HashMap;
import java.util.List;

import cn.laojia.common.PageModel;
import cn.laojia.news.model.News;
import cn.laojia.user.model.User;

public interface NewsService {
	
	public PageModel getNewsList(PageModel model);
	public PageModel getNewsListByAdmin(PageModel model,HashMap<String,String> map_parameter);
	
	/**
	 * 根据用户名和密码查找用户是否存在
	 * @param user
	 * @return
	 */
	public List<News> getListUsers(News news);
	public void saveNews(News news, User user);
	public void delete(Object obj);
	//根据信息ID，获取信息
	public News findNewsById(int id);
	/**
	 * 根据用户名查找用户是否存在
	 * @param username
	 * @return
	 */
	public boolean findUserByName(String username);
	
	/**
	 * 获取省的列表
	 * @return
	 */
	public List getProvince();
	

	/**
	 * 获取市的列表
	 * @return
	 */
	public List getCity(String provice_id);
	/**
	 * 获取区的列表
	 * @return
	 */
	public List getCounty(String city_id);
	/**
	 * 获取镇的列表
	 * @return
	 */
	public List getTown(String countyID);
	
	/**
	 * 获取村的列表
	 * @return
	 */
	public List getVillage(String town_id);
	
	/**
	 * 根据家乡的ID，获取家乡的地址
	 * @param village_id
	 * @return
	 */
	public String getHomeTownAddress(String village_id);
	
}
