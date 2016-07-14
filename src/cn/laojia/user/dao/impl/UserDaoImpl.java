package cn.laojia.user.dao.impl;

import java.io.Serializable;
import java.util.List;

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
