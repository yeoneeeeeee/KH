package com.kh.practice.chap02.loop;

import java.util.Scanner;

public class LoopPractice {
	
	Scanner sc = new Scanner(System.in);
	
	public void practice1() {
//		사용자로부터 한 개의 값을 입력 받아 1부터 그 숫자까지의 숫자들을 모두 출력하세요.
//		단, 입력한 수는 1보다 크거나 같아야 합니다. 만일, 1 미만의 숫자가 입력됐다면
//		“1 이상의 숫자를 입력해주세요”가 출력되면서 다시 사용자가 값을 입력하도록 하세요.
		System.out.print("1이상의 숫자를 입력하세요 : ");
		int num = sc.nextInt();
		
//		if(num >= 1) { // 제대로 입력한경우
//			for(int i = 1; i <=num; i++) { // 1 2 3 4 5 ... n
//				System.out.print(i+" ");
//			}
//		} else {
//			System.out.println("1 이상의 숫자를 입력해주세요!");
//			practice1();
//		}
		
		if(!(num >= 1)) {
			System.out.println("1 이상의 숫자를 입력해주세요!");
			practice1();
			return;
		}
		for(int i = 1; i <=num; i++) { // 1 2 3 4 5 ... n
			System.out.print(i+" ");
		}
	}
	
	public void practice2() {
		
		System.out.print("1이상의 숫자를 입력하세요 : ");
		int num = sc.nextInt();
		
		if(!(num >= 1)) {
			System.out.println("1 이상의 숫자를 입력해주세요!");
			practice2();
			return;
		}
		
		for(int i = num; i >=1; i-- ) { // n , n-1 n-2 n-3 ... 1
			System.out.print(i+" ");
		}
	}
	
	public void practice3() {
		// 1부터 사용자에게 입력 받은 수까지의 정수들의합을 출력하세요.
		System.out.print("정수를 하나 입력하세요 :");
		int num = sc.nextInt(); // 8
		//1 + 2 + 3 + 4 + 5 + 6 + 7 + 8 = 36
		
		int sum = 0;
		for(int i = 1; i<=num; i++) { // 1 2 3 4 5 6 7 8
//			if(i == num) {
//				System.out.print(i + " = " );
//			}else {
//				System.out.print(i + " + " );	
//			}
			System.out.print(i + (i == num ? " = ": " + "));
			sum += i;
		}
		System.out.print(sum);
	}
	
	public void practice4() {
//		사용자로부터 두 개의 값을 입력 받아 그 사이의 숫자를 모두 출력하세요. 만일, 1 미만의 숫자가 입
//		력됐다면 “1 이상의 숫자를 입력해주세요”가 출력되면서 다시 사용자가 값을 입력하도록 하세요.
		System.out.print("첫 번째 숫자 : ");
		int num1 = sc.nextInt();
		
		System.out.print("두 번째 숫자 : ");
		int num2 = sc.nextInt();
		
		if(num1 <= 0 || num2 <= 0 ) {
			System.out.println("1 이상의 숫자를 입력해주세요");
			practice4();
			return;
		}
		
		int min = num1;
		if( min > num2) {
			min = num2;
		}
		
		int max = num1;
		if( max < num2) {
			max = num2;
		}
		
		for(int i = min; i<= max; i++) {
			System.out.print(i + " ");
		}
	}
	
	public void practice5() {
		System.out.print("숫자 : ");
		int dan = sc.nextInt();
		
		if(dan > 9) {
			System.out.println("9이하의 숫자를 입력해주세요");
			practice5();
			return;
		}
		
		for(int j = dan; j<=9; j++) {
			System.out.printf("==== %d단 ====\n",j);
			for(int i = 1; i<= 9; i++) {
				System.out.printf("%d X %d = %d \n", j , i , j * i );
			}
		}
	}
	
