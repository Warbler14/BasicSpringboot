package com.example.spring.dbTest.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.spring.dbTest.service.SqliteService;

@Controller
@RequestMapping(value = "/sqlite")
public class SqliteController {
	
	private final static Logger logger = LoggerFactory.getLogger(SqliteController.class);
	
	@Autowired
	private SqliteService sqliteService;
	
	@ResponseBody
	@RequestMapping(value = "/test", method = RequestMethod.GET)
	public Map<String, Object> test(Model model, HttpServletRequest request) {
		Map<String, Object> outerMap = new HashMap<String, Object>();
		
		outerMap.put("message", sqliteService.test());
		
		
		return outerMap;
	}

}
