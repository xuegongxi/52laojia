package cn.laojia.user.dao;

import java.util.List;

import cn.laojia.user.model.User;

public interface UserDao {
	public List<User> getListUsers();
	
	/**
	 *  根据用户名和密码查找用户是否存在
	 * @param user
	 * @return
	 */
	public List<User> getListUsers(User user);
	public Object save(final Object model);
	public void update(final Object model);
	public void delete(final Object model);
	/**
	 * 根据用户名查找用户是否存在
	 * @param username
	 * @return
	 */
	public boolean findUserByName(String username);
}
 
