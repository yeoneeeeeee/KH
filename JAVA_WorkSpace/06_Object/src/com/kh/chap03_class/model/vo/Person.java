package com.kh.chap03_class.model.vo;

// 클래스에서 사용 가능한 접근 제한자 : public , default(생략가능) 
public class Person {
	
	// 필드부
	// 필드 == 멤버변수 == 인스턴스변수
	private String memberId;
	private String memberPwd;
	private String memberName;
	private int age;
	private char gender;
	private String phone;
	private String email;
	
	public Person() {
		
	}
	
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberPwd() {
		return memberPwd;
	}
	public void setMemberPwd(String memberPwd) {
		this.memberPwd = memberPwd;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public char getGender() {
		return gender;
	}
	public void setGender(char gender) {
		this.gender = gender;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	
	public void changeName(String name) {
		this.memberName = name;
	}
	public void printName() {
		System.out.println(memberName);
	}
	
	@Override
	public String toString() {
		return "Person [memberId=" + memberId + ", memberPwd=" + memberPwd + ", memberName=" + memberName + ", age="
				+ age + ", gender=" + gender + ", phone=" + phone + ", email=" + email + "]";
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
