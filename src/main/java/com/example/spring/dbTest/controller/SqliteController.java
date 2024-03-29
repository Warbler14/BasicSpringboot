package com.example.spring.dbTest.controller;

import java.util.HashMap;
import java.util.List;
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

import example.model.TestModel;

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
		
		outerMap.put("message", sqliteService.getTestMessage());
		
		try {
			logger.debug("test for preparedStatement");
			String resultByPreparedStatement = sqliteService.getAllByPreparedStatement();
			outerMap.put("preparedStatement", resultByPreparedStatement);

			logger.debug("test for SqlSession");
			List<TestModel> resultList1 = sqliteService.getAllBySession();
			outerMap.put("list by session", resultList1);
			
			logger.debug("test for Mapper interface");
			List<TestModel> resultList2 = sqliteService.getAllByMapperInterface();
			outerMap.put("list by interface", resultList2);
			
			logger.debug("test for sqlite session bean");
			List<TestModel> resultList3 = sqliteService.getAllBySqlSessionBean();
			outerMap.put("list by autowired sessionBean", resultList3);
			
			logger.debug("test for mybatis interface");
			List<TestModel> resultList4 = sqliteService.getAllByMapperBean();
			outerMap.put("list by mapper", resultList4);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return outerMap;
	}

}
