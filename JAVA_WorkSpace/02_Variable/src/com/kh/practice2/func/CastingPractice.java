package com.kh.practice2.func;

import java.util.Scanner;

public class CastingPractice {
//	실수형으로 국어, 영어, 수학 세 과목의 점수를 입력 받아 총점과 평균을 출력하세요.
//	이 때 총점과 평균은 정수형으로 처리하세요.
	public void method1() {
		Scanner sc = new Scanner(System.in);
		System.out.print("국어 : ");
		double kor = sc.nextDouble();
		
		System.out.print("영어 : ");
		double eng = sc.nextDouble();
		
		System.out.print("수학 : ");
		double math = sc.nextDouble();
		
		System.out.println("총점 : " + (int) (kor+eng+math));
		System.out.println("평균 : " + (int) ((kor+eng+math) / 3));
	}
	
	public void method2() {
		
		int iNum1 = 10;
		int iNum2 = 4;
		
		float fNum = 3.0f;
		
		double dNum = 2.5;
		
		char ch = 'A';
		
		System.out.println( iNum1 / iNum2 ); // 2
		System.out.println( (int) dNum ); // 2
		System.out.println( iNum2 * dNum ); // 10.0
		System.out.println( (double) iNum1 ); // 10.0
		System.out.println( iNum1 / (double) iNum2 ); // 2.5
		System.out.println( dNum ); // 2.5
		System.out.println( (int) fNum ); // 3
		System.out.println( iNum1 / (int)fNum ); // 3
		System.out.println( iNum1 / fNum );// 3.3333333
		System.out.println( iNum1 / (double)fNum ); // 3.3333333333333335
		System.out.println( ch ); // 'A'
		System.out.println( (int) ch ); // 65
		System.out.println( (int) ch + iNum1 ); // 75
		System.out.println( (char) (ch + iNum1) ); // 'K'
	}
	
	
	
	
	
	
	
	
	
}
