package com.kh.chap04_assist.part02_object.run;

import com.kh.chap04_assist.part02_object.model.dao.ObjectDao;

public class Run {

	public static void main(String[] args) {
		//new ObjectDao().fileSave("phone.txt");
		new ObjectDao().fileRead();
	}

}
