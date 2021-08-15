package com.example.spring.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.autoconfigure.web.ResourceProperties;
import org.springframework.core.io.support.ResourcePropertiesPersister;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	private final static Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@RequestMapping("/")
	public String home() {
		
		logger.debug("request ");
		
		
		ResourcePropertiesPersister resourcePropertiesPersister;
		ResourceProperties resourceProperties;
		
		return "home";
	}

}
