package com.kh.calendar.practice;

import java.util.Calendar;
import java.util.Scanner;

public class CalcYourDays {
	
	
	/*
	 * 사용자로부터 생일(년, 월, 일)을 입력 받고, 오늘이 태어난지 몇일 되었느지 출력하세요.
	 * 출력예시: 오늘은 x번째 날입니다.
	 * 
	 */
	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		System.out.print("생일을 입력하시오(yyyy)년도 : ");
		int year = sc.nextInt();
		
		System.out.print("월 : ");
		int month = sc.nextInt();
		
		System.out.print("일 : ");
		int date = sc.nextInt();
		
		Calendar today = Calendar.getInstance();
		
		Calendar birth = Calendar.getInstance();
		birth.set(year, month-1, date,0,0,0);
		
		// 날짜 차이 계산 -> 
		long diff = (today.getTimeInMillis() - birth.getTimeInMillis());
		//double test  = 0.0;
		diff = diff / 1000 / 60 / 60 / 24 ;//일수
		
		//System.out.println(test);
				
		System.out.println("오늘은 태어난지 "+(diff+1)+"번째 날입니다.");
	}
	
	
	
	
	
	
	
	
	

}
