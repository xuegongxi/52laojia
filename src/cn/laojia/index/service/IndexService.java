package cn.laojia.index.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.laojia.common.PageModel;
import cn.laojia.user.model.User;

public interface IndexService {
	public List<User> getListUsers();
	/**
	 * 根据用户名和密码查找用户是否存在
	 * @param user
	 * @return
	 */
	public List<User> getListUsers(User user);
	public void save(User st);
	public void delete(Object obj);
	/**
	 * 根据用户名查找用户是否存在
	 * @param username
	 * @return
	 */
	public boolean findUserByName(String username);
	
	public PageModel getNewsList(PageModel model,HashMap<String,String> map_parameter);
	
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
	 * 获取枚举字典表
	 * @return
	 */
	public Map getEnum();
	
}
