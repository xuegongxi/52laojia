package com.laojia.dao;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Query;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.stereotype.Repository;

import cn.laojia.common.BaseDaoImpl;
@Repository 
public class EntityDaoImpl  extends BaseDaoImpl implements EntityDao{
	
	public List<Object> createQuery(final String queryString) {
		return (List<Object>) getHibernateTemplate().execute(
				new HibernateCallback<Object>() {
					public Object doInHibernate(org.hibernate.Session session)
							throws org.hibernate.HibernateException {
						Query query = session.createQuery(queryString);
						List<Object> rows = query.list();
						return rows;
					}
				});
	}
	public Serializable save(final Object model) {
		return super.save(model);
	}
	public void update(final Object model) {
		getHibernateTemplate().execute(new HibernateCallback<Object>() {
			public Object doInHibernate(org.hibernate.Session session)
					throws org.hibernate.HibernateException {
				session.update(model);
				return null;
			}
		});
	}
	public void delete(final Object model) {
		getHibernateTemplate().execute(new HibernateCallback<Object>() {
			public Object doInHibernate(org.hibernate.Session session)
					throws org.hibernate.HibernateException {
				session.delete(model);
				return null;
			}
		});
	}
}
