package cn.laojia.common;

import java.io.Serializable;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;

public interface BaseDao {
	/**
     * ɾ��
     */
    public <E> void delete(E entity);
  
    public <E> List<E> find(String queryString);
    
    public <E> List<E> find(Class<E> bean);
    /**
     * �����޸Ļ�ɾ��
     */
     public int bulkUpdate(String queryString, Object[] values);
     /**
      * ����ɾ��
      */
     public <E> void deleteAll(Collection<E> entities);
    
    public List<?> find(String queryString, Object[] values);
    /**
     * ��ȡΨһʵ��
     */
    public <E> E findUniqueEntity(String queryString, Object ... params);
    
    /**
	 * ��������ҳ��ѯ
	 */
    public <E> List<E> findByPage(String queryString, Integer startRow,
	    Integer pageSize, Object... params);

    public <E> List<E> findByNamedQuery(String queryName);

    
    public <E> List<E> findByNamedQuery(String queryName, Object... values);
    
    /**
     * ��ȡ����ʵ��
     */
    public <E> E get(Class<E> entityClass, Serializable id);

    public <E> Iterator<E> iterate(String queryString);
    
    /**
     */
    public <E> Iterator<E> iterate(String queryString, Object ... values);

    /**
     */
    public <E> E load(Class<E> entityClass, Serializable id);
    
    /**
     * �־û�һ������
     */
    public <E> void persist(E entity);

    /**
     * ˢ��һ������
     */
    public <E> void refresh(E entity);
    
    /**
     * ����һ������
     */
    public <E> Serializable save(E entity);
    
    /**
     * ����һ������
     */
    public <E> void saveAll(Collection<E> entities);
    
    /**
     * ������޸�һ��ʵ��
     */
    public <E> void saveOrUpdate(E entity);
    
    /**
     * ������޸�һ������
     */
    public <E> void saveOrUpdateAll(Collection<E> entities);
    
    /**
     * �޸�һ��ʵ��
     */
    public <E> void update(E entity);
    
    /**
     * �޸�һ������
     */
    public <E> void updateAll(Collection<E> entities);

    /**
     * id��Ӧ�Ķ����Ƿ����
     */
    public <E> boolean exist(Class<E> c, Serializable id);
    
    /**
     * ͳ��������
     */
    public Integer count(String hql);
    
    /**
     * ��������ͳ��������
     */
    public Integer count(String hql, Object ... obj);
    
	/**
	 * ��������ҳ��ѯ
	 * @param queryString HQL���
	 * @param startRow ��ʼ����
	 * @param pageSize ҳ��
	 * @param params   ��������
	 * @return ��ҳ��ѯ���
	 * @see #findByPage(String, Integer, Integer, Object...)
	 */
	public <E> List<E> findByPage(String queryString, PageModel pageModel, List<?> params);
	
	
}
