package com.example.spring.cache.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Random;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.spring.cache.model.GoodsModel;
import com.example.spring.cache.service.CacheService;
import com.example.spring.response.Result;

@Controller
@RequestMapping("/cache")
public class CacheController {

	@Autowired
	private CacheService casheService;

	private final static Logger logger = LoggerFactory.getLogger(CacheController.class);

	@RequestMapping("/test")
	public @ResponseBody Result<Map<String, String>> test( 
			@RequestHeader Map<String, Object> requestHeader,
			HttpServletRequest reqest) throws IOException {

		Object token = requestHeader.get("token");
		if(token != null) {
			logger.debug("token : " + token.toString());
		}
		

		int randomIndex = new Random().nextInt(CacheService.productCode.length);
		String output = casheService.vendingMachine(CacheService.productCode[randomIndex]);

		Map<String, String> test = new HashMap<String, String>();
		test.put("product", output);

		return new Result<Map<String, String>>(test);
	}
	
	@RequestMapping("/fruit")
	public @ResponseBody Result<Map<String, String>> fruit( 
			@RequestHeader Map<String, Object> requestHeader,
			@ModelAttribute GoodsModel goodsO,
			HttpServletRequest reqest) throws IOException {

		String output = casheService.fruitSupplyer(goodsO);

		Map<String, String> test = new HashMap<String, String>();
		test.put("fruit", output);

		return new Result<Map<String, String>>(test);
	}
}
