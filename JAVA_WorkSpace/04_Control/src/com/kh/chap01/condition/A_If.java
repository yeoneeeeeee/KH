package com.kh.chap01.condition;

import java.util.Scanner;

public class A_If {
	/*
	 * 기본적으로 프로그램의 진행은 순차적으로 진행됨
	 * 단, 이 순차적인 흐름을 바꾸고자 한다면 제어문을 이용해서 직접 제어 가능.
	 * 
	 * 선택적으로 실행시키고자할때 => 제어문
	 * 
	 * 반복적으로 실행시키고자할때 => 반복문
	 * 
	 * 그 외의 흐름제어 => 분기문 
	 * 
	 * 조건문
	 * 조건식을 통해 참, 거짓 이냐를 판단해서 그에 해당하는 코드 실행
	 * 
	 * 조건식의 결과는 항상 true/false여야함.
	 * 보통 조건식에서는 비교연산자(대소,동등), 논리연산자(&&,||)을 주로사용한다.
	 * 
	 * 조건문은 크게 if문( 단독if, if~else, if ~eles if, 중복 if)과 switch문으로 나뉨.
	 */

	// 삼항 연사자를 조건문으로 바꿔보기
	public void method1() {
		/*
		 * 단독 if문
		 * [표현법]
		 * if(조건식) {
		 * 	   조건식이 true일때 실행되는 코드
		 * }
		 * 
		 * => 조건식의 결과가 참(true)일 경우 중괄호 블럭 안의 코드가 실행
		 * => 조건식의 결과가 거짓(false)일 경우 중괄호 블럭은 무시하고 넘어감. 
		 */
		
		// 사용자에게 정수값을 입력받은후 "양수다" 양수가 아니다를 출력
		Scanner sc = new Scanner(System.in);
		
		System.out.print("정수를 입력하세요 : ");
		int num = sc.nextInt();
		
		System.out.println(num > 0 ? "양수다" : "양수가 아니다");
		
		//삼항연산자를 if문으로 바꾸기
		if(num > 0) {
			System.out.println("양수다");
		}
		if(num <= 0) { // 실행될 필요가 없는 조건이지만 jvm은 if문을 만나면 무조건 조건검사함.
			System.out.println("양수가 아니다");
		}
	}
	
	public void method2() {
		/*
		 * if ~ else 문
		 * 
		 * if(조건식) {
		 * 	// 조건식이 true라면 실행될 코드
		 * } else {
		 * 	// if문의 조건식이 false라면 실행될 코드
		 * }
		 */
		Scanner sc = new Scanner(System.in);
		
		System.out.print("정수를 입력하세요 : ");
		int num = sc.nextInt();
		
		System.out.println(num > 0 ? "양수다" : "양수가 아니다");
		
		//삼항연산자를 if문으로 바꾸기
		if(num > 0) {
			System.out.println("양수다");
		}
		else { // 실행될 필요가 없는 조건이지만 jvm은 if문을 만나면 무조건 조건검사함.
			System.out.println("양수가 아니다");
		}
	}
	
	public void method3() {
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("정수 : ");
		int num = sc.nextInt(); 
		/*
		 * if ~ else if문
		 * 같은 비교대상으로 여러개의 조건을 제시해야할 경우 사용
		 * if(조건식1) { // 조건식1이 트루라면 실행코드1을 실행시키고 if블록 종료
		 * //실행코드1
		 * } else if (조건식 2){  // 조건식2이 트루라면 실행코드2을 실행시키고 if블록 종료
		 * //실행코드2
		 * } else if (조건식 3) {  // 조건식3이 트루라면 실행코드3을 실행시키고 if블록 종료
		 * //실행코드3
		 * } else { // 위 모든 조건이 false인 경우 자동으로 실행.
		 * //실행코드4
		 * }
		 */
		if(num > 0) {
			System.out.println("양수다");
		} else if(num == 0) {
			System.out.println("0이다");
		} else{
			System.out.println("음수다");
		}
	}
	
