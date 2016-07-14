package cn.laojia.user.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.laojia.user.dao.UserDao;
import cn.laojia.user.model.User;
import cn.laojia.user.service.UserService;

@Service
public class UserServiceImpl implements UserService {

	@Resource//@Autowired
	private UserDao userDao;
	
	public UserServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	public List<User> getListUsers() {
		return userDao.getListUsers();
	}

	public void save(User st){
		userDao.save(st);
	}
	public void delete(Object obj){
		userDao.delete(obj);
	}

    /**
     * �����û�������������û��Ƿ����
    */
	public List<User> getListUsers(User user) {
		return userDao.getListUsers(user);
	}

	/**
	 * �����û��������û��Ƿ����
	 */
	public boolean findUserByName(String username) {
		return userDao.findUserByName(username);
	}
     
}
