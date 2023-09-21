package com.kh.chap03_class;

import com.kh.chap03_class.model.vo.Person;
import com.kh.chap03_class.model.vo.Product;
import com.kh.chap04_field.model.vo.FieldTest2;

public class Run {

	public static void main(String[] args) {
		
		// Person이라는 클래스 == 나만의 자료형(여러개의 자료형의 여러개의 값들을 보관) == 사용자 정의 자료형
		Person p = new Person();
		System.out.println(p);
		
		p.setMemberId("id");
		p.setMemberPwd("pass");
		p.setMemberName("경민");
		
		p.changeName("민경");
		p.printName();
		
		System.out.println(p);
		System.out.println(FieldTest2.sta);
		// 상품객체 생성
		Product p1 =new Product();
		// 상품객체에 상품명 아이폰14로 초기화
		// 상품객체의 가격을 1500000원으로 초기화
		// 브랜드 : 애플
		p1.setpName("아이폰14");
		p1.setPrice(1500000);
		p1.setBrand("애플");
		
		// 상품객체에 상품명 갤럭시z-plip4로 초기화
		// 상품객체의 가격을 1000000원으로 초기화
		// 브랜드 : 삼성
		Product p2 = new Product();
		p2.setpName("Z-PLIP4");
		p2.setPrice(1000000);
		p2.setBrand("삼성");
		
		// 초기화한 상품정보를 모두 출력
		System.out.println(p1);
		System.out.println(p2);
	}

}
