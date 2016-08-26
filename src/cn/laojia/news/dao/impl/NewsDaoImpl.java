package cn.laojia.news.dao.impl;

import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.springframework.stereotype.Repository;

import cn.laojia.common.BaseDaoImpl;
import cn.laojia.common.PageModel;
import cn.laojia.news.dao.NewsDao;
import cn.laojia.news.model.News;


@Repository
public class NewsDaoImpl extends BaseDaoImpl implements NewsDao{
	
	/**
	 * ��SQL ���з�ҳ
	 */
	public PageModel getNewsList(PageModel model) {
	    String sql=" SELECT @rowno:=@rowno+1 as rowno, n.news_title,n.create_time,case na.approve_state when 0 then 'δ���'  when 1 then '���ͨ��'   when 2 then '��˲�ͨ��' else '����' end  as approve_state  from news n,news_approve na,(select @rowno:=0) t where n.news_id=na.news_id";
		//List<News>  lists=getHibernateTemplate().find(hql);//������
	    Session session= super.getSession();
	    //1.����
	    SQLQuery query1 = session.createSQLQuery(sql);
	    List newslist1 = query1.list();
	    model.setRecordCount(newslist1.size());
	    
	    //2.��ҳ��ѯ
	    SQLQuery query = session.createSQLQuery(sql);
	    query.setFirstResult(model.getStartRow());//�ӵ�һ����¼��ʼ
	    query.setMaxResults(model.getEndRow());//ȡ��������¼
	    List newslist = query.list();
		model.setDatas(newslist);
		return model;
	}
	public Serializable save(final Object model) {
		return  super.save(model);
	}
	public void update(final Object model) {
		super.update(model);
	}
	public void delete(final Object model) {
		super.delete(model);
	}
	/**
	 * ������ϢID����ȡ��Ϣ
	 */
	public News findNewsById(int id){
		Object obj =super.get(News.class, id);
		return (News) obj;
	}
	
	 public  String getJson(String tableName,String select,String where,String orderby,int pageIndex,int pageCount){
         StringBuilder sb=new StringBuilder();
         sb.append("select "+select+" from "+tableName);
         if(!"".equals(where)){
        	 sb.append(" ");
        	 if(where.startsWith("where")){
        		 sb.append(" "+where);
        	 }else{
        		 sb.append(" where "+where);
        	 }
         }
         sb.append(" "+orderby+" ");
         int temp=(pageIndex-1) * pageCount;
         sb.append(" limit "+temp+","+pageCount);
         List list = super.find(sb.toString());
    	 //RowSet rt=DBop.search(sb.toString());
    	 //����������Ŀ��
         int rowNum=0;
        // rowNum=DBop.getNum(tableName,where);
    	 return null;
     }
	/**
	 * �����û�������������û��Ƿ����
	 */
	public List<News> getListUsers(News news) {
		List<News>  lists=super.findByExample(news);
		return lists;
	}
	/**
	 * �����û��������û��Ƿ����
	 * @param username
	 * @return
	 */
	public boolean findUserByName(String username){
		boolean is_exist=false;
		String hql="from User u where u.username=?";
		List list =super.getHibernateTemplate().find(hql, username);
		if(list!=null&&list.size()>0){
			is_exist=true;
		}
		return is_exist;
	}
	/**
	 * ��ȡʡ���б�
	 * @return
	 */
	public List getProvince(){
		String sql = "SELECT * FROM j_position_provice";
		List<Map<String, Object>> list =  getJdbcTemplate().queryForList(sql);
		if(list!=null&&list.size()>0){
			return list;
		}else{
			return null;
		}
	}
	
	/**
	 * ��ȡ�е��б�
	 * @return
	 */
	public List getCity(String provice_id) {
		String sql = "SELECT s.city_id ,s.city_name FROM j_position_city  s  where s.province_id="+provice_id;
		List<Map<String, Object>> list =  getJdbcTemplate().queryForList(sql);
		if(list!=null&&list.size()>0){
			return list;
		}else{
			return null;
		}
	}
	/**
	 * ��ȡ�����б�
	 * @return
	 */
	public List getCounty(String city_id) {
		String sql = "SELECT s.county_id ,s.county_name FROM j_position_county  s  where s.city_id="+city_id;
		List<Map<String, Object>> list =  getJdbcTemplate().queryForList(sql);
		if(list!=null&&list.size()>0){
			return list;
		}else{
			return null;
		}
	}
	/**
	 * ��ȡ����б�
	 * @return
	 */
	public List getTown(String countyID) {
		String sql = "SELECT s.town_id ,s.town_name FROM j_position_town s where s.county_id="+countyID;
		List<Map<String, Object>> list =  getJdbcTemplate().queryForList(sql);
		if(list!=null&&list.size()>0){
			return list;
		}else{
			return null;
		}
	}
	
	/**
	 * ��ȡ����б�
	 * @return
	 */
	public List getVillage(String town_id) {
		String sql = "SELECT s.village_id ,s.village_name FROM j_position_village s where s.town_id="+town_id;;
		List<Map<String, Object>> list =  getJdbcTemplate().queryForList(sql);
		if(list!=null&&list.size()>0){
			return list;
		}else{
			return null;
		}
	}
	
	/**
	 * ���ݼ����ID����ȡ����ĵ�ַ
	 * @param village_id
	 * @return
	 */
	public String getHomeTownAddress(String village_id){
		String sql = "SELECT concat(j.province_name,j.city_name,j.county_name,j.town_name,j.village_name) from j_position  j where j.village_id=?";
	     // ��������ΪString(String.class)
		String address="";
		try {
		    address=this.getJdbcTemplate().queryForObject(sql, String.class, village_id);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return address;
	}
	
	
	/*public void addUser(User user){
		String SQL = "insert into user1(username,password) values(' "+user.getUsername() + "' ,'"  
					+ user.getPassword()+"')";
		 getJdbcTemplate().execute(SQL); 
	}
	
	public List<User> findAll(){
				
		List<User> users = new ArrayList<User>();
		List<Map<String, Object>> list =  getJdbcTemplate().queryForList("select * from user1");
		for(Map<String, Object> m : list)
		{
			User u = new User();
			u.setId((Integer)m.get("id"));
			u.setLogin_name((String)m.get("login_name"));
			u.setUsername((String)m.get("username"));
			u.setPassword((String)m.get("password"));
			u.setDescription((String)m.get("description"));
			users.add(u);
		}
		return users;		
	}*/
}
