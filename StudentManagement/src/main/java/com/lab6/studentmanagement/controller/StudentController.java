package com.lab6.studentmanagement.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.lab6.studentmanagement.entity.Student;
import com.lab6.studentmanagement.service.StudentService;

@Controller
@RequestMapping("/student")
public class StudentController {
	
	@Autowired
	private StudentService studentService;
	
	
	@RequestMapping("/list")											// add mapping for "/student/list"
	public String listStudents(Model theModel) {
		
		// get all student details from database table
		List<Student> theStudents = studentService.fetchAllStudents();
		
		// add data to spring model
		theModel.addAttribute("Students", theStudents);
		
		// returning the jsp page name
		return "list-Students";
	}
	
	
	@RequestMapping("/showFormForAdd")									// add mapping to "/student/showFormForAdd"
	public String showFormForAdd(Model theModel) {
		
		// create model attribute to bind form data
		Student theStudent = new Student();
		
		theModel.addAttribute("Student", theStudent);
		
		return "Student-form";
	}
	
	
	@RequestMapping("/showFormForUpdate")								// add mapping to "/student/showFormForUpdate"
	public String showFormForUpdate(@RequestParam("studentId") int id, Model theModel) {
		
		// get student based on the id
		Student theStudent = studentService.findStudentById(id);
		
		// set student as model attribute to pre-populate the form
		theModel.addAttribute("Student", theStudent);
		
		System.out.println(theStudent.toString());
		
		return "Student-form";
	}
	
	
	@RequestMapping("/save")											// add post mapping to "/student/save"
	public String saveStudent(@RequestParam("studentId") int id, @RequestParam("firstName") String firstName, 
			@RequestParam("lastName") String lastName, @RequestParam("course") String course, @RequestParam("country") String country) {
		
		System.out.println("Save student details :: Student id - " + id);
		Student theStudent;
		
		if (id != 0) {
			// get customer based on the id
			theStudent = studentService.findStudentById(id);
			
			theStudent.setFirstName(firstName);
			theStudent.setLastName(lastName);
			theStudent.setCourse(course);
			theStudent.setCountry(country);
		}
		else {
			theStudent = new Student(firstName, lastName, course, country);
		}
		
		// save the customer data 
		studentService.saveStudent(theStudent);
		
		// using redirect to prevent duplicate submissions -- go back to previous page
		return "redirect:/student/list";
	}
	
	
	@RequestMapping("/delete")										// add mapping to "/student/delete"
	public String deleteStudent(@RequestParam("studentId") int id) {
		
		// delete customer data based on id
		studentService.deleteStudentById(id);
		
		// using redirect to prevent duplicate submissions -- go back to previous page
		return "redirect:/student/list";
	}
	
	
	@RequestMapping(value = "/403")									// add mapping to "/student/403"
	public ModelAndView accessDenied(Principal user) {
		
		// show error message to users who don't have access to certain pages
		ModelAndView model = new ModelAndView();
		
		if (user != null) {
			model.addObject("msg", "Hi " + user.getName() + ", you do not have permission to access this page!");
		}
		else {	
			model.addObject("msg", "You do not have permission to access this page!");
		}
		
		model.setViewName("403");
		return model;
	}

}
