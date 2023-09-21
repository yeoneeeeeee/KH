package com.kh.hw.shape.controller;

import com.kh.hw.shape.model.vo.Shape;
import com.kh.hw.shape.view.ShapeView;

public class SquareController {
	private Shape s = new Shape();
	
	public double calcPerimeter(double height, double width) {
//		모양 타입 번호와 받은
//		매개변수를 매개변수 있
//		는 생성자로 초기화 시킨
//		후 둘레 반환
//		둘레: 너비*2 + 높이*2
		s = new Shape(ShapeView.SQUARE , height , width);
		System.out.println(this);
		
		return width*2 + height*2;
	}
	
	public double calcArea(double height, double width) {
		s = new Shape( ShapeView.SQUARE , height , width);
		
		return width * height ;
	}
	
	public void paintColor(String color) {
		s.setColor(color);
	}
	
	public String print() {
		return s.toString();
	}
	
	public void print(String... arg) {
		
	}
	
	
	
	
	
	
	
	
	
}
