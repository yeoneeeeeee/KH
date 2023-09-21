package com.kh.variable;

public class A_Variable {
	
	// 시급과 근무시간과 근무일수를 곱해서 월급을 계산하여 출력하는 프로그램
	public void printVariable() {
		System.out.println("==== 변수 사용 전 ====");
		
		System.out.println("시급 : 8500");
		System.out.println("근무시간 : 6");
		System.out.println("근무일 : 20");
		
		// 월급 = 시급 * 근무시간 * 근무일수 
		// 김갑생 : 00000원 형식으로 출력
		// *은 "곱셈"을 의미함
		// 서로 다른 자료형(문자열, 숫자 ..)을 여러개를 하나로 동시에 출력할때는 +로 접함시킨다.
		System.out.println("민경민 : "+(9000 * 6 * 20)+"원");
		System.out.println("민경민2 : "+(9000 * 8 * 20)+"원");
		System.out.println("민경민3 : "+(9000 * 4 * 20)+"원");
		System.out.println("민경민4 : "+(9000 * 6 * 10)+"원");
		System.out.println("민경민5 : "+(9000 * 6 * 15)+"원");
		
		// 
		System.out.println("=== 변수 사용 후 ====");
		// 자료형 변수명 = 값;
		// == "같다"라는 의미로 사용시
		// = 값을 "대입"할시
		int pay = 9000;// 시급
		int time = 6;// 근무시간
		int day = 9;// 근무일
		
		System.out.println("시급 : " + pay);
		System.out.println("근무시간 : "+time);
		System.out.println("근무일 : "+day);
		
		System.out.println("민경민 : " +( pay * time * day )+"원");
		System.out.println("민경민2 : "+( pay * time * day )+"원");
		System.out.println("민경민3 : "+( pay * time * day )+"원");
		System.out.println("민경민4 : "+( pay * time * day )+"원");
		System.out.println("민경민5 : "+( pay * time * day )+"원");
		
		/*
		 * 변수를 사용하는 이유
		 * 1. 변수는 우선적으로 값에 의미를 부여할 목적으로 사용(가독성이 좋음)
		 * 2. 단 한번 값을 기록해두고 필요할 때마다 계속 사용할 목적으로 사용(재사용성이 좋다)
		 * 3. 유지보수를 보다 쉽게할수 있다.
		 */
	}
	
	// 변수의 선언
	public void declareVariable() {
		/*
		 * 변수의 선언(값을 기록하기 위한 변수를 메모리 공간에 확보해 두겠다)
		 * [표현법] 자료형 변수명;
		 * 
		 * 자료형 : 어떤 값을 담아낼지, 어떤크기의 값을 담아낼지에 따라 변수의 크기 및 모양을 지정하는 부분
		 * 변수명 : 변수의 이름을 정하는 부분
		 * 
		 * 주의할점
		 * 1. 변수명은 소문자로 시작하게끔 이름 지어줄것(+낙타등표기법 반드시 지킬것)
		 * ex) String userName; (0)
		 *     String uesrname; (X)
		 * 2. 같은 영역(중괄호 영역{}) 안에서는 동일한 변수명 으로 선언 불가능
		 * 3. 해당 영역에 선언된 변수는 해당 영역 안에서만 사용 가능(다른 메소드에서는 불가)
		 * 
		 */
		
		// ------- 자료형에 대한 개념 ------------
		// 1. 논리형(논리값 = true / false)
		boolean isTrue; // 1byte
		
		// 2. 숫자형
		// 2_1. 정수형
		byte bNum; // 1byte (-127 ~ 128)
		short sNum; // 2byte
		int iNum; // 4byte(-21억 ~ 21억) => 정수형중 대표자료형이고, 리터럴한 정수값이 제시되어 있을때 해당 값을 
				  //                       int자료형으로 판단한다(기본자료형)
		long lNum; // 8byte
		
		// 2_2. 실수형 사이즈에 따라 소수점 아래 더 많은 숫자를 담을 수 있다.
		float fNum; // 4byte => 소수점아래 7자리까지 표현가능.
		double dNum; // 8byte => 실수형중 대표자료형 리터럴한 실수값이 제시되어 있을때 해당 값을 double자료형으로
		             //          판단한다. 소수점아래 15자리까지 표현가능.
		
		// 3. 문자형
		char ch; // 2btye;
		
		// -------------- 여기까지 총 8개의 자료형 == 기본자료형 --------
		
		// 4. 문자열 (참조자료형) => 나중에 좀더 자세히 다룰 예정
		String str;
		
		// ---- 여기까지 총 9개의 변수를 선언했고, 메모리공간에 9개의 저장공간이 할당되었음
		
		/*
		 * 변수에 값음 담기(대입)
		 * [표현법] 변수명 = 값;
		 */
		isTrue = true;
		
		bNum = 1;
		sNum = 2;
		iNum = 4;
		lNum = 8L; // long 자료형임을 알려주기위해 소문자나 대문자 L을 표기해주는게 관례.(L을 더 권장)
		
		fNum = 4.0f; // 반드시 f를 붙여줘야한다.
		dNum = 8.0;
		
		ch = '민'; // 반드시 ''(작은따옴표)안에 넣어줘야한다.
		str = "ABC"; // 반드시 ""(쌍따옴표)안에 넣어줘야한다.
		
		// 각 변수에 담긴 값 출력
		System.out.println(isTrue);
		System.out.println(bNum);
		System.out.println(sNum);
		System.out.println(iNum);
		System.out.println(lNum);
		System.out.println(fNum);
		System.out.println(dNum);
		System.out.println(ch);
		System.out.println(str);
	}
	
	public void initVariable() {
		/*
		 * 변수 선언과 동시에 초기화(값 대입)
		 * [표현법] 자료형 변수명 = 값(리터럴);
		 */
		//1. 논리형
		boolean isTrue = true; // 1byte
		
		//2_1. 정수형
		byte bNum = 1;
		short sNum = 2;
		int iNum = 4;
		long lNum = 8L;
		
		//2_2. 실수형
		float fNum = 4.0f;
		double dNum = 8.0;
		
		//3. 문자형
		char ch ='민';
		
		//4. 문자열(참조자료형)
		String str = "자바 공부중";
		
		int longNum = 999_999_999;
		System.out.println(longNum);
	}
	
	public void constant() {
		
		int age = 20;
		System.out.println("age : "+age);
		
		age = 25;
		System.out.println("변경된 age : "+age);
		
		//final = 변수를 상수로 만들기위해 사용
		final int AGE =20; // 상수는 전체변수명을 대문자로 표시함.
		System.out.println("상수 age : "+AGE);
		
		//AGE = 21; 상수로 정의한 변수는 재정의가 불가능하다.
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
