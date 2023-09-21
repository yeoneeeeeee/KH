package com.kh.chap01_file.run;

import java.io.File;
import java.io.IOException;

public class FileRun {

	public static void main(String[] args) {
		
		// 간단하게 파일을 만드는 과정 및 메소드 실습
		// java.io.File클래스를 가지고 작업
		
		try {
			// 1. 별도의 경로를 지정하지 않고 파일명만 제시해서 파일생성해보기 -> 생성위치는 현재 프로젝트내
			File file1 = new File("test.txt");
			file1.createNewFile();
			
			// 2. 경로 지정을 한 파일명을 제시해서 생성하기=> 단, 존재하는 경로로 제시해야한다.(절대경로)
//			File file2 = new File("C:\\aaa\\test.txt");
//			file2.createNewFile();
			
			// 3. 폴더를 생성하고 나서 그 안에 파일을생성하는 방법
			File folder = new File("C:\\aaa");
			folder.mkdir();// mk -> make , dir ->directory
			
			File file2 = new File("C:\\aaa\\test.txt");
			file2.createNewFile();
			
			// 4. 별도의 경로 지정 없이 폴더 생성 후 파일 생성하기 => 프로젝트 폴더 내에 생성됨
			File file = new File("test\\person.txt");
			file.createNewFile();
			
			//file.delete(); 파일삭제
			
			// File 에서 제공하는 메소드들.
			System.out.println(folder.isFile());// 파일인지, 폴더인지:: 폴더이므로 false
			System.out.println(file.isFile()); // 파일이므로 true
			
			System.out.println("파일명 : "+file.getName());
			System.out.println("상위폴더 : "+file.getParent());
			System.out.println("파일용량 : "+file.length());
			System.out.println("절대경로 : "+file.getAbsolutePath());
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	/*
	 * 프로그램상의 데이터를 외부매체(모니터, 스피커, "파일" )로 출력하거나 입력장치(키보드, 마우스, "파일")로 입력받는
	 * 과정을 진행 하고자 한다면 반드시! 프로그램과 외부매체와의 "통로"를 만들어야 한다. == 통로를 "스트림"이라고 부름.
	 * 
	 * 스트림의 특징
	 * - 단방향 : 입력이면 입력만, 출력이면 출력만 존재함.
	 *           즉, 동시에 입출력을 하고자 한다면 하나의 스트림으로는 안된다.
	 *           
	 * - 선입선출(FIFO) : 먼저 전달한 값이 먼저 나오게 된다.
	 * - 시간지연 문제가 발생할 수 있다.
	 * 
	 * 스트림의 구분
	 * - 통로의 사이즈 :
	 *바이트 스트림 : 1BYTE짜리가 이동할 수 있을 정도의 사이즈(좁은 통로) => 입력(xxxInputStream) / 출력(xxxOutputStream)
	 *문자 스트림 : 2BYTE짜리가 이돌할수 일을 정도의사이즈(큰 통로) => 입력(XXXReader)/ 출력(xxxWriter)
	 *
	 *- 외부매체와의 직접적인 연결 여부
	 * 기반스트림 : 외부매체와 직접적으로 연결되는 통로
	 * 보조스트림 : 기반스트림만으로 부족한 성능을 향상시켜주는 용도의 스트림(외부매체와 직접연결 x) => 단독 사용 불가
	 *            (속도향상, 자료형변환, 객체단위 입출력 ...)
	 *            단, 보조스트림은 단독으로 사용이 안된다. 외부매체와 직접 연결되는 기반스트림이 필수다.
	 * 
	 */
	
	
	
	
	
	
	
	
	
	
	
}
