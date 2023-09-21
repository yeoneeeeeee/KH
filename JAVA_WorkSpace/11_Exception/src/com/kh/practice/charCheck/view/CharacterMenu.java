package com.kh.practice.charCheck.view;

import java.util.Scanner;

import javax.swing.text.StyleConstants.CharacterConstants;

import com.kh.practice.charCheck.controller.ChartacterController;
import com.kh.practice.charCheck.exception.CharCheckException;

public class CharacterMenu {
	
	public void menu() {
		Scanner sc = new Scanner(System.in);
		System.out.print("문자열 : ");
		String s = sc.nextLine();
		
		ChartacterController cc = new ChartacterController();
		
		try {
			
			int count = cc.countAlpha(s);
			
			System.out.println("'"+s+"'에 포함된 영문자 개수 : "+count);
			
			menu();
		} catch(CharCheckException e) {
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		
		
		
		
		
	}
}
