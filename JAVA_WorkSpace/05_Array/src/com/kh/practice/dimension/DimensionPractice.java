package com.kh.practice.dimension;

import java.util.Arrays;

public class DimensionPractice {

	public void practice4() {

		int[][] arr = new int[4][4];

		// 0행 0열부터 2행 2열까지는 1~10 사이의 임의의 정수값을 저장하시오
		for (int i = 0; i < 3; i++) { // 0행, 1행, 2행

			for (int j = 0; j < 3; j++) {
				arr[i][j] = (int) (Math.random() * 10 + 1);

				arr[i][3] += arr[i][j];

				arr[3][j] += arr[i][j];

				arr[3][3] += arr[i][j] * 2;
			}
		}

//		for (int i = 0; i < 3; i++) { // 0행, 1행, 2행
//			for (int j = 0; j < 3; j++) {
//				arr[i][3] += arr[i][j];
//				arr[3][i] += arr[j][i];
//				
//				arr[3][3] += arr[i][j]*2;
//			}
//		}
//		[5, 4, 7, 0] arr[0][3] = arr[0][0] + arr[0][1] + arr[0][2]
//		[2, 9, 9, 0] arr[1][3] = arr[1][0] + arr[1][1] + arr[1][2]
//		[1, 8, 5, 0] arr[2][3] = arr[2][0] + arr[2][1] + arr[2][2]

//		[0, 0, 0, 0] arr[3][0] = arr[0][0] + arr[1][0] + arr[2][0]
//                   arr[3][1] = arr[0][1] + arr[1][1] + arr[2][1]
////                 arr[3][2] = arr[0][2] + arr[1][2] + arr[2][2]

		for (int i = 0; i < arr.length; i++) {
			System.out.println(Arrays.toString(arr[i]));
		}

	}

	public void practice04() {	
		
		int num[][] = new int [4][4];
		for (int i = 0; i < num.length; i++) {
			for (int j = 0; j < num.length; j++) {
				num[i][j]=(int)(Math.random()*10+1);
				if(j==num.length-1){
					
				switch(i){
				case 0 : num[0][j]= num[0][0]+num[0][1]+num[0][2];
				case 1 : num[1][j]= num[1][0]+num[1][1]+num[1][2];
				case 2 : num[2][j]= num[2][0]+num[2][1]+num[2][2];
				break;
				}
				}
				if(i==num.length-1) {
					switch(j){
					case 0 : num[i][0]= num[0][0]+num[1][0]+num[2][0];
					case 1 : num[i][1]= num[0][1]+num[1][1]+num[2][1];
					case 2 : num[i][2]= num[0][2]+num[1][2]+num[2][2];
					break;
					}
				}
				if(i==3 && j==3) {
					num[3][3]= num[0][3]+num[1][3]+num[2][3]+num[3][0]+num[3][1]+num[3][2];
				}
				System.out.print(num[i][j]+" ");
				}
			System.out.println("");
			}
	}
	
	public void practice6() {
		String[][] strArr = new String[][] {{"이", "까", "왔", "앞", "힘"}, {"차", "지", "습", "으", "냅"}, {"원", 
			"열", "니", "로", "시"}, {"배", "심", "다", "좀", "다"}, {"열", "히", "! ", "더", "!! "}};
//			위의 초기화되어 있는 배열을 가지고 아래의 ‘[그림] 실습문제4 흐름’과 같은 방식으로 출력하세요.
//			단, print()를 사용하고 값 사이에 띄어쓰기(“ “)가 존재하도록 출력하세요.
		for(int i = 0; i< strArr.length; i++) {
			for(int j =0; j< strArr[i].length; j++) {
				System.out.print(strArr[j][i]);
			}			
			System.out.println();
		}	
	}
	
	public void practice8() {
//		1차원 배열에 12명의 학생들을 출석부 순으로 초기화 하고
//		2열 3행으로 2차원 배열 2개를 이용하여 분단을 나눠
//		1분단 왼쪽부터 오른쪽, 1행에서 아래 행 순으로 자리를 배치하세요.
//		<출석부>
//		1. 강건강 2. 남나나 3. 도대담 4. 류라라 5. 문미미 6. 박보배
//		7. 송성실 8. 윤예의 9. 진재주 10. 차천축 11. 피풍표 12. 홍하하
		String [] arr = {"강건강","남나나","도대담","류라라","문미미","박보배","송성실","윤예의","진재주","차천축","피풍표","홍하하"};
		
		String [][] class1 = new String[3][2];
		String [][] class2 = new String[3][2];
		
		int index = 0;
		System.out.println("== 1분단 ==");
		for(int i =0; i<class1.length; i++) {
			for(int j =0; j<class1[i].length;j++) {
				class1[i][j] = arr[index++];
				System.out.print(class1[i][j]+" ");
			}
			System.out.println();
		}
		
		System.out.println("== 2분단 ==");
		for(int i =0; i<class2.length; i++) {
			for(int j =0; j<class2[i].length;j++) {
				class2[i][j] = arr[index++];
				System.out.print(class2[i][j]+" ");
			}
			System.out.println();
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
