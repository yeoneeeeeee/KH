package com.kh.chap01_thread.thread;

/*
 * 스레드 생성방법
 * 2. Runnable 인터페이스 구현하기
 *  - Runnable 인터페이스 run() 메소드만 오버라이딩
 *  - Thread 객체 생성 시 생성자에 Runnable  인터페이스를 구현한 구현객체를 매개값으로 전달 후 start()메소드 호출
 */
public class Thread2 implements Runnable{
	
	// Runnable 인터페이스를 구현하여 구현메소드만 따로 만드는것을 권장한다.
	@Override
	public void run() {
		for(int i =1; i<=100; i++) {
			System.out.println(Thread.currentThread().getName() +"["+i+"]"   );
		}
	}
}
