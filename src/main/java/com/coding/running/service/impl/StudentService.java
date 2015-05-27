package com.coding.running.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.coding.running.dao.IStudentDao;
import com.coding.running.dao.impl.StudentDao;
import com.coding.running.model.Student;
import com.coding.running.service.IStudentService;

@Service
public class StudentService implements IStudentService{
	@Autowired
	private IStudentDao studentDao;
	@Transactional
	public void add(Student student) {
		studentDao.add(student);
	}

	@Transactional
	public void edit(Student student) {
		studentDao.edit(student);
	}

	@Transactional
	public void delete(int studentId) {
		studentDao.delete(studentId);
	}

	@Transactional
	public Student getObjectById(int studentId) {
		return studentDao.getObjectById(studentId);
	}

	@Transactional
	public List<Student> getListAllStudent() {
		return studentDao.getListAllStudent();
	}

}
