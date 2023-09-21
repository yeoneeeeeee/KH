package com.kh.variable;

public class C_Cast {
	/*
	 * 형변환(casting) : 값의 자료형을 바꾸는 개념
	 * 
	 * 컴퓨터의 값 처리 규칙
	 * 1. 대입연산자(=) 기준으로 왼쪽과 오른쪽은 같은 자료형이여야함.
	 *        => 즉, 같은자료형에 해당하는 값만 대입 가능
	 *        => 다른 자료형의 값을 대입하고자한다면 "형변환"이 필수
	 * [표현법] 자료형 변수명 = (바꿀 자료형)값;
	 * 
	 * 2. 같은 자료형끼리만 연산 가능
	 *   => 즉, 다른자료형끼리 연산을 수행하고 싶으면 한 구문은 "형변환"을 해야한다.
	 *   [표현법] 값 + (바꿀 자료형) 값;
	 *   
	 * 형변환의 종류
	 * 
	 * 1. 자동형변환(autocasting) : 자동으로 형변환이 진행되기 때문에 내가 직접 형변환할 필요가
	 *                           없다
	 *                           작은 바이트의 자료형 -> 큰 바이트의 자료형
	 * 
	 * 2. 강제(명시적)형변환(forcecasting) : 자동형변환이 되지 않아 내가 직접 강제로 형변환을
	 *                                  해야하는 경우
	 *                           큰 바이트 자료형 -> 작은 바이트의 자료형
	 * [표현범] (형변환연산자) 값;
	 * 
	 * (바꿀 자료형) == 형변환연산자 == cast연산자
	 * 
	 * 주의사항
	 * boolean은 형변환 불가
	 */
	// 자동형변환 : 작은 바이트의 자료형이 큰 바이트의 자료형으로 형변환되는 경우
	public void autoCasting() {
		
		// 1. int(4byte) -> double(8byte)
		int i1 = 10;
		double d1 = /* (double) */ i1; // 자동으로 형변환이 되었다.
									   // 컴퓨터 포장용상자(long)에 휴대폰(int)을 담은 꼴
		                               // 다만, int는 정수 double은 실수이므로
										// d1은 10 -> 10.0으로 형변환이 된다.
		
		System.out.println("d1 : "+d1);// 10.0
		
		int i2 = 12;
		double b2 = 3.3;
		
		double result = /* (double) */ i2 + b2; // 12.0 + 3.3 => 15.3
		
		System.out.println("result : "+result); //15.3
		
		// 2. int(4byte) -> long(8byte)
		int i3 = 1000;
		long l3 = /* (long) */ i3;
		
		long l4 = 2000; // L을 붙이지 않아도 문제가 없는이유 : 자동형변환이 이루어져서
		 
		// 특이케이스 3. long (8byte) -> float(4byte)
		// 정수가 실수로 담길때에는 큰 사이즈의 정수여도 작은 사이즈의 실수 변수에 대입 가능
		// float는 long자료형보다 담을수 있는 값의 범위가 더 크기때문.(자동형변환 가능)
		long l5 = 1000000L;
		float f5 = l5;
		
		System.out.println(f5);
		
		// 특이케이스 4. char(2btye) <-> int (4byte) 양방향으로 자동 형변환
		char ch = 65;
		System.out.println("ch : "+ch); 
		
		int num = 'A';
		System.out.println("num : "+num);
		
		/*
		 *  char의 범위 (0~65xxx) : 각 문자마다 고유의 정수값이 정해져있음. 따라서
		 *                        양방향으로 변환이 가능하다. 단, 음수값은 오류가남.
		 *  참고 : 아스키코드표(0 ~ 127, 영문자 대소문자, 숫자, 특수문자)
		 *        유니코드표(0 ~ 65xxx, 영어, 숫자, 특수문자, 한글, 한자 그 외 언어)
		 * 
		 */
		System.out.println((int)'김'); //44608
		
		int sum = 'A' + 10;
		System.out.println("sum : "+sum); // 75 문자와 정수사이에 연산이 가능하다.
		System.out.println("sum : "+(char)sum); // K 알파벳 별로 순서대로 고유값이 들어가있음
		
		// 특이케이스 5. byte , short간의 연산
		byte b1 =1;
		byte b3 = 10;
		
		// byte나 short로 연산시 반드시 무조건 int자료형으로 형변환이 자동으로 이루어짐..!
		byte b4 = (byte)(b1+b3);
	}
	
	// 강제(명시적)형변환 : 큰 크기의 자료형을 작은 크기의 자료형으로 형변환 할 경우 
	public void forceCasting() {
		
		// 1. double(8byte) -> float (4byte)
		float f1 = 4.0f; // 반드시 f를 붙여줘야함.
		
		double d2 = 8.0;
		float f2 = (float) d2;
		
		// 2. double(8byte) -> int (4byte)
		double d3 = 10.89;
		int i3 = (int) d3; // 10.89 -> 10
		System.out.println("i3 : "+i3);// 10 소숫점 아래는 절삭
		
		int iNum = 10;
		double dNum = 5.89;
		
		System.out.println(iNum + dNum);
		
		// int iSum = iNum + dNum; // iNum이 double자료형으로 자동형변환됨. 10 -> 10.0
		                           // 결과값으로 15.89 덧셈연산은 잘 수행된다.
		                           // 다만, 연산결과가 15.89라는 실수값이기 때문에 대입하는 변수의 자료형도 
		                           // 실수자료형이어야 에러가나지 않음.
		
		// 해결방법 1. 연산결과를 int자료형으로 강제 형변환시킴
		int iSum = (int)(iNum + dNum); // 15 . 실행순서는 : 변수생성, 덧셈연산, 강제형변환, 대입연산
		System.out.println("iSum : "+iSum);
		
		// 해결방법 2. 덧셈연산전에 dNum변수를 int자료형으로 강제형변환
		//           자동형변환은 작은 바이트 변수가 큰 바이트 변수로 변환되기 때문에 원래는 iNum이 double로
		//           변환되는데 그 전에 먼저 dNum 강제 형변환 시킨것
		int iSum2 = iNum + (int)dNum; // 15
		System.out.println("iSum2 : "+iSum2);
		
		// 해결방법 3. 애초에 결과값을 double로 저장하기(데이터 손실 없이 정확한 값이 전달된다)
		double dSum = iNum + dNum; // 15.89
		System.out.println("dSum : "+dSum);
		
		
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
