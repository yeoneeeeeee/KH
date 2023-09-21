package com.kh.chap04_properties.run;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Properties;

import com.kh.chap03_hashMap.model.vo.Snack;

public class PropertiesTest1 {

	public static void main(String[] args) {
		// Properties : Map 계열 -> key, value 세트로 저장됨
		//              단, Properties만의 특징이라고한다면 key, value 모두 String으로 제한됨.
		//              파일 입출력 메소드를 지원하며, 설정정보 표현에 최적의 형태를 가지고 있음
		Properties prop = new Properties();
		
		// String이 아닌값을 넣게 될 경우, Map계열이기 때문에 추가 가능하다.
		prop.put("다이제", new Snack());
		
		System.out.println(prop);
		System.out.println(prop.get("다이제"));
		
		// 단, 주로 Properteis를 사용하는 경우에는 Properties에 담겨있는 key+value를 세트로 파일에
		// 기록을 할것. 그리고 파일에 기록된 key value를 가지고올때도 주로 사용됨
		
//		try {
//			//prop.store(new FileOutputStream("test.properties"), "Properties test");
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
		
		// 따라서 Properties에 값을 담을때는 보통
		// 1. setProperty(String key, String value)
		prop = new Properties();
		
		prop.setProperty("List", "ArrayList");
		prop.setProperty("Set", "HashSet,TreeSet,LinkedHashSet");
		prop.setProperty("Map", "Properties");
		prop.setProperty("Map", "HashMap,Properties");
		System.out.println(prop);// 저장순서 유지 x, key값 중복 안됨
		
		// 값 가져오기
		// 2. getProperty(String key) : String
		System.out.println(prop.getProperty("Map"));
		System.out.println(prop.getProperty("DBID","HEY"));// 두번째 매개변수는 받고자하는값이 없을때 default값을 제시가능
		
		
		
		try {
			// 3. store(출력스트림객체, 코멘트내용) : Properties안에 담긴 key,value를 파일로 출력
			prop.store(new FileOutputStream("test.properties"), "ABC");
			
			// 4. storeToXML(출력스트림객체, 코멘트내용 ) : Properties안에담긴 key, value xml문서에 출력
			prop.storeToXML(new FileOutputStream("test.xml"), "xml");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

	
	
	
	
	
	
}
