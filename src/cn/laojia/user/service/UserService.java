package cn.laojia.user.service;

import java.util.List;

import cn.laojia.user.model.User;

public interface UserService {
	public List<User> getListUsers();
	/**
	 * �����û�������������û��Ƿ����
	 * @param user
	 * @return
	 */
	public List<User> getListUsers(User user);
	public void save(User st);
	public void delete(Object obj);
	/**
	 * �����û��������û��Ƿ����
	 * @param username
	 * @return
	 */
	public boolean findUserByName(String username);
}
