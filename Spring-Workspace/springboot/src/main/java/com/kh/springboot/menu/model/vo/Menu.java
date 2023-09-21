package com.kh.springboot.menu.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Menu {

	private int id;//	ID
	private String restaurant;//	RESTAURANT
	private String name;//	NAME
	private int price;//	PRICE
	private MenuType type;// MenuType(직접만든클래스) / TYPE(VARCHAR2) 
	private String taste;//	TASTE
	
	
	
}
