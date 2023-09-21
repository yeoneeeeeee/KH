package com.kh.chap03_sync.sync;

// 1. 계좌 1개의 계좌
// 2. ATM 2개 만들 예정
public class Account {
	private int balance = 1000;
	
	public int getBalance() {
		return balance;
	}
	/*
	 * 동기화란?
	 * 멀티쓰레드 프로그래밍에서 스레드간에 공유자원에대한 처리를 말함. 즉 공유자원 사용순서를 정해주는 개념.
	 * 공유자원에대한 LOCK을 획득한 스레드만 공유자원 사용이 가능하다.
	 * 
	 */
	
	// 출금메서드
	// synchronized (격리공간으로 지정)
	// - 동기화 메소드, 동기화 블럭에 사용되는 키워드
	// - 동기화 메소드는 메소드 선언에 synchronized키워드를 붙이고 인스턴스, 정적메소드 어디서든 사용이 가능하다.
	// - 동기화메소드는 스레드가 메소드를 실행하면 메소드 전체에 락을걸고 메소드가 종료되면 락이 풀린다. --> 메소드가 존재하는 객체에
	// - 현재 메소드가 존재하는 객체가아니라 다른 객체에 락을 걸고싶다면 동기화블럭을 사용하면 된다. (동기화블럭사용 권장)
	public /* synchronized */ void withdraw(int money) { 
		//동기화 블럭 synchronized(공유객체) {}
		synchronized(this) {
			System.out.println(Thread.currentThread().getName()+"::::"+ balance);
			
			if(money <= balance) {
				balance -= money;
				System.out.printf("[%s] %d원 출금 >>> 잔액 : %d원\n",Thread.currentThread().getName(), money, balance );
			}else {
				System.out.printf("[%s] %d원 출금시도 >>> 잔액이 부족합니다. \n", Thread.currentThread().getName() , money);
			}
		}
	}

	
	
	
	
	
	
	
}
