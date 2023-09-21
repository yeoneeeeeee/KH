package com.kh.practice1.func;

import java.util.Scanner;

public class VariablePractice1 {
	
	public int a = 10;
	
	public void practice1() {
		
		Scanner sc = new Scanner(System.in);
		
		System.out.print("이름을 입력하세요 :");
		String name = sc.nextLine();
		
		System.out.print("성별을 입력하세요(남/여) :");
		char gender = sc.nextLine().charAt(0);
		
		System.out.print("나이를 입력하세요 :");
		int age = sc.nextInt();
		
		System.out.print("키를 입력하세요(cm) : ");
		double height = sc.nextDouble();
		
		//키 180.5cm인 20살 남자 아무개님 반갑습니다^^
		System.out.printf("키 %.1fcm인 %d살 %c자 %s님 반갑습니다^^", height, age, gender, name);
	}
	
	public void practice2() {
		
		Scanner sc = new Scanner(System.in);

		System.out.print("첫 번째 정수 : ");
		int num1 = sc.nextInt();
		System.out.print("두 번째 정수 : ");
		int num2 = sc.nextInt();		
		
		System.out.println("더하기 결과 : "+ (num1+num2));
		System.out.println("빼기 결과 : "+ (num1 - num2));
		System.out.println("곱하기 결과 : " + num1*num2 );
		System.out.println("나누기 몫 결과 : " + num1/num2);
	}
	
	public void practice3() {
		
		Scanner sc = new Scanner(System.in);
		System.out.print("가로 : ");
		double width = sc.nextDouble();
		
		System.out.print("세로 : ");
		double height = sc.nextDouble();
		
		System.out.println("면적 : " + width * height);
		System.out.println("둘레 : " + (width + height) *2);
	}
	
	public void practice4() {
		//영어 문자열 값을 키보드로 입력 받아 문자에서 앞에서 세 개를 출력하세요.
		Scanner sc = new Scanner(System.in);
		System.out.print("문자열을 입력하세요 : ");
		String str = sc.nextLine();
		
		// sc.nextLine().charAt(0)
		// str.charAt(0);
		System.out.println("첫 번째 문자 : "+str.charAt(0)); 
		System.out.println("두 번째 문자 : "+str.charAt(1));
		System.out.println("세 번째 문자 : "+str.charAt(2));
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
