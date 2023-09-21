package com.kh.controller;

import java.util.Scanner;

public class A_UncheckedException {
	
	/*
	 * RuntimeException
	 * - 프로그림 실행시 발생되는 예외들
	 * 
	 * RuntimeException의 자식클래스들
	 * - ArrayIndexOutOfBoundsException : 배열에 부적절한 인덱스로 접근했을때 발생하는 예외 
	 * - NullPointerException : 참조변수가 담고있는 값이 NULL임에도 불구하고 어딘가에 접근하려고할대 발생하는 예외 (null.어딘가)
	 * - ArithmeticException : 나누기 연산시 0으로 나눌때 발생하는 예외 
	 * - ClassCastException : 강제적 형변환을 할때 허용하지 않는 형변환일때 발생
	 * - NegativeArraySizeException : 배열의 크기를 음수로 지정할 경우 발생하는 예외.
	 * .....
	 * => 이러한 RuntimeException과 관련한 예외는 충분히 예측가능한 상황이기 때문에 예외 자체가 발생이 안되게끔 조건문으로 해결가능.
	 *    굳이 예외처리(예외가 발생했을 때 실행할 내용을 정의해두는 행위)를 할필요가 없다. 
	 * 
	 */
	Scanner sc = new Scanner(System.in);
	
	public void method1() {
		// ArithmeticException : 나누기 연산시 0으로 나눌때 발생하는 예외
		
		// 사용자에게 두개의 정수값을 입력받아 나눗셈을 한 결과를 출력예정.
		System.out.print("첫번째 정수 : ");
		int num1 = sc.nextInt();
		
		System.out.print("두번째 정수 : ");
		int num2 = sc.nextInt();
		
		// 해결방법1. 조건문으로 처리해주기 (애초에 예외가 발생할수 없게끔 if문으로 조건검사 후 계산진행) => 예외처리X
//		if(num2 != 0) {
//			System.out.println("나눗셈 연산 결과 : "+ num1 /num2);
//		}else {
//			System.out.println("0으로 나눌수는 없습니다.");
//		}
		// 해결방법2. 예외처리 구문으로 해결(예외가 발생했을 경우를 대비해서 실행할 내용을 정의해두는 것)
		/*
		 * try ~ catch문
		 * [표현법]
		 * try {
		 *  // 예외가 발생될수 있는 구문
		 * } catch(발생될예외클래스 변수명 (매개변수)){
		 * 	// 위 예외가 발생했을경우 실행할 구문
		 * }
		 */
		try {
			System.out.println("나눗셈 연산 결과 : "+ num1 /num2);
		}catch(ArithmeticException e) {
			System.out.println("0으로 나눌수는 없습니다.");
			e.printStackTrace(); // 오류를 추적해주는 구문.(현재 예외가 발생한 정보를 볼 수 있음)
		}
		System.out.println("프로그램 종료");
		//System.out.println("나눗셈 연산 결과 : "+ num1 /num2);
		
	}
	
	public void method2() {
		
		// ArrayIndexOutOufBoundException
		// NegativeArraySizeException
		
		System.out.print("배열의 크기를 지정 : ");
		int size = sc.nextInt();
		
//		if(size > 0) {
//			int [] arr = new int[size];
//		}
		
//		try {
//			
//			int [] arr = new int[size]; // 에러발생시 try블럭안의 아래내용은 실행되지 않는다.
//			System.out.println(arr[100]);
//			
//		}catch(NegativeArraySizeException e) { // 해당 catch블럭이 실행되면 아예 try ~ catch블럭을 빠져나감
//			System.out.println("배열의 크기로는 음수를 제시할수 없습니다.");
//		}catch(ArrayIndexOutOfBoundsException e) {
//			System.out.println("부적절한 인덱스로 접근했습니다.");
//		}
		
		try {
			int [] arr = new int[size]; // 에러발생시 try블럭안의 아래내용은 실행되지 않는다.
			System.out.println(arr[100]);
		} catch(ArrayIndexOutOfBoundsException e) {
			// 다중 catch 작성시 블럭의 순서가 중요함 => 범위가 작은 자식타입의 예외클래스를 먼저 기술해야한다.
		} catch(RuntimeException e) { // 다형성을 적용하여 부모타입 예외 클래스를 작성 가능.
			System.out.println("예외가 발생했는데, 배열의 크기를 음수로 지정했거나, 부적절한 인덱스로 접근했을것.");
			 // 다중 catch블록보다 예외는 적어졌지만, 정확히 어떤예외인지 알수없다.
		} 
		
		System.out.println("프로그램종료.");
	}
	/*
	 * RuntimeException 관련된 예외는
	 * - 조건문으로 해결 가능=> 예외 자체가 발생 안되게끔 개발자가 소스코드로 핸들힝 하는것(예외처리 x)
	 * - 예외처리 구문으로도 해결가능 => 예외가 발생했을때를 대비해서 그때 실행할 내요을 정의해두는것
	 * 
	 * 예측이 가능한 상황 => 조건문으로 해결하는것을 권장
	 * 예측이 불가능한 상황 => 예외처리 구문으로 해결. 
	 * 
	 * RuntimeException 계열은 충분히 예측 가능한 상황이기 때문에 => 조건문으로 해결하는것을 권장함.
	 * 
	 * UnCheckException => 필수는 아니다.
	 * 
	 */
	
	
	
	
	
}
