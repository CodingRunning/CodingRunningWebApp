package com.coding.running.dao;

import java.util.List;

import com.coding.running.model.Student;

public interface IStudentDao {
	public void add(Student student);
	public void edit(Student student);
	public void delete(int studentId);
	public Student getObjectById(int studentId);
	public List<Student> getListAllStudent();
}
