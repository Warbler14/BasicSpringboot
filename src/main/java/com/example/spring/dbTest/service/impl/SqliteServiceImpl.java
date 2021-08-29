package com.example.spring.dbTest.service.impl;

import java.io.File;
import java.util.Date;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.sqlite.JDBC;

import com.example.spring.dbTest.mapper.TestMapper;
import com.example.spring.dbTest.service.SqliteService;
import com.lotus.jewel.data.sqlSession.SqlSessionAdaptor;
import com.lotus.jewel.data.sqlSession.SqlSessionFactoryAdaptor;

import test.SQLitePreparedStatementAdaptorTest;
import test.model.TestModel;


@Service
public class SqliteServiceImpl implements SqliteService {
	private static final Logger logger = LoggerFactory.getLogger(SqliteServiceImpl.class);

	@Autowired
	private SqlSession sqliteSession;
	
	@Autowired
	private TestMapper testMapper;
	
	@Override
	public String getTestMessage() {
		return "Hello World " + new Date();
	}
	
	@Override
	public String getAllByPreparedStatement() throws Exception {
		
		try {
			Class.forName("org.sqlite.JDBC");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		String dbFilePath = "/Users/kook/workspaces/webserver/data/test.db";
		
		File file = new File(dbFilePath);
		if(file.exists()) {
			//file.delete();
		} else {
			throw new Exception("db file " + dbFilePath + " not found");
		}
		
		String url = JDBC.PREFIX + dbFilePath;
		
		try {
			String result = SQLitePreparedStatementAdaptorTest.getTable(url, "select * from test");
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public List<TestModel> getAll() throws Exception {
		
		SqlSessionAdaptor sqlSessionAdaptor = new SqlSessionFactoryAdaptor();
		SqlSession session = sqlSessionAdaptor.getSqlSession("mybatis/configuration.xml");
		
		List<TestModel> resultList = session.selectList("com.example.spring.dbTest.mapper.TestMapper.selectAll");
		
		
		return resultList;
	}

	@Override
	public List<TestModel> getAllByMapperInterface() throws Exception {
		
		SqlSessionAdaptor sqlSessionAdaptor = new SqlSessionFactoryAdaptor();
		SqlSession session = sqlSessionAdaptor.getSqlSession("mybatis/configuration.xml");
		
		
		TestMapper testMapper = session.getMapper(TestMapper.class);
		
		
		List<TestModel> resultList = testMapper.selectAll();
		return resultList;
	}
	
	@Override
	public List<TestModel> getAllBySqlSessionBean() throws Exception {
		TestMapper testMapper = sqliteSession.getMapper(TestMapper.class);
		List<TestModel> resultList = testMapper.selectAll();
		return resultList;
	}

	@Override
	public List<TestModel> getAllByMapperBean() throws Exception {
		List<TestModel> resultList = testMapper.selectAll();
		return resultList;
	}
}


