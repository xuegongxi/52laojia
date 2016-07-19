package cn.laojia.user.dao.impl;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import cn.laojia.common.BaseDaoImpl;
import cn.laojia.user.dao.UserDao;
import cn.laojia.user.model.User;


@Repository
public class UserDaoImpl extends BaseDaoImpl implements UserDao{
	
	public List<User> getListUsers() {
		String hql="From User";
		//List<User>  lists=hibernateTemplate.find(hql);//方法一
		List<User>  lists=getHibernateTemplate().find(hql);//方法二
		return lists;
	}
	public Serializable save(final Object model) {
		return  super.save(model);
	}
	public void update(final Object model) {
		super.update(model);
	}
	public void delete(final Object model) {
		super.delete(model);
	}
	/**
	 * 根据用户名和密码查找用户是否存在
	 */
	public List<User> getListUsers(User user) {
		List<User>  lists=super.findByExample(user);
		return lists;
	}
	/**
	 * 根据用户名查找用户是否存在
	 * @param username
	 * @return
	 */
	public boolean findUserByName(String username){
		boolean is_exist=false;
		String hql="from User u where u.username=?";
		List list =super.getHibernateTemplate().find(hql, username);
		if(list!=null&&list.size()>0){
			is_exist=true;
		}
		return is_exist;
	}
	/**
	 * 获取省的列表
	 * @return
	 */
	public List getProvince(){
		String sql = "SELECT * FROM j_position_provice";
		List<Map<String, Object>> list =  getJdbcTemplate().queryForList(sql);
		if(list!=null&&list.size()>0){
			return list;
		}else{
			return null;
		}
	}
	
	/**
	 * 获取市的列表
	 * @return
	 */
	public List getCity(String provice_id) {
		String sql = "SELECT s.city_id ,s.city_name FROM j_position_city  s  where s.province_id="+provice_id;
		List<Map<String, Object>> list =  getJdbcTemplate().queryForList(sql);
		if(list!=null&&list.size()>0){
			return list;
		}else{
			return null;
		}
	}
	/**
	 * 获取区的列表
	 * @return
	 */
	public List getCounty(String city_id) {
		String sql = "SELECT s.county_id ,s.county_name FROM j_position_county  s  where s.city_id="+city_id;
		List<Map<String, Object>> list =  getJdbcTemplate().queryForList(sql);
		if(list!=null&&list.size()>0){
			return list;
		}else{
			return null;
		}
	}
	/**
	 * 获取镇的列表
	 * @return
	 */
	public List getTown(String countyID) {
		String sql = "SELECT s.town_id ,s.town_name FROM j_position_town s where s.county_id="+countyID;
		List<Map<String, Object>> list =  getJdbcTemplate().queryForList(sql);
		if(list!=null&&list.size()>0){
			return list;
		}else{
			return null;
		}
	}
	
	/**
	 * 获取村的列表
	 * @return
	 */
	public List getVillage(String town_id) {
		String sql = "SELECT s.village_id ,s.village_name FROM j_position_village s where s.town_id="+town_id;;
		List<Map<String, Object>> list =  getJdbcTemplate().queryForList(sql);
		if(list!=null&&list.size()>0){
			return list;
		}else{
			return null;
		}
	}
	
	/**
	 * 根据家乡的ID，获取家乡的地址
	 * @param village_id
	 * @return
	 */
	public String getHomeTownAddress(String village_id){
		String sql = "SELECT concat(j.province_name,j.city_name,j.county_name,j.town_name,j.village_name) from j_position  j where j.village_id=?";
	     // 返回类型为String(String.class)
		return this.getJdbcTemplate().queryForObject(sql, String.class, village_id);
	}
	
	
	/*public void addUser(User user){
		String SQL = "insert into user1(username,password) values(' "+user.getUsername() + "' ,'"  
					+ user.getPassword()+"')";
		 getJdbcTemplate().execute(SQL); 
	}
	
	public List<User> findAll(){
				
		List<User> users = new ArrayList<User>();
		List<Map<String, Object>> list =  getJdbcTemplate().queryForList("select * from user1");
		for(Map<String, Object> m : list)
		{
			User u = new User();
			u.setId((Integer)m.get("id"));
			u.setLogin_name((String)m.get("login_name"));
			u.setUsername((String)m.get("username"));
			u.setPassword((String)m.get("password"));
			u.setDescription((String)m.get("description"));
			users.add(u);
		}
		return users;		
	}*/
}
