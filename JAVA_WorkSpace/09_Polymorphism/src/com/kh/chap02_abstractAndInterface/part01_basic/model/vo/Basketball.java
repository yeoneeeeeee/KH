package com.kh.chap02_abstractAndInterface.part01_basic.model.vo;

public class Basketball extends Sports{

	@Override
	public void rule() {
		System.out.println("손으로 공을 던져서 링에 넣어야 한다.");
	}
}
