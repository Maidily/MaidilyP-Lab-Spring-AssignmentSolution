package com.lab6.studentmanagement.service;

import java.util.List;
import java.util.Optional;

import com.lab6.studentmanagement.entity.Student;

public interface StudentService {
	
	public List<Student> fetchAllStudents();
	
	public Student saveStudent(Student student);
	
	public Student findStudentById(int studentId);
	
	public void deleteStudentById(int studentId);

}
