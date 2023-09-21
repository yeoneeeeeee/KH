package com.kh.chap02.loop;

import java.util.Scanner;

public class A_For {
	/*
	 * <반복문>
	 * 프로그램 흐름을 제어하는 제어문중 하나.
	 * 어떤 실행코드를 반복적으로 수행시켜줌.
	 * 
	 * 크게 두종류로 나뉘는데(for문/ while문(do-while))
	 * [표현법]
	 * for(초기식; 조건식; 증감식  ){ //각 가지 식들은 세미콜론으로 구분해서 표현. 세미콜론을 안쓰면 에러납니다.
	 *   // 반복적으로 실행시킬 코드
	 * }
	 * - 초기식 : 반복문이 시작될 때 "초기에 단 한번만 실행"되는 구문
	 *          (반복문에서 사용할 변수를 선언 및 초기화 구문)
	 *          예) int i = 0;
	 *
	 * - 조건식 : "반복문이 수행될 조건"을 작성하는 구문
	 *           조건식이 true일 경우 반복문 실행
	 *           조건식이 false일 경우 반복문 종료
	 *           (보통 초기식에 제시된 변수를 가지고 조건식을 작성)
	 *           예) i <10;
	 * 
	 * - 증감식 : 반복문을 제어하는 변수값을 증감시키는 구문(보통 초기식에 제시된 변수를 가지고 증감식 작성)
	 *           예) i++ , i+=1
	 *           
	 * jvm이 for문을 만나는 순간
	 * 초기식 -> 조건식(조건검사) -> true일 경우 실행할 코드를 실행 -> 증감식
	 *      -> 조건식(조건검사) -> true일 경우 실행할 코드를 실행 -> 증감식
	 *      -> 조건식(조건검사) -> true일 경우 실행할 코드를 실행 -> 증감식
	 *      ....
	 *      -> 조건식(조건검사) -> false일 경우 코드를 실행하지 않고, for반복문 종료.
	 * 
	 * 매번 조건식의 조건검사를 통해서 조건이 true일 경우만 반복해서 실행함.
	 * 
	 */
	
	public void method1() {
		// "안녕하세요/"를 5번 반복해서 출력하고싶다
		System.out.println("안녕하세요!");
		System.out.println("안녕하세요!");
		System.out.println("안녕하세요!");
		System.out.println("안녕하세요!");
		System.out.println("안녕하세요!");
		
		// 적은횟숫일 경우 복사 붙여넣기가 가능하만
		// 100번 반복하고 싶은경우?
		// 1000번 반복하고 싶은경우? 
		
		/*
		 * for(;;) { // 초기식, 조건식, 증감식 없어도 에러나지 않음.(세미콜론만 있으면 됨)
		 * System.out.println("하이"); }// 무한반복.
		 */
		
		// i값이 1에서부터 5보다 작거나 같을때까지 1씩 증가할 동안 반복 수행
		// i: 1 , 2, 3, 4, 5(5회)
		for(int i = 1 ; i <= 5 ; i++) {
			System.out.println("하이");
		}
		
		// 0 1 2 3 4 (5회)
		for(int i = 0 ; i < 5 ; i++) {
			System.out.println("하이222");
		}
		// 5 6 7 8 9 (5회)
		for(int i = 5 ; i < 10 ; i++) {
			System.out.println("하이333");
		}
		
		// 1 3 5 7 9 (5회)
		for(int i = 1 ; i < 10 ; i+=2 ) {
			System.out.println("하이444");
		}
		// int i 변수는 for문 안에서만 사용 가능하고, 같은 이름으로 반복적으로 선언이 가능하다
	}
	
	public void method2() {
		// 1 ~ 5까지 출력
		// i값은 1부터 6보다 작을대까지 1씩 증가시킬것.
		for(int i = 1; i<=5; i++) {
			System.out.println(i);
		}
		// 가로로 12345 출력
		for(int i = 1; i<=5; i++) {
			System.out.print(i);
		}
	}
	
	public void method3() {
		// 5 4 3 2 1
		int i =0;
		
		for(i = 5; i >= 1; i--) { // i의 값이 5에서부터 1씩 감소하는동안 반복수행(5,4,3,2,1)
			System.out.print(i+" ");
		}
		
		System.out.println(i);// i=0;
	}
	
