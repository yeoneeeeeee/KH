package com.kh.chap02_override.run;

import com.kh.chap02_override.model.vo.Book;

public class Run {

	public static void main(String[] args) {
		
		/*
		 * 모든 클래스 Object클래스의 후손이다. 즉, 최상위클래스는 항상 Object
		 * => 즉, Object에 있는 메소드들을 마음에 안들면 오버라이딩을 통해 재정의 할수있다.
		 */
		Book bk = new Book("자바프로그래밍입문","경민",10000);
		
		/*
		 * 출력문 안에 참조 변수를 제시해서 출력하고자할때
		 * 내부적으로 JVM이 자동으로 toString()메소드를 호출.
		 * 
		 * 부모클래스인 Object클래스에 있는 toString()함수가 항상 호출되었음.
		 * 해당 클래스의 풀클래스명 + @ + 해당 객체의 주소값의 16진수
		 * 
		 * 자식클래스인 Book클래스에서 toString()메소드를 재정의
		 * 해당 객체의 모든 필드값을 하나의 문자열로 합쳐서 돌려주는 메소드로 변경하였음(자동생성)
		 * 
		 */
		new Object().toString();
		System.out.println(bk.toString());
		
		
	}

	
	
	
	
	
	
	
}
