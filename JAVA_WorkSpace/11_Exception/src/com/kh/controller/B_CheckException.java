package com.kh.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;

public class B_CheckException {
	/*
	 * CheckedException은 "반드시" 예외처리를 해줘야하는 예외들
	 * (즉, 예측불가능한 곳에서 에러가 발생하기 때문에 미리 예외처리구문을 작성해야함)
	 * => 주로 외부매체와 어떤 입출력을할때 발생.
	 */
	
	public void method1() {
		
		try {
			method2();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	public void method2() throws IOException {
		
		// Scanner와 같이 키보드로 값을 입력 받을수 있는 객체(단, 문자열로만 가능)
		InputStreamReader is = new InputStreamReader(System.in);
		
		BufferedReader br = new BufferedReader(is);
		
		System.out.print("아무글자나 입력해주세요 : ");
		
//		try {
//			String str = br.readLine(); // 이메소드를 호출하기 위해서는 IOException이 발생할수 있으므로 예외처리를 해야한다.
//			System.out.println("문자열의 길이 : "+str.length());
//		}catch(IOException e) {
//			System.out.println("예외발생");// 예외가 언제 발생할지 모름
//		}
		
		// 2. throws : 지금 현재 메소드에서 발생한 예외를 본인을 호출한 메소드로 떠넘기는 키워드
		String str = br.readLine();
	}
	
	/*
	 *                         예외발생시점                            예외 처리
	 * RunTimeException     프로그램 샐행 시 => 런타임 에러(컴파일 에러 x)   필수아님 => UnCheckedExeption(조거문으로 예외처리가능)
	 * IOException               그 외    =>  컴파일 에러               필수   => CheckedException(반드시 예외처리로 해결) 
	 * 
	 */
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
