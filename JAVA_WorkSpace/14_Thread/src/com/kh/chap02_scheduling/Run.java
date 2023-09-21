package com.kh.chap02_scheduling;

import com.kh.chap02_scheduling.scheduling.Car;
import com.kh.chap02_scheduling.scheduling.Plane;
import com.kh.chap02_scheduling.scheduling.Tank;

public class Run {

	public static void main(String[] args) {
		Thread th1 = new Thread(new Car());
		Thread th2 = new Thread(new Plane());
		Thread th3 = new Thread(new Tank());
		
		// setName() : 스레드의 이름변경
		th1.setName("Car");
		th2.setName("Plane");
		th3.setName("Tank");
		
		// 우선순위 설정
		// 변경전 스레드는 기본적으로 1 ~ 10사이의 우선순위중 5의 우선순위를 가지고 있다.
		// 메모리가 모자랄때 우선순위를 정할수 있음.
		// 스레드의 우선순위를 정해주지 않으면 os가 임의로 수행시킨다.
		
		System.out.println("---우선순위 변경전----");
		System.out.println(Thread.currentThread().getName()+"의 우선순위 : "+Thread.currentThread().getPriority());
		System.out.println(th1.getName()+"의 우선순위 : "+th1.getPriority());
		System.out.println(th2.getName()+"의 우선순위 : "+th2.getPriority());
		System.out.println(th3.getName()+"의 우선순위 : "+th3.getPriority());
		
		// setPriority() : 우선순위를 지정해주는 메소드
		th1.setPriority(Thread.MAX_PRIORITY); // 10
		th3.setPriority(Thread.MIN_PRIORITY); // 1
		
		System.out.println("---우선순위 변경후----");
		System.out.println(Thread.currentThread().getName()+"의 우선순위 : "+Thread.currentThread().getPriority());
		System.out.println(th1.getName()+"의 우선순위 : "+th1.getPriority());
		System.out.println(th2.getName()+"의 우선순위 : "+th2.getPriority());
		System.out.println(th3.getName()+"의 우선순위 : "+th3.getPriority());
		
		th1.setDaemon(true);
		th2.setDaemon(true);
		th3.setDaemon(true);
		
		
		th1.start();
		th2.start();
		th3.start();
		
		// 주종관계 설정
		// main스레드가 종료시 다른스레드도 종료시키기 위해서는 반드시 setDaemon사용.
		// *주의점* 스레드중 한개라도 setDaemon적용되었다면 모든스레드에도 적용시켜야함.
		System.out.println("메인스레드 종료 ^^");
		
		
		
	}

}
