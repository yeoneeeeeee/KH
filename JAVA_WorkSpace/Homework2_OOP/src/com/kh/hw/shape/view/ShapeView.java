package com.kh.hw.shape.view;

import java.util.Scanner;

import com.kh.hw.shape.controller.SquareController;
import com.kh.hw.shape.controller.TriangleController;

public class ShapeView {
	
	public static final int TRIANGLE = 3;
	public static final int SQUARE = 4;
	
	private Scanner sc = new Scanner(System.in);

	private SquareController scr = new SquareController();

	private TriangleController tc = new TriangleController();

	public void inputMenu() {
		// ===== 도형 프로그램 =====
		// 3. 삼각형 ==> triangleMenu()
		// 4. 사각형 ==> squareMenu()
		// 9. 프로그램 종료 => “프로그램 종료” 출력 후 프로그램 종료
		// 메뉴 번호 :
		// 잘못 입력했을 시 “잘못된 번호입니다. 다시 입력해주세요.” 출력 후 반복
		while (true) {
			System.out.println("===== 도형 프로그램 =====");
			System.out.println("3. 삼각형");
			System.out.println("4. 사각형");
			System.out.println("9. 프로그램 종료");
			System.out.print("메뉴 번호 : ");
			int num = sc.nextInt(); // 입력버퍼에 \n개행문자
			sc.nextLine();// 지워주기
			switch (num) {
			case 3:
				triangleMenu();
				break;
			case 4:
				squareMenu();
				break;
			case 9:
				System.out.println("프로그램을 종료합니다.");
				return;
			default:
				System.out.println("잘못된 번호입니다. 다시 입력해주세요.");
			}
		}

	}

	public void triangleMenu() {
		// ===== 삼각형 =====
		// 1. 삼각형 면적 ==> inputSize()
		// 2. 삼각형 색칠 ==> inputSize()
		// 3. 삼각형 정보 ==> printInformation()
		// 9. 메인으로 ==> “메인으로 돌아갑니다.” 출력 후 inputMenu()로
		// 메뉴 번호 :
		// 잘못 입력했을 시 “잘못된 번호입니다. 다시 입력해주세요.” 출력 후 반복
		while (true) {
			System.out.println("===== 삼각형 =====");
			System.out.println("1. 삼각형 면적 ");
			System.out.println("2. 삼각형 색칠 ");
			System.out.println("3. 삼각형 정보 ");
			System.out.println("9. 메인으로 ");
			System.out.print("메뉴 번호 : ");
			int num = sc.nextInt();
			sc.nextLine();

			switch (num) {
			case 1:
				inputSize(TRIANGLE , 1);
				break;
			case 2:
				inputSize(TRIANGLE , 2);
				break;
			case 3:
				printInformation(TRIANGLE);
				break;
			case 9:
				System.out.println("메인으로 돌아갑니다.");
				return;
			default:
				System.out.println("잘못된 번호입니다. 다시 입력해주세요.");
			}
		}

	}

	public void squareMenu() {
		// ===== 사각형 =====
		// 1. 사각형 둘레 ==> inputSize()
		// 2. 사각형 면적 ==> inputSize()
		// 3. 사각형 색칠 ==> inputSize()
		// 4. 사각형 정보 ==> printInformation()
		// 9. 메인으로 ==> “메인으로 돌아갑니다.” 출력 후 inputMenu()로
		// 메뉴 번호 :
		// 잘못 입력했을 시 “잘못된 번호입니다. 다시 입력해주세요.” 출력 후 반복
		while (true) {
			System.out.println("===== 사각형 =====");
			System.out.println("1. 사각형 둘레 ");
			System.out.println("2. 사각형 면적 ");
			System.out.println("3. 사각형 색칠 ");
			System.out.println("4. 사각형 정보 ");
			System.out.println("9. 메인으로 ");
			System.out.print("메뉴 번호 : ");
			int num = sc.nextInt();
			sc.nextLine();

			switch (num) {
			case 1:
				inputSize(SQUARE ,1);
				break;
			case 2:
				inputSize(SQUARE , 2);
				break;
			case 3:
				inputSize(SQUARE , 3);
				break;
			case 4:
				printInformation(SQUARE);
				break;
			case 9:
				System.out.println("메인으로 돌아갑니다.");
				return;
			default:
				System.out.println("잘못된 번호입니다. 다시 입력해주세요.");
			}
		}
	}

	// 삼각형 메뉴, 사각형 메뉴의 세부 메뉴에서 모두 같은 메소드로 이동하기 때문에
	// 삼각형인지 사각형인지, 몇 번 메뉴인지 구분하기 위해 매개변수로 넘겨줌
	public void inputSize(int type, int menuNum) {
		if (type == 3) {

			if (menuNum == 1) {
				System.out.print("높이 : ");
				double height = sc.nextDouble();
				System.out.print("너비 : ");
				double width = sc.nextDouble();
				System.out.println("삼각형 면적 : " + tc.calcArea(height, width));
			} else {
				System.out.print("색깔을 입력하세요 :");
				String color = sc.nextLine();
				tc.paintColor(color);
				System.out.println("색이 수정되었습니다.");
			}
		} else {
			if (menuNum == 1 || menuNum == 2) {
				// 값 입력
				System.out.print("높이 : ");
				double height = sc.nextDouble();
				System.out.print("너비 : ");
				double width = sc.nextDouble();
				if (menuNum == 1) {
					System.out.println("사각형 둘레 : " + scr.calcPerimeter(height, width));
				} else {
					System.out.println("사각형 면적 : " + scr.calcArea(height, width));
				}
			} else {
				System.out.print("색깔을 입력하세요 :");
				String color = sc.nextLine();
				scr.paintColor(color);
				System.out.println("색이 수정되었습니다.");
			}
		}
	}

	public void printInformation(int type) {
		// int type에 따라 print()메소드를 불러오는 controller가 다름
		// int type이 ‘삼각형’일 경우 tc.print() 출력
		// int type이 ‘사각형’일 경우 scr.print() 출력
		if (type == 3) {
			System.out.println(tc.print());
		} else {
			System.out.println(scr.print());
		}
	}

}
