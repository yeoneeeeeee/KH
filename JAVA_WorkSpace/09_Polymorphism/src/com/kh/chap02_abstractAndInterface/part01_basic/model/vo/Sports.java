package com.kh.chap02_abstractAndInterface.part01_basic.model.vo;

public abstract class Sports {
	
	private int people; // 스포츠에 참여하는 선수 명 수
	
	public Sports() {
		
	}
	
	public Sports(int people) {
		this.people = people;
	}

	public int getPeople() {
		return people;
	}

	public void setPeople(int people) {
		this.people = people;
	}

	@Override
	public String toString() {
		return "Sports [people=" + people + "]";
	}
	
	public abstract void rule();
	
	/*
	 * 몸통부가 존재하지 않는 미완성 메소드 == 추상메소드
	 * 몽통부가 없는 미완성메소드(추상메소드)를 정의하고자하면 abstract예약어를 써야한다.
	 * 
	 * 미완성 메소드가 클래스 내부에 하나라도 포함되는 순간, 해당클래스 또한 미완성된 클래스
	 * (추상클래스)가 되버린다. 
	 * 
	 * 따라서 클래스에도 abstract키워드를 적어줘야함.
	 * 
	 * 
	 */
	
	
	
	
	
	
	
}
