package com.kh.practice.chap01;

import java.util.Scanner;

public class ControlPractice {

	public void practice1() {
		Scanner sc = new Scanner(System.in);
		System.out.println("1. 입력");
		System.out.println("2. 수정");
		System.out.println("3. 조회");
		System.out.println("4. 삭제");
		System.out.println("7. 종료");
		System.out.print("메뉴 번호를 입력하세요 : ");
		int num = sc.nextInt();

		String menu = "";
		switch (num) {
		case 1:
			menu = "입력";
			break;
		case 2:
			menu = "수정";
			break;
		case 3:
			menu = "조회";
			break;
		case 4:
			menu = "삭제";
			break;
		case 7:
			System.out.println("프로그램이 종료됩니다.");
			return;
		}

		System.out.println(menu + "메뉴입니다");
	}

	public void practice4() {

		Scanner sc = new Scanner(System.in);
		System.out.print("1 ~ 12 사이의 정수 입력");
		int month = sc.nextInt();

		String season = "";
		switch (month) {
		case 1:
		case 2:
		case 12:
			season = "겨울";
			break;
		case 3:
		case 4:
		case 5:
			season = "봄";
			break;
		case 6:
		case 7:
		case 8:
			season = "여름";
			break;
		case 9:
		case 10:
		case 11:
			season = "가을";
			break;
		default:
			System.out.println(month + "월은 잘못 입력된 달입니다.");
			return;
		}
		System.out.println(month + "월은 " + season + "입니다.");

	}

	public void practice5() {
		// 아이디 : minmin
		// 비밀번호 : Min1234
		Scanner sc = new Scanner(System.in);
		System.out.print("아이디 : ");
		String id = sc.nextLine();
		
		System.out.print("비밀번호 : ");
		String pwd = sc.nextLine();
		
		// 로그인 성공하는케이스 ->
		// 1) id값이 minmin과 일치하고
		// 2) pwd값이 Min1234 두가지 모두 일치할때만 로그인성공
		if(id.equals("minmin") && pwd.equals("Min1234")) {
			System.out.println("로그인 성공");
		}
		// 비밀번호 틀린 케이스
		else if(!pwd.equals("Min1234")) {
			System.out.println("비밀번호가 틀렸습니다");
		}
		// 아이디가 틀린케이스
		else if(!id.equals("minmin")) {
			System.out.println("아이디가 틀렸습니다.");
		}
		
	}
	
	public void practice7() {
		
		Scanner sc = new Scanner(System.in);
//		키(m)를 입력해 주세요 : 1.65
//		몸무게(kg)를 입력해 주세요 : 58.4
//		BMI 지수 : 21.45087235996327
//		정상체
		System.out.print("키(m)를 입력해 주세요 : ");
		double height = sc.nextDouble();
		
		System.out.print("몸무게(kg)를 입력해 주세요 : ");
		double kg = sc.nextDouble();
		
		double BMI = kg / (height * height); 
		//18.5이상 23미만일 경우 정상체중
//		BMI가 23이상 25미만일 경우 과체중 / 25이상 30미만일 경우 비만
//		BMI가 30이상일 경우 고도 비만
		System.out.println(BMI);
		if(BMI < 18.5) {
			System.out.println("저체중");
		}
		else if(BMI <23 ) {
			System.out.println("정상체중");
		}
		else if(BMI <25 ) {
			System.out.println("과체중");
		}
		else if(BMI <30 ) {
			System.out.println("비만");
		}
		else {
			System.out.println("고도비만");
		}
	}
	
	public void practice8() {
		Scanner sc = new Scanner(System.in);
		System.out.print("피연산자1 입력 : ");
		int num1 = sc.nextInt();
		
		System.out.print("피연산자2 입력 : ");
		int num2 = sc.nextInt();
		
		if( !(num1 > 0 && num2 >0) ) {
			System.out.println("똑바로 입력하세요 ");
			practice8();
			return;
		}
		
		sc.nextLine();
		System.out.print("연산자를 입력(+,-,*,/,%) :");
		char op = sc.nextLine().charAt(0);
//		(단, 두 개의 정수 모두 양수일 때만 작동하며 없는 연산 기호를 입력 했을 시
//				“잘못 입력하셨습니다. 프로그램을 종료합니다.” 출력
		
		
		double result = 0;
		switch(op) {
		case '+' : 
			result = num1 + num2;
			break;
		case '-' :
			result = num1 - num2;
			break;
		case '*' :
			result = num1 * num2;
			break;
		case '/' :
			result = num1 / ((double) num2);
			break;
		case '%' :
			result = num1 % num2;
			break;
		default : 
			System.out.println("잘못 입력하셨습니다. 프로그램을 종료합니다.");
			return;
		}
		
		System.out.printf("%d %c %d = %f", num1, op, num2, result);
	}
	
