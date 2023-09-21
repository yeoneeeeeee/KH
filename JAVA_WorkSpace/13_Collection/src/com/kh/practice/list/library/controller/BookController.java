package com.kh.practice.list.library.controller;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Iterator;
import java.util.List;

import com.kh.practice.list.library.model.vo.Book;

public class BookController {
	private List<Book> bookList = new ArrayList();

	public BookController() {
		// 초기 값 4개 추가
		bookList.add(new Book("자바의 정석", "남궁 성", "기타", 20000));
		bookList.add(new Book("쉽게 배우는 알고리즘", "문병로", "기타", 15000));
		bookList.add(new Book("대화의 기술", "강보람", "인문", 17500));
		bookList.add(new Book("암 정복기", "박신우", "의료", 21000));
	}

	public void insertBook(Book bk) {
		bookList.add(bk);
	}

	public ArrayList selectList() {
		return (ArrayList) bookList;
		// 해당 bookList의 주소 값 반환
	}

	public ArrayList searchBook(String keyword) {
		ArrayList searchList = new ArrayList();

		for (Book bk : bookList) {
			if (bk.getTitle().contains(keyword)) {
				searchList.add(bk);
			}
		}

		return searchList;
	}

	public Book deleteBook(String title, String author) {
		Book removeBook = null;

		Iterator<Book> it = bookList.iterator();
		while (it.hasNext()) {
			Book temp = it.next();
			if (temp.getAuthor().equals(author) && temp.getTitle().equals(title)) {
				removeBook = temp;
				it.remove();
			}
		}

		return removeBook;
	}

	public int ascBook() {
		// 책 이름으로 오름차순 후 1 반환

		try {
			Collections.sort(bookList);

			return 1;
		} catch (Exception e) {
			return 0;
		}

	}

}
