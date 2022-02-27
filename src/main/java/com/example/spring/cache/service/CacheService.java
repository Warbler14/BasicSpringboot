package com.example.spring.cache.service;

import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.example.spring.cache.model.GoodsModel;

@Service
public class CacheService {
	
	public static char[] productCode = { 'S', 'D', 'G' };

	@Cacheable(value = "product")
	public String vendingMachine(char code) {

		String output = "";
		System.out.println(code + " product를 조회합니다 ...");

		// 각 코드에 맞는 결과물 리턴
		if (code == 'S') {
			output = "과자";
		} else if (code == 'D') {
			output = "음료수";
		} else if (code == 'G') {
			output = "껌";
		}

		return output;
	}
	
	@Cacheable(value = "fruit", key="#goodsO.getTag()")
	public String fruitSupplyer(GoodsModel goodsO) {
		
		String output = "";
		System.out.println(" goods 를 조회합니다 ..." + goodsO.toString());
		
		String fruitCode = goodsO.getCode();
		
		if(!StringUtils.hasLength(fruitCode)) {
			return null;
		}
		
		switch(fruitCode) {
		case "per" :
		case "persimmon" :
			output = "감";
			break;
		case "man" :
			output = "귤";
		case "mandarin" :
			output = "귤";
			break;
		case "strawberry" :
			output = "딸기";
			break;
		case "lemon" :
			output = "레몬";
			break;
		case "mango" :
			output = "망";
			break;
		}
		
		return output;
	}
}