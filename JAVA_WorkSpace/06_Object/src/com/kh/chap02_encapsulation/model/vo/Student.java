package com.kh.chap02_encapsulation.model.vo;

public class Student {

	//필드부
	/*
	 * 필드 == 멤버변수 == 인스턴스 변수
	 * 
	 * 접근제한자 [예약어] 자료형 필드명;
	 */
	private String name;
	private int stdNo;
	private double height;
	
	//생성자부
	
	//메소드부
	/*
	 * 각 기능을 구현하는 부분
	 * 
	 * 접근제한자 반환형 메소드명(매개변수 => 생략가능){
	 * 	// 실행할코드
	 * }
	 * 
	 * setter 메소드
	 * 해당필드에 대입하고자 하는 값을 전달받아 해당필드에 대입시켜주는 기능의 메소드
	 * 이때 , 이 메소드는 접근 가능하도록 해야되기 때문에 접근제한자는 public을 이용
	 */
	
	// 이름(name)값을 기록 및 수정 할수 있는 기능의 메소드(name필드에 값을 대입해주는 용도)
	public void setName(String name) {
		// 매개변수 : 해당 메소드 호출시 전달되는 값을 받아주기 위한 변수 선언문(이 메소드 안에서만 사용가능)
		
		// name = name; -> 필드명과 매개변수 명이 동일한 시점에서 {}영역 내에 해당 변수를 제시시 해당영역 안에서
		// 생성된 변수가 우선순위가 더 높다
		
		// this? 현재 생성된 객체의 주소값이 담겨있음.
		this.name = name;
	}
	
	// 키(Height)값을 기록 및 수정 할 수 있는 기능의 메소드
	public void setHeight(double height) {
		
		this.height = height;
	}
	
	public void setStdNo(int stdNo) {
		this.stdNo = stdNo;
	}
	
	// 데이터를 반환해주는 기능의 메소드 : getter 메소드
	
	// name필드에 담긴 값을 돌려주는 용도의 메소드
	public String getName() {
		return name; // return 결과값; 결과값을 돌려주겠다.
	}
	
	// height값을 돌려주는 용도의 메소드
	public double getHeight() {
		return height;
	}
	//  stdNo학번 필드에 담긴 값을 돌려주는 용도의 메소드
	public int getStdNo() {
		return stdNo;
	}
	
	// 모든 필드값을 하나의 문자열로 합쳐서 돌려주는 용도의 메소드
	public String toString() {
		return name +"님의 학번은"+stdNo+"이고, 키는 "+height+"입니다"  ; // 결과값은 반드시 딱 "한개" 여야함.
	}
}

