package com.kh.operator;

public class C_Compound {
	
	/*
	 * 복합대입연산자 : 산술연산자와 대입연산자를 함께 사용하는 연산자
	 * 연산처리속도가 빨라지므로 사용하는걸 권장함
	 * += , -= , *= , /= , %=
	 * 
	 * a = a +3; => a += 3;
	 * a = a -3; => a -= 3;
	 * a = a *3; => a *= 3;
	 * a = a /3; => a /= 3;
	 * a = a %3; => a %= 3;
	 * 
	 * 기존의 a 값에 3을 더하거나,빼거나,나누거나,곱하고 그결과값을 다시한번 a변수에 대입해주겠다. 
	 */
	
	public void method() {
		
		int num = 12;
		
		System.out.println("현재 num : "+num);
		
		// num을 3증가시키기
		num = num+3;
		System.out.println("3 증가시킨 num "+num);
		
		// num을 또 3증가시키기
		num += 3;
		System.out.println("또 3 증가시킨 num "+num);
		
		// num을 5 감소시키기 num = num -5;
		num -=5;
		
		// num을 6배 증가시키기 num = num*6;
		num *= 6;
		
		// num을 2배 감소시키기 num = num/2;
		num /= 2;
		
		// num을 4로 나누었을때 나머지를 num에 대입 num = num%4;
		num %= 4;
		
		// += 의 경우 문자열도 접합이 가능하다.
		String str = "hello";
		str += " world";
		
		System.out.println(str);
	}
	
	
	
	
	
}
