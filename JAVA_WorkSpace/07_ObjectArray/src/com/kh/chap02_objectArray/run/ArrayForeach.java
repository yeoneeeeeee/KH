package com.kh.chap02_objectArray.run;

import java.util.Scanner;

import com.kh.chap02_objectArray.model.vo.Phone;

public class ArrayForeach {

	public static void main(String[] args) {
		int [] arr = new int[3];
		
		arr[0] = 10;
		arr[1] = 20;
		arr[2] = 30;
		
		// 기본 반복문 basic loop
		for(int i =0; i<arr.length; i++) {
			System.out.println(arr[i]);
		}
		
		// 이 외에 또다른 반복문이 있음. 
		
		// 향상된 반복문(for loop)
		/*
		 * for each문(향상된 for문/ 개선된 for문)
		 * 배열, 컬렉션과 사용됨
		 * 배열 또는 컬렉션의 0번째 인덱스에서부터 마지막 인덱스까지 순차적으로 접근할 목적일때 사용 
		 * 
		 * 초기식 x 조건식 x 증감식 x 
		 * 반복하는 횟수는 ? 배열 또는 컬렉션의 크기.
		 * [표현법]
		 * for( 순차적으로 접근할 값을 담을 변수 선언     :   배열/컬렉션         ) {
		 *  실행할코드
		 * }
		 */
		
		for( int num : arr  ) {
			System.out.println("향상된 반복문"+num);
		}
		
		Phone[] phones = new Phone[3];
		
		
		phones[0] = new Phone("갤럭시 z-plip","4","삼성",1000000);
		phones[1] = new Phone("갤럭시","10","삼성",1000000);
		phones[2] = new Phone("아이폰","14","애플",1400000);
		
		int total = 0;
		
		for( Phone phone     :      phones   ) {
			System.out.println(phone);
			total += phone.getPrice();
		}
		System.out.println("총 합계 : "+total);
		
		Scanner sc = new Scanner(System.in);
		System.out.print("구매하고자 하는 폰 : ");
		String buy = sc.nextLine();
		
		for( Phone phone    :   phones    ) {
			if(buy.equals( phone.getName() )) {
				System.out.println("가격 : "+phone.getPrice()+"원");
			}
		}
		
		
	}

}
