package com.kh.chap01_beforeVsAfter.after.model.vo;

public class Tv extends Product {
	// 브랜드명, 상품코드, 상품명, 가격, 인치
	private int inch;

	public Tv() {

	}

	public Tv(String brand, String pCode, String pName, int price, int inch) {
		super(brand, pCode, pName, price);
		this.inch = inch;
	}

	public int getInch() {
		return inch;
	}

	public void setInch(int inch) {
		this.inch = inch;
	}

	@Override
	public String toString() {
		return "Tv [inch=" + inch + ", toString()=" + super.toString() + "]";
	}

}
