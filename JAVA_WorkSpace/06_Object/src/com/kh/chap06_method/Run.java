package com.kh.chap06_method;

import com.kh.chap06_method.controller.MethodTest1;
import com.kh.chap06_method.controller.MethodTest2;

public class Run {
	public static void main(String[] args) {
		System.out.println("============================================");
		
		MethodTest1 mt1 = new MethodTest1();
		mt1.method1();
		
		int a = mt1.method2();
		System.out.println("랜덤값은 ?? "+a);
		
		mt1.method3(2 , 1);// 반드시 자료형을 맞춰서 매개변수에 대입해줘야한다.
		
		System.out.println(mt1.method4(5, 55));
		
		MethodTest1 mt2 = new MethodTest1();
		//mt2.method1();
		
		System.out.println("======================================================");
		// static 메소드의 경우에는 new 생성자 구문으로 객체를 생성할 필요가 없다.
		// static이 붙은 클래스 변수와 마찬가지로 메소드 또한 프로그램 실행시에 정적메모리영역에 저장된다.
		// 클래스명.필드명 == static영역의 주소값.
		// 클래스명.메서드명() == static영역의 주소값().
		MethodTest2.method1();
		
		System.out.println(MethodTest2.method2());
		
		MethodTest2.method3("경민", 33);
		
		MethodTest2.method4(1 , '+');
	}
}
