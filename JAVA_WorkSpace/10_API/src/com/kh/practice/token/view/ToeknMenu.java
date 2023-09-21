package com.kh.practice.token.view;

import java.util.Scanner;

import com.kh.practice.token.controller.TokenController;

public class ToeknMenu {
	
	private Scanner sc = new Scanner(System.in);
	private TokenController tc = new TokenController();
	
	
	public void mainMenu() {
		while(true) {
			System.out.println("1. 지정 문자열");
			System.out.println("2. 입력 문자열");
			System.out.println("3. 프로그램 끝내기");
			System.out.print("메뉴번호 : ");
			int num = Integer.parseInt(sc.nextLine());
			
			switch(num) {
			case 1: tokenMenu(); break;
			case 2: inputMenu(); break;
			case 3: System.out.println("프로그램을 종료합니다."); return;
			default: System.out.println("잘못입력함. 다시입력.");
			}
		}
	}
	
	public void tokenMenu() {
		String str = "J a v a P r o g r a m "; 
		// 토큰 처리 전 글자, 토큰 처리 전 개수를 출력
		// TokenController(tc)의 afterToken()의 반환 값을 가지고
		// 토큰 처리 후 글자, 토큰 처리 후 개수, 모두 대문자로 변환 한 것을 출력
		System.out.println("토큰 처리 전 글자 : "+str);
		System.out.println("토큰 처리 전 개수 : "+str.length()); 
		str = tc.afterToken(str);
		System.out.println("토큰 처리 후 글자 : "+str);
		System.out.println("토큰 처리 후 개수 : "+str.length());
		System.out.println("모두 대문자로 변환 : "+str.toUpperCase());
	}
	
	public void inputMenu() {
		System.out.print("문자열을 입력하세요 :");
		String input = sc.nextLine();
		System.out.println(tc.firstCap(input));
		
		System.out.print("찾을 문자를 하나 입력하세요 : ");
		char one = sc.nextLine().charAt(0);
		System.out.println(tc.findChar(input, one));
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
