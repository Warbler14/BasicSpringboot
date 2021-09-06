package com.example.spring.jstl.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.example.spring.jstl.model.User;
import com.example.spring.jstl.service.JSTLService;

@RestController
@RequestMapping("/jstl")
public class JSTLController {
	
	@SuppressWarnings("unused")
	private final static Logger logger = LoggerFactory.getLogger(JSTLController.class);
	
	private final static String SUB_PATH = "jstl/";
	
	@Autowired
	JSTLService jstlService;
	
	@GetMapping("/test01")
	public ModelAndView test01() {
		ModelAndView mav = new ModelAndView(SUB_PATH + "test01");
		
		List<User> users = jstlService.getAllUsersForJstl();
		
		 mav.addObject("users", users);
		
		return mav;
	}
	

}
