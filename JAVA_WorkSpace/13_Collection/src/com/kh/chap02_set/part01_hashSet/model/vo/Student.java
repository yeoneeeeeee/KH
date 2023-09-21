package com.kh.chap02_set.part01_hashSet.model.vo;

import java.util.Objects;

public class Student {

	private String name;
	private int age;
	private int score;

	public Student() {

	}

	public Student(String name, int age, int score) {
		super();
		this.name = name;
		this.age = age;
		this.score = score;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public int getScore() {
		return score;
	}

	public void setScore(int score) {
		this.score = score;
	}

	@Override
	public String toString() {
		return "Student [name=" + name + ", age=" + age + ", score=" + score + "]";
	}
	
	/*
	 * equals()
	 * 
	 * 필드값이 모두 동일하면 true가 나올수 있도록 재작성하기.
	 * name, age, score
	 * 
	 * 문자열.equals(문자열)
	 * 
	 * equals() 와 hashCode()는 동시에 오버라이딩한다.
	 * equals결과가 true면 hashCode값도 동일해야한다. (동일한객체로 취급)
	 * 
	 */
	@Override
	public boolean equals(Object o) {
		
		// Student other = (Student) o; 만약 매개변수로 넘어온 객체가 Student가 아니라면
		// 형변환 에러 발생할수 있음.
		
		// 형변환 전에 타입검사
		if( !(o instanceof Student)) {
			return false;
		}
		
		Student other = (Student) o;
		
		if(!this.name.equals(other.name)) {
			return false;
		}
		
		if(this.age != other.age) {
			return false;
		}
		
		if(this.score != other.score) {
			return false;
		}
		
		return true;
	}
	
	/*
	 * equals에 사용한 필드를 똑같이 이용해서 hashCode생성하기
	 */
	@Override
	public int hashCode() {
		// hashCode생성 메소드 => java 7버전 이상부터 사용.
		return Objects.hash(name, age, score);
	}
	
	
	
	
	
	
}
