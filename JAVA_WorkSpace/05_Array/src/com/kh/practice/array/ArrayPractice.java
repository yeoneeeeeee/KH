package com.kh.practice.array;

import java.util.Arrays;
import java.util.Scanner;

public class ArrayPractice {
	// 6, 10, 12
	
	Scanner sc = new Scanner(System.in);
	
	public void practice6() {
//		문자열을 입력 받아 문자열에 어떤 문자가 들어갔는지 배열에 저장하고
//		문자의 개수와 함께 출력하세요
		System.out.print("문자열 : ");
		String str = sc.nextLine();
		
		char [] arr = new char[str.length()];
		for(int i =0; i<arr.length; i++) {
			arr[i] = str.charAt(i);// [a , p ,p, l, i, c,a,t,i,o,n]
		}
		
		int count = 0;
		System.out.print("문자열에 있는 문자 : ");
		
		loop1: // 분기문과 함께 사용가능함.
		for(int i =0; i<arr.length; i++) {
			boolean isDuplicate = false;
			
			loop2:
			for(int j = 0; j < i; j++ ) {
				if(arr[i] == arr[j]) {
					isDuplicate = true;
					break;
				}
			}
			
			if(!isDuplicate) {
				System.out.print(arr[i] +  (i == (arr.length-1) ? "" : ", " ));  
				count++;
			}
		}
		System.out.println("\n문자 개수 : "+count);
//              		 a p p l i c a t i o n
//		문자열에 있는 문자 : a, p, l, i, c, t, o, n
//		문자 개수 : 8
	}
	
	public void practice10(){
//		10개의 값을 저장할 수 있는 정수형 배열을 선언 및 할당하고
//		1~10 사이의 난수를 발생시켜 중복된 값이 없게 배열에 초기화한 후 출력하세요
		
		int [] arr = new int[10];
		
		int [] checkedArr = new int[11];
		
		for(int i=0; i<arr.length; i++) {
			int random = (int)(Math.random()*10+1);
			if(checkedArr[random] == 1) {
				i--;
				continue;
			}
			arr[i] = random;
			checkedArr[random] = 1;
		}
		System.out.println(Arrays.toString(arr));
	}
	
	
	public void practice12() {
//		1. 사용자가 입력한 배열의 길이만큼의 문자열 배열을 선언 및 할당하고
//		2. 배열의 인덱스에 넣을 값 역시 사용자가 입력하여 초기화 하세요.
//		3. 단, 사용자에게 배열에 값을 더 넣을지 물어보고 몇 개를 더 입력할 건지,
//		4.늘린 곳에 어떤 데이터를 넣을 것인지 받으세요.
//		5. 사용자가 더 이상 입력하지 않겠다고 하면 배열 전체 값을 출력하세요.
		System.out.print("배열의 크기를 입력하세요 : ");
		int size = sc.nextInt();
		sc.nextLine();
		
		String [] arr = new String[size];
		String [] copy = null;
		
		int i = 0;
		while(true) {
			if( i == size) {
				System.out.print("더 값을 입력하시겠습니까?(Y/N) : ");
				char ch = sc.nextLine().charAt(0);
				if(ch == 'y' || ch == 'Y') {
					System.out.print("더 입력하고 싶은 개수 : ");
					int num = sc.nextInt();
					sc.nextLine();
										
					// arr배열은 꽉참. 카피본 배열
					copy = new String[size+num];
					size += num;
					for(int j = 0; j<arr.length; j++) {
						copy[j] = arr[j];
					}
					arr = copy;
				}else {
					break;
				}
			}
			arr[i] = sc.nextLine();			
			i++;
		}
		System.out.println(Arrays.toString(arr));
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
