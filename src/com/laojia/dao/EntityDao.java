package com.laojia.dao;

import java.util.List;

import org.springframework.stereotype.Repository;
public interface EntityDao {
	public List<Object> createQuery(final String queryString);
	public Object save(final Object model);
	public void update(final Object model);
	public void delete(final Object model);
}
