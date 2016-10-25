package cn.laojia.index.dao.impl;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Repository;

import cn.laojia.common.BaseDaoImpl;
import cn.laojia.common.PageModel;
import cn.laojia.index.dao.IndexDao;
import cn.laojia.user.model.User;


@Repository
public class IndexDaoImpl extends BaseDaoImpl implements IndexDao{
	
	
	
	/**
	 * 纯SQL 进行分页
	 */
	public PageModel getNewsList(PageModel model,HashMap<String,String> map_parameter) {
		StringBuffer sb =new StringBuffer();
		sb.append("SELECT @rowno:=@rowno+1 as rowno, n.news_id,n.news_title,n.news_content,n.img_path, ");
		sb.append(" n.news_summary,n.news_from,date_format(n.create_time,'%Y-%c-%d %h:%i:%s') create_time ");
		sb.append("from news n,news_approve na,(select @rowno:=0) t ");
		sb.append(" where  n.news_id=na.news_id and na.approve_state='1000-2' and n.is_delete=0 and 1=1 ");
		 if(!map_parameter.isEmpty()){
			 if(map_parameter.containsKey("enum_code")){
		    		String value=map_parameter.get("enum_code");
		    		if (StringUtils.isNotEmpty(value)&&!value.equals("null")) {
		    			sb.append(" and n.news_type='");
		    			sb.append(value);
		    			sb.append("'");
					}
		    	}
		 }
		
		sb.append(" order by create_time desc");
		
	    String sql=sb.toString();
		//List<News>  lists=getHibernateTemplate().find(hql);//方法二
	    List total = super.getJdbcTemplate().queryForList(sql);
	    model.setRecordCount(total.size());
	    
	    String sql1=sql+" limit  "+ model.getStartRow()+"," +model.getPageSize();
	    List newslist = super.getJdbcTemplate().queryForList(sql1);
	    model.setDatas(newslist);
	    //hibernate 纯SQL执行 因行号的问题 hibernate3.jar有bug
	   /* Session session= super.getSession();
	    //1.总数
	    SQLQuery query1 = session.createSQLQuery(sql);
	    List newslist1 = query1.list();
	    model.setRecordCount(newslist1.size());
	    
	    //2.分页查询
	    SQLQuery query = session.createSQLQuery(sql);
	    query.setFirstResult(model.getStartRow());//从第一条记录开始
	    query.setMaxResults(model.getEndRow());//取出四条记录
	    List newslist = query.list();
		model.setDatas(newslist);*/
		return model;
	}
	
	public List<User> getListUsers() {
		String hql="From User";
		//List<User>  lists=hibernateTemplate.find(hql);//方法一
		List<User>  lists=getHibernateTemplate().find(hql);//方法二
		return lists;
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
	 * 根据用户名和密码查找用户是否存在
	 */
	public List<User> getListUsers(User user) {
		List<User>  lists=super.findByExample(user);
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

	/**
	 * 获取枚举字典表
	 * @return
	 */
	public Map getEnum() {
		Map re_map= new HashMap<String,String>();
		String sql = "select e.enum_code,e.enum_name from lj_enum e";
		List<Map<String, Object>> list =  getJdbcTemplate().queryForList(sql);
		if(list!=null&&list.size()>0){
			for (int i = 0; i < list.size(); i++) {
				Map<String, Object> map=list.get(i);
				String enum_name=(String) map.get("enum_name");
				String enum_code=(String) map.get("enum_code");
				re_map.put(enum_code, enum_name);
			}
		}else{
			return null;
		}
		return re_map;
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
