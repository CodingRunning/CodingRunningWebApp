package com.coding.running.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.LocaleEditor;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.coding.running.model.Student;
import com.coding.running.service.IStudentService;

@Controller
public class StudentController {
	@Autowired
	private IStudentService studentService;
	
	private String studentLists;
	

	public String getStudentLists() {
		return studentLists;
	}

	public void setStudentLists(String studentLists) {
		this.studentLists = studentLists;
	}

	@RequestMapping("/index")
	public String setupFrom(Map<String, Object> map) {
		Student student = new Student();
		map.put("student", student);
		map.put("studentList", studentService.getListAllStudent());
		return "student";
	}

	@RequestMapping(value = "/student.do", method = RequestMethod.POST)
	public String doActions(@ModelAttribute Student student,
			BindingResult result, @RequestParam String action,
			Map<String, Object> map) {
		Student studentResult = new Student();
		switch (action.toLowerCase()) {
		case "add":
			studentService.add(student);
			studentResult = student;
			break;
		case "edit":
			studentService.edit(student);
			studentResult = student;
			break;
		case "delete":
			studentService.delete(student.getStudentId());
			studentResult = new Student();
			break;
		case "search":
			Student searchedStudent = studentService.getObjectById(student
					.getStudentId());
			studentResult = searchedStudent != null ? searchedStudent
					: new Student();
			break;

		default:
			break;
		}
		map.put("student", studentResult);
		map.put("studentList", studentService.getListAllStudent());
		return "student";
	}

	@RequestMapping(value = "ajax/changelanguage.do", method = RequestMethod.POST)
	@ResponseBody
	public String changeLanguage(@RequestParam String new_lang,
			HttpServletRequest request, HttpServletResponse response) {
		String msg = "";

		try {
			LocaleResolver localeResolver = RequestContextUtils
					.getLocaleResolver(request);
			if (localeResolver == null) {
				throw new IllegalStateException(
						"No LocaleResolver found: not in a DispatcherServlet request?");
			}

			LocaleEditor localeEditor = new LocaleEditor();
			localeEditor.setAsText(new_lang);
			localeResolver.setLocale(request, response,
					(Locale) localeEditor.getValue());

			msg = "Change Language Success!";
		} catch (Exception ex) {
			msg = "error";
		}
		return "success";
	}
	
	@RequestMapping(value="ajax/test", method = RequestMethod.POST)
	@ResponseBody
	 public Student test()
	   throws Exception {
		Student searchedStudent = studentService.getObjectById(2);
		return searchedStudent;
	 }

}
