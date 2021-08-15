package com.example.spring;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
//import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
//@ComponentScan
public class BasicWebAppApplication {

	public static void main(String[] args) {
		SpringApplication.run(BasicWebAppApplication.class, args);
	}

}