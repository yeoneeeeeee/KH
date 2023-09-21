package com.kh.chap02_string.controller;

public class D_StringBufferAndBuilder {
	/*
	 * String은 불변클래스
	 * StringBuffer와 StringBuilder은 변하는 클래스 
	 * 문자열 연산이 빈번하게 일어나는 알고리즘에서 메모리이슈를 해결하기위해 나온 클래스.
	 * 
	 * 기본적으로 두개의 클래스는 완전100%동일한 메서드를 가짐.
	 * 차이점 예약어 하나만다른데, "동기화"여부
	 * 
	 * 추후 배우게될 Thread개념이 적용되어있음.
	 * StringBuffer는 멀티스레드 환경에서 유용하며
	 * StringBuilder는 단일스레드 환경에서 유용함.
	 */
	
	public void method() {
		String str = "Hello";
		str += "World";
		
		StringBuffer sb = new StringBuffer("Hello");
		sb.append("World");
		
		StringBuilder sb2 = new StringBuilder("Hello");
		sb2.append("World,");
		
		// 유용한 메서드 알아보기
		// 특정위치의 문자를 없애는 메소드
		sb2.deleteCharAt(sb2.length()-1);
		System.out.println(sb2);
		
		System.out.println("o의 마지막 위치 ? "+sb2.lastIndexOf("o"));
		
		// 0번 인덱스부터 마지막 인덱스까지 모든 문자를 삭제하겠다.
		System.out.println(sb.delete(1, sb.length()));
		
		System.out.println(sb);
	}
	
	
	
	
	
	
	
	
}
