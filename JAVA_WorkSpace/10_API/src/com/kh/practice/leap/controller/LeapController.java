package com.kh.practice.leap.controller;

import java.util.Calendar;

public class LeapController {
	
	
	public boolean isLeapYear(int year) {
		boolean isLeap = false;
		
		if((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
			isLeap = true;
		}
			
		return isLeap;
	}
	
	public long leapDate(Calendar c) {
//		1년 1월 1일부터 오늘까지의 총
//		날 수를 계산
//		1년부터 현재 연도까지 각 연도가
//		윤년이면 총 날수에 366일을, 평
//		년이면 365일을 더함
//		해당 현재 연도가 윤년이면 2월을
//		29일로 평년이면 28일로 더함
//		월의 날짜 수를 더함
//		(31일: 1, 3, 5, 7, 8, 10, 12월/
//		30일: 4, 6, 9, 11월)
		c.set(Calendar.HOUR, 0);
		c.set(Calendar.MINUTE, 0);
		c.set(Calendar.SECOND, 0);
		c.set(Calendar.MILLISECOND, 0);
		
		Calendar begin = Calendar.getInstance();
		
		begin.set(1, 0,1,0,0,0);
		begin.set(Calendar.MILLISECOND,0);
		
		Calendar thisYear = Calendar.getInstance();
		thisYear.set(c.get(Calendar.YEAR), 0,1,0,0,0);
		thisYear.set(Calendar.MILLISECOND, 0);
		
		// 2023 - 1 = 2022 * 365 // 738,030
		int total = 365 * (c.get(Calendar.YEAR) - 1);
		for(int i = 0; i<c.get(Calendar.YEAR); i+=4) {
			if(i % 100 != 0 || i % 400 == 0) {
				total++;
			}
		}
		
		// 이번년도의 일수 구하기 2023.01.01 ~ 2023.04.12
		long diff = (c.getTimeInMillis() - thisYear.getTimeInMillis()) /1000;
		diff = diff/60/60/24;
		
		total += diff;
		
		return total;
	}
	
	
	
	
	
	
	
	
	
	
	
}
