package com.kh.chap03_sync.sync;

public class ATM implements Runnable{
	private Account acc;
	
	public ATM() {
		
	}
	
	public ATM(Account acc) {
		this.acc = acc;
	}
	
	
	@Override
	public void run() {
		while(acc.getBalance() > 0) {
			
			// 100, 200, 300
			int money = (int)(Math.random() * 3 + 1) *100; 
			acc.withdraw(money);
			
			try {
				Thread.sleep(2000);
			} catch (InterruptedException e) {
				e.printStackTrace();
			}
			
		}
		System.out.println(Thread.currentThread().getName()+"종료");
	}
	
}
