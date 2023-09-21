package com.kh.example.practice3.model.vo;

public class Circle {
	private final static double PI = 3.14;
	private static int radius = 1;
	
	public Circle() {
		getAreaOfCircle();
		getSizeOfCircle();
		incrementRadius();
		getAreaOfCircle();
		getSizeOfCircle();
	}
	
	public void incrementRadius() {
		radius++;
	}
	
	public void getAreaOfCircle() {
		System.out.println("원의 넓이 ? "+ (PI * radius * radius));
	}
	
	public void getSizeOfCircle() {
		System.out.println("원의 둘레 ? "+ (PI * 2 * radius));
	}
	
}