	public void method4() {
		// i값이 1에서부터 10까지 증가하면서 
		// i값 중 홀수만 출력하시오.
		// 1 3 5 7 9
		for(int i = 1; i < 10; i++) {// i= 1, 2, 3, 4,... 9 (10회 반복)
			if(i % 2 == 1) {
				System.out.print(i+" ");
			}
		}
		System.out.println();//줄바꾸기 용도 
		for(int i =1; i<10; i+=2) {// i = 1, 3, 5, 7, 9 (5회) 
			System.out.print(i+" "); // 반복횟수가 더 적으면서, 조건검사도 없음(효율이 더 좋다)
		}
	}
	
	public void method5() {
		// 출력  : 1 2 3 4 5 6 7 8 9 10
		//반복문 틀 고정
		for(int i =0; i<=9; i++) {
			System.out.print(i + 1 +" ");
		}
	}
	
	public void method6() {
		// 1 ~ 10까지의 총 합계
		//int sum = 1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 + 9 + 10;
		
		//int sum = 1;
		//sum += 2;
		//sum += 3;
		//sum += 4;
		//... sum += 10;
		// 규칙을 찾아내는 노력이 필요함!! sum변수에 누적해서 합산하는 코드를 반복적으로 실행시키는 규칙이 있다.
		// 단, 누적해서 더하는 그 값이 초기값 1에서부터 최대 10씩 1씩 증가하는 규칙을 가지고 있다.
		int sum = 0;
		for(int i = 1; i<= 5; i++) {
			sum += i;
		}
		System.out.println("1에서부터 10까지의 총 합계 : "+sum);
	}
	
	 // 산술연산 + 스캐너 + 반복문
	public void method7() {
		// 1에서부터 사용자가 입력한 수까지 모두 더해서 출력해보기
		Scanner sc = new Scanner(System.in);
		System.out.print("양수 입력 : ");
		int num = sc.nextInt();
		
		// 입력받은수가 양수 일 경우
		if(num > 0) {
			int sum = 0;
			for(int i = 1; i<=num; i++) { // 5 -> 1 2 3 4 5
				sum += i;
			}
			System.out.printf("1에서부터 %d까지의 총 합계 : %d입니다.", num , sum);
		}else {
			System.out.println("잘못 입력했습니다");
		}
		// 1에서부터 n까지의 총 합계 : xx입니다.
		// 입력받은수가 양수가 아닐경우
		// 잘못입력했씁니다.
	}
	
	public void method8() {
		// 1에서부터 매번 달라지는 랜덤값을구하고 , 그 값까지의 총 합계
		
		/*
		 * java.lang.Math 클래스에 정의되어있는 random()메소드를 호출하여 매번 다른 랜덤값을 얻어올수 있다.
		 * 스캐너 생성시 스캐너 new 해서 생성했음. but Math클래스의 경우 별도의 생성없이 사용가능.
		 * java.lang => java.base안에 담겨있꼬, java.lang패키지안의 모든 클래스는 모든클래스에 자동으로 import 되어있음
		 * 
		 * random() : 0.0 ~ 0.99999999999... 사이의 랜덤값을 발생
		 *            0.0 <= x < 1.0
		 * 1 ~ 10사이의 랜덤값 구하기
		 * 우선 10을 곱해보기 -> 0.0 <=  x < 10.0
		 * 그다음 1을 더해주기 -> 1.0 <= x  < 11.0
		 *                 -> 1.0 <= x <= 10.99999999999
		 * 소숫점 다 버려주기 -> 1<= x <= 10
		 * 
		 * 1 ~ 10사이의 랜덤수를 원한다면 (int) (Math.random() * 10 ) + 1을 하면됨
		 * => 1.0 <= random < 11.0
		 * => 1 <= random <= 10
		 * [표현법]
		 * Math.random() * 출력하고자하는 갯수 + 시작수
		 * 시작수 ~ (시작수+갯수) 
		 */
		
		// Math m = new Math();
		// m.random();
		//double random = Math.random();
		//String a = "";
		
		int random = (int) ((Math.random() * 10) +1);
		System.out.println("랜덤값 : "+random);
		
		int sum = 0;
		for(int i = 1; i<= random; i++) {
			sum += i;
		}
		System.out.printf("1부터 %d까지의 총 합은 %d 입니다.", random, sum);
	}
	
