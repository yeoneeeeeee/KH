package com.kh.chap02_abstractAndInterface.part02_family.run;

import com.kh.chap02_abstractAndInterface.part02_family.model.vo.Baby;
import com.kh.chap02_abstractAndInterface.part02_family.model.vo.Basic;
import com.kh.chap02_abstractAndInterface.part02_family.model.vo.Mother;

public class Run {

	public static void main(String[] args) {

		// Person p = new Person(); // 객체 생성불가

//		Person p1 = new Mother("경민", 50, 70, "입양");
//		Person p2 = new Baby("응애", 3.5, 70);
//		
//		p1.eat(); // 엄마 : 몸무게 +10 건강도 -10
//		p2.eat(); // 애기 : 몸무게 + 3, 건강도 +1
//		p1.sleep();  //엄마 : 건강도 +10
//		p2.sleep();  //엄마 : 건강도 +5
//		
//		System.out.println(p1);
//		System.out.println(p2);
//		
		// 인터페이스 적용 후
		//Basic b = new Basic();// 객체생성 불가능
		Basic b1 = new Mother("경민",60,70,"입양");
		Basic b2 = new Baby("애기",3.5,80);
		
		System.out.println(b1);
		System.out.println(b2);
		
		// 람다식 
	}

	
	
	
	
	
	
}
