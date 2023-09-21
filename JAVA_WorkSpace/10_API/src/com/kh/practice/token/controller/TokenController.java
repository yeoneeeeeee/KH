package com.kh.practice.token.controller;

import java.util.StringTokenizer;

public class TokenController {
	
	public TokenController() {
		
	}
	
	public String afterToken(String str) {
		//String str = "J a v a P r o g r a m "; 
		StringTokenizer st = new StringTokenizer(str, " ");
		//String s = "";
		StringBuilder sb = new StringBuilder("");
		while(st.hasMoreTokens()) {
			sb.append(st.nextToken());
		}
		
		return sb.toString();
	}
	
	public String firstCap(String input) {
		return input.toUpperCase().charAt(0) + input.substring(1);
	}
	
	public int findChar(String input, char one) {
		int count =0;
		for(int i =0;i<input.length(); i++) { // hello
			if(one == input.charAt(i)) {
				count++;
			}
		}
		return count;
	}
	
	
	
	
	
	
	
	
	
	
	
}
