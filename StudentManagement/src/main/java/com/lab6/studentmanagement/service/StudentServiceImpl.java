package com.lab6.studentmanagement.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lab6.studentmanagement.entity.Student;
import com.lab6.studentmanagement.repository.StudentRepository;

@Service
public class StudentServiceImpl implements StudentService {
	
	@Autowired
	StudentRepository studentRepository;

	@Override
	public List<Student> fetchAllStudents() {
		
		// get all student details from the database
		List<Student> students = studentRepository.findAll();
		return students;
	}

	@Override
	public Student saveStudent(Student student) {
		
		// save student details
		return studentRepository.save(student);
	}

	@Override
	public Student findStudentById(int studentId) {
		
		// get student by id from database table
		return this.studentRepository.findById(studentId).get();
	}

	@Override
	public void deleteStudentById(int studentId) {
		
		// delete student by id from database table
		studentRepository.deleteById(studentId);
	}

}
