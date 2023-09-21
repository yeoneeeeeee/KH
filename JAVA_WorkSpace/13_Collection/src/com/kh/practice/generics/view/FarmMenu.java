package com.kh.practice.generics.view;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Scanner;
import java.util.Set;

import com.kh.practice.generics.controller.FarmController;
import com.kh.practice.generics.model.vo.Farm;
import com.kh.practice.generics.model.vo.Fruit;
import com.kh.practice.generics.model.vo.Nut;
import com.kh.practice.generics.model.vo.Vegetable;

public class FarmMenu {
	private Scanner sc = new Scanner(System.in);
	private FarmController fc = new FarmController();

	public void mainMenu() {
		System.out.println("========== KH 마트 ==========");
		while (true) {
			System.out.println("******* 메인 메뉴 *******");
			System.out.println("1. 직원메뉴");
			System.out.println("2. 손님 메뉴");
			System.out.println("9. 종료");
			System.out.print("메뉴 번호 선택 :");
			int menu = Integer.parseInt(sc.nextLine());

			switch (menu) {
			case 1:
				adminMenu();
				break;
			case 2:
				customerMenu();
				break;
			case 9:
				System.out.println("종료");
				return;
			default:
				System.out.println("제대로입력하세요");
			}
		}
		// adminMenu() 실행
		// customerMenu()
		// “프로그램 종료.” 출력 후 main()으로 리턴

		// 잘 못 입력 하였을 경우 "잘못 입력하였습니다. 다시 입력해주세요" 출력 후 반복
	}

	public void adminMenu() {
		while(true) {
			System.out.println("******* 직원 메뉴 *******");
			System.out.println("1. 새 농산물 추가 ");
			System.out.println("2.  종류 삭제 ");
			System.out.println("3. 수량 수정 ");
			System.out.println("4. 농산물 목록");
			System.out.println("9. 메인으로 돌아가기");
			System.out.print("메뉴 번호 선택 :");
			int menu = Integer.parseInt(sc.nextLine());

			switch (menu) {
			case 1:
				addNewKind();
				break;
			case 2:
				removeKind();
				break;
			case 3:
				changeAmount();
				break;
			case 4:
				printFarm();
				break;
			case 9:
				System.out.println("종료");
				return;
			default:
				System.out.println("제대로입력하세요");
			}
		}
		// 잘 못 입력 하였을 경우 "잘못 입력하였습니다. 다시 입력해주세요" 출력 후 반복
	}

	public void customerMenu() {
		System.out.println("현재 KH마트 농산물 수량");

		printFarm();
		while(true) {
			System.out.println("******* 고객 메뉴 *******");
			System.out.println("1. 농산물 사기 ");
			System.out.println("2. 농산물 빼기");
			System.out.println("3. 구입한 농산물 보기");
			System.out.println("9. 메인으로 돌아가기");
			System.out.print("메뉴 번호 선택 :");
			int menu = Integer.parseInt(sc.nextLine());

			switch (menu) {
			case 1:
				buyFarm();
				break;
			case 2:
				removeFarm();
				break;
			case 3:
				printBuyFarm();
				break;
			case 9:
				System.out.println("종료");
				return;
			default:
				System.out.println("제대로입력하세요");
			}
		}
	
	}

	// 1-1. 새 농산물 추가용 view 메소드
	public void addNewKind() {
		System.out.print("1. 과일 / 2. 채소 / 3. 견과");
		int kind = sc.nextInt();
		sc.nextLine();
		
		System.out.print("이름 : ");
		String name = sc.nextLine();
		
		System.out.print("수량 : ");
		int amount = sc.nextInt();
		sc.nextLine();
		Farm f = null;
		
		switch(kind) {
		case 1:  f = new Fruit("과일",name); break;
		case 2:  f = new Vegetable("채소", name); break;
		case 3:  f = new Nut("견과",name); break;
		
		default : System.out.println("잘못 입력하셨습니다. 다시입력해주세요");
				  addNewKind();
				  return;
		}	
		boolean result = fc.addNewKind(f, amount);
		if(result) {
			System.out.println("새 농산물이 추가되었습니다.");
		}else {
			System.out.println("새 농산물 추가에 실패했습니다. 다시입력하세요");
			addNewKind();
		}
		
	}

