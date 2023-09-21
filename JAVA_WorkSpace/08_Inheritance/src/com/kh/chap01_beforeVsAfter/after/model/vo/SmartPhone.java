package com.kh.chap01_beforeVsAfter.after.model.vo;

public class SmartPhone extends Product {
	// 브랜드명, 상품코드, 상품명, 가격, 통신사
	private String mobileAgency;

	public SmartPhone() {

	}

	public SmartPhone(String brand, String pCode, String pName, int price, String mobileAgency) {
		super();
		this.mobileAgency = mobileAgency;
	}

	public String getMobileAgency() {
		return mobileAgency;
	}

	public void setMobileAgency(String mobileAgency) {
		this.mobileAgency = mobileAgency;
	}

	@Override
	public String toString() {
		return "SmartPhone [mobileAgency=" + mobileAgency + ", toString()=" + super.toString() + "]";
	}

}
