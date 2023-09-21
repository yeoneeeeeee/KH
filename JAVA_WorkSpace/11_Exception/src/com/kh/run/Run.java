package com.kh.run;

import java.io.IOException;

import com.kh.controller.A_UncheckedException;
import com.kh.controller.B_CheckException;
import com.kh.controller.C_CustomException;

public class Run {

	public static void main(String[] args) {
		/*
		 *  에러(오류) 종류  
		 * - 시스템 에러 : 컴퓨터의 오작동으로 인해 발생하는 에러 -> 소스코드로 해결불가.
		 * - 컴파일 에러 : 소스코드상의 문법적인 문제로 발생하는 에러=> 빨간줄로 알려줌 -> 소스코드 수정으로 해결가능
		 * - 런타임 에러 : 소스코드상으로는 문제가 없는데 프로그램 실행 중 발생하는 에러 => 사용자의 잘못이거나 혹은, 개발자가 예측하지
		 * 못한 케이스
		 * 
		 * - 논 리 에러  : 소스코드상의 문법적인 문제도없고, 실행했을때도 문제없지만, 프로그램 의도상 맞지 않는것
		 * 
		 * 시스템 에러를 제외한 컴파일 에러, 런타임 에러, 논리 에러와 같은 비교적 덜 심각한 것을 가지고 작업을 할예정이며
		 * 이런 것들을 "예외"라고 부른다.(Exception)
		 * 
		 * 이러한 예외들이 발생했을 경우에 대비해 "처리"하는 방법을 "예외처리"라고 함.
		 * 
		 * 예외처리를 해야하는 이유 : 예외 발생시 프로그램이 비정상적으로 종료되는것을 막기 위함.
		 * 
		 * 예외처리 방법
		 * 1. try ~ catch문을 이용하는 방법
		 * 2. throws를 이용 (떠넘기기)
		 */
		A_UncheckedException aue = new A_UncheckedException();
		//aue.method2();
		
		B_CheckException bce = new B_CheckException();
		//bce.method1();
		
		throw new C_CustomException("그냥 에러 발생");
		
	}

}
