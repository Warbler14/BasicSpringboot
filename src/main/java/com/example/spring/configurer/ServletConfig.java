package com.example.spring.configurer;

import org.springframework.boot.web.servlet.ServletRegistrationBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

import com.lotus.jewel.ci.servlet.BasicHttpServlet;

@Configuration
public class ServletConfig {
	
	@Bean
	public ServletRegistrationBean<BasicHttpServlet> getServletRegistrationBean() {
		
		ServletRegistrationBean<BasicHttpServlet> registrationBean 
			= new ServletRegistrationBean<BasicHttpServlet>(new BasicHttpServlet());
		registrationBean.addUrlMappings("/BasicHttpServlet/*");
		registrationBean.addInitParameter("isAbsolutePAth", "true");
		registrationBean.setLoadOnStartup(1);
		
		return registrationBean;
	}

}
