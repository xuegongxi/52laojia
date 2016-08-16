package cn.laojia.news.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import cn.laojia.news.dao.NewsDao;
import cn.laojia.news.model.News;
import cn.laojia.news.service.NewsService;

@Service
public class NewsServiceImpl implements NewsService {

	@Resource//@Autowired
	private NewsDao newsDao;
	
	public NewsServiceImpl() {
		// TODO Auto-generated constructor stub
	}

	public List<News> getListUsers() {
		return newsDao.getListUsers();
	}

	public void save(News news){
		newsDao.save(news);
	}
	public void delete(Object obj){
		newsDao.delete(obj);
	}

    /**
     * �����û�������������û��Ƿ����
    */
	public List<News> getListUsers(News news) {
		return newsDao.getListUsers(news);
	}

	/**
	 * �����û��������û��Ƿ����
	 */
	public boolean findUserByName(String username) {
		return newsDao.findUserByName(username);
	}

	/**
	 * ��ȡʡ���б�
	 * @return
	 */
	public List getProvince() {
		// TODO Auto-generated method stub
		return newsDao.getProvince();
	}
     
	/**
	 * ��ȡ�е��б�
	 * @return
	 */
	public List getCity(String provice_id) {
		// TODO Auto-generated method stub
		return newsDao.getCity(provice_id);
	}
	/**
	 * ��ȡ�����б�
	 * @return
	 */
	public List getCounty(String city_id) {
		// TODO Auto-generated method stub
		return newsDao.getCounty(city_id);
	}
	/**
	 * ��ȡ����б�
	 * @return
	 */
	public List getTown(String countyID) {
		// TODO Auto-generated method stub
		return newsDao.getTown(countyID);
	}
	
	/**
	 * ��ȡ����б�
	 * @return
	 */
	public List getVillage(String town_id) {
		// TODO Auto-generated method stub
		return newsDao.getVillage(town_id);
	}
	
	/**
	 * ���ݼ����ID����ȡ����ĵ�ַ
	 * @param village_id
	 * @return
	 */
	public String getHomeTownAddress(String village_id){
		return newsDao.getHomeTownAddress(village_id);
	}
}
