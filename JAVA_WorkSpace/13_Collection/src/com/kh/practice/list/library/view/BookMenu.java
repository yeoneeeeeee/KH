package com.kh.practice.list.library.view;

import java.util.ArrayList;
import java.util.Scanner;

import com.kh.practice.list.library.controller.BookController;
import com.kh.practice.list.library.model.vo.Book;

public class BookMenu {

	private Scanner sc = new Scanner(System.in);
	private BookController bc = new BookController();

	public void mainMenu() {
		System.out.println("== Welcome KH Library ==");
		while(true) {
			System.out.println("******* 메인 메뉴 *******");
			System.out.println("1. 새 도서 추가");
			System.out.println("2. 도서 전체 조회");
			System.out.println("3. 도서 검색 조회");
			System.out.println("4. 도서 삭제");
			System.out.println("5. 도서 명 오름차순 정렬");
			System.out.println("	9. 종료");
			System.out.print("메뉴 번호 선택 :");
			int menu = Integer.parseInt(sc.nextLine());
			
			switch (menu) {
			case 1:
				insertBook();
				break;
			case 2:
				selectList();
				break;
			case 3:
				searchBook();
				break;
			case 4:
				deleteBook();
				break;
			case 5:
				ascBook();
				break;
			case 9:
				System.out.println("종.료.");
				return;
			default:
				System.out.println("똑바로입력해");
			}
		}
	}

	// 1. 새 도서 추가용 view 메소드
	public void insertBook() {
		System.out.print("1. 도서명 입력받기 ");
		String title = sc.nextLine();
		System.out.print("2. 저자명 입력받기 ");
		String author = sc.nextLine();
		System.out.print("3. 장르 입력받기(1.인문 / 2.자연과학 / 3.의료 / 4.기타) ");
		int categoryNo = Integer.parseInt(sc.nextLine());
		System.out.print("4. 가격 입력받기 ");
		int price = Integer.parseInt(sc.nextLine());
		
		String category = "";
		switch(categoryNo) {
		case 1: category="인문";break;
		case 2: category="자연과학";break;
		case 3: category="의료";break;
		case 4: category="기타";break;
		}
		Book bk = new Book(title, author, category, price);
		
		bc.insertBook(bk);
	}

	// 2. 도서 전체용 view 메소드
	public void selectList() {
		ArrayList<Book> bookList = bc.selectList();
		
//		if(bookList.isEmpty()  ) {
//			
//		}
		if(bookList.size() > 0) {
			for( Book b  :  bookList) {
				System.out.println(b);
			}
		}else {
			System.out.println("존재하는 도서가 없습니다.");
		}
	}

	// 3. 도서 검색용 view 메소드
	public void searchBook() {
		System.out.print("검색할 도서 :");
		String keyword = sc.nextLine();
		
		ArrayList<Book> searchList = bc.searchBook(keyword);
		
		if(searchList.isEmpty()) {
			System.out.println("검색 결과가 없습니다.");
		}else {
			for(Book b : searchList) {
				System.out.println(b);
			}
		}
	}

	// 4. 도서 삭제용 view 메소드
	public void deleteBook() {
		System.out.print("삭제할 도서명 : ");
		String title = sc.nextLine();
		System.out.print("삭제할 저자명 : ");
		String author = sc.nextLine();
		
		Book remove = bc.deleteBook(title, author);
		
		if(remove == null) {
			System.out.println("삭제할 도서를 찾지 못했씁니다.");
		}else {
			System.out.println("성공적으로 삭제되었습니다.");
		}
	}

	// 5. 도서 명 오름차순 정렬용 view 메소드
	public void ascBook() {
//		bc(BookController)의 ascBook() 메소드 값에 따라
//		성공 시 “정렬에 성공하였습니다.”, 실패 시 “정렬에 실패하였습니다.” 출력
		int result = bc.ascBook();
		if(result == 1) {
			System.out.println("정렬 성공");
		}else {
			System.out.println("정렬 실패");
		}
		
		
	}

}
