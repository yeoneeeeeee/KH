package com.kh.chap01_poly.part01_basic.model.vo;

public class Parent {

	private int x;
	private int y;

	public Parent() {

	}

	public Parent(int x, int y) {
		super();
		this.x = x;
		this.y = y;
	}

	public int getX() {
		return x;
	}

	public void setX(int x) {
		this.x = x;
	}

	public int getY() {
		return y;
	}

	public void setY(int y) {
		this.y = y;
	}

	@Override
	public String toString() {
		return "Parent [x=" + x + ", y=" + y + "]";
	}

	public void printParent() {
		System.out.println("부모 클래스에서 호출");
	}
	
	// 다형성 이용시 instacneof 연산자를 쓰지 않고 작업하는 경우
	public void print() {
		System.out.println("나 부모");
	}
	
	
	
	
}
