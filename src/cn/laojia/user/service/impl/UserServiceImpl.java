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

	/**
	 * ��ȡʡ���б�
	 * @return
	 */
	public List getProvince() {
		// TODO Auto-generated method stub
		return userDao.getProvince();
	}
     
	/**
	 * ��ȡ�е��б�
	 * @return
	 */
	public List getCity(String provice_id) {
		// TODO Auto-generated method stub
		return userDao.getCity(provice_id);
	}
	/**
	 * ��ȡ�����б�
	 * @return
	 */
	public List getCounty(String city_id) {
		// TODO Auto-generated method stub
		return userDao.getCounty(city_id);
	}
	/**
	 * ��ȡ����б�
	 * @return
	 */
	public List getTown(String countyID) {
		// TODO Auto-generated method stub
		return userDao.getTown(countyID);
	}
	
	/**
	 * ��ȡ����б�
	 * @return
	 */
	public List getVillage(String town_id) {
		// TODO Auto-generated method stub
		return userDao.getVillage(town_id);
	}
	
	/**
	 * ���ݼ����ID����ȡ����ĵ�ַ
	 * @param village_id
	 * @return
	 */
	public String getHomeTownAddress(String village_id){
		return userDao.getHomeTownAddress(village_id);
	}
}
