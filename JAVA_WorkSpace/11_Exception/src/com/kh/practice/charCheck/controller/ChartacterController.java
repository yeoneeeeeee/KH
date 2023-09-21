package com.kh.practice.charCheck.controller;

import com.kh.practice.charCheck.exception.CharCheckException;

public class ChartacterController {
	
	public ChartacterController() {
		
	}
	
	public int countAlpha(String s) throws CharCheckException{
		
		// 매개변수로 들어온 값에 있는 영문자를 세어 반환
		
		// 문자열에 공백이 있다면 CharCheckException발생, 에러 메시지는 출력 값 참고
		
		char[] arr = s.toUpperCase().toCharArray();
		
		int count = 0;
		for(char c : arr) {
			if(c == ' ') {
				throw new CharCheckException("체크할 문자열 안에 공백이 포함되어 있습니다.");
			}
			if(c >= 'A' && c <= 'Z') {
				count++;
			}
		}
		
		return count;
		
	}
}
