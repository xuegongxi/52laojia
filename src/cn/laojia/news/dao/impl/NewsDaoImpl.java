package cn.laojia.news.dao.impl;

import java.io.Serializable;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Repository;

import cn.laojia.common.BaseDaoImpl;
import cn.laojia.common.PageModel;
import cn.laojia.news.dao.NewsDao;
import cn.laojia.news.model.News;
import cn.laojia.news.model.NewsApprove;
import cn.laojia.user.model.User;


@Repository
public class NewsDaoImpl extends BaseDaoImpl implements NewsDao{
	
	/**
	 * 纯SQL 进行分页
	 */
	public PageModel getNewsList(PageModel model,User user) {
	    String sql=" SELECT @rowno:=@rowno+1 as rowno, n.news_id,n.news_title,date_format(n.create_time,'%Y-%c-%d') create_time,(select k.enum_name from lj_enum k WHERE k.enum_code=na.approve_state)  approve_state  from news n,news_approve na,(select @rowno:=0) t where na.news_create_userid= "+user.getUserid()+" and n.news_id=na.news_id and n.is_delete=0  order by create_time desc";
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
	/**
	 * 纯SQL 进行分页
	 */
	//keywords=为&news_person=额为为&approve_status=&news_type=0&is_delte=1&start_date=2016-08-30&end_date=2016-08-31

	/*SELECT @rowno:=@rowno+1 as rowno, n.news_id,n.news_title, (select k.enum_name from lj_enum k WHERE k.enum_code=n.news_type) news_type,     n.news_person,date_format(n.create_time,'%Y-%c-%d') create_time, 
			(select k.enum_name from lj_enum k WHERE k.enum_code=na.approve_state) approve_state
			 from news n,news_approve na,(select @rowno:=0) t where n.news_id=na.news_id and 1=1
	*/
	
	public PageModel getNewsListByAdmin(PageModel model,HashMap<String,String> map_parameter) {
		StringBuffer sb = new StringBuffer();
	   sb.append("SELECT @rowno:=@rowno+1 as rowno, n.news_id,n.news_title, (");
	   sb.append("select k.enum_name from lj_enum k WHERE k.enum_code=n.news_type ");
	   sb.append(") news_type,  n.news_person,date_format(n.create_time,'%Y-%c-%d') create_time,");
	   sb.append(" ( select k.enum_name from lj_enum k WHERE k.enum_code=na.approve_state) approve_state ");
	   sb.append(" from news n,news_approve na,(select @rowno:=0) t where n.news_id=na.news_id and n.is_delete=0 and 1=1");
	   
	    //String sql=" SELECT @rowno:=@rowno+1 as rowno, n.news_id,n.news_title,date_format(n.create_time,'%Y-%c-%d') create_time,case na.approve_state when 0 then '未审核'  when 1 then '审核通过'   when 2 then '审核不通过' else '其他' end  as approve_state  from news n,news_approve na,(select @rowno:=0) t where n.news_id=na.news_id and 1=1";
		//List<News>  lists=getHibernateTemplate().find(hql);//方法二
	    if(!map_parameter.isEmpty()){
	    	if(map_parameter.containsKey("keywords")){
	    		String value=map_parameter.get("keywords");
	    		if (StringUtils.isNotEmpty(value)&&!value.equals("null")) {
	    			sb.append(" and n.news_title like '%");
	    			sb.append(value);
	    			sb.append("%'");
	    			//sql+=" and n.news_title like '%"+value+"%' ";
				}
	    	}
	    	if(map_parameter.containsKey("news_person")){
	    		String value=map_parameter.get("news_person");
	    		if (StringUtils.isNotEmpty(value)&&!value.equals("null")) {
	    			//sql+=" and  n.news_person='"+value+"'";
	    			sb.append("  and  n.news_person='");
	    			sb.append(value);
	    			sb.append("'");
				}
	    	}
	    	if(map_parameter.containsKey("approve_status")){
	    		String value=map_parameter.get("approve_status");
	    		if (StringUtils.isNotEmpty(value)&&!value.equals("null")) {
	    			//sql+=" and na.approve_state="+value;
	    			sb.append(" and na.approve_state= '");
	    			sb.append(value);
	    			sb.append("'");
				}
	    	}
	    	if(map_parameter.containsKey("news_type")){
	    		String value=map_parameter.get("news_type");
	    		if (StringUtils.isNotEmpty(value)&&!value.equals("null")) {
	    			//sql+=" and n.news_type="+value;
	    			sb.append(" and n.news_type= ");
	    			sb.append(value);
				}
	    	}
	    	/*if(map_parameter.containsKey("is_delte")){
	    		String value=map_parameter.get("is_delte");
	    		if (StringUtils.isNotEmpty(value)&&!value.equals("null")) {
	    			sql+=" and n.is_delete="+value;
				}
	    	}*/
	    	if(map_parameter.containsKey("start_date")&&map_parameter.containsKey("end_date")){
    			String start_value=map_parameter.get("start_date");
    			String end_value=map_parameter.get("end_date");
    			if(StringUtils.isNotEmpty(start_value)&&StringUtils.isNotEmpty(end_value)){
    				sb.append(" and n.create_time  BETWEEN '");
	    			sb.append(start_value);
	    			sb.append("' AND '");
	    			sb.append(end_value);
	    			sb.append("'");
    				//sql+=" and n.create_time  BETWEEN '"+start_value+"' AND '"+end_value+"'";
    			}
    			
    		}	
	    }
    	sb.append(" order by create_time desc");

	    String sql =sb.toString();
	    List total = super.getJdbcTemplate().queryForList(sql);
	    model.setRecordCount(total.size());
	    
	    String sql1=sql+" limit  "+ model.getStartRow()+"," +model.getPageSize();
	    List newslist = super.getJdbcTemplate().queryForList(sql1);
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
		super.update(model);
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
	
	/**
	 * 审核信息
	 * @param approve
	 * @param news_id
	 */
	public void approveNews(NewsApprove approve,String news_id){
		StringBuffer sb = new  StringBuffer();
		sb.append("update news_approve t set t.news_approve_userid='");
		sb.append(approve.getNews_approve_userid());
		sb.append("' ,t.approve_state='");
		sb.append(approve.getApprove_state());
		sb.append("' ,t.approve_opinion= '");
		sb.append(approve.getApprove_opinion());
		sb.append("' ,t.approve_time= now()");		
		sb.append(" where t.news_id= '");
		sb.append(news_id);
		sb.append("'");

		String sql = sb.toString();
		try {
			getJdbcTemplate().execute(sql);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
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
