package com.kh.variable;

import java.util.Scanner;

// 사용자가 키보드로 입력한 값을 변수에 기록하는 방법
public class B_KeyboardInput {
	
	public void inputTest1() {
		/*
		 * 자바에서 이미 제공하고있는 Scanner클래스를 이용해야한다.
		 * Scanner 클래스 안에 작성되어있는 메소드를 호출해서 사용
		 */
		java.util.Scanner sc = new java.util.Scanner(System.in);
		//System.in 입력받은 값을 바이트단위로 받아들이겠다라는 의미
		// 출력시에는 System.out을 사용했음.
		
		// 사용자의 인적사항(이름, 나이, 키) 입력받기 
		
		// 입력받고자 하는 내용을 먼저 출력해서 입력을 유도
		System.out.print("당신의 이름은 무엇 입니까 : ");
		
		// 사용자가 입력한 값을 문자열로 받아오는 메소드 : next(), nextLine()★	
		// 변수 선언과 동시에 값을 입력받아 바로 대입하는 방법		
		//String name = sc.next();
		// next() : 사용자가 입력한 값중 "공백"이 있을 경우 공백 이전까지만 출력해줍니다.
		String name = sc.nextLine(); // 사용자가 엔터를 입력하기 전까지 대기상태
		// nextLine() : 사용자가 입력한 값 중 개행(엔터)이 있을 경우 공백에 무관하게 개행이전까지만 출력해준다.
		//              특히 사용자가 입력한 값에 공백이 포함될 여지가 있을경우 안전하게 nextLine쓰기. ex)주소
		
		System.out.print("당신의 나이는 몇 살 입니까 : ");
		int age = sc.nextInt(); // 사용자가 엔터(개행문자)를 입력하기전까지 대기상태
		
		sc.nextLine(); // 입력버퍼에 남아있는 엔터를 비워주기 위해서 실행
		
		System.out.print("주소 : ");
		String address = sc.nextLine(); 
		
		System.out.print("당신의 키는 몇 cm입니까 : "); // 170.1 , 170.9
		double height = sc.nextDouble();
		
		// sc.nextInt() : 사용자가 입력한 정수형 값을 입력받을때 사용
		// sc.nextDouble() : 사용자가 입력한 실수형값을 입력받을때 사용
		
		System.out.println(name+"님은 "+age+"살이고 키는 "+height+"cm입니다 그리고 주소는 : "+ address);
		
	}
	
	public void inputTest2() {
		
		Scanner sc = new Scanner(System.in);
		
		// 문자열을 뽑을 때 => sc.nextLine() / sc.next()
		// 정수값을 뽑을 때 => sc.nextInt() / sc.nextByte() / sc.nextShort() / sc.nextLong()
		// 실수값을 뽑을 때 => sc.nextDouble() / sc.nextFloat()
		// 문자를 뽑을때 => sc.nextChar() 없음.
		
		System.out.print("이름 : ");
		String name = sc.nextLine();
		
		System.out.print("성별(M/F) : ");
		char gender = sc.nextLine().charAt(0); 
		// 먼저 사용자가 입력한 값을 문자열로 받아온 후, 그 문자열의 0번째 문자를 추출
		// "apple" 문자열 a -> 0번째(인덱스)
		//  12345 X
		//  01234 O
		
		System.out.print("당신의 나이는 몇 살 입니까 : ");
		int age = sc.nextInt(); // 사용자가 엔터(개행문자)를 입력하기전까지 대기상태
		
		System.out.print("당신의 키는 몇 cm 입니까 : ");
		double height = sc.nextDouble();
		
		System.out.println(name + "님의 개인정보");
		System.out.println("성별 : "+gender);
		System.out.println("나이 : "+age);
		System.out.println("키 : "+height);
	}

	/*
	 * 1. 콘솔 창(모니터)에 출력하기 위해 : System.out.printXX()메소드 이용함
	 * 2. 콘솔 창(키보드)으로 입력받기 위해 : Scanner 이용해서 (nextLine(), next(), nextInt(), nextXXX().. )
	 * 
	 *  > 주의사항
	 *  1) sc.nextXXX()메소드 뒤에 sc.nextLine()메소드가 와야될 경우
	 *  sc.nextLine()메소드를 한번더 명시적으로 선언해주면서 입력버퍼에 남아있는 '엔터'값을 빼주는 과정 필수
	 *  
	 *  2) '문자'값을 입력받아야될 경우
	 *  sc.nextLine()메소드로 우선 문자열을 입력받은후 그뒤에 .charAt(인덱스)메소드를 통해 문자 하나만추출
	 */
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
