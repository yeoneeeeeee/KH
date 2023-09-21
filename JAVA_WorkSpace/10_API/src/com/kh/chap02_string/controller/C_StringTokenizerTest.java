package com.kh.chap02_string.controller;

import java.util.StringTokenizer;

public class C_StringTokenizerTest {
	
	public void method() {
		
		String students = "정선경,박수진,김시현,최미선,황슬기,이아인,이정택,김새하,오창정,김정찬,신용수,배선유,이준호,정승훈,정동현,원동연,오승환,소유진,박지현,김자은,안재국,차재현,이정완,이은영,김소연,임재린,최정준,이찬우,정재학,고창윤";
		
		// 구분자를 제시해서 문자열을 분리시키는 방법
		// 방법 1. 분리된 문자열들을 String[]배열에 차곡차곡 담아서 관리하고자 할때.
		//        문자열.split(String 구분자) : String[]
		String[] arr = students.split(",");
		
		for( String student   :  arr) {
			System.out.println(student);
		}
		
		// 방법 2. 분리된 각각의 문자열들을 토큰으로 취급하고 싶을대
		//        java.util.StringTokenizer 클래스를 이용하면됨.
		//        StringTokenizer stn = new StringTokenizer(분리시키고자하는 문자열, 구분자);
		
		System.out.println("================================================");
		
		StringTokenizer stn = new StringTokenizer(students , ",");
		
		System.out.println("분리된 문자열의 갯수 : "+stn.countTokens());
		
//		System.out.println(stn.nextToken());
//		System.out.println(stn.nextToken());
//		System.out.println(stn.nextToken());
//		System.out.println(stn.nextToken());
//		System.out.println(stn.nextToken());
//		System.out.println(stn.nextToken());
		
//		int count = stn.countTokens();
//		for(int i =0; i<count; i++) {
//			System.out.println(stn.nextToken());
//		}
		
		while(stn.hasMoreTokens()) { // stn공간안에 남아있는 토큰이 있나? 
			System.out.println(stn.nextToken());
		}
		
		
		
		
		
		
		
	}

}
