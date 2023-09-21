package com.kh.practice.book.view;

import java.util.Calendar;
import java.util.Scanner;

import com.kh.practice.book.controller.BookController;
import com.kh.practice.book.model.vo.Book;

public class BookMenu {
	private Scanner sc = new Scanner(System.in);
	private BookController bc = new BookController();
	private Book[] bArr = null;

	public BookMenu() {
		bc.makeFile();
		bArr = bc.fileRead();
		// 필드에 있는 bArr에 bc의 fileRead() 반환 값 대입
	}

	public void mainMenu() {
		while (true) {
			System.out.println("1. 도서 추가 저장");
			System.out.println("2. 저장 도서 출력");
			System.out.println("9. 프로그램 끝내기");
			System.out.print("메뉴 번호 : ");
			int num = Integer.parseInt(sc.nextLine());

			switch (num) {
			case 1:
				fileSave();
				break;
			case 2:
				fileRead();
				break;
			case 9:
				System.out.println("종로");
				return;
			default:
				System.out.println("똑바로입력하세요");
			}
		}

	}

	public void fileSave() {
		System.out.print("도서 명 :");
		String title = sc.nextLine();
		
		System.out.print("저자 명 :");
		String author = sc.nextLine();
		
		System.out.print("도서 가격 :");
		int price = Integer.parseInt(sc.nextLine());
		
		System.out.print("출판 날짜(yyyy-mm-dd) :");
		String date = sc.nextLine();
		
		System.out.print("할인율 :");
		double discount = Double.parseDouble(sc.nextLine());
		
		String [] dateSplit = date.split("-");
		
		Calendar c = Calendar.getInstance();
		c.set( Integer.parseInt(dateSplit[0]), Integer.parseInt(dateSplit[1]) -1 , Integer.parseInt(dateSplit[2]));
		
		Book b = new Book(title, author, price , c , discount);
		
		for(int i=0; i<bArr.length; i++) {
			if(bArr[i] == null) {
				bArr[i] = b;
				break;
			}
		}
		bc.fileSave(bArr);
	}

	public void fileRead() {
		Book[] books = bc.fileRead();
		for(Book b : books) {
			if(b != null)
			System.out.println(b);
		}
		// bc에 fileRead()의 반환 값을 가지고 저장된 데이터 출력
	}
}
