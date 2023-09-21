package com.kh.hw.shape.controller;

import com.kh.hw.shape.model.vo.Shape;
import com.kh.hw.shape.view.ShapeView;

public class TriangleController {
	private Shape s = new Shape();

	public double calcArea(double height, double width) {
		// 매개변수로 넘어온 값을 Shape의 매개변수 있는 생성자에 넣어
		// Shape의 필드들 초기화하고 면적 계산법을 통해 계산된 값 반환
		s = new Shape( ShapeView.TRIANGLE , height , width);
		
		return width * height / 2;
	}

	public void paintColor(String color) {
		s.setColor(color);
	}

	public String print() {
//		어떤 모양인지와 Shape
//		의 toString()메소드의
//		반환 값 합쳐 함께 반환
		return s.toString();
	}
}
