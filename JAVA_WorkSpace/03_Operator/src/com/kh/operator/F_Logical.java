package com.kh.operator;

import java.util.Scanner;

public class F_Logical {
	/*
	 * 논리 연산자 :  논리 값 2개(이항연산자)를 비교하는 연산자
	 * 
	 * AND && : 조건식 A && 조건식 B
	 *          조건식 A와 조건식 B가 모두 참일경우에만 true를 반환.
	 *          둘중 하나라도 false값이 들어간경우 false값 반환
	 * 
	 * OR || : 조건식 A || 조건식 B         
	 *         조건식 A와 조건식 B가 모두 거짓일 경우에만 false값 반환.
	 *         둘중 하나라도 true가 들어간경우 true값 반환.
	 */
	
	public void method1() {
		//사용자에게 정수값을 하나 입력받아서 입력한 정수가 짝수이면서 , 양수인지 확인
		Scanner sc = new Scanner(System.in);
		System.out.print("정수를 입력하세요.");
		int num = sc.nextInt();
		
		boolean result = (num % 2 == 0) && (num > 0);
		
		System.out.println("입력한 값이 짝수이면서, 양수입니까 ? "+result);
	}
	
	public void method2() {
		
		
		//입력받은 정수가 1이상 100이하의 정수인지 검사해볼것
		Scanner sc = new Scanner(System.in);
		System.out.print("정수를 입력해주세요.");
		int num = sc.nextInt(); 
		
		// 1 <= num <= 100 --> 에러발생!
		boolean result = (num >= 1) && (num <= 100);
		System.out.println("num은 1이상 100이하의 정수입니까? " +result);
	}
	
	public void method3() {
		// 사용자가 입력한 문자가 알파벳 대문자인지 확인하는 프로그램
		Scanner sc = new Scanner(System.in);
		System.out.print("영어 한글자를 입력해주세요 : ");
		char ch = sc.nextLine().charAt(0);
		
		boolean result = (ch >= 'A') && (ch <= 'Z');
		boolean result2 = (ch >= 65) && (ch <= 90);
		
		System.out.println("해당 문자는 대문자 입니까 ? "+result);
	}
	
	public void method4() {
		// 다음으로 넘어가려면 y를 눌러주세요
		Scanner sc = new Scanner(System.in);
		System.out.print("다음으로 넘어가려면 y를 눌러주세요");
		char ch = sc.nextLine().charAt(0);
		
		// y Y 
		boolean result = (ch == 'y') || (ch == 'Y') || (ch == 'ㅛ');
		System.out.println("사용자가 입력한값은 y이거나 Y입니까? "+result);
	}
	
	public void method6() {
		
		int num1 = 10;
		
		boolean result1 = (num1 < 5) && (++num1 > 0) && (++num1 > 0)&& (++num1 > 0)&& (++num1 > 0)&& (++num1 > 0)&& (++num1 > 0)&& (++num1 > 0)&& (++num1 > 0)&& (++num1 > 0)&& (++num1 > 0)&& (++num1 > 0)&& (++num1 > 0)&& (++num1 > 0)&& (++num1 > 0)&& (++num1 > 0)&& (++num1 > 0);
		System.out.println("result1 : "+result1);
		System.out.println("num1 : "+num1); // 11 
		
		int num2 = 10;
		boolean result2 = (num2 < 20) || (++num2 > 0);
		System.out.println("result2 : "+result2);
		System.out.println("num2 : "+num2); // 11 
		
		boolean result3 = true || (num1 > 0);
		// dead코드? 절대 실행될일이 없는 코드
		// AND(&&)연산자의 경우 왼쪽 조건식의 결과가 false인경우 우측 조건식은 검사조차 하지 않음
		// OR(||)연산자의 경우 왼쪽 조건식의 결과가 true참인경우 우측 조건식은 검사하지 않는다.
	} 
	
	
	
	
	
	
	
	
	
	
}
