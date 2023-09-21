package com.kh.hw.person.controller;

import com.kh.hw.person.model.vo.Employee;
import com.kh.hw.person.model.vo.Student;

public class PersonController {
	
	private Student[] s = new Student[3];
	
	private Employee[] e = new Employee[10];
	
	public int [] personCount() {
		int[] personCount = new int[2];
		for(Student student  : s) {
			if(student != null) {
				personCount[0]++;
			}
		}
		for(Employee employee  : e) {
			if(employee != null) {
				personCount[1]++;
			}
		}
		return personCount;
	}
	
	public void insertStudent(String name, int age, double height , double weight, int grade, String major) {
		
		for(int i =0; i<s.length; i++) {
			if(s[i] == null) {
				s[i] = new Student(name, age, height, weight, grade, major);
				break;
			}
		}
	}
	public Student[] printStudent() {
		return s;
	}
	public void insertEmployee(String name, int age, double height, double weitht, int salary, String dept) {
		
	}
	
	public Employee[] printEmployee() {
		return e;
	}
}
