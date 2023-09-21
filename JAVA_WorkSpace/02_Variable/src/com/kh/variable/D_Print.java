package com.kh.variable;

public class D_Print {

	public void printfTest() {
		
		/*
		 * System.out.println(출력하고자하는값); -> 값 출력 후 줄바꿈(개행) 자동으로 넣어줌
		 * System.out.print(출력하고자하는값); -> 값을 출력만 해줌
		 * 
		 * System.out.printf("출력하고자하는 형식" , 출력하고자하는 값);
		 * => f는 format(형식)을 의미
		 * => 형식에 맞춰서 값들이 출력만 되고 끝(줄바꿈x)
		 * => 문자열 안에 그 값이 들어갈 자리를 다음과 같은 형식으로 잡아줘야 한다.
		 * 
		 * 형식
		 * %d : 정수
		 * %f : 실수
		 * %c : 문자
		 * %s : 문자열
		 */
		// 정수 테스트
		int iNum1 = 10;
		int iNum2 = 20;
		
		// iNum1 : xx, iNum2 : xx <<- 요걸 출력할 예정
		// 1. println사용
		System.out.println("iNum1 : "+ iNum1 + ", iNum2 : "+iNum2);
		// 2. printf 사용해서 변경 => 정수값이기때문에 %d로 공간을 확보한다. + 개행이 없으므로 개행문자를 직접넣어주기
		System.out.printf("iNum1 : %d, iNum2 : %d \n", iNum1 , iNum2);
		
		// 10 + 20 = 30 을 출력해보기
		// 1. println 사용해서 출력
		System.out.println(iNum1+" + "+iNum2+" = "+ (iNum1 + iNum2));
		
		// 2. printf로 변경
		System.out.printf( "%d + %d = %d \n"  , iNum1 , iNum2, iNum1+iNum2 );
		
		System.out.printf("%6d\n", iNum1); // %6d : 6칸의 공간을 확보하고, 오른쪽으로 값을정렬시킴
		System.out.printf("%-5d\n", iNum1); // %-5d : 5칸의 공간을 확보하고 , 값을 왼쪽에서부터 정렬시킴
		
		// 실수 테스트
		double dNum = 4.27546789;
		System.out.printf("dNum : %f \n", dNum);
		// %f : 소숫점 아래 7번째위치에서 반올림되며, 소숫점아래 6개까지만 출력된다.
		
		System.out.printf("dNum : %.1f%% %n", dNum); // 
		// %.1f : 소숫점 아래 2번재 줄에서 반올림되어 소숫점 첨번째자리 까지만 출력됨
		// .자릿수로 소숫점을 제어한다
		
		// 내가 지정한 포맷의 갯수와 종류(자료형), 뒤에오는 변수 혹은 값과 그종류가 정확히 일치해야한다.
		
		// 문자와 문자열 테스트
		char ch = 'a';
		String str = "Hello";
		
		System.out.printf("%c %s \n", ch, str);
		System.out.printf("%C %S \n", ch, str); // 영문자알파밧이 들어가는경우 대문자로 변경해준다.
		
		
		
		
		
		
		
		
		
		
		
	}
	
}
