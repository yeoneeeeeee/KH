package com.kh.chap04_assist.part01_buffered.model.dao;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class BufferedDao {
	
	// BufferedReader / BufferedWriter
	
	// 프로그램 -> 파일
	public void fileSave() {
		// 1. 기반스트림 객체 먼저 생성(FileWriter)
		// 보조스트림도 Reader/Writer 계열이면 기반스트롬도 Reader / Writer 계열이여야함.
		// 보조스트림도 Input/Output 계열이면 기반스트롬도 Input/ Output계열이여야함.
		
		BufferedWriter bw = null;
		
		try {
			//FileWriter fw = new FileWriter("c_buffer.txt");
			bw = new BufferedWriter(new FileWriter("c_buffer.txt"));
			
			bw.write("안녕하세요");
			bw.newLine(); // 개행을 넣어주는 메서드
			bw.write("반갑다\n");
			bw.write("수고하셨어요.");
			
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				bw.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		// try ~ with ~ resource구문 (jdk 7 버전 이상부터만 가능)
		/*
		 * try(스트림객체 생성;){
		 *   // 예외가 발생될법한구문
		 * }catch(예외클래스명 e){
		 *  // 예외 발생시 실행할 구문
		 * }
		 * 
		 * 스트림객체를 try(여기) 안에 넣어버리면 스트림 객체 생성 후 해당 블록구문이 실행 완료된 후,
		 * 알아서 자원이 반납됨.
		 * 
		 * 
		 * 
		 */
	}
	// 프로그램 <-- 외부매체
	public void fileRead() {
		
		// FileReader
		// BufferedReader
		
		try(BufferedReader br = new BufferedReader( new FileReader("c_buffer.txt")     )){
			
			String value = null;
			while( (value = br.readLine()) != null ) {
				System.out.println(value);
			}
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
}
