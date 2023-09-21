package com.kh.array;

import java.util.Scanner;

public class C_DimensionalArray {

	// 이차원 배열 : 일차원 배열 여러개를 하나로 묶은 것
	
	public void method1() {

		// 일차원 배열 선언
		// int [] arr1;
		// int arr2 [];
		
		/* 
		 * 이차원 배열 선언
		 * [표현법]
		 * 1. 자료형 배열명 [][];
		 * 2. 자료형 [][] 배열명; 
		 * 3. 자료형 [] 배열명 [];
		 * 
		 */
		int arr1[][] ;
		int [][] arr2 ;
		int [] arr3 [];
		
		/*
		 * 이차원 배열 할당(크기 지정)
		 * 배열명 = new 자료형[행크기][열크기];
		 */
		
		arr3 = new int[2][3];
		
		// 이차원배열 선언과 동시에 할당
		int[][] arr = new int[3][5];
		
		
		System.out.println(arr); // 2차원 배열 주소값
		System.out.println(arr[0]); // ?? 1차원 배열의 주소값
		System.out.println(arr[0][0]); // ?? 0
		
		System.out.println("행의 길이 : " + arr.length);
		// 각 행별 열의 길이를 알고자 한다면
		System.out.println("0행의 열의 크기 : "+arr[0].length);
		System.out.println("1행의 열의 크기 : "+arr[1].length);
		System.out.println("2행의 열의 크기 : "+arr[2].length);
		
		/*
		 * 출력(arr[0][0]);
		 * 출력(arr[0][1]);
		 * ...
		 * 출력(arr[0][4]);
		 * =========================
		 * 출력(arr[1][0]);
		 * 출력(arr[1][1]);
		 * ...
		 * 출력(arr[1][4]);
		 * ==========================
		 * 출력(arr[2][0]);
		 * 출력(arr[2][1]);
		 * ...
		 * 출력(arr[2][4]);
		 * 
		 * 
		 */
		for(int i =0; i< arr.length; i++) { // 0, 1, 2
			
			for(int j =0; j<arr[i].length; j++) { // 0, 1, 2, 3, 4
				System.out.printf("arr[%d][%d] : %d\n",i,j,arr[i][j]);
			}
			System.out.println();
		}
	}
	
	public void method2() {
		
		// 순선대로 1, 2, 3, 4, 5 .... 15 값을 넣어보기
		
		int[][] arr= new int[3][5];
		// 값 대입 
		int value = 1;
		
		for(int i =0; i< arr.length; i++) { // 0행 ~ 마지막 행
			for(int j =0; j<arr[i].length; j++) { // 0열 ~ 각 행별 마지막 열
				arr[i][j] = value++;
			}
		}
		// 출력식 : printf("%-2d")
		for(int i =0; i<arr.length; i++) {
			for(int j=0; j<arr[i].length; j++) {
				System.out.printf("%3d", arr[i][j]);
			}
			System.out.println();
		}
		
	}
	
	public void method3() {
		
		// 일차원 배열 선언 및 할당과 동시에 초기화
		int[] iArr = {1,2,3,4,5};
		
		// 이차원 배열 선언 및 할당과 동시에 초기화
		
		int [][] arr = { {1,2,3,4,5}, {6,7,8,9},{11,13,15}     };
		for(int i =0; i<arr.length; i++) {
			for(int j=0; j<arr[i].length; j++) {
				System.out.printf("%3d", arr[i][j]);
			}
			System.out.println();
		}
	}
	
	public void method4() {
		/*
		 * 가변 배열
		 * 행의 크기는 정해져있으나 각각의 행 별 열의 갯수가 정해지지 않은 상태
		 * 이차원 배열 == 일차원 배열 여러개 묶은 형태
		 * 즉, 묶여있는 일차원 배열의 길이가 같을 필요는 없다
		 * 행 크기는 생략이 불 가능하지만, 열크기는 사실 생략이 가능하다. 각 행의 열의 길이가 변경 가능하다. 
		 * 
		 */
		
		int[][] arr = new int[3][]; // 가변배열
		
		//System.out.println(arr); // 이차원 배열 주소값
		System.out.println(arr[0]); // null(O) , 1차원 배열 주소값 X
		//System.out.println(arr.length); // 3
		//System.out.println(arr[0].length); // 비어있다? 초기화 되기전까지는모른다? 오류가뜬다.(O) 0(2)

		arr[0] = new int[2];
		arr[1] = new int[1];
		arr[2] = new int[3];
		
		/*
		 * 1 2
		 * 3
		 * 4 5 6
		 */
		int value = 1;
		for(int i = 0; i< arr.length; i++) {
			for(int j =0; j< arr[i].length; j++) {
				arr[i][j] =value++;
				System.out.print(arr[i][j]+" ");
			}			
			System.out.println();
		}
	}
	
	public void method5() {
		// char[][] 가변 배열 생성
		//char[][] arr = new char[3][];
		char[][] arr = { {'a','b','c'} , {'d','e'}, {'f','g','h','i'}   };
		// 다음과 같은 문자 행과 열대로 배열에 담기
		/*
		 * a b c
		 * d e
		 * f g h i
		 */
		arr[0] = new char[3];
		arr[1] = new char[2];
		arr[2] = new char[4];
				
		char value = 'a'; 
		for(int i = 0; i< arr.length; i++) {
			for(int j =0; j< arr[i].length; j++) {
				arr[i][j] = value++;
				System.out.print(arr[i][j]+" ");
			}			
			System.out.println();
		}
	}
	
	public void method6() {
		
		// 3행 3열 짜리 String[][]배열 생성후
		// 중첩 반복문을 통해 현재 행, 열의 순번을 출력
		// (0,0) (0,1) (0,2)
		// (1,0) (1,1) (1,2)
		// (2,0) (2,1) (2,2)
		String[][] arr = new String[3][3];
		
		for(int i = 0; i< arr.length; i++) {
			for(int j =0; j< arr[i].length; j++) {
				System.out.printf("(%d,%d) ", i, j);
			}			
			System.out.println();
		}
	}
	
	public void method7() {
		
		/*
		 * int 형 2차원 배열을 만들어
		 * 0번 행에는 국어점수 3개를 입력받고
		 * 1번 행에는 영어점수를 3개 입력 받은후
		 * 
		 * 각각 반복문을 통해 출력
		 * 
		 * 입력예시 : xx점수를 입력하세요 : 
		 * 출력예시 : xx점수 : xx xx xx
		 */
		Scanner sc = new Scanner(System.in);
		
		int [][] arr = new int[2][3];
		String [] subjects = {"국어","영어","수학","과학"};
		
		for(int i = 0; i< arr.length; i++) {
			String subject = i == 0 ? "국어" : "영어";
			
			for(int j =0; j< arr[i].length; j++) {
				System.out.printf("%s점수를 입력하세요 : ", subjects[i] /*subject*/);
				arr[i][j] = sc.nextInt();
			}			
			System.out.println();
			System.out.printf("%s점수 : %d %d %d ", subject , arr[i][0], arr[i][1],arr[i][2]);
//			for(int j=0;  j< arr[i].length; j++) {
//				System.out.print(arr[i][j]+" ");
//			}
			// 4번 , 6번  , 8 번
		}
		
		
		
		
		
		
		
		
		
		
		
		
	}
	
	
	
	
	
}
