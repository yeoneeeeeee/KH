package com.kh.chap05_constructor;

import com.kh.chap05_constructor.model.vo.User;

public class Run {

	public static void main(String[] args) {
		
		// 1. 기본생성자로 객체 생성/ setter메소드로 각 필드 초기화
		User u1 = new User();
		u1.setUserId("user01");
		u1.setUserPwd("pass01");
		u1.setUserName("경민");
		
		System.out.println(u1);
		//2. 객체 생성과 동시에 각 필드에 값들을 초기화
		User u2 = new User("user02" , "pass02" , "경민2");
		System.out.println(u2);
		
		
		// 3. 생성자는 여러개 만들 수있음. 단, 매개변수가 중복되지 않아야 한다.
		// 객체 생성과 동시에 각 필드에 값들을 초기화
		// 매개변수 5개짜리 생성자로 객체 생성.
		User u3 = new User("pass03","user03","user03", 33 , '남');
		System.out.println(u3);
		
	}

}
