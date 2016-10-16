package cn.laojia.index.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import cn.laojia.common.PageModel;
import cn.laojia.index.dao.IndexDao;
import cn.laojia.index.service.IndexService;
import cn.laojia.user.model.User;

@Service
public class IndexServiceImpl implements IndexService {

	@Resource//@Autowired
	private IndexDao indexDao;
	
	public IndexServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	public List<User> getListUsers() {
		return indexDao.getListUsers();
	}
	@Transactional
	public void save(User st){
		indexDao.save(st);
	}
	public void delete(Object obj){
		indexDao.delete(obj);
	}

    /**
     * 根据用户名和密码查找用户是否存在
    */
	public List<User> getListUsers(User user) {
		return indexDao.getListUsers(user);
	}

	/**
	 * 根据用户名查找用户是否存在
	 */
	public boolean findUserByName(String username) {
		return indexDao.findUserByName(username);
	}

	/**
	 * 获取省的列表
	 * @return
	 */
	public List getProvince() {
		// TODO Auto-generated method stub
		return indexDao.getProvince();
	}
     
	/**
	 * 获取市的列表
	 * @return
	 */
	public List getCity(String provice_id) {
		// TODO Auto-generated method stub
		return indexDao.getCity(provice_id);
	}
	/**
	 * 获取区的列表
	 * @return
	 */
	public List getCounty(String city_id) {
		// TODO Auto-generated method stub
		return indexDao.getCounty(city_id);
	}
	/**
	 * 获取镇的列表
	 * @return
	 */
	public List getTown(String countyID) {
		// TODO Auto-generated method stub
		return indexDao.getTown(countyID);
	}
	
	/**
	 * 获取村的列表
	 * @return
	 */
	public List getVillage(String town_id) {
		// TODO Auto-generated method stub
		return indexDao.getVillage(town_id);
	}
	
	/**
	 * 根据家乡的ID，获取家乡的地址
	 * @param village_id
	 * @return
	 */
	public String getHomeTownAddress(String village_id){
		return indexDao.getHomeTownAddress(village_id);
	}

	@Override
	public PageModel getNewsList(PageModel model) {
		// TODO Auto-generated method stub
		return indexDao.getNewsList(model);
	}
}
