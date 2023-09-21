package com.kh.chap02_string.controller;

public class A_StringPoolTest {
	// String은 불변클래스(변하지 않는 클래스)
	// 수정하는 순간 기존의 값이 담겨있던 공간에서 수정되지 않음.
	
	// String constant Pool(문자열 상수풀)
	// 문자열 데이터가 담기는 영역으로 heap메모리 영역안에 항상 고정적으로 상수풀
	// 영역이 할달되어 있음(JDK7버전이상)
	
	// 1. 생성자를 통해 문자열 담기
	public void method1() {
		String str1 = new String("hello"); //new 객체생성 무조건 heap안에 고유한 저장공간이 할당됨
		String str2 = new String("hello");
		
		System.out.println("str1 == str2 ? "+(str1 == str2));
		
		System.out.println(str1);
		// String클래스의 toString()메소드의 경우 실제 담겨있는 문자열을 반환하도록 오버라이딩 되어있음.
		
		System.out.println(str1.equals(str2));// true => 문자열 비교
		// String클래스의 equals()메소드의 경우 주소값 비교가 아닌 문자열비교를하도록 오버라이딩 되어있음.
		
		System.out.println(str1.hashCode());
		System.out.println(str2.hashCode());
		// 기존 hashcode()의 경우 16진수의 메모리 주소값을 10진수형태로 반환해준 값
		// String클래스의 hashcode()메소드의 경우 주소값 기반이 아닌 실제 담긴 문자열 기반으로
		// 해시코드값을 만들어서 반환하도록 오버라이딩 되어있음.
		// why? 문자열은 문자열 기반의 hashcode값을 상수풀상의 주소값으로 저장하고 있음(HashMap으로구현)
		//      따라서 상수풀안에 데이터를 저장할때 문자열을 해시코드로 변환한후 그자리에 데이터가 들어가있는지
		//      검사를 실행하고 이미 들어가있다면 상수풀상의 주소값을 변수에 참조시키고, 없다면 상수풀에
		//      등록을시키고 그 주소값을 반환해준다.
		
		// 정말 주소값에 대해서 알고싶다면 System.identityHashCode(변수);
		System.out.println(System.identityHashCode(str1));
		System.out.println(System.identityHashCode(str2));
	}
	
	// 2. 문자열 리터럴로 생성
	public void method2() {
		
		// 프로그램 첫 시작시에는 문자열 상수풀에 들어가 있는데이터 없음.
		// 문자열을 사용할때마다 추가가 됨.
		String str = new String("hello"); // heap메모리에 객체생성됨
		
		String str1 = "hello";/*new String("hello").intern();*/ // 상수풀에 hello문자열 저장 
		String str2 = "hello";/*new String("hello").intern();*/ // hello문자열이 이미 상수풀에 저장되어 있기때문에 값을 저장하지 않음.
		String str3 = "world"; // 상수풀에 world문자열 저장
		
		System.out.println(str1 == str2);
		
		// JVM이 클래스안의 정보를 읽어드리면서 문자열 리터럴값을 만나면 상수풀에 등록
		// new String("hello")으로 감싸줌 그후에 intern()이라는 메소드를 호출함
		// intern()? 상수풀 안에 내가 생성한 문자열이 존재하는지 체크하고 존재한다면 문자열을 반환,
		//           존재하지 않는 다면 상수풀에 문자열 등록후 문자열 반환.
		
		// 따라서 동일한 문자열 리터럴 제시시 새롭게 저장공간을 할당하지 않고 이미 저장된 주소값을
		// 공유해서 사용하므로 효율적으로 저장공간을 활용할수 있음.
		
		System.out.println(str1.hashCode());
		System.out.println(str2.hashCode());
		
		System.out.println(System.identityHashCode(str1));
		System.out.println(System.identityHashCode(str2));
	}
	
	// 불변 클래스
	public void method3() {
		
		String str = "hello";
		System.out.println(System.identityHashCode(str));
		
		str = "goodbye";
		System.out.println(System.identityHashCode(str));
		
		str += "abc";
		System.out.println(System.identityHashCode(str));
		
		/*
		 * 자바에서 가장많이 사용되는 객체가 바로 String
		 * String이 메모리영역에서 사라지지 않는다면 메모리부족이슈가 발생할것.
		 * 기존의 상수풀의 연결이 끊긴 문자열들은 가비지 컬렉터가 알아서 정리해줌(java7이후)
		 * 불변이라고 해서 수정이 안되는게 아니라, 있던자리 그대로에서수정이 안된다라는 뜻.
		 * 매번 새로운 주소값을 참조하게됨.
		 * 
		 * 따라서 문자열 사용할때 new String을 통해 객체를 생성하는것보다, 리터럴로 문자열을 만드는것을
		 * 더 권장함.
		 */
	}
	
	
	
	
	
}
