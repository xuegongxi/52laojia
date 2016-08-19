package cn.laojia.news.service;

import java.util.List;

import cn.laojia.news.model.News;
import cn.laojia.user.model.User;

public interface NewsService {
	public List<News> getNewsList();
	/**
	 * �����û�������������û��Ƿ����
	 * @param user
	 * @return
	 */
	public List<News> getListUsers(News news);
	public void save(News news, User user);
	public void delete(Object obj);
	//������ϢID����ȡ��Ϣ
	public News findNewsById(int id);
	/**
	 * �����û��������û��Ƿ����
	 * @param username
	 * @return
	 */
	public boolean findUserByName(String username);
	
	/**
	 * ��ȡʡ���б�
	 * @return
	 */
	public List getProvince();
	

	/**
	 * ��ȡ�е��б�
	 * @return
	 */
	public List getCity(String provice_id);
	/**
	 * ��ȡ�����б�
	 * @return
	 */
	public List getCounty(String city_id);
	/**
	 * ��ȡ����б�
	 * @return
	 */
	public List getTown(String countyID);
	
	/**
	 * ��ȡ����б�
	 * @return
	 */
	public List getVillage(String town_id);
	
	/**
	 * ���ݼ����ID����ȡ����ĵ�ַ
	 * @param village_id
	 * @return
	 */
	public String getHomeTownAddress(String village_id);
	
}