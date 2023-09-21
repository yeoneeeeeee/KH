package com.kh.array;

import java.util.Arrays;

public class B_ArrayCopy {
	/*
	 *  배열복사
	 * - 얕은 복사 : 배열의 주소값만을 복사
	 *  
	 * - 깊은 복사 : 동일한 새로운 배열을 하나 생성해서 실제 내부값들을 복사
	 * 
	 */
	
	// 얕은 복사
	public void method1() {
		
		// 원본배열 셋팅
		int [] origin = {1,2,3,4,5};
		
		System.out.println("===원본 배열 출력===");
		for(int i = 0; i< origin.length; i++) {
			System.out.print(origin[i] + " ");
		}
		// 단순하게 origin배열을 다시 copy 배열에 대입(주소값만 저장)
		int [] copy = origin;
		System.out.println("===복사본 배열 출력===");
		for(int i = 0; i< origin.length; i++) {
			System.out.print(copy[i] + " ");
		}
		
		copy[2] = 15;
		
		System.out.println("=== 복사본 배열 수정 후 ===");
		System.out.println("===원본 배열 출력===");
		for(int i = 0; i< origin.length; i++) {
			System.out.print(origin[i] + " "); // 1 2 15 4 5
		}
		
		System.out.println("===복사본 배열 출력===");
		for(int i = 0; i< origin.length; i++) {
			System.out.print(copy[i] + " "); // 1 2 15 4 5
		}
		
		/*
		 * 복사본 배열만을 가지고 수정을 했는데, 원본배열도 같이 수정이 되었다.
		 * 왜냐면 얕은복사이기 때문이고, 배열의 주소값은 하나로 공유해서 사용하고 있기때문.
		 * 원본배열과 ,복사본 배열 모두 하나의 주소값을 가르키고 있다.
		 */
		
		System.out.println();
		System.out.println(origin.hashCode());
		System.out.println(copy.hashCode());
		System.out.println(origin == copy);
	}
	
	// 깊은복사하는 4가지방법
	public void method2() {
		// 1. for문 활용하는 방법(수작업)
		// 새로운 배열을 생성하고, 인덱스 별 내부값을 일일이 대입하는 방법
		int [] origin = {1,2,3,4,5};
		
		int [] copy = new int[origin.length];
		
		// copy[0] = origin[0];
		// copy[1] = origin[1];
		// copy[n] = origin[n];
		for(int i =0; i<copy.length; i++) {
			copy[i] = origin[i];
		}
		// 배열복사 ok
		for(int i =0; i<copy.length;i++) {
			System.out.println(copy[i]);
		}
		copy[2] = 15;
		
		System.out.println("=== 복사본 배열 수정 후 ===");
		System.out.println("===원본 배열 출력===");
		for(int i = 0; i< origin.length; i++) {
			System.out.print(origin[i] + " "); // 1 2 3 4 5 
		}
		System.out.println();
		System.out.println("===복사본 배열 출력===");
		for(int i = 0; i< origin.length; i++) {
			System.out.print(copy[i] + " "); // 1 2 15 4 5
		}
	}
	
	// 자바에서 제공하는 다양한 메서드 사용해서 복사
	// 이미 만들어져있는 퀄리토 꽤 좋은 메서드 많이 있음. 
	public void method3() {
		// 2. 새로운 배열을 생성한 후 System클래스에서 arraycopy메서드를 이용한 복사
		
		int [] origin = {1, 2, 3, 4, 5};
		int [] copy = new int[10];
		
		// System.arraycopy(원본 배열명, 원본 배열에서 복사를 시작할 인덱스, 복사본 배열명, 복사본 배열의 복사가 시작될 인덱스, 복사할 개수);
		System.arraycopy(origin, 0, copy, 0, 5);//1 2 3 4 5 0 0 0 0 0 
		copy = new int[10]; // 0 0 0 0 0 0 0 0 0 
		
		System.arraycopy(origin, 0, copy, 2 , 5);// 0 0 1 2 3 4 5 0 0 0
		copy = new int[10]; // 0 0 0 0 0 0 0 0 0
		
		System.arraycopy(origin, 0, copy, 1, 3);// 0 1 2 3 0 0 0 0 0 0 
		copy = new int[10];
		
		System.arraycopy(origin, 2, copy, 1, 3);// 0 3 4 5 0 0 0 0 0 0
		//System.arraycopy(origin, 2, copy, 9, 3);
		// 인덱스 범위를 벗어났기 때문에 오류 발생함.
		
		for(int i =0; i < copy.length; i++) {
			System.out.print(copy[i]+" ");
		}
		
		System.out.println("\n원본 해시코드 : "+origin.hashCode());
		System.out.println("복사본 해시코드 : "+copy.hashCode());
	}
	
	public void method4() {
		// 3. Arrays 클래스에서 제공하는 copyOf 메소드를 이용한 복사(내부적으로 System.arraycopy를 사용함)
		int [] origin = {1, 3, 5, 7 ,9};
		
		// 복사본 배열 = Arrays.copyOf(원본 배열명, 복사할 갯수);
		int [] copy = Arrays.copyOf(origin, 7); // 복사할 갯수 == copy 배열의 크기
		
		System.out.println(Arrays.toString(copy));
		
		/*
		 * 2. System.arraycopy 메소드 : 몇번 인덱스부터 몇개를 어느 위치의 인덱스에 복사할건지 다 직접 지정 가능
		 * 
		 * 3. Arrays.copyOf 메소드 : 무조건 원본배열의 0번 인덱스부터 내가 지정한 갯수만큼 복사가 진행됨.
		 *                          내가 제시한 길이가 원본배열보다 크다면 나머지는 0으로 채워서 복사해줌.
		 */
	}
	
	public void method5() {
		
		// 4. clone 메소드를 사용하여 복사
		int [] origin = {1 ,2 ,3 , 4 ,5};
		
		// 복사본 배열 = 원본 배열.clone();
		int [] copy = origin.clone(); // 인덱스 x ,복사할갯수 x 원본배열과 똑같이 생성
		// clone()함수는 Arrays클래스에서만 깊은 복사를 지원함
		// 그 외의 클래스에서는 얕은복사(주소값 복사)를 지원함
		
		System.out.println(Arrays.toString(copy));
		
		System.out.println("\n원본 해시코드 : "+origin.hashCode());
		System.out.println("\n복사본 해시코드 : "+copy.hashCode());
		// 6, 10, 12
	}
	
	
	
	
	
	
	
	
	
	
	
}
