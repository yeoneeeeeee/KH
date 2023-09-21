package com.kh.chap01_poly.part02_electronic.controller;

import com.kh.chap01_poly.part02_electronic.model.vo.Electronic;

//다형성을 적용시켰을때.
public class ElectronicController2 {
	
	private Electronic[] elec = new Electronic[3];
	
	// insert를 어느위치에하느냐?
	
	public void insert(Electronic any, int index) {
		elec[index] = any;
	}
	
	public Electronic select(int index) {
		return elec[index];
	}
	
	public Electronic[] select() {
		return elec;
	}
	
	
	
	
	
	
}
