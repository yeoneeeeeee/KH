package com.kh.practice.file.controller;

import com.kh.practice.file.model.dao.FileDaAO;

public class FileController {

	private FileDaAO fd = new FileDaAO();
	
	public boolean checkName(String file) {
		return fd.checkName(file);
	}
	
	public void fileSave(String file, StringBuilder sb) {
		fd.fileSave(file, sb.toString());
	}
	
	public StringBuilder fileOpen(String file) {
		return fd.fileOpen(file);
	}
	
	public void fileEdit(String file, StringBuilder sb) {
		fd.fileEdit(file, sb.toString());
	}
}
