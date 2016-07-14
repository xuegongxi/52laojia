package cn.laojia.user.service;

import java.util.List;

import cn.laojia.user.model.User;

public interface UserService {
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
}
