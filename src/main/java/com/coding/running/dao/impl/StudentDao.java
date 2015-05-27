package com.coding.running.dao.impl;

import java.util.List;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.coding.running.dao.IStudentDao;
import com.coding.running.model.Student;

@Repository
public class StudentDao implements IStudentDao{
	 
	@Autowired
	private SessionFactory session;
	
	
	@Override
	public void add(Student student) {
		session.getCurrentSession().save(student);
	}

	@Override
	public void edit(Student student) {
		session.getCurrentSession().update(student);
	}

	@Override
	public void delete(int studentId) {
		Student student = getObjectById(studentId);
		session.getCurrentSession().delete(student);
	}

	@Override
	public Student getObjectById(int studentId) {
		return (Student) session.getCurrentSession().get(Student.class, studentId);
	}

	@Override
	public List<Student> getListAllStudent() {
		return session.getCurrentSession().createQuery("from Student").list();
	}

	

}
