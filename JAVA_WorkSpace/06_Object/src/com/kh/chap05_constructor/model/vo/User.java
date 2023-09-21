package com.kh.chap05_constructor.model.vo;

public class User {
	// 필드부
	private String userId;
	private String userPwd;
	private String userName;
	private int age;
	private char gender;

	// 생성자부
	/*
	 * 생성자 [표현법] public 클래스명(매개변수(생략가능) { 해당 생성자를 통해서 객체 생성시 실행하고자 하는 코드; }
	 * 
	 * 생성자를 작성하는 목적 
	 * 1. 객체를 생성해주기 위한 목적 
	 * 2. 객체 생성 뿐만 아니라 매개변수로 전달된 값을 곧바로 필드에 초기화할 목적
	 * 
	 * 생성자 작성시 주의사항 
	 * 1. 반드시 클래스명과 동일해야함(대/소문자 구분) 
	 * 2. 반환형이 존재하지 않는다(메소드와 비슷하게 생겨서 헷갈릴수있음) 
	 * 3. 여러개 생성이 가능하지만 매개변수가 중복 되면 안된다. 
	 * 4. 매개변수 생성자를 명시적으로 작성하게 되면 기본 생성자를 jvm이
	 * 자동으로 만들어 주지 않는다.
	 * 
	 * 즉, 어찌됏든 기본생성자는 항상 작성하는 습관을 들이자
	 */
	public User() { // 매개변수 없는 생성자 == 기본 생성자
		// 단지 객체 생성만을 목적으로 할 때 사용
		// 기본생성자 작성하지 않아도 호출하는데 문제어 없음.
		// JVM이 자동으로 만들어 줬기 때문에 항상 객체 생성이 가능했다.
		// 단, 매개변수가 있는 생성자가 작성되어있을때에는 기본생성자도 반드시 기술해야한다.

		System.out.println("기본생성자 호출");
	}

	public User(String userId, String userPwd, String userName) {
		this.userId = userId;
		this.userPwd = userPwd;
		this.userName = userName;
	}
	
	public User(String userId, String userPwd, String userName, int age, char gender) {
//		this.userId = userId;
//		this.userPwd = userPwd;
//		this.userName = userName;
		// 위와같이 중복되는 동일한 내용의 초기화구문이 존재할때,
		// this생성자 호출 가능
		this(userId, userPwd, userName); // 같은 클래스 내에 있는 다른 생성자 호출하는 구문
		//단 반드시 생성자 내부 첫줄에 기술해야함.
		this.age = age;
		this.gender = gender;
	}
	

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getAge() {
		return age;
	}

	public void setAge(int age) {
		this.age = age;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}

	@Override
	public String toString() {
		return "User [userId=" + userId + ", userPwd=" + userPwd + ", userName=" + userName + ", age=" + age
				+ ", gender=" + gender + "]";
	}

	// 메서브두

}
