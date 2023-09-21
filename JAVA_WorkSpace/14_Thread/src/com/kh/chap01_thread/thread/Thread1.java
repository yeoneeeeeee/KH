package com.kh.chap01_thread.thread;

/*
 * 스레드 생성방법 1
 * 1. Thread 클래스를 상속받는 방법(Thread클래스내부의 모든 메서드를 가져와서 사용할수있음)
 *   - Thread클래스 상속 후에 run()메소드 오버라이딩 => 쓰레드가 실행시키는 코드 내용이 run메서드 안의 내용.
 *   - Thread1 객체생성 하고, start() 메소드 호출.
 */
public class Thread1 extends Thread{
	// 쓰레드 실행시(start()호출시) run()메소드가 자동으로 호출된다.
	// 따라서 내가 작업하고자 하는 코드를 반드시 run이라는 메서드 안에 작성을 해야한다.
	// 즉, Thread클래스 안에 있는 run메서드를 내가 원하는 형태로 재정의 하면 된다.
	
	@Override
	public void run() {
		// 작업하고자 하는 코드를 작성
		for(int i =1; i<= 100; i++) {
			System.out.println(getName()+"["+i+"]");
		}
		
	}
	
	
	
	
	
	
	
}
