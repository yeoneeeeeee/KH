package com.kh.chap02_abstractAndInterface.part02_family.model.vo;

public class Baby extends Person implements Basic{

	public  Baby() {
		
	}

	public Baby(String name, double weight, int health) {
		super(name, weight, health);
	}

	@Override
	public String toString() {
		return super.toString()+"Baby []";
	}
	
	@Override
	public void eat() {
		// 몸무게가 기존의 몸무게에서 3증가
		super.setWeight(super.getWeight() +3);
		// 건강도는 기존의 건강도에서 1 증가
		super.setHealth(super.getHealth() +1);
	}
	
	@Override
	public void sleep() {
		// 건강도 5 증가
		super.setHealth(super.getHealth() +5);
	}
	
	
	
}
