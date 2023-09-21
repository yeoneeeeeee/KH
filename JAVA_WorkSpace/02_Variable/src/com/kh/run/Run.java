package com.kh.run;

import com.kh.variable.*; // * 모든 클래스 => variable패키지 아래 존재하는 모든클래스를 임포트하겠다.

public class Run {

	public static void main(String[] args) {
		A_Variable av = new A_Variable(); 
		//av.printVariable();
		//av.declareVariable();
		//av.initVariable();
		//av.constant();
		B_KeyboardInput bk = new B_KeyboardInput();
		bk.inputTest1();
		//bk.inputTest2();
		
		C_Cast cc = new C_Cast();
		//cc.autoCasting();
		//cc.forceCasting();
		
		D_Print dp = new D_Print();
		//dp.printfTest();
		
	}
	
	
	
	
	
	
}
