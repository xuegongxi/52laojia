package com.laojia.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.laojia.dao.EntityDao;
import com.laojia.entity.Student;


@Service
public class StudentService {
	@Resource
	private EntityDao entityDao;
	
	@Transactional
	public List<Object> getStudentList(){
		StringBuffer sff = new StringBuffer();
		sff.append("select a from ").append(Student.class.getSimpleName()).append(" a ");
		List<Object> list = entityDao.createQuery(sff.toString());
		return list;
	}
	@Transactional
	public void save(Student st){
		entityDao.save(st);
	}
	public void delete(Object obj){
		entityDao.delete(obj);
	}
}
