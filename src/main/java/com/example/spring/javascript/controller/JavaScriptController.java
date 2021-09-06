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
	
	@RequestMapping("/defaultTime")
	public String defaultTime() {
		logger.debug("in defaultTime");
		
		return SUB_PATH + "defaultTime";
	}
	
	@RequestMapping("/jquery01")
	public String jquery01() {
		logger.debug("in jquery01");
		
		return SUB_PATH + "jquery01";
	}
	
	@RequestMapping("/mementjs")
	public String mementjs() {
		logger.debug("in mementjs");
		
		return SUB_PATH + "mementjs";
	}

}