	public void method4() {
		
		// 사용자가 입력한 나이값을 가지고 어린이/청소년/성인을 출력
		// if else if문으로 만들어주기
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("나이를 입력하세요 : ");
		int age = sc.nextInt();
		
		// 어린이(13세이하), 청소년은 (13세초과~ 19세이하), 성인(19세 초과)
		if( age <= 13) {
			System.out.println("어린이");
		} else if(age <= 19) {
			System.out.println("청소년");
		} else /* if(age > 19) */{
			System.out.println("성인");
		}
		
		// 다른방법으로 풀기 -> 어린이, 청소년ㄴ, 성인에 대한 값을 담아두고 마지막에 출력하기
		String result = ""; // 박스를 먼저 만둘어두고 값을 대입하기(초기화 과정 필수)
		
		if( age <= 13) {
			result = "어린이";
		} else if(age <= 19) {
			result = "청소년";
		} else if( age > 19) {
			result = "성인";
		}
		// 해당블럭안에서 선언된 변수는 해당블럭이 끝나면 자동으로 사라진다.
		System.out.println(result);
	}
	
	public void method5() {
		Scanner sc = new Scanner(System.in);
		//사용자에게 이름, 성별을 입력받아 남자인지 여자인지 출력해볼 예정
		
		System.out.print("이름 : ");
		String name = sc.nextLine();
		
		System.out.print("성(M/F) : ");
		char gender = sc.nextLine().charAt(0);
		
		String result;
		if(gender == 'm' || gender == 'M') {
			result = "남학생";
		}
		else if(gender == 'f' || gender == 'F') {
			result = "여학생";
		}else {
			// return이라는 녀석을 이용
			//result = "잘못입력하셨습니다.";
			return; // 현재 호출된 일반메소드를 빠져나가는 역할을 한다.
		}
		
		
		// xxx님은 xxx이다.
		System.out.println(name+"님은 "+result+"이다");
	}
	
	public void method6() {
		// 특이케이스 . 문자열과 문자열간의 동등비교(문자열 == 문자열)
		// 사용자에게 이름을 입력받아 민경민과 일치하는지 확인
		Scanner sc = new Scanner(System.in);
		String name = sc.nextLine();
		
		// String이라는 녀석 참조자료형
		if( name == "민경민") {
			System.out.println("민경민님 반갑습니다");
		}else {
			System.out.println("민경민님이 아니시네요 누구신가요?");
		}
		/*
		 * 기본자료형 : boolean, byte,short ,int, long, float,double, char
		 * 참조자료형 : String // 특이한녀석
		 * 
		 * 기본자료형간 비교시 == != 사용가능함
		 * 단, 참조자료형은 동등비교시 정상적으로 비교가 안되요.
		 * 
		 * 그럼 어떻게하냐?? .equals()라는 방법으로 비교를함.
		 * 문자열.equals(문자열)
		 */
		if(name.equals("민경민")) {// 조건식으로 생각해도 무방함. true or false값을 반환
			System.out.println("민경민님 반갑습니다");
		}else {
			System.out.println("민경민님이 아니시네요?? 누구죠??");
		}
	}
	
	// 조건문 중복 사용
	public void method7() {
		Scanner sc = new Scanner(System.in);
		// 양수를 입력받고, 짝수인지 홀수인지 판별하는 프로그램 만들어보기.
		// 사용자가 입력한 정수가 양수가 아니라면 "양수가 아닙니다. 잘못 입력했습니다"
		System.out.print("정수(양수) 입력 : ");
		int num = sc.nextInt();
		if(num > 0) { // 양수인지 아닌지 검사
			if(num % 2 == 0) { // 짝수이면서 양수
				System.out.println("짝수입니다.");
				
			} else { // 홀수이면서 양수
				System.out.println("홀수입니다.");
				
			}
		}else {
			System.out.println("양수가 아닙니다; 잘못입력했습니다;;");
		}
		
		
		
		
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
