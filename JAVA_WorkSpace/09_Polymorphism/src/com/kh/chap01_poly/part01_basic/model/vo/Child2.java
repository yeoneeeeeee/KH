package com.kh.chap01_poly.part01_basic.model.vo;

public class Child2 extends Parent {
	private int n;
	
	public Child2() {
		
	}
	
	public Child2(int x , int y , int n) {
		super(x , y);
		this.n  = n ;
	}

	public int getN() {
		return n;
	}

	public void setN(int n) {
		this.n = n;
	}

	@Override
	public String toString() {
		return "Child2 [n=" + n + ", toString()=" + super.toString() + "]";
	}
	
	public void printChild2() {
		System.out.println("자식객체2에서 호출!");
	}
	
	@Override
	public void print() {
		System.out.println("나 자식2");
	}
	
	
	
	
}
