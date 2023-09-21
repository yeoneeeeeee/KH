package com.kh.chap02_byte.model.dao;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;

// DAO(Data Access Object) : 데이터가 보관되어 있는 공간과 직접 접근해서 데이터를 입,출력하는 클래스 
public class FileByteDao {

	// 프로그램 --> 외부매체(파일)
	// 출력 : 프로그램 내의 데이터를 파일로 내보내기(즉, 파일에 기록하겠다.)
	
	public void fileSave() {
		
		// FileOutputStream : "파일"로 데이터를 1 byte단위로 출력하는 스트림
		
		FileOutputStream fos = null; // 변수 선언 및 null 로 초기화
		try {
			//1. FileOutputStream 객체 생성 => 매개변수로 지정한 파일과 직접 연결되는 통로를 만들겠다.
			//   해당 파일이 존재하지 않으면 해당 파일이 "생성"되면서 통로가 연결됨
			//            존재하는 파일이면 그냥 통로 연결
			//   두번째 매개변수에 true 작성시 => 기존에 해당 파일이 있을경우 이어서 작성함. 
			//                 true 미작성시 or 명시적 false작성시 => 항상 덮어씌워진다.
			//fos = new FileOutputStream("a_byte.txt"); // 객체 생성 => 덮어쓰기
			fos = new FileOutputStream("a_byte.txt",true ); // 객체 생성 => 이어쓰기
			
			// 2. 연결통로로 데이터를 출력 : write() 메소드 사용
			//    1byte 범위 : -128 ~ 127 까지의 숫자(단, 파일에 기록되기를 해당 숫자의 고유한 '문자'가 기록됨)
			//                음수는 작성->아스키 코드표에 음수가 존재하지 않음. 0 ~ 127까지의 숫자만 기록가능
			fos.write(97);
			fos.write('b');
			fos.write('민');// 한글은 2byte이기 때문에 깨져서 저장
			
			byte[] bArr = {99,100,101};
			fos.write(bArr);
			
			fos.write(bArr,1,2);
			
			// 3. 스트림을 다 이용했으면 자원 반납해주기(반드시)
			//fos.close(); // 위에서 혹시 예외가 발생했을경우 실행이 안될수 있음.
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally { // 어떤 예외가 발생하든간에 반드시 실행할 구문을 작성하는 블럭(항상실행됨)
			try {
				fos.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
	
	// 프로그램 <-- 외부매채(파일)
	// 입력 : 파일로부터 데이터를 가지고 오겠다.
	public void fileRead() {
		
		// FileInputStream : 파일로부터 데이터를 1 바이트단위로 입력받는 스트림.
		
		FileInputStream fis = null;
		
		try {
			// 1. 객체생성 : 파일과 연결되는 스트림을 열겠다.
			fis = new FileInputStream("a_byte.txt"); // 반드시 존재하는 파일로 제시할것. 
			
			// 2. 통로를 통해 데이터 입력받기 read() 사용.
			// 단 1byte단위로만 하나씩 읽어옴.
			
//			System.out.println(fis.read());
//			System.out.println(fis.read());
//			System.out.println(fis.read());
//			System.out.println(fis.read());
//			System.out.println(fis.read());
//			System.out.println(fis.read());
//			System.out.println(fis.read());
//			System.out.println(fis.read());
//			System.out.println(fis.read()); // 파일 끝을 만나는 순간 read함수는 -1을 반환.
//			System.out.println(fis.read());
//			System.out.println(fis.read());
//			System.out.println(fis.read());
			
			// 콘솔창에 파일의 첫글자부터 마지막글짜까지 출력해보기.
			int value = 0;
			while( (value = fis.read()) != -1 ) {
				System.out.print((char)value);
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			
			try {
				fis.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
