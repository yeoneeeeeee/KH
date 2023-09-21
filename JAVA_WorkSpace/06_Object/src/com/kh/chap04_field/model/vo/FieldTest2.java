package com.kh.chap04_field.model.vo;

// 클래스변수(static 변수)와 상수필드(static final)에 대해
public class FieldTest2 {
	
	// 접근제한자 예약어(생략가능) 자료형 변수명;
	public static String sta = "static 변수";
	
	/*
	 * static은 '정적인, 고정된, 움직이지 않는'의 의미를 가진다.
	 * 즉, static키워드는 특정 변수나 , 메서드를 메모리영역(static)에 "고정"시켜둔다
	 * 
	 * 이렇게 static영역에 고정된 데이터는 모든 객체에서 "공유"할수 있다.
	 * 따라서 자주 사용하는 변수, 메서드를 static으로 선언함으로써 메모리영역에 미리 올려두고
	 * 모든객체에서 공유하면서 사용하게됨.
	 * 
	 * Math.random();
	 * 
	 */
	
	/*
	 * 상수필드
	 * 
	 * public static final 자료형 변수명 = 값;
	 * 한번 지정된 값을 고정해서 쓰기 때문에 무조건 초기화를 해줘야한다.
	 * 
	 * 예약어 순서는 상관없다.
	 * 
	 * static : 공유의 개념(재사용)
	 * final  : 한번 지정된 값 변경x(상수)
	 * 
	 * 값이 변경되어서는 안되는 고정적인 값을 메모리상에 올려두고 공유하면서 사용할 목적
	 * ex) Math.PI 
	 * 
	 * 상수명은 항상 모든글자가 대문자
	 */
	
	public static final int NUM = 10;
	
	public static void test() {
		System.out.println("하이");
	}
	
	/*
	 * static필드 생성시점 : 프로그램 실행과 동시에 메모리의 static영역에 할당된다.(굳이 객체생성하지 않아도 된다.)
	 *           소멸시점 : 프로그램 종료시 소멸된다.
	 * 따라서 프로그램의 생명주기와 동일한 생명주기를 가지게 되므로 static영역안에 너무 많은 클래스변수, 메서드를 추가
	 * 하는것은 좋지 못함.
	 * 
	 */
	
	
	
	
	
	
	
	
}
