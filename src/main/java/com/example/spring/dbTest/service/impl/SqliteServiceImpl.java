package com.example.spring.dbTest.service.impl;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;

import com.example.spring.dbTest.service.SqliteService;


@Service
public class SqliteServiceImpl implements SqliteService {
	private static final Logger logger = LoggerFactory.getLogger(SqliteServiceImpl.class);

	@Override
	public String test() {
		return "connected";
	}

}


