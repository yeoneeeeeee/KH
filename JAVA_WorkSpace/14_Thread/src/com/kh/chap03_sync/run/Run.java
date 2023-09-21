package com.kh.chap03_sync.run;

import com.kh.chap03_sync.sync.ATM;
import com.kh.chap03_sync.sync.Account;

public class Run {

	public static void main(String[] args) {
		Account acc = new Account();// 모든 스레드에서 접근해서 사용할 공유자원.
		Thread atm1 = new Thread(new ATM(acc) , "atm1");//(Runnable인터페이스 구현객체, 스레드의 이름);
		
		Runnable run1 = new ATM(acc);
		Thread atm2 = new Thread(run1);
		atm2.setName("atm2");
		
		atm1.start();
		atm2.start();
		/* 
		 * 하나의 공유자원(Account acc)에 동시에 여러개의 쓰레드가(Atm1, atm2)가 접근하는 상황을 경쟁상태라고 부름.
		 * 이를 방지하기 위해 하나의 공유자원에 접근할때는 하나의 스레드만 접글할수 있도록 통제 해야한다.
		 * 통제가 필요한 영역 임계영역이라고 부르며, 임계영역을 통제하기위하여 synchronized키워드를 추가해야한다.
		 * 
		 * 해결방법
		 * 1. synchronized 키워드를 붙인 메소드 추가
		 * 2. 메소드 내부에 synchronzied 키워드 추가
		 */
		
		
		System.out.println("메인스레드 종료!!");
	}
	
	

}
