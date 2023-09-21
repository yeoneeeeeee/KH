package com.kh.chap06_method.controller;

public class MethodTest1 {
	/*
	 * 메소드
	 * [표현법]
	 * 접근제한자 예약어(생략가능) 반환할값의자료형 메소드명(매개변수(생략가능)){
	 * 			// 실행할 코드;
	 * 		    return 반환할 값;(반환할 자료형이 void인경우 생략가능)
	 * }
	 * 한번 정의한 메소드는 얼마든지 다시 호출해서 사용할수 있다. 
	 * 
	 * 메소드? 실행해야할 명령어의 집합
	 */
	
	// 1. 매개변수가 없고, 반환값도 없는 메소드
	public void method1() {
		System.out.println("매개변수와 반환값이 둘 다 없는 메소드 입니다.");
		
		//return; void메소드의 경우 생략이 가능함. JVM이 자동으로 마지막줄에 생성해준다.
	}
	
	// 2. 매개변수가 없고 반환값은 있는 메소드
	public int method2() {
		System.out.println("매개변수가 없고 반환값은 있는 메소드입니다.");
		
		return (int)(Math.random() * 100 + 1);
	}
	
	// 3. 매개변수가 있고 반환값은 없는 메소드 -> setter함수 같은 녀석들
	public void method3(int num1, int num2) {
		
		System.out.println("매개변수가 있고 반환값은 없는 메소드입니다. ");
		
		// num1과 num2의 값을 비교하여 결과를 출력하는 메소드
		// 최소값 : xx
		// 최대값 : xx 
		int min = 0; // 두수중에 작은값을 보관할 변수
		int max = 0; // 두수중에 큰 값을 보관할 변수
		
		if(num1 - num2 > 0) {
			min = num2;
			max = num1;
		}else {
			min = num1;
			max = num2;
		}
		System.out.println("최소값 : "+min+"\n최대값 : "+max);
	}
	
	// 4. 매개변수도 있고 반환값도 있는 메소드
	public int method4(int a, int b) {
		
		System.out.println("매개변수도 있고 반환값도 있는 메소드다");
		
		
		return a*b;
	}
	
	
	
	
	
	
	
	
	
	
	
	
}