	public void method9() {
		//사용자에게 문자열을 입력받기
		//각 인덱스별로 문자를 뽑아서 출력
		
		// hello ->
		// hello world
		// apple kiwi
		Scanner sc = new Scanner(System.in);
		System.out.print("문자열 입력 : ");
		String str = sc.nextLine();
		
		// apple 문자열의 길이 : 5
		// apple의 마지막 인덱스의 위치 : 4
		// 01234
		
		// kiwi 문자열의 길이 : 4
		// kiwi의 마지막 인덱스의 위치 : 3
		// 0123
		// 추출하고자 하는 인덱스값의 범위는 0 ~ (문자열의 길이 -1) 까지 매번 1씩 증가
		
		// 문자열의 길이는 어떻게 아냐? 문자열의 길이를 알려주는 메소드 활용하면 됨.
		System.out.println("문자열의 길이 : "+ str.length() );
		for(int i = 0; i < str.length(); i++ ) { 
			System.out.println(str.charAt(i));
//			str.charAt(0);
//			str.charAt(1);
//			str.charAt(2);
//			str.charAt(3);
//			...
//			str.charAt(n-1);
		}
		
	}
	
	public void method11() {
		// 구구단 출력(2단)
		/*
		 * 2 X 1 = 2
		 * 2 X 2 = 4
		 * 2 X 3 = 6
		 * 2 X 4 = 8
		 * ...
		 * 2 X 9 = 18
		 * 
		 * 규칙찾기 1. 2 X 까지는 모든 반복문마다 그대로, 그리고 뒤의숫자가 1~9까지 올라감
		 */
		for(int i = 1; i<= 9; i++) {
			System.out.printf("%d X %d = %d \n", 2 , i , 2 * i );
		}
	}
	
	public void method12() {
		// 사용자가 입력한 단을 출력
		Scanner sc = new Scanner(System.in);
		
		System.out.print("단 수(2~9) 입력 : ");
		int dan = sc.nextInt();
		// 이때 , 사용자가 잘못 입력하는것을 대비해보기
		// 2~9사이의 단수를 입력한경우-> 해당 단수 출력
		if(!(dan >= 2 && dan <= 9)) {
			System.out.println("잘못입력했씁니다. 2~9사이의 정수를 입력해주세요");
			method12();
			return;
		}
		
		for(int i =1; i<=9; i++) {
			System.out.printf("%d X %d = %d \n", dan , i, dan*i);
		}
		// 잘못입력한경우 -> 잘못입력했씁니다. 2~9사이의 정수를 입력해주세요 -> 다시한번 입력받기
	}
	
	//중첩반복문
	public void method14() {
		// 1~5까지 연달아 출력
		// 1 2 3 4 5\n
		// 1 2 3 4 5\n
		// 1 2 3 4 5\n
		for(int j = 1; j<=3; j++) {
			for(int i = 1; i<=5; i++ ) { //1 2 3 4 5
				System.out.print(i+" ");
			}
			System.out.println();//줄바꿈해주는 코드.
		}
	}
	
	public void method15() {
		//****\n
		//****\n 
		//****\n
		//****\n
		
		//중첩 for문 사용해서 출력해보기
		for(int j = 1; j<=4; j++) {
			for(int i =0; i<4; i++) {
				System.out.print("*");
			}
			System.out.println();
		}
	}
	
	public void method16() {
		//1***
		//*2**
		//**3*
		//***4
		int raddom = (int) (Math.random()*45)+1;

		for(int i = 1; i<=4; i++) { // 4번 반복 i = 1, 2, 3 , 4
			for(int j = 1; j<=4;j++) { // 4번반복 ( 1, 2, 3, 4)
				if(j == i) {
					System.out.print(j);
				}else {
					System.out.print("*");
				}
			}
			System.out.println();
		}
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
