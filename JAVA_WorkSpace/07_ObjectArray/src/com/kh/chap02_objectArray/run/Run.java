package com.kh.chap02_objectArray.run;

import com.kh.chap02_objectArray.model.vo.Phone;

public class Run {

	public static void main(String[] args) {
		
		Phone[] arr = new Phone[3];
		
//		arr[0] = new Phone();
//		arr[0].setName("폰");
//		System.out.println(arr[0]);
		
		arr[0] = new Phone();
		arr[1] = new Phone("갤럭시","10","삼성",1000000);
		arr[2] = new Phone("아이폰","14","애플",1400000);
		
		int sum = 0;
		for(int i =0; i< arr.length; i++) {
			System.out.println(arr[i]);
			sum += arr[i].getPrice();
		}
		
		System.out.println("총 가격 : "+sum+"원");
		
	}

	
	
	
	
	
	
	
}
