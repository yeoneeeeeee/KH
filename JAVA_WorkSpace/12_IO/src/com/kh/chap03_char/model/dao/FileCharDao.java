package com.kh.chap03_char.model.dao;

import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;

public class FileCharDao {
	
	
	// 프로그램 --> 외부매체(파일)
	public void fileSave() {
		
		// 파일로 데이터를 2BYTE단위로 "출력"해주는 출력스트림.
		FileWriter fw = null;
		
		
		try {
			fw = new FileWriter("test\\b_char.txt");
			
			fw.write("와! IO 재밌다");
			fw.write('A');
			fw.write(' ');
			
			char[] cArr = {'무','야','호'};
			fw.write(cArr);
			
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				fw.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}
	
	// 프로그램 <-- 외부매체(파일)
	public void fileRead() {
		
		// 파일로부터 2byte단위로 데이터를 입력받는 스트림
		FileReader fr = null;
		
		try {
			fr = new FileReader("test\\b_char.txt");
			
			int value = 0;
			while( (value = fr.read())  != -1 ) {
				System.out.print((char)value);
			}
			
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
}
