package cn.laojia.index.dao;

import java.util.List;

import cn.laojia.common.PageModel;
import cn.laojia.user.model.User;

public interface IndexDao {
	public List<User> getListUsers();
	
	/**
	 *  �����û�������������û��Ƿ����
	 * @param user
	 * @return
	 */
	public List<User> getListUsers(User user);
	public Object save(final Object model);
	public void update(final Object model);
	public void delete(final Object model);
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
	
	public PageModel getNewsList(PageModel model);

}
 
