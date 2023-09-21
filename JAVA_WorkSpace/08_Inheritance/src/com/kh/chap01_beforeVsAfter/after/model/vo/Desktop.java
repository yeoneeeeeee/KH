package com.kh.chap01_beforeVsAfter.after.model.vo;

// 자식             부모
// 후손             조상
// 하위             상위
public class Desktop extends Product {
	// 브랜드명, 코드명, 상품명, 가격, 패키지
	private boolean allInOne;

	public Desktop() {
		super();
	}

	public Desktop(String brand, String pCode, String pName, int price, boolean allInOne) {
		//super(); // super : 부모의 메모링영역상 주소값 , super(); 부모 기본생성자
		// 부모객체에 생성된 필드데이터들을 자식객체에서 초기화 시켜주는 방법?
		// 해결방법 1. 부모클래스에 있는 public 접근제한자를가진 setter이용하기.
		// 부모클래스 안에있는 setBrand함수 호출하기
//		super.setBrand(brand);
//		super.setpCode(pCode);
//		super.setpName(pName);
//		super.setPrice(price);
		
		// 해결방법2. 부모클래스의 필드에 직접 접근해서 초기화 -> 부모클래스의 접근제한자를 private -> protected
		// super.brand = brand;
		
		// 해결방법3. 부모생성자 호출하기(항상 첫줄에 부모생성자를 호출해야함)
		super(brand, pCode, pName, price);
		this.allInOne = allInOne;
	}

	public boolean isAllInOne() {
		return allInOne;
	}

	public void setAllInOne(boolean allInOne) {
		this.allInOne = allInOne;
	}
	
	// 오버라이딩 : 부모클래스의 메소드를 자식클래스가 재정의하는것 
	@Override
	public String toString() {
		return "Desktop [allInOne=" + allInOne + ", toString()=" + super.toString() + "]";
	}

}
