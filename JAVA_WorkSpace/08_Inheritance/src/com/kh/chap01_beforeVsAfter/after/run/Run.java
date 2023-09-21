package com.kh.chap01_beforeVsAfter.after.run;

import com.kh.chap01_beforeVsAfter.after.model.vo.Desktop;
import com.kh.chap01_beforeVsAfter.after.model.vo.SmartPhone;
import com.kh.chap01_beforeVsAfter.after.model.vo.Tv;

public class Run {

	public static void main(String[] args) {
		Desktop d = new Desktop("삼성", "d-01", "데탑", 2000000, true);
		
		SmartPhone s = new SmartPhone("애플", "a-01", "아이폰 14", 1400000, "KT");

		Tv t = new Tv("엘지", "t-01", "얇은티비", 3500000, 60);
		
		System.out.println(d.toString());
		
		/*
		 * 상속의 장점
		 * - 보다 적은양의 코드로 새로운 클래스들을 작성 가능
		 * - 중복된코드를 공통적으로 관리하기 때문에 새로운 코드를 추가하거나 수정할때 용이하다
		 *   => 프로그램 생산성과 유지보수에 크게 기여
		 * - 정의해둔 부모클래스를 통해 좀더 손쉽게 다른클래스로의 확장이 가능해짐.
		 *  ex) Product클래스 하나로 백화점에 존재하는 모든 상품객체를 만든다라고 했을때, 데스크탑, 스마트폰 , tv
		 *  3가지 클래스 외에도 냉장고, 에어프라이어, 책, 음식 등 다양한 상품클래스로 확장시켜줄수가 있다.
		 * 
		 *  상속의 특징
		 *  - 클래스간의 다중상속은 불가능하다(단일 상속만 가능)
		 *  - 명시되어있지 않지만 모든 클래스(자바에서 이미 제공하는 클래스, 내가만 클래스)는 Object클래스의 후손
		 *  => Object클래스에 있는 메소드를 쓸수있음.
		 *  => Object클래스에 있는 메소드가 맘에 안들면 오버라이딩을 통해 재정의가 가능하다.
		 */
		
		
		
		
	}
	
	
	
	
	
	
	
	
	

}
