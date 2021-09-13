package com.example.spring.message.controller;

import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.LocaleResolver;
import org.springframework.web.servlet.ModelAndView;

@RestController
@RequestMapping("/message")
public class MessageController {

	@SuppressWarnings("unused")
	private final static Logger logger = LoggerFactory.getLogger(MessageController.class);

	private final static String SUB_PATH = "message/";

	@Autowired
	MessageSource messageSource;

	@Autowired
	LocaleResolver localeResolver;

	@GetMapping("/i18n")
	public ModelAndView test01(Locale locale, HttpServletRequest request) {
		ModelAndView mav = new ModelAndView(SUB_PATH + "i18n");

		// RequestMapingHandler로 부터 받은 Locale 객체를 출력해 봅니다.
		mav.addObject("clientLocale", locale);

		// localeResolver 로부터 Locale 을 출력해 봅니다.
		mav.addObject("sessionLocale", localeResolver.resolveLocale(request));

		// JSP 페이지에서 EL 을 사용해서 arguments 를 넣을 수 있도록 값을 보낸다.
		mav.addObject("siteCount", messageSource.getMessage("msg.first", null, locale));

		return mav;
	}

}
