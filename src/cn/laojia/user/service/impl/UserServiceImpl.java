package cn.laojia.user.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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
	@Transactional
	public void save(User st){
		userDao.save(st);
	}
	public void delete(Object obj){
		userDao.delete(obj);
	}

    /**
     * 根据用户名和密码查找用户是否存在
    */
	public List<User> getListUsers(User user) {
		return userDao.getListUsers(user);
	}

	/**
	 * 根据用户名查找用户是否存在
	 */
	public boolean findUserByName(String username) {
		return userDao.findUserByName(username);
	}

	/**
	 * 获取省的列表
	 * @return
	 */
	public List getProvince() {
		// TODO Auto-generated method stub
		return userDao.getProvince();
	}
     
	/**
	 * 获取市的列表
	 * @return
	 */
	public List getCity(String provice_id) {
		// TODO Auto-generated method stub
		return userDao.getCity(provice_id);
	}
	/**
	 * 获取区的列表
	 * @return
	 */
	public List getCounty(String city_id) {
		// TODO Auto-generated method stub
		return userDao.getCounty(city_id);
	}
	/**
	 * 获取镇的列表
	 * @return
	 */
	public List getTown(String countyID) {
		// TODO Auto-generated method stub
		return userDao.getTown(countyID);
	}
	
	/**
	 * 获取村的列表
	 * @return
	 */
	public List getVillage(String town_id) {
		// TODO Auto-generated method stub
		return userDao.getVillage(town_id);
	}
	
	/**
	 * 根据家乡的ID，获取家乡的地址
	 * @param village_id
	 * @return
	 */
	public String getHomeTownAddress(String village_id){
		return userDao.getHomeTownAddress(village_id);
	}
}
