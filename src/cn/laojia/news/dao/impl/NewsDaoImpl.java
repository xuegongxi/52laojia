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
	 * 纯SQL 进行分页
	 */
	public PageModel getNewsList(PageModel model) {
	    String sql=" SELECT @rowno:=@rowno+1 as rowno, n.news_title,n.create_time,case na.approve_state when 0 then '未审核'  when 1 then '审核通过'   when 2 then '审核不通过' else '其他' end  as approve_state  from news n,news_approve na,(select @rowno:=0) t where n.news_id=na.news_id";
		//List<News>  lists=getHibernateTemplate().find(hql);//方法二
	    Session session= super.getSession();
	    //1.总数
	    SQLQuery query1 = session.createSQLQuery(sql);
	    List newslist1 = query1.list();
	    model.setRecordCount(newslist1.size());
	    
	    //2.分页查询
	    SQLQuery query = session.createSQLQuery(sql);
	    query.setFirstResult(model.getStartRow());//从第一条记录开始
	    query.setMaxResults(model.getEndRow());//取出四条记录
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
	 * 根据信息ID，获取信息
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
    	 //求数据总条目数
         int rowNum=0;
        // rowNum=DBop.getNum(tableName,where);
    	 return null;
     }
	/**
	 * 根据用户名和密码查找用户是否存在
	 */
	public List<News> getListUsers(News news) {
		List<News>  lists=super.findByExample(news);
		return lists;
	}
	/**
	 * 根据用户名查找用户是否存在
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
	 * 获取省的列表
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
	 * 获取市的列表
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
	 * 获取区的列表
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
	 * 获取镇的列表
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
	 * 获取村的列表
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
	 * 根据家乡的ID，获取家乡的地址
	 * @param village_id
	 * @return
	 */
	public String getHomeTownAddress(String village_id){
		String sql = "SELECT concat(j.province_name,j.city_name,j.county_name,j.town_name,j.village_name) from j_position  j where j.village_id=?";
	     // 返回类型为String(String.class)
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
