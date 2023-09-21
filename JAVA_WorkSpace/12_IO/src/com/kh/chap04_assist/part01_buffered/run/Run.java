package com.kh.chap04_assist.part01_buffered.run;

import com.kh.chap04_assist.part01_buffered.model.dao.BufferedDao;

public class Run {

	public static void main(String[] args) {
		/*
		 * 보조 스트림
		 * 기반 스트림(외부매체와의 직접적인 연결이 목적)의 부족한 기능들을 확장시킬수 있는 스트림
		 * 보조 스트림은 단독으로 사용불가(단독으로 객체 생성자체가 안됨)
		 * 
		 * [표현법]
		 * 보조스트림 변수명 = new 보조스트림(new 기반스트림(외부매체경로));
		 * 
		 * 속도 성능 향상 목적의 보조 스트림 : BufferedXXX
		 * => 버퍼 공간을 제공해서 데이터를 한번에 모아뒀다가 한꺼번에 입출력 진행
		 */
		
		BufferedDao bd = new BufferedDao();
		//bd.fileSave();
		bd.fileRead();
	}
	
	
	
	
	
	
	

}
