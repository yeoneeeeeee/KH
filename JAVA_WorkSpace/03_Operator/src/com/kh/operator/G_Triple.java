package com.kh.operator;

import java.util.Scanner;

public class G_Triple {
	/*
	 * 삼항연산자 : 3개의 항목(값)을 가지고 연산하는 연산자
	 * 
	 * [표현법]
	 * 조건식 ? 조건이 true일 경우 : 조건이 false인 경우
	 * 
	 * 조건식이란(true/false)가 나오게하는 연산자(주로 논리연산자를 통해 작성함)
	 */
	public void method1() {
		
		// 사용자가 입력한 정수값이 양수인지 아닌지 판별 후 그에 맞는 결과 출력
		Scanner sc= new Scanner(System.in);
		
		System.out.print("정수값 입력 : ");
		int num = sc.nextInt();
		
		// 결과값이 String이기 때문에 String변수를 사용했음.
		String result = (num > 0) ? "양수네요" : "음수네요"; 
		
		// xx는 xxxx
		//System.out.println(num +"는 "+result);
		System.out.println(num+"는 " + ((num > 0) ? "양수네요" : "음수네요" ));
	}
	
	public void method2() {
		// 사용자가 입력한 정수값이 짝수인지 홀수인지 판별 후 출력 
		Scanner sc = new Scanner(System.in);
		
		System.out.print("정수값 입력 : ");
		int num = sc.nextInt();
		String result = ( num % 2 == 0 ? "짝"  : "홀"  );
		
		//x은(는) x수입니다
		System.out.printf("%d은(는) %s수입니다.", num, result);
	}
	
	public void method3() {
		
		// 사용자로부터 종료의사여부를 입력받은후 판변해서 출력
		// 사용자가 입력한 값이 y이거나 Y인경우 => 프로그램을 종료합니다.
		//                 그 외에는      => 계속진행하겠습니다.
		Scanner sc = new Scanner(System.in);
		
		System.out.print("종료하시려면 y를 입력하세요..");
		char ch = sc.nextLine().charAt(0);
		
		String result = (ch == 'y' || ch == 'Y') ? "프로그램을 종료할게요" : "계속진행할게요";
		
		System.out.println(result);
	}
	
	public void method4() {
		// 입력받은 값이 영어 소문자인지 대문자인지 판별후 출력
		Scanner sc = new Scanner(System.in);
		// 영문자입력 :
		System.out.print("영문자입력 :");
		char  ch = sc.nextLine().charAt(0);
		
		// 출력문형식: 소문자이다 . 대문자이다
		String result =  (ch >= 'A' && ch <= 'Z') ?  "대문자입니다" : (ch >= 'a' && ch <= 'z') ? "소문자입니다": "잘못입력하셨습니다" ;
		
		System.out.println(result);
	}
	
	//삼항연산자 중첩사용해보기
	public void method5() {

		// 사용자가 입력한 정수값이 양수인지 아닌지 판별 후 그에 맞는 결과 출력
		Scanner sc= new Scanner(System.in);
		
		System.out.print("정수값 입력 : ");
		int num = sc.nextInt();
		
		// 결과값이 String이기 때문에 String변수를 사용했음.
		String result = num > 0 ? "양수입니다" : num == 0 ? "0입니다" : "음수입니다" ; // 사용자가 입력한 값이 양수인지, 0인지, 음수인지 정확하게 판별후 그에맞는 결과를 출력
		
		// xx는 xxxx
		//System.out.println(num +"는 "+result);
		System.out.println(num+"는 " + result);
	}
	
	
	public void method6() {
		
		/* 두개의 정수값과 + 또는 -의 문자를 하나 입력받아
		 * +일경우 두 정수값의 덧셈연산한결과
		 * -일경우 두 정수값의 뺄셈연산한 결과
		 * 둘다 아닌결우 "잘못입력하셨습니다"를 출력
		 */
		Scanner sc = new Scanner(System.in);
		
		// 첫번째 정수 : 
		System.out.print("첫번째 정수 : ");
		int num1 = sc.nextInt();
		// 두번째 정수 :
		System.out.print("두번째 정수 : ");
		int num2 = sc.nextInt();
		
		sc.nextLine(); // 엔터키 비워주기
		// 연산자 입력(+ or -) :
		System.out.print("연산자 입력(+ or -) :");
		char op = sc.nextLine().charAt(0);
		
		// 결과 : xxx
		String result = (op == '+') ? (num1 + num2)+"" : (op == '-') ? (num1 - num2)+"" : "잘못입력했습니다";
		
		System.out.println("결과 : " +result);
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
