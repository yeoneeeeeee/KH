package com.kh.chap01.condition;

import java.util.Scanner;

public class C_Switch {
	
	/*
	 * switch문은 if문과 동일한 조건문중에 하나
	 * switch문과 if문의 차이점
	 * 
	 * if(조건식) => 조건식을 복잡하게 기술가능. 비교범위(대소비교) 제시할수 있음
	 * switch 조건식x => 확실한 값만 조건으로 기술할수 있음, 이 값을가지고 (동등비교만 수행함)
	 * 
	 * [표현법]
	 * switch(동등비교를 수행할 값) {
	 * case 값1 : 실행할 코드1; // 앞으로 동등비교를할 대상자 == 값1 일경우 실행할코드1을 실행함.
	 *            break; // 실행할코드1을 실행하고 switch문을 빠져나갈수 있게 break;를 걸어준다.
	 *            // 브레이크문이 없다면 아래내용이 순차적으로 실행됌.
	 * case 값2 : 실행할 코드2;
	 *            break;
	 * 
	 * case 값n : 실행할 코드n;
	 *            break;
	 * default : 실행할 코드; // if - else if문에서 else문과 같은 역할을 함.
	 *                     // 위의 값1, 값2, ... 값n까지 앞으로 동등비교를할 대상자와 일치하지 않다면
	 *                     // default 내의 실행할코드가 실행된다.
	 *                     // 마지막은 break문을 작성하지 않음.
	 * }
	 * 
	 * switch문의 장점 : case에 기록된 값을 통해 내가 원하는 코드위치로 프리패스 가능하다. 
	 *                 if~else문의 경우 if의 조건식 결과가 true가 나오기전까지 조건식검사를 계속 실행하므로 , switch문보다
	 *                 연산효율이 떨어짐
	 * 
	 * switch문 자주 사용되지는 않지만, 사용하는경우는 정말 어떤 동일한 연산결과가 수행되어야하는 경우.
	 * ex) 키보드입력, 마우스입력
	 * 키보드 a를 누르는 입력시간과 p를 누를대의 입력시간이 다르면 이상하다 -> 게임을한다? q키는 빨리눌리고 r키는 늦게 눌린다.
	 */
	public void method1() {
		// 1~3사이의 정수값을 입력받아
		// 1인경우 "빨간불입니다" 출력
		// 2인경우 "파란불입니다" 출력
		// 3인경우 "초록불입니다" 출력
		// 잘못입력한경우 "잘못 입력했습니다." 출력
		Scanner sc = new Scanner(System.in);
		
		System.out.print("1 ~ 3 사이의 정수 입력 : ");
		int num = sc.nextInt();
		
//		if(num == 1) { // 조건검사 1번함
//			System.out.println("빨간불");
//		}else if(num == 2) { // 조건검사 2번함
//			System.out.println("파란불");
//		}else if(num == 3) { // 조건검사 3번함
//			System.out.println("초록불");
//		} else {
//			System.out.println("잘못입력했습니다");
//		}
		
		switch(num) {
		case 1 : 
			System.out.println("빨간불");
			break;
		case 2 :
			System.out.println("파란불");
			break;
		case 3 :
			System.out.println("초록불");
			break;
		default:
			System.out.println("잘못 입력 했 습니다.");
		}
	}
	
	public void method2() {
		// 사용자에게 구매할 과일명을 입력받아
		// 각 과일마다 가격을 출력해보는 프로그램만들기
		Scanner sc = new Scanner(System.in);
		// 사과(1000원) , 바나나(2000원), 복숭아(5000)
		System.out.println("구매할 과일 목록(사과, 바나나, 복숭아) ");
		System.out.print("구매할 과일 입력 :");
		String fruit = sc.nextLine();
		
		int price = 0;
		
		switch(fruit) {
		case "사과" : 
			price = 1000;
			break;
		case "바나나" : 
			price = 2000;
			break;
		case "복숭아" :
			price = 5000;
			break;
		default : 
			System.out.println("저희가게에서 판매하는 과일이 아니네요;");
			return;// 아래 출력문이 안나오게끔 return문 추가
		}
		
		System.out.printf("%s의 가격은 %d원입니다", fruit , price );
		
		// 존재하는 과일의 경우 :
		// xx의 가격은 xxxx원입니다'
		
		// 판매하지않는 과일의 경우 : "저희 가게에서 판매하는 과일이 아닙니다" 
	}
	
	public void method3() {
		// 사용자에게 등급별로 권한을 부여하는 프로그램
		// 1 등급 : 관리권한, 글쓰기 권한, 읽기 권한
		// 2 등급 : 글쓰기 권한, 읽기 권한
		// 3 등급 : 읽기 권한
		
		Scanner sc = new Scanner(System.in);
		System.out.print("등급을 입력해 주세요 : ");
		int level = sc.nextInt();
		
		// break문 없이 switch 작성하는케이스가 종 종 있음
		switch(level) {
		case 1: System.out.print("관리 권한 소유 ");
		case 2: System.out.print("글쓰기 권한 소유 ");
		case 3: System.out.print("읽기 권한 소유");
		}
	}
	
	public void method4() {
		// 사용자에게 1월 ~ 12월 사이의 월을 입력받아 해당 달의 마지막 날짜를 출력하는 프로그램
		// 1, 3, 5, 7,8,10,12 -> 해당 달은 31일 까지 입니다.
		// 4, 6, 9, 11 => 해당 달은 30일 까지 입니다.
		// 2 => 해당 달은 28일 또는 29일까지입니다.
		// 그외 => 1월부터 12월까지의 숫자를 입력해주세요.
		
		// switch문으로 만들기, break은 딱 3개만 사용
		Scanner sc = new Scanner(System.in);
		System.out.print("1월 ~ 12월 사이의 월 입력 :");
		int month = sc.nextInt();
		
		switch(month) {
		case 1: 
		case 3: 
		case 5: 
		case 7: 
		case 8: 
		case 10: 
		case 12: System.out.println("해당 달은 31일 까지 입니다."); break;
		case 6: 
		case 4: 
		case 9: 
		case 11: System.out.println("해당 달은 30일 까지 입니다."); break;
		case 2: System.out.println("해당 달은 28일 또는 29일까지입니다."); break;
		default: System.out.println("1월부터 12월까지의 숫자를 입력해주세요.");
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
