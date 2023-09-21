package com.kh.practice.set.view;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Scanner;
import java.util.TreeSet;

import com.kh.practice.set.controller.LotteryController;
import com.kh.practice.set.model.vo.Lottery;

public class LotteryMenu {
	private Scanner sc = new Scanner(System.in);

	private LotteryController lc = new LotteryController();

	public void mainMenu() {
		System.out.println("========== KH 추첨 프로그램 ==========");
		while (true) {
			System.out.println("******* 메인 메뉴 *******");
			System.out.println("1. 추첨 대상 추가");
			System.out.println("2. 추첨 대상 삭제");
			System.out.println("3. 당첨 대상 확인");
			System.out.println("4. 정렬된 당첨 대상 확인");
			System.out.println("5. 당첨 대상 검색");
			System.out.println("9. 종료");
			System.out.print("메뉴 번호 선택 :");
			int menu = Integer.parseInt(sc.nextLine());
			switch (menu) {
			case 1:
				insertObject();
				break;
			case 2:
				deleteObject();
				break;
			case 3:
				winObject();
				break;
			case 4:
				sortedWinObject();
				break;
			case 5:
				searchWinner();
				break;
			case 9:
				System.out.println("프로그램 종료.");
				return;
			default:
				System.out.println("잘못 입력했습니다. 다시 입력해주세요.");
			}
		}

	}

	// 1. 추첨 대상 추가용 view 메소드
	public void insertObject() {
		System.out.println("추가할 추첨 대상 수 : ");
		int num = Integer.parseInt(sc.nextLine());
		
		for(int i =0; i<num; i++) {
			System.out.println("이름 : ");
			String name = sc.nextLine();
			
			System.out.println("핸드폰 번호('-'빼고) : ");
			String phone = sc.nextLine();
			Lottery l = new Lottery(name, phone);
			boolean result = lc.insertObject(l);
			if(result) {
				System.out.println("중복된 대상입니다. 다시 입력하세요.");
				i--;
			}else {
				System.out.println("추가 완료되었습니다");
			}
		}

	}

	// 2. 추첨 대상 삭제용 view 메소드
	public void deleteObject() {
		System.out.println("삭제할 대상의 이름과 핸드폰 번호를 입력하세요.");
		System.out.print("이름 : ");
		String name = sc.nextLine();

		System.out.print("핸드폰 번호('-'빼고) :");
		String phone = sc.nextLine();
		Lottery l = new Lottery(name, phone);
		boolean result = lc.deleteObject(l);
		if(result) {
			System.out.println("삭제 완료");
		}else {
			System.out.println("존재하지 않는 대상입니다");
		}
	}

	// 3. 당첨 대상 확인용 view 메소드
	public void winObject() {
		HashSet<Lottery> l = lc.winObject();
		if(l == null) {
			System.out.println("추첨인원수가 모자랍니다.");
			return;
		}
		for(Lottery lot : l) {
			System.out.println(lot);
		}
	}

	// 4. 정렬된 당첨 대상 확인
	public void sortedWinObject() {
		TreeSet<Lottery> l = lc.sortedWinObject();
		Iterator<Lottery> it = l.iterator();
		while(it.hasNext()) {
			System.out.println(it.next());
		}
		// lc에서 받아온 Set객체를 Iterator를 통해 출력
	}

	// 5. 당첨 대상 검색용 view 메소드
	public void searchWinner() {
		System.out.println("검색할 대상의 이름과 핸드폰 번호를 입력하세요.");
		System.out.print("이름 : ");
		String name = sc.nextLine();

		System.out.print("핸드폰 번호('-'빼고) :");
		String phone = sc.nextLine();
		Lottery l = new Lottery(name,phone);
		boolean winner = lc.searchWinner(l);
		if(winner) {
			System.out.println("축하합니다");
		}else {
			System.out.println("안타깝지만 당첨 목록에 존재하지 않습니다.");
		}
	}
}
