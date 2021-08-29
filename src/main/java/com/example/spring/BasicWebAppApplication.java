package com.example.spring;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.autoconfigure.jdbc.DataSourceTransactionManagerAutoConfiguration;


@EnableAutoConfiguration(exclude = { DataSourceTransactionManagerAutoConfiguration.class, DataSourceAutoConfiguration.class })
@SpringBootApplication
public class BasicWebAppApplication {

	public static void main(String[] args) {
		SpringApplication.run(BasicWebAppApplication.class, args);
	}

}