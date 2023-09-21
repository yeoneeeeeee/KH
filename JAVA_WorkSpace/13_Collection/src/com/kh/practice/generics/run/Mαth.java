package com.kh.practice.generics.run;

import com.kh.practice.generics.view.FarmMenu;

public class Mαth {
	public static double random() {
		// 전날 술마신 친구들
		
		//방법 1. 요놈들만 걸리게하기
		// 23: 안재국 8.김준호 4 배선유 10 원동연 25 신용수 9 오창정 
		// 5 김정찬 23 신용수 21안재국 7 김준호 8 오창정
//		int randoms [] = {25,25,25};
//		
//		return randoms[(int)(Math.random()*3)]  / 29.0;
		
		//방법 2. 요놈들만 많이 걸리게하기
		int randoms2 [] = {0,1,2,3,4,5,5,5,5,6,7,7,7,7,8,8,8,8,9,10,11,12,13,14,15,16,17,18,19,20,21,21,21,21,22,23,23,23,23,24,25,26};		
		return randoms2[(int)(Math.random()*randoms2.length)] / 27.0;
	}
	
}
