package com.kh.hw.person.view;

import java.util.Scanner;

import com.kh.hw.person.controller.PersonController;
import com.kh.hw.person.model.vo.Student;

public class PersonMenu {
	private Scanner sc = new Scanner(System.in);
	private PersonController pc = new PersonController();
	
	public void mainMenu() {
		while(true) {
			int personCount[] = pc.personCount();
			System.out.println("학생은 최대 3명까지 저장할 수 있습니다.");
			System.out.println("현재 저장된 학생은 "+personCount[0]+"명입니다.");
			System.out.println("사원은 최대 10명까지 저장할 수 있습니다.");
			System.out.println("현재 저장된 사원은 "+personCount[1]+"명입니다.");
			System.out.println("1. 학생 메뉴");
			System.out.println("2. 사원 메뉴");
			System.out.println("9. 끝내기");
			System.out.print("메뉴 번호 :");
			int num = Integer.parseInt(sc.nextLine());
			
			switch(num) {
			case 1: studentMenu(); break;
			case 2: employeeMenu(); break;
			case 9: System.out.println("프로그램을 종료합니다."); return;
			default: System.out.println("잘못입력했습니다. 다시입력해주세요");
			}
		}
	}
	
	public void studentMenu() {
		while(true) {
			int [] personCount = pc.personCount();
			if(personCount[0] == 3) {
				System.out.println("학생을 담을 수 있는 공간이 꽉 찼기 때문에 학생 추가 메뉴는 더 이상 활성화 되지 않습니다.”");
			}else {
				System.out.println("1. 학생 추가 ");
			}
			System.out.println("2. 학생 보기 ");
			System.out.println("9. 메인으로");
			System.out.print("메뉴 번호 : ");
			int num = Integer.parseInt(sc.nextLine());
			
			switch(num) {
			case 2: printStudent(); break;
			case 9: System.out.println("메인으로 돌아갑니다.");return;
			case 1: 
				if(personCount[0] < 3) {
					insertStudent(); 
					break;
				}
			default: System.out.println("잘못 입력하셧씁니다. 다시 입력해주세요.");
			}
		}
	}
	
	public void employeeMenu() {
		while(true) {
			int [] personCount = pc.personCount();
			if(personCount[1] == 10) {
				System.out.println("사원을 담을 수 있는 공간이 꽉 찼기 때문에 학생 추가 메뉴는 더 이상 활성화 되지 않습니다.”");
			}else {
				System.out.println("1. 사원 추가 ");
			}
			System.out.println("2. 사원 보기 ");
			System.out.println("9. 메인으로");
			System.out.print("메뉴 번호 : ");
			int num = Integer.parseInt(sc.nextLine());
			
			switch(num) {
			case 2: printEmployee(); break;
			case 9: System.out.println("메인으로 돌아갑니다.");return;
			case 1: 
				if(personCount[1] < 10) {
					insertEmployee(); 
					break;
				}
			default: System.out.println("잘못 입력하셧씁니다. 다시 입력해주세요.");
			}
		}
	}
	
	public void insertStudent() {
		System.out.print("학생 이름 :");
		String name = sc.nextLine();
		
		System.out.print("학생 나이 :");
		int age = Integer.parseInt(sc.nextLine());
		
		System.out.print("학생 키 :");
		double height = Double.parseDouble(sc.nextLine());
		
		System.out.print("학생 몸무게 : ");
		double weight = Double.parseDouble(sc.nextLine()); 
		
		System.out.print("학생 학년 : ");
		int grade = Integer.parseInt(sc.nextLine());
		
		System.out.print("학생 전공 :");
		String major = sc.nextLine();
		
		pc.insertStudent(name, age, height, weight, grade, major);
		
		int [] personCount = pc.personCount();
		if(personCount[0] < 3) {
			
			System.out.print("그만하시려면 N(또는 n), 이어하시려면 아무 키나 누르세요 :");
			char ch = sc.nextLine().toUpperCase().charAt(0);
			
			if(ch == 'N') {
				// 데이터받기 종료
				return;
			}else{
				insertStudent();
				// 데이터 계속 받기
			}
		} else if(personCount[0] == 3) {
			System.out.println("학생을 담을 수 있는 공간이 꽉 찼기 때문에 학생 추가를 종료하고 학생 메뉴로 돌아갑니다");
			return;
		}
	}
	
	public void printStudent() {	
		Student[] s = pc.printStudent();
		for( Student student : s ) {
			if(student != null) {
				System.out.println(student);
			}
		}
	}

	public void insertEmployee() {
//		사원 이름 :
//			사원 나이 :
//			사원 키 :
//			사원 몸무게 : 
//			사원 급여 : 
//			사원 부서 :
			// 위의 데이터를 모두 사용자에게 입력 받아 pc의 insertEmployee()메소드의
			// 매개변수로 넘겨 줌
			// 이 때 사원 객체 배열에 담긴 데이터의 수가 10개가 되지 않았을 때는
			// “그만하시려면 N(또는 n), 이어하시려면 아무 키나 누르세요 : “를 출력해
			// N 또는 n이 아니면 위의 데이터를 받는 것을 반복하고
			// N 또는 n이라면 반복을 멈춤
			// 만일 사원 객체 배열에 담긴 데이터의 수가 10이 되었을 때는
			// “사원을 담을 수 있는 공간이 꽉 찼기 때문에 사원 추가를 종료하고
			// 사원 메뉴로 돌아갑니다.”를 출력 후 반복 종료
	}
	
	public void printEmployee() {
		// pc의 printEmployee() 메소드의 반환 값을 이용하여 사원 객체 배열에 저장된
		// 모든 데이터 출
	}

	
	
	
	
	
}
