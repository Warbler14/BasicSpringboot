package com.example.spring.configurer;

import java.io.IOException;
import java.io.Reader;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.Lazy;

@Configuration
@Lazy
@MapperScan(basePackages = {"com.example.spring.dbTest.mapper"})
public class MybatisConfig {

	
	@Bean
	public SqlSessionFactory sqlSessionFactory() {
		
		Reader reader = null;
		try {
			String configuration = "mybatis/configuration.xml";
			reader = Resources.getResourceAsReader(configuration);
		} catch (IOException e) {
			e.printStackTrace();
			return null;
		}
		
		SqlSessionFactoryBuilder builder = new SqlSessionFactoryBuilder();
		SqlSessionFactory factory = builder.build(reader);
		return factory;
	}
	
	@Bean
	public SqlSession sqliteSession() {
		return sqlSessionFactory().openSession(true);
	}
}