	public void practice6() {
//		사용자로부터 시작 숫자와 공차를 입력 받아
//		일정한 값으로 숫자가 커지거나 작아지는 프로그램을 구현하세요.
//		단, 출력되는 숫자는 총 10개입니다.
//		* ‘공차’는 숫자들 사이에서 일정한 숫자의 차가 존재하는 것을 말한다.
//		ex) 2, 7, 12, 17, 22 …
//		5 5 5 5 => 여기서 공차는 5
		
		System.out.print("시작 숫자 : ");
		int start = sc.nextInt();
		
		System.out.print("공차 : ");
		int gong = sc.nextInt();
		
		int count = 1;
		for(int i = start; count <= 10; i += gong) { //  i <= gong*9+start
			System.out.print(i + " ");
			count++;
		}
		
	}
	public void practice7() {
//		정수 두 개와 연산자를 입력 받고 입력된 연산자에 따라 알맞은 결과를 출력하세요.
//		단, 해당 프로그램은 연산자 입력에 “exit”라는 값이 들어올 때까지 무한 반복하며
//		exit가 들어오면 “프로그램을 종료합니다.”를 출력하고 종료합니다.
//		또한 연산자가 나누기이면서 두 번째 정수가 0으로 들어오면
//		“0으로 나눌 수 없습니다. 다시 입력해주세요.”를 출력하며,
//		없는 연산자가 들어올 시 “없는 연산자입니다. 다시 입력해주세요.”라고 출력하고
//		두 경우 모두 처음으로 돌아가 사용자가 다시 연산자부터 입력하도록 하세요.
		for(;;) { // 무한반복
			System.out.print("연산자(+, -, *, /, %) :");
			String op = sc.nextLine();
			
			if(op.equals("exit")) {
				System.out.println("프로그램을 종료합니다.");
				return;
			}
			
			System.out.print("정수 1: ");
			int num1 = sc.nextInt();
			
			System.out.print("정수 2: ");
			int num2 =sc.nextInt();
			int result = 0;
			sc.nextLine();
			
			switch(op) {
			case "+": 
				result = num1 + num2;
				break;
			case "-":
				result = num1 - num2;
				break;
			case "*":
				result = num1 * num2;
				break;
			case "/":
				if( num2 == 0) {
					System.out.println("0으로 나눌수 없습니다. 다시 입력해주세요");
					practice7();
					return;
				}
				result = num1 / num2;
				break;
			case "%":
				if( num2 == 0) {
					System.out.println("0으로 나눌수 없습니다. 다시 입력해주세요");
					practice7();
					return;
				}
				result = num1 % num2;
				break;
			//case "exit" : System.out.println("프로그램을 종료합니다. "); return;
			default : 
				System.out.println("없는 연산자입니다. 다시 입력해주세요");
				practice7();
				return;
			}
			
			System.out.printf("%d %s %d = %d", num1, op, num2 , result);
		}
		
	}
	
	public void practice10() {
//		//   *\n
//		for(int i =0; i<4; i++) { // 4번반복
//			if(i < 3) { // 0 1 2
//				System.out.print(" ");
//			}else { // 3
//				System.out.print("*");
//			}
//		}
//		System.out.println();
//		//  **\n
//		for(int i =0; i<4; i++) { // 4번반복
//			if(i < 2) { // 0 1 2
//				System.out.print(" ");
//			}else { // 3
//				System.out.print("*");
//			}
//		}
//		System.out.println();
//		// ***\n
//		for(int i =0; i<4; i++) { // 4번반복
//			if(i < 1) { // 0 1 2
//				System.out.print(" ");
//			}else { // 3
//				System.out.print("*");
//			}
//		}
//		System.out.println();
//		//****\n
//		for(int i =0; i<4; i++) { // 4번반복
//			if(i < 0) { // 0 1 2
//				System.out.print(" ");
//			}else { // 3
//				System.out.print("*");
//			}
//		}
//		System.out.println();
		System.out.print("정수 입력 : ");
		int num = sc.nextInt();
		
		for(int j = 0; j < num; j++) {
			for(int i =0; i<num; i++) { // 4번반복
							// 0 1 2 3
							// 3 2 1 0
				System.out.print( i < (num-1) - j ? " " :"*");
//				if(i < (num-1) - j) { // 0 1 2 3
//					System.out.print(" ");
//				}else { // 3
//					System.out.print("*");
//				}
			}
			System.out.println();
		}
	}
	
	public void practice14() {
//		2부터 사용자가 입력한 수까지의 소수를 모두 출력하고 소수의 개수를 출력하세요.
//		단, 입력한 수가 2보다 작은 경우 “잘못 입력하셨습니다.”를 출력하세요
		System.out.print("숫자 : ");
		int num = sc.nextInt(); //11
		
		if(num < 2) {
			System.out.println("잘못 입력하셨습니다.");
			return;
		}
		
		int count = 0;
		for(int i = 2; i<=num; i++) {// 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18 19 20
			// ‘소수’는 i을 1부터 i까지로 나누었을 때 나누어 떨어지는 수가 1과 i뿐인 수를 말한다.
			boolean isPrime = true;
			for(int j = 2; j < i; j++) {
				if(i % j == 0) { // 소수가 아님.
					isPrime = false;
					break;
				}
			}
			//break;
//			if(isPrime) {
//				System.out.print(i+" ");
//				count++;
//			}
		}
		System.out.printf("\n2부터 %d까지 소수의 개수는 %d개입니다.", num, count);
			
//		2 3 5 7 11 
//		2부터 11까지 소수의 개수는 5개입니다
		
	}
	
	
	
	
	
}