	public void practice9() {
//		중간고사, 기말고사, 과제점수, 출석회수를 입력하고 Pass 또는 Fail을 출력하세요.
//		평가 비율은 중간고사 20%, 기말고사 30%, 과제 30%, 출석 20%로 이루어져 있고
//		이 때, 출석 비율은 출석 회수의 총 강의 회수 20회 중에서 출석한 날만 따진 값으로 계산하세요.
//		70점 이상일 경우 Pass, 70점 미만이거나 전체 강의에 30% 이상 결석 시 Fail을 출력하세요.
//		중간 고사 점수 : 80
//		기말 고사 점수 : 90
//		과제 점수 : 50
//		출석 회수 : 15
		Scanner sc = new Scanner(System.in);
		System.out.print("중간 고사 점수 :");
		int middle_test = sc.nextInt();
		
		System.out.print("기말 고사 점수 :");
		int final_test = sc.nextInt();
		
		System.out.print("과제 점수 :");
		int exam = sc.nextInt();
		
		System.out.print("출석 점수 :");
		int attend = sc.nextInt();
		
		System.out.println("================= 결과 =================");
		if(attend > 14 ) {
			System.out.println("중간 고사 점수(20) : "+ (middle_test*0.2));
			System.out.println("기말 고사 점수(30) : "+ (final_test*0.3));
			System.out.println("과제     점수(30) : "+ (exam*0.3));
			System.out.println("출석     점수(20) : "+ (attend));
			double total = (middle_test*0.2 + final_test*0.3 +
					exam*0.3 + attend);
			
			System.out.println("총점 : "+ total);
			if(total >= 70) {
				System.out.println("PASS");
			}else {
				System.out.println("FAIL");
			}
		}else {
			System.out.printf("FAIL [출석 회수 부족(%d/20)]",attend);
		}
		
		
//		================= 결과 =================
//		중간 고사 점수(20) : 16.0
//		기말 고사 점수(30) : 27.0
//		과제 점수 (30) : 15.0
//		출석 점수 (20) : 15.0
//		총점 : 73.0
//		PASS
	}
	
	public void practice11() {
//		정수를 이용해서 4자리 비밀번호를 만들려고 하는데
//		이 때 4자리 정수를 입력 받아 각 자리 수에 중복되는 값이 없을 경우 ‘생성 성공’
//		중복 값이 있으면 ‘중복 값 있음‘
//		자리수가 안 맞으면 ‘자리 수 안 맞음‘ 출력
//		단, 제일 앞자리 수의 값은 1~9 사이 정수
		Scanner sc = new Scanner(System.in);
		System.out.print("비밀번호 입력(1000~9999) : ");
		int num = sc.nextInt(); // 1 2 3 4
//		String str = num+"";
//		
//		char thousand2 = str.charAt(0);
//		char hundred2 = str.charAt(1);
//		char ten2 = str.charAt(2);
//		char one2 = str.charAt(3);
		
		int thousand = num / 1000; // 1234 -> 1 (1000의자리수)
		int hundred = (num % 1000) / 100 ; // 1234 -> 234 -> 2(100의 자릿수)
		int ten = ((num % 1000) % 100) / 10; // 1234 % 1000 -> 234 % 100 -> 34 / 10 -> 3; (10의 자리)
		int one = ((num % 1000) % 100) % 10;// 1234 -> 234 -> 34 -> 4
		
		System.out.println(""+thousand+hundred+ten+one);
		// if(!(1 == 10 && 1 == 100 && 1 == 1000))
		// if 2311
		
		if(num <1000 || num > 9999) {
			System.out.println("자리수 안맞음");
		} else if( !(one == ten || one == hundred || one == thousand ||  ten == hundred || ten == thousand || hundred == thousand)) {
			// 중복값이 없는 케이스
			System.out.println("생성 성공");
		}else {
			System.out.println("중복 값 있음");
		}
		
		
		
		
		
		
		
		
		
		
		
		
	}
	
	
	
	
	
	
	
	
}
