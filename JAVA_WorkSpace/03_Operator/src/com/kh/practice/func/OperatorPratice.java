package com.kh.practice.func;

import java.util.Scanner;

public class OperatorPratice {
	
	public void practice1() {
		Scanner sc = new Scanner(System.in);
		
		System.out.print("인원 수 :");
		int num = sc.nextInt();
		
		System.out.print("사탕 개수 : ");
		int candy = sc.nextInt();
		
		// 1인당 사탕개수 사탕개수 / 인원수
		// 남는 사탕개수 사탕개수 % 인원수
		System.out.println("1인당 사탕 개수 : "+ candy / num);
		System.out.println("남는 사탕 개수 : "+ candy % num);
	}
	
	public void practice2() {
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("이름 : ");
		String name = sc.nextLine();
		
		System.out.print("학년(숫자만) :");
		int classes = sc.nextInt();
		
		System.out.print("반(숫자만) : ");
		int grade = sc.nextInt();

		System.out.print("번호(숫자만) : ");
		int number = sc.nextInt();
		
		sc.nextLine(); // ★
		
		System.out.print("성별(M/F) : ");
		char gender = sc.nextLine().charAt(0);
				
		System.out.print("성적(소수점 아래 둘째자리까지) :");
		double exam = sc.nextDouble();
		
		System.out.printf("%d학년 %d반 %d번 %s %s의 성적은 %.2f이다.", classes , grade, number, name, 
				(gender == 'M' || gender == 'm') ? "남학생" : (gender == 'F' || gender == 'f') ? "여학생" : "학생"
				, exam);
	}
	
	public void practice3() {
//		나이를 키보드로 입력 받아 어린이(13세 이하)인지, 청소년(13세 초과 ~ 19세 이하)인지, 
//		성인(19세 초과)인지 출력하세요.

		Scanner sc = new Scanner(System.in);
		System.out.print("나이 : ");
		int age = sc.nextInt();
		
		// 어린이, 청소년, 성인
		String result = age <= 13 ? "어린이" : age <= 19 ? "청소년" : "성인";
		
		System.out.println(result);
	}
	
	public void practice5() {
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("주민번호를 입력하세요(- 포함) : ");
		String res = sc.nextLine(); // 123456-1212121
		
		char ch = res.charAt(7);
		
		String gender = (ch == '1' || ch == '3') ? "남자" : "여자";
		
		System.out.println(gender);
	}
	
	
	public void practice6() {
//		키보드로 정수 두 개를 입력 받아 각각 변수(num1, num2)에 저장하세요.
//		그리고 또 다른 정수를 입력 받아 그 수가 num1 이하거나 num2 초과이면 true를 출력하고
//		아니면 false를 출력하세요.
//      (단, num1은 num2보다 작아야 함)
		
		Scanner sc = new Scanner(System.in);
		System.out.print("정수1 : ");
		int num1 = sc.nextInt();
		
		System.out.print("정수2 : ");
		int num2 = sc.nextInt();
		
		System.out.print("입력 : ");
		int input = sc.nextInt();
		
		boolean result = (input <= num1 || input > num2 )? true : false;
		
		System.out.println(result);
	}
	
	public void practice7() {
		//3개의 수를 키보드로 입력 받아 입력 받은 수가 모두 같으면 true, 아니면 false를 출력하세요
		Scanner sc = new Scanner(System.in);
		
		System.out.print("입력1 : ");
		int num1 = sc.nextInt();
		
		System.out.print("입력2 : ");
		int num2 = sc.nextInt();
		
		System.out.print("입력3 : ");
		int num3 = sc.nextInt();
		
		// a == b == c -> a == b && b == c
		
		System.out.println(num1 == num2 && num2 == num3);
	}
	
	public void practice8() {
		
//		A, B, C 사원의 연봉을 입력 받고 각 사원의 연봉과 인센티브를 포함한 연봉을 계산하여 출력하고
//		인센티브 포함 급여가 3000만원 이상이면 “3000 이상”, 미만이면 “3000 미만”을 출력하세요.
//		(A 사원의 인센티브는 0.4, B 사원의 인센티브는 없으며, C 사원의 인센티브는 0.15)
		Scanner sc = new Scanner(System.in);
		System.out.print("A사원의 연봉 : ");
		int a = sc.nextInt();
		double aBonus = a * 1.4; 
		
		System.out.print("B원의 연봉 : ");
		int b = sc.nextInt();
		
		System.out.print("C사원의 연봉 : ");
		int c = sc.nextInt();
		double cBonus = c + (c * 0.15);
		
		System.out.printf("A사원 연봉/연봉+a : %d/%.1f \n", a , aBonus );
		System.out.println( aBonus > 3000 ? "3000 이상" : "3000 미만" );
		
		System.out.printf("B사원 연봉/연봉+a : %d/%.1f \n", b , (double) b);
		System.out.println( b > 3000 ? "3000 이상" : "3000 미만" );
		
		System.out.printf("C사원 연봉/연봉+a : %d/%.13f \n", c , cBonus);
		System.out.println(cBonus > 3000 ? "3000 이상" : "3000 미만");
		
	
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
