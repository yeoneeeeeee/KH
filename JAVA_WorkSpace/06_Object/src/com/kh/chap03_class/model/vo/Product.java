package com.kh.chap03_class.model.vo;

public class Product {

	// 상품명, 상품가격, 브랜드
	private String pName;
	private int price;
	private static String brand;
	int [] lotto = new int[6];
	
	{
		pName = "초기화";
		for(int i =0; i<lotto.length;i++) {
			// lotto[i] = 랜덤값 
		}
	}
	static {
		brand = "초기화";
	}
	
	// set+필드명(첫글자는대문자) : 예외규칙 ==> 이어지는 글자의 두번째 글자가 대문자라면 첫글자는 그냥 소문자로 표시함
	// setPName

	public String getpName() {
		return pName;
	}

	public void setpName(String pName) {
		this.pName = pName;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	@Override
	public String toString() {
		return "Product [pName=" + pName + ", price=" + price + ", brand=" + brand + "]";
	}

}
