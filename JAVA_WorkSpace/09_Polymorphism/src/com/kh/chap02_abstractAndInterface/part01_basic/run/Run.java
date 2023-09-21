package com.kh.chap02_abstractAndInterface.part01_basic.run;

import com.kh.chap02_abstractAndInterface.part01_basic.model.vo.Basketball;
import com.kh.chap02_abstractAndInterface.part01_basic.model.vo.Football;
import com.kh.chap02_abstractAndInterface.part01_basic.model.vo.Sports;

public class Run {

	public static void main(String[] args) {
		
		//Sports s2 = new Sports();
		// 추상클래스로는 객체생성이 불가능함.
		// 미완성된 클래스 이기 때문에
		
		Sports s = new Football();// 객체생성은 안되지만, 참조변수로 사용가능.
		
		Sports[] arr = new Sports[2]; // 다형성은 적용된다.
		arr[0] = new Basketball();
		arr[1] = new Football();
		
		for(int i =0;  i<arr.length; i++) {
			arr[i].rule(); 
		}
		
		/*
		 * 추상클래스 
		 * - 미완성된 클래스 abstract class
		 * - 객체생성불가(단, 참조변수로 선언가능)
		 * - 추상메소드가 존재하는 순간 반드시 추상클래스로 정의해야한다.
		 *   (일반필드 + 일반메소드 + [추상메소드(생략가능)])
		 *   
		 *   단, 추상메소드가 없어도 추상클래스로 만들수는 있다
		 *   언제? 클래스가 아직 구체적이지 않은 덜 구현된 상태일때(개념적)
		 *        현재 이클래스를 객체생성이 불가하게끔 하고자할때(기술적)(거의안쓰임)
		 *        
		 * 추상메소드
		 * - 미완성된 메소드로 몸통부 {}가 구현되어있찌 않은 메소드
		 * - 자식클래스에서 오버라이딩을 통해 완성됨(강제 오버라이딩해야함)
		 *    => 오버라이딩 하지않을경우 에러발생
		 *    => 메소드 사용의 통일성을 확보할수 있음
		 *    => 표준화된 틀을 제공할수 있다. 
		 *  
		 * 
		 * 
		 * 
		 * 
		 * 
		 * 
		 * 
		 * 
		 * 
		 */
		
		
		
		
		
		
		
	}

}