	// 1-2. 종류 삭제용 view 메소드
	public void removeKind() {
		System.out.print("1. 과일 / 2. 채소 / 3. 견과");
		int kind = sc.nextInt();
		sc.nextLine();
		
		System.out.print("이름 : ");
		String name = sc.nextLine();
		
		System.out.print("수량 : ");
		int amount = sc.nextInt();
		sc.nextLine();
		Farm f = null;
		
		switch(kind) {
		case 1:  f = new Fruit("과일",name); break;
		case 2:  f = new Vegetable("채소", name); break;
		case 3:  f = new Nut("견과",name); break;
		
		default : System.out.println("잘못 입력하셨습니다. 다시입력해주세요");
				removeKind();
				return;
		}	
		boolean result = fc.removeKind(f);
		if(result) {
			System.out.println("농산물 삭제에 성공하였습니다.");
		}else {
			System.out.println("새 농산물 추가에 실패하였습니다. 다시 입력해주세요.");
			removeKind();
		}

	}

	// 1-3. 수량 수정용 view 메소드
	public void changeAmount() {
		System.out.print("1. 과일 / 2. 채소 / 3. 견과");
		int kind = sc.nextInt();
		sc.nextLine();
		
		System.out.print("이름 : ");
		String name = sc.nextLine();
		
		System.out.print("수량 : ");
		int amount = sc.nextInt();
		sc.nextLine();
		Farm f = null;
		
		switch(kind) {
		case 1:  f = new Fruit("과일",name); break;
		case 2:  f = new Vegetable("채소", name); break;
		case 3:  f = new Nut("견과",name); break;
		
		default : System.out.println("잘못 입력하셨습니다. 다시입력해주세요");
				changeAmount();
				return;
		}	
		boolean result = fc.changeAmount(f, amount);
		if(result) {
			System.out.println("농산물 수량이 수정되었습니다.");
		}else {
			System.out.println("농산물 수량 수정에 실패하였습니다. 다시 입력해주세요.");
			changeAmount();
		}
	}

	// 1-4. 농산물 목록 출력용 view 메소드
	public void printFarm() {
		HashMap<Farm,Integer> farms= fc.printFarm();
		Set<Farm> keySet= farms.keySet();
		
		for(Farm f  :  keySet) {
			System.out.println(f.getKind()+" : "+f.getName()+"("+farms.get(f)+")");
		}
	}

	// 2-1. 농산물 구매용 view 메소드
	public void buyFarm() {
		System.out.print("1. 과일 / 2. 채소 / 3. 견과");
		int kind = sc.nextInt();
		sc.nextLine();
		
		System.out.print("이름 : ");
		String name = sc.nextLine();
		
		Farm f = null;
		
		switch(kind) {
		case 1:  f = new Fruit("과일",name); break;
		case 2:  f = new Vegetable("채소", name); break;
		case 3:  f = new Nut("견과",name); break;
		
		default : System.out.println("잘못 입력하셨습니다. 다시입력해주세요");
				buyFarm();
				return;
		}	
		boolean result = fc.buyFarm(f);
		if(result) {
			System.out.println("구매에 성공하였습니다.");
		}else {
			System.out.println("마트에 없는 물건이거나 수량이 없습니다. 다시 입력해주세요.");
			buyFarm();
		}
	}

	// 2-2. 농산물 구매 취소용 view 메소드
	public void removeFarm() {
		System.out.print("1. 과일 / 2. 채소 / 3. 견과");
		int kind = sc.nextInt();
		sc.nextLine();
		
		System.out.print("이름 : ");
		String name = sc.nextLine();
		
		Farm f = null;
		
		switch(kind) {
		case 1:  f = new Fruit("과일",name); break;
		case 2:  f = new Vegetable("채소", name); break;
		case 3:  f = new Nut("견과",name); break;
		
		default : System.out.println("잘못 입력하셨습니다. 다시입력해주세요");
				removeFarm();
				return;
		}	
		boolean result = fc.removeFarm(f);
		if(result) {
			System.out.println("구매 취소에 성공하였습니다.");
		}else {
			System.out.println("구매매 목록에 존재하지 않습니다. 다시 입력해주세요.");
			removeFarm();
		}
	}

	// 2-3. 구입한 농산물 출력용 view 메소드
	public void printBuyFarm() {
		ArrayList<Farm> list = fc.printBuyFarm();
		Iterator<Farm> iter = list.iterator();
		
		while(iter.hasNext()) {
			System.out.println(iter.next());
		}
	}

}
