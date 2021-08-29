package com.example.spring.configurer;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.lotus.jewel.data.sqlSession.SqlSessionAdaptor;
import com.lotus.jewel.data.sqlSession.SqlSessionFactoryAdaptor;

/*
 * 메이븐 공부
 * 라이브러리 생성
 * 라이브러리 내장 종속성 설정, 빌드
 * 실
 * 
 * */
@Configuration
public class WebConfig implements WebMvcConfigurer {

	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		
		//classpath:/static
		//classpath:/public
		//classpath:/resources/
		//classpath:/META_INF/resources
		
		registry.addResourceHandler("/static/**")
			.addResourceLocations("classpath:/static/")	// 반드시 '/' 로 끝나야 
			.setCachePeriod(20);	//필수 아님, 캐시 지속시간 (초)
		
		
//		Resource path = new ClassPathResource("config/setting.yml");
		 
		SqlSessionAdaptor sqlSessionAdaptor = new SqlSessionFactoryAdaptor();
		
		
//		 
//		
//		
//		
//		String dbFilePath = "./test.db";
//		
//		File file = new File(dbFilePath);
//		if(file.exists()) {
//			file.delete();
//		}
//		
//		String url = JDBC.PREFIX + dbFilePath;
//		
//		
//		
//		SQLitePreparedStatementAdaptorTest.createTableTest(url);
//		
	}
}