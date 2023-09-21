package com.kh.operator;

public class B_InDecrease {

	/*
	 * ++ -- 증감연산자 (단항연산자) 
	 * 
	 * ++ : 변수에 담긴 값을 1 증가시키는 연산자
	 *      ++ 변수값(전위연산자) 변수값 ++ (후위연산자)
	 * 
	 * -- : 변수에 담긴 값을 1 감소시키는 연산자 
	 *      -- 변수값(전위연산자) 변수값 -- (후위연산자)
	 * 
	 * (증감연산자)변수 : 전위연산 -> 선증감 후처리 
	 * 변수(증감연산자) : 후위연산 -> 선처리 후증감
	 */
	
	public void method1() {
		// 전위연산 테스트(mbti J같은녀석)
		int num = 10;
		System.out.println("전위연산 적용전 num : "+num); // 10
		System.out.println("1회 수행후 결과 : " + ++num); // 11 . 증감연산자가 우선순위가 더 높기때문에 증감연산후 +연산을 실행함. 
		System.out.println("2회 수행후 결과 : " + ++num); // 12 
		System.out.println("3회 수행후 결과 : " + ++num); // 13
		
		System.out.println("최종 num의 값 : "+num);
		
		// 후위연산 테스트(mbti P같은녀석) --> 쪼금헷갈림
		int num2 = 10;
		System.out.println("후위 연산 적용전 num2 : "+num2);
		System.out.println("1회 수행후 결과 : "+ num2++); // 10으로 덧셈연산하고 출력. 그리고마지막에 num2 담긴값을 1증가시킴.
		System.out.println("2회 수행후 결과 : "+ num2++); // 11
		System.out.println("3회 수행후 결과 : "+ num2++); // 12
		
		System.out.println("최종 num2 : "+num2); // 11
	}
	
	public void method2() {
		// 전위연산
		int a = 10;
		int b = ++a; // 11 a값을 1증가시키고 b에 담죠.
		
		// 후위연산
		int c = 10;
		int d = c++; // 10 d라는 변수에 값을 대입하는 작업을 처리하고나서, c의값을 1증가시킴.
		
		//예측해보기
		int num = 20;
		System.out.println("현재 num : "+num); // 20
		System.out.println("++num? "+ ++num); // 21
		System.out.println("num++? "+ num++); // 21
		System.out.println("--num? "+ --num); // 21
		System.out.println("num--? "+ num--); // 21 
		
		System.out.println("최종 num : "+num); // 20
	}
	
	public void method3() {
		
		int num1 = 20;
		int result1 = num1++ * 3;// 60
		
		System.out.println("num1 : "+ num1);//21
		System.out.println("result1 : "+result1); // 60
		
		int num2 = 20;
		int result2 = ++num2 *4; // num2에 미리 값을 1 증가시키고 num2 =num2+1 연산을 한후 result2 = 21*4;
		
		
		System.out.println("num2 : "+ num2);//21
		System.out.println("result2 : "+result2); // 84
	}
	
	public void method4() {
		
		int a = 10;
		int b = 20;
		int c = 30;

		// 주석표시하면서 어떻게 출력될지 예측해보기 
		System.out.println(a++); // a = 10(11) -> 10출력
		System.out.println(      (++a) + (b++)    );// a = 12 , b =20(21) -> 32출력
		System.out.println(  (a++) + (--b) + (--c)  ); // a = 12(13) , b = 20 , c = 29 ->61출력 
		System.out.printf("a : %d, b : %d, c : %d", a,b,c); // a = 13 , b = 20 , c = 29
		
	}
	
	
	
}
