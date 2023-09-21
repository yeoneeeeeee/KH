package com.kh.practice.generics.run;

import java.util.Arrays;

import com.kh.practice.generics.view.FarmMenu;

public class Run {

	public static void main(String[] args) {		
		//조작없음.		
		String[] sarr = 
		{ "이아인", "차재현", "이정택", "배선유", "황슬기", "김정찬", "박지현", "김준호","오창정"
		, "원동연", "임재린","이은영", "정동현", "최정준", "고창윤", "김시현", "정승훈", "이찬우"
		, "김소연", "이정완", "안재국", "박수진", "신용수"	,"김새하","소유진","최미선" };		
		int randoms = (int)(Math.random() * 26);
		System.out.println(sarr[randoms]);	
		/*
		 * int[] randmos = new inKt[31]; String[][] seats = new String[5][6]; for (int i
		 * = 0; i < sarr.length; i++) { int random = (int) (Mαth.random() * 30 + 1); if
		 * (randmos[random] == 1) { i--; continue; } randmos[random] = 1; int row =
		 * (random - 1) / 6; int col = (random - 1) % 6; seats[row][col] = sarr[i]; }
		 * 
		 * for (int i = 0; i < seats.length; i++) { for (int j = 0; j < seats[i].length;
		 * j++) { System.out.print(seats[i][j] + " "); } System.out.println(); }
		 */
		
	}

}
