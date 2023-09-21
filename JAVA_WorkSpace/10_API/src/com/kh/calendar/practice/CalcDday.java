package com.kh.calendar.practice;

import java.util.Calendar;
import java.util.Scanner;

public class CalcDday {
	/*
	 * 
	 * Calendar클래스를 이용해서 D-Day계산기를 만드시오.
	 * 사용자로부터 D-Day를 입력받고 ,다음과 같이 출력
	 * 1. (D-DAY 전) : XXX일 남았습니다.
	 * 2. (D-DAY) : D-DAY입니다.
	 * 3. (D-DAY 후) : XX일 지났습니다.
	 */
	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		System.out.print("D-day를 입력하시오(yyyy)년도 : ");
		int year = sc.nextInt();
		
		System.out.print("월 : ");
		int month = sc.nextInt();
		
		System.out.print("일 : ");
		int date = sc.nextInt();
		
		Calendar today = Calendar.getInstance();
		
		Calendar dday = Calendar.getInstance();
		dday.set(year, month-1, date,0,0,0);
		//dday.set(Calendar.MILLISECOND, 0);
		
		// 날짜 차이 계산 -> 
		double diff = (today.getTimeInMillis() - dday.getTimeInMillis());
		
		diff = diff / 1000 / 60 / 60 / 24 ;//일수
		
		//System.out.println(diff);
				
		//System.out.println("오늘은 태어난지 "+(diff+1)+"번째 날입니다.");
		if(diff > 1) {
			System.out.println( (int)diff +"일 남았습니다.");
		} else if(diff > 0) {
			System.out.println("D-Day 입니다.");
		} else {
			System.out.println((int)( Math.ceil(-diff)) +"일 지났습니다.");
		}
	}
	
	
	
	
	
	

}
