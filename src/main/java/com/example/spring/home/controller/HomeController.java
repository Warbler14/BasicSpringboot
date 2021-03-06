package com.example.spring.home.controller;

import javax.servlet.Servlet;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	private final static Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping("/")
	public String home() {
		
		logger.debug("request ");
		
		return "home";
	}

	@SuppressWarnings("unused")
	public void test() {
		
		Servlet servlet;
		
	}
}
