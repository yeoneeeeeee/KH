package com.kh.operator;

public class A_Arithmetic {

	// 산술연산자 ( 이항연산자 == 두 개의 값을 가지고 연산)
	// * / % + -
	
	public void method() {
		int num1 = 10;
		int num2 = 3;
		
		System.out.println("num1 + num2 = "+ (num1+num2) );
		// num1 + num2를 그대로 출력해버리면 String문자열로 취급하기 때문에 103이라는 결과가 나온다.
		
		System.out.println("num1 - num2 = " + (num1 - num2));
		// 문자열은 뺄샘이 불가능하다.
		
		System.out.println("num1 * num2 = "+ (num1 * num2));
		System.out.println("num1 / num2 = "+ (num1 / num2));
		System.out.println("num1 % num2 = "+ (num1 % num2));
		// 곱셈,나눗셈,모듈러 연산의 경우 덧셈보다는 우선순위가 높기때문에 괄호로 묶지 않아도 정확한 결과가 나온다.
		// 다만, 가독성 확보를위해 묶어두는것을 권장한다.
		
		// System.out.println(10 % 0);
		// 수학과 마찬가지로 0으로 나누기는 불가능함. 에러가 발생한다.
		
		double a = 35; // 35.0
		double b = 10; // 10.0
		
		System.out.println(a / b); // 3.5
		System.out.println(a % b); // 5.0
	}
	
	
	
	
	
	
	
	
	
	
}
