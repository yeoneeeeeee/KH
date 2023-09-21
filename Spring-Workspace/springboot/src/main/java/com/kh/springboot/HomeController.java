package com.kh.springboot;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class HomeController {
	
	@GetMapping("/")
	public String home() {
		log.info("/home 요청2!");
		return "forward:index.jsp";
	}

}
