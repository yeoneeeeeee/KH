package com.kh.chap03_char.run;

import com.kh.chap03_char.model.dao.FileCharDao;

public class Run {

	public static void main(String[] args) {
		/*
		 * 문자 기반 스트림
		 * 
		 * 외부매체를 지정하고 그 외부매체와 직접적으로 연결되는 2byte단위의 통로를 만들어주는 스트림
		 * 
		 * xxxReader / xxxWriter
		 * 
		 */
		FileCharDao fcd = new FileCharDao();
		//fcd.fileSave();
		fcd.fileRead();
		String [] arr2 = new String[11];
		System.out.println(arr2);
	}

	
	
	
	
	
	
	
}
