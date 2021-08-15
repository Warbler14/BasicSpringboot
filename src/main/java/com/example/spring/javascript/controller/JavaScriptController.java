package com.example.spring.javascript.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/javascript")
public class JavaScriptController {
	
	private final static Logger logger = LoggerFactory.getLogger(JavaScriptController.class);
	
	private final static String SUB_PATH = "javascript/";
	
	@RequestMapping("/test01")
	public String test01() {
		logger.debug("in test01");
		
		return SUB_PATH + "test01";
	}
	
	@RequestMapping("/test02")
	public String test02() {
		logger.debug("in test02");
		
		return SUB_PATH + "test02";
	}

}
