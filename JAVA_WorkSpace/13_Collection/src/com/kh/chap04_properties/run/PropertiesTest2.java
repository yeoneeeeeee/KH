package com.kh.chap04_properties.run;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Enumeration;
import java.util.Properties;

public class PropertiesTest2 {

	public static void main(String[] args) {
		Properties prop = new Properties(); 
		System.out.println(prop); // 현재는 비어있음.
		
		try {
			// 5. load(입력스트림객체)
			prop.load(new FileInputStream("test.properties"));
		} catch (IOException e) {
			e.printStackTrace();
		}
		System.out.println(prop);
		
		// 6. 요소가져오기
		String list = prop.getProperty("List");
		System.out.println(list);
		
		// 전체열람
		Enumeration<?> en = prop.propertyNames(); //names == keys == 키값의 모음.
		while(en.hasMoreElements()) {
			String name = (String) en.nextElement();
			String value = prop.getProperty(name);
			System.out.println(name+" - "+value);
		}
		/*
		 * .properties 사용하는 경우는 해당 프로그램이 기본적으로 가져야 할 정보들을
		 * .properties확장자 문서로 저장해두면 key값, value값이 모두 문자열이기 때문에
		 * 개발자가 아닌 일반관리자도 해당문서를 다루기가 쉽다 => jdbc에 사용할 예정
		 * 
		 * .xml 사용하는 경우는 xml확장자 문서자체가 다양한 프로그래밍언어간에 호환이 쉽기때문에
		 * 사용이 된다.
		 * 
		 */
		
	}
	
	
	
	
	
	

}
