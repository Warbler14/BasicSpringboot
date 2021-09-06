package com.example.spring.dbTest.service;

import java.util.List;

import org.springframework.stereotype.Service;

import test.model.TestModel;

@Service
public interface SqliteService {
	
	public String getTestMessage();
	
	public String getAllByPreparedStatement() throws Exception;

	public List<TestModel> getAllBySession() throws Exception;
	
	public List<TestModel> getAllByMapperInterface() throws Exception;
	
	public List<TestModel> getAllBySqlSessionBean() throws Exception;
	
	public List<TestModel> getAllByMapperBean() throws Exception;
}
