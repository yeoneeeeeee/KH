package com.kh.practice.chap02_abstractNInterface.controller;

import com.kh.practice.chap02_abstractNInterface.model.vo.GalaxyNote9;
import com.kh.practice.chap02_abstractNInterface.model.vo.Phone;
import com.kh.practice.chap02_abstractNInterface.model.vo.SmartPhone;
import com.kh.practice.chap02_abstractNInterface.model.vo.V40;

public class PhoneController {
	private String[] result = new String[2];
	
	public String[] method() {
		Phone [] phones = new Phone[2];
		phones[0] = new GalaxyNote9();
		phones[1] = new V40();
		
		int i = 0;
		for(Phone p  : phones) {
			result[i++] = ((SmartPhone) p).printInformation();
		}
		
		return result;
	}
	
	
	
	
	
	
	
	
	
	
}
