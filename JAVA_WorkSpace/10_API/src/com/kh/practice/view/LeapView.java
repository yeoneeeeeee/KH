package com.kh.practice.view;

import java.util.Calendar;

import com.kh.practice.leap.controller.LeapController;

public class LeapView {
	
	public LeapView() {
//		기본생성자로 이 안에 평년인지
//		윤년인지, 1년 1월 1일부터 지금
//		까지 며칠이 지났는지 모두 출력
		Calendar c = Calendar.getInstance();
		int year = c.get(Calendar.YEAR);
		
		boolean isLeap = new LeapController().isLeapYear(year);
		System.out.println(year+"년은 "+(isLeap ? "윤년":"평년")+"입니다.");
		
		
		long total = new LeapController().leapDate(c);
		System.out.println("총 날짜 수 : "+total);
	}
}
