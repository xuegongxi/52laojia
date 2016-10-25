package cn.laojia.news.dao;

import java.util.HashMap;
import java.util.List;

import cn.laojia.common.PageModel;
import cn.laojia.news.model.News;
import cn.laojia.news.model.NewsApprove;
import cn.laojia.user.model.User;

public interface NewsDao {
	public PageModel getNewsList(PageModel model,User user);
	public PageModel getNewsListByAdmin(PageModel model,HashMap<String,String> map_parameter);
	/**
	 *  根据用户名和密码查找用户是否存在
	 * @param user
	 * @return
	 */
	public List<News> getListUsers(News news);
	/**
	 * 根据信息类型查找信息列表
	 * @param news_type
	 * @return
	 */
	public List<News> getNewListByType(String news_type);
	public Object save(final Object model);
	public void update(final Object model);
	public void delete(final Object model);
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
	
	/**
	 * 审核信息
	 * @param approve
	 * @param news_id
	 */
	public void approveNews(NewsApprove approve,String news_id);
}
 
