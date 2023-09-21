package com.kh.chap03.branch;

public class B_Continue {
	/*
	 * continue; : 반복문 안에서 사용하는 구문
	 *             continue를 만나게되면 그 뒤에 어떤구문이 있든간에 실행하지 않고
	 *             가장 가까운 반복문으로 올라가라는걸 의미
	 */
	
	public void method1() {
		// 1 부터 10까지 홀수만 출력
		// 1 3 5 7 9
		
		
		// 방법1 : i값을 매번 2씩 증가시키는방법
		for(int i = 1; i<= 10; i+=2) {
			System.out.print(i + " ");// 1 3 5 7 9
		}
		
		// 방법2. 반복문을 돌때마다 홀수인경우를 체크해서 출력하는방법 if(i % 2 == 1) --> 출력
		System.out.println();
		// 방법3. 짝수일경우 현재반복을 중지하고 가장가까운 반복문으로 올라가는 방법
		for(int i =1; i<=10; i++) { // 10회 반복
			if(i % 2 == 0) { // 짝수면
				continue; // 뒷쪽의 내용은 무시하고 다음증감식부분으로 넘어감
			}
			System.out.print(i+" ");
		}
	}
	
	public void method2() {
		// 1부터 100까지의 총 합계
		// 단 , 6의 배수값은 빼고 더해보기.
		int sum = 0;
		for(int i = 1; i<=100; i++) {
			if(i % 6 == 0) {
				//sum -= i;
				continue;
			}
			sum += i;			
		}
		// 출력예시 : 총 합계 : xxxx 5055
		System.out.println("총 합계 : "+sum);
	}
	
	
   public void method3() {
	      //1부터 100까지의 총 합계
	      //단, 6의 배수값은 빼고 더해보기.
	      
	      // 출력예시 : 총 합계 : xxxx
	      int sum = 0;
	      int i = 1;
	      for(i = 1; i <= 100; i++) {
	         if(i % 6 == 0) {
	            continue;
	         }
	         sum += i ;
	      }
	      System.out.println("총 합계 : "+sum);
	   }
	
		   
	
	
	
}

