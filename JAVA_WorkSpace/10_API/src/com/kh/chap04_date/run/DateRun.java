package com.kh.chap04_date.run;

import java.text.DecimalFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

public class DateRun {

	public static void main(String[] args) {
		DateRun dr = new DateRun();
		// test1함수 호출하기
		//dr.test2();
		//dr.test3();
		dr.test5();
	}

	// Calendar : 날짜와 시간에 대한 데이터를 손쉽게 처리할수 있는 클래스(추상클래스)
	public void test1() {
		// 현재 날짜 ,시각 정보 조회
		Calendar cal1 = Calendar.getInstance();
		// 현재 로컬 컴퓨터상의 시스템상 지역정보를 바탕으로 해당지역의 시간정보를 가져옴
		// (한국은 그레고리력 사용). 그레고리력 == 국제표준시간
		Calendar cal2 = new GregorianCalendar();
		// 로컬컴퓨터상의 지역정보가 그레고리달력이 아닌경우 명시적으로 그레고리력 객체 생성.

		// System.out.println(cal1);

		// 조회
		System.out.println(cal1.get(Calendar.YEAR));
		System.out.println(cal1.get(Calendar.MONTH));// 0월 == 1월
		System.out.println(cal1.get(Calendar.DATE));

		// 시(12 , 24), 분, 초
		System.out.println(cal1.get(Calendar.HOUR)); // 12
		System.out.println(cal1.get(Calendar.HOUR_OF_DAY)); // 24
		System.out.println(cal1.get(Calendar.MINUTE));
		System.out.println(cal1.get(Calendar.SECOND));

		// 요일(일1 , 월2, 화3, 수4, 목5, 금6, 토7)
		System.out.println(cal1.get(Calendar.DAY_OF_WEEK));
		char[] dayOfWeek = { '일', '월', '화', '수', '목', '금', '토' };
		System.out.println(dayOfWeek[cal1.get(Calendar.DAY_OF_WEEK) - 1] + "요일");

		printCalendar(cal1);
	}

	// 특정일로 Calendar객체 생성
	public void test2() {
		
		Calendar cal1 = Calendar.getInstance();
		cal1.set(2023, 0,1,0,0,0); // 2023년 1월 1일
		printCalendar(cal1);
		
		Calendar cal2 = new GregorianCalendar(2024, 0, 1, 10, 10, 10);
		printCalendar(cal2);// 2024/02/01
		
		// 날짜 차이 계산하기
		Calendar now = Calendar.getInstance();
		// 밀리초 단위로 변환해서 차이를 구하고, 다시 초분시일 단위로 환산.
		
		long num1 = now.getTimeInMillis(); // 1970년 1월 1일 ~ 흐른 시간을 밀리초로 반환
		long num2 = cal2.getTimeInMillis(); 
		
		// mills / 1000(초) / 60 (분) / 60 (시)/ 24(일) 
		long diff = (num2 - num1) / 1000 / 60 / 60 / 24;
		
		System.out.println(diff);
		System.out.println("새해까지 D-"+(diff+1)+"일 남았습니다.");
	}
	
	/*
	 * java.util.Date 클래스
	 * - 날짜와 시간에 대한 정보를 담을수 있는 클래스
	 * - 자바 개발 초창기에 급하게 만들어져서 완성도가 높지 않은 클래스(다국적으로 쓰기에 적합하지 않음X)
	 */
	public void test3() {

		// 기본생성자를 통한 Date객체 셍성 => 현재 날짜 및 시간정보를가지옴
		Date today = new Date();
		System.out.println(today);
		
		// 내가 원하는 날짜(2023년 6월 19일)
		// 방법 1. 년,월,일 생성자를 활용하는 방법
		// 내부적으로 내가 전달한 년도 +1900 => 셋팅하고자 하는 년 - 1900
		Date date1 = new Date(2023 - 1900, 6 - 1 , 19);
		System.out.println("매개변수 생성자 : "+date1);
		
		// 방법 2. long타입 생성자를 사용하여 생성하는 방법
		//        long? unix second를 매개변수로 받은 생성자(1970년 1월 1일부터 흐른 밀리초)
		Calendar cal2 = new GregorianCalendar(2024, 6-1 , 19,0,0,0);
		
		long mills = cal2.getTimeInMillis();
		Date date2 = new Date(mills);
		
		System.out.println("long타입 생성자 : "+date2);
	}
	
	// SimpleDateFormat
	public void test4() {
		
		// xxxx년 xx월 xx일 xx시 xx분 xx초
		// 내 입맛대로 형식을 지정한 문자열을 받고자 할 때 사용할수 있는 클래스
		// java.text.SimpleDateFormat
		Date date = new Date();
		
		// 1. 형식을 지정한 SimpleDateFormat 객체 생성
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy년 MM월 dd일 (E) HH시 mm분 ss초");
		
		// 2. sdf 객체에서 제공하는 format메소드 호출 시 Date객체 전달 => 포맷으로지정한 String값이 반환
		String formatDate = sdf.format(date);
		System.out.println(formatDate);
	}
	
	// 번외) 숫자값 형식 지정
	public void test5() {
		//DecimalFormat
		// # 해당자리에 데이터가 없는경우 생략
		// 0 해당자리에 데이터가 겂는경우 0으로 표시해라 라는 의미.
		double num = 1234567890.123;
		DecimalFormat df = new DecimalFormat("￦#,###.000000");
		System.out.println(df.format(num)); 
		
	}
	
	
	public void printCalendar(Calendar c) {
		// yyyy/MM/dd hh24:mm:ss
		System.out.printf("%s/%02d/%02d %02d:%02d:%02d\n", c.get(Calendar.YEAR), c.get(Calendar.MONTH) + 1,
				c.get(Calendar.DATE), c.get(Calendar.HOUR_OF_DAY), c.get(Calendar.MINUTE), c.get(Calendar.SECOND));
	}

}
