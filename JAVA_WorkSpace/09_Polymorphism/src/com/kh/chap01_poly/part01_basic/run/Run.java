package com.kh.chap01_poly.part01_basic.run;

import com.kh.chap01_poly.part01_basic.model.vo.Child1;
import com.kh.chap01_poly.part01_basic.model.vo.Child2;
import com.kh.chap01_poly.part01_basic.model.vo.Parent;

public class Run {

	public static void main(String[] args) {
		
		// = 대입연산자 기준으로 왼쪽과 오른쪽의 자료형은 같아야한다.
		
		// 1. 부모타입 참조 변수로 부모객체를 다루는 경우
		System.out.println("1. 부모타입 참조 변수로 부모객체를 다루는 경우");
		Parent p1 = new Parent();
		p1.printParent();
		
		// 2. 자식타입 참조 변수로 자식 객체를 다루는 경우
		System.out.println("2. 자식타입 참조 변수로 자식 객체를 다루는 경우");
		Child1 c1 = new Child1();
		c1.printChild1(); 
		c1.printParent(); // ((Parent)c1).printParent();
		// c1참조변수로 Parent, Child1 주소값에 둘다 접근가능.
		// (Parent 내부로 접근시 자동으로 형변환 된채로 진행된다)
		// 자식에서 부모로 자동형변환이됨. (작은것에서 큰것으로 형변환된것과 같은이치)
		
		// 3. 부모 타입 참조변수로 자식 객체를 다루는 경우(다형성이 적용된 개념)
		System.out.println("3. 부모 타입 참조변수로 자식 객체를 다루는 경우(다형성이 적용된 개념)");
		Parent p2 = /* (Parent) */ new Child1();
		// 대입연산자기준 양쪽의 자료형이 다름에도 불구하고 오류가 발생하지 않음.
		// 자식객체인 Child1이 부모클래스인 Parent객체로 '자동형변환'이 되고있다.
		// 상속구조에서는 클래스 변환이 가능하다.
		
		p2.printParent(); // p2라는 레퍼런스로는 Parent에만 접근가능.
		((Child1)p2).printChild1(); // Child1 내부로 접근하기위해서는 강제형변환을 해줘야함.
		
		/*
		 * 클래스간에 형변환이 가능(단, 상속구조일 경우에만)
		 * 
		 * 1. UpCasting
		 *    자식타입 -> 부모타입으로 형변환할때 생략가능(자동형변환)
		 *    ex) 자식객체.부모메서드();
		 *    부모 참조변수 = 자식객체();
		 *    
		 * 2. DownCasting
		 *    부모타입 -> 자식타입으로 형변환할때는 생략 불가능(강제 형변환 해야함)
		 *    ex     ((자식)부모).자식메서드();
		 *    
		 * 다형성을 쓰는 이유
		 * - 부모타입으로부터 파생된 여러가지 타입의 자식객체들을 부모클래스 하나로 다룰수 잇음.
		 */
		
		// * 다형성의 장점
		
		// 다형성 배우기 전
		// Child1객체 2개 , Child2 객체 2개가 필요함.
		// 객체배열을 이용해보기
		// 2개맞음
		Child1[] arr1 = new Child1[2];
		arr1[0] = new Child1(1 , 2 , 4);
		arr1[1] = new Child1(2 , 1 , 5);
		
		Child2[] arr2 = new Child2[2];
		arr2[0] = new Child2(5, 7 , 2);
		arr2[1] = new Child2(2, 3 , 5);
		
		// 단, 다형성이 적용되면 부모타입 레퍼런스로 모든 자식객체들을 받아줄수있다.
		System.out.println("==== 다형성 접목한 객체배열! ====");
		Parent[] arr = new Parent[4];
		arr[0] = new Child1(1,2,3);
		arr[1] = new Child2(3,4,5);
		arr[2] = new Child2(6,7,8);
		arr[3] = new Child1(9,0,1);
		
		// 하나의 부모타입만으로 모든 자식객체들을 다룸으로써, 편리 유지보수하기좋고 코드길이감소 == 생산성이 증가
		((Child1)arr[0]).printChild1();
		((Child2)arr[1]).printChild2();
		((Child2)arr[2]).printChild2();
		((Child1)arr[3]).printChild1();
		
		// 바꿔줘야할 자료형이 Child2인데 Child1으로
		// 바꾸면 ClssCastException에러가 발생함(클래스 형변화이 잘못 되었을 경우 발생하는 에러) 
		
		System.out.println("===== 반복문 =====");
		for(int i =0; i<arr.length; i++) {
			// 어떤조건으로 현재 배열안에 담겨있는 값이 Child1객체, Child2객체인지 구분할수있나?
			
			// instanceof 연산자 -> true/ false값을 반환함
			// 현재 참조변수가 실제로 어떤 클래스타입의 객체를 참조하고있는지 확인할때 사용
			
//			if(arr[i] instanceof Child1) {
//				((Child1)arr[i]).printChild1();
//			}else if(arr[i] instanceof Child2) {
//				((Child2)arr[i]).printChild2();
//			}
			arr[i].print();
			// 단, 오버라이딩을 이용하면 굳이 형변환하지 않아도 됨
			// * 동적바인딩 : 프로그램이 실행되기전에 자동으로 컴파일되면서 정적바인딩(참조변수의 메소드를
			//             가리킴). 단, 실질적으로 참조하고있는 자식클래스에 해당 메소드가 오버라이딩
			//             되어있다면 프로그램 실행시 동적으로 그 자식클래스에 있는 오버라이딩된 메소드
			//             를 찾아가서 실행함.
			//             (적혀있기를 Parent의 print()가 실행된다고 했지만, 실제로 실행될때(런타임)시 
			//             자식 클래스의 오버라이딩된 print()가 실행된다.)
			
		}
		
		
		
		
		
	}

}
