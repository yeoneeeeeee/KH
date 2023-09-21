package com.kh.chap01_oneVsMany.run;

import java.util.Scanner;

import com.kh.chap01_oneVsMany.model.vo.Book;

public class ObjectRun {

	public static void main(String[] args) {
		
		// 1. 기본생성자로 객체 생성 후 setter메소드를 통해 각 필드에 대입
//		Book bk1 = new Book();
//		bk1.setTitle("자바프로그래밍 입문");
//		bk1.setAuthor("박은종");
//		bk1.setPrice(25000);
//		bk1.setPublisher("이지스퍼블리싱");
		
		// 2. 매개변수 생성자로 객체 생성과 동시에 각 필드에 값 대입
		//Book bk2 = new Book("자바프로그래밍 입문","박은종",25000,"이지스 퍼블리싱");
		
		// 세 개의 Book 객체가 필요하다는 가정하에
		// 각  Book객체를 따로따로 관리
		// 단, Book객체 내부의 값은 사용자가 입력한 값들로 초기화시키기
		Book bk1 = null;
		Book bk2 = null;
		Book bk3 = null;
		
		Scanner sc = new Scanner(System.in);
		
		// 3개의 전체 도서 정보를 입력 받은 후 각 객체에 초기화
		for(int i =0; i< 3; i++) { // 0 1 2 || '3'
			System.out.print("제목 : ");
			String title = sc.nextLine();
			
			System.out.print("저자 : ");
			String author = sc.nextLine();
			
			System.out.print("가격 : ");
			int price = sc.nextInt();
			sc.nextLine();
			
			System.out.print("출판사 : ");
			String publisher = sc.nextLine();
			// 초기화 시키고자 하는 객체가 많으면 많을수록 코드가 길고 복잡해진다. 유지보수가 힘들것.
			if( i == 0) {
				bk1 = new Book(title, author, price, publisher);	
			} else if(i == 1) {
				bk2 = new Book(title, author, price, publisher);
			} else if(i == 2) {
				bk3 = new Book(title, author, price, publisher);
			}
			
		}
				
		
		
		
		
		
		
		
		
		
		
		
		
		
		
	}

}
