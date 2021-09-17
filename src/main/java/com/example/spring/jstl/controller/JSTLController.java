package com.example.spring.jstl.controller;

import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.StringTokenizer;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.method.HandlerMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.method.RequestMappingInfo;
import org.springframework.web.servlet.mvc.method.annotation.RequestMappingHandlerMapping;

import com.example.spring.jstl.model.User;
import com.example.spring.jstl.service.JSTLService;

@RestController
@RequestMapping("/jstl")
public class JSTLController {
	
	@SuppressWarnings("unused")
	private final static Logger logger = LoggerFactory.getLogger(JSTLController.class);
	
	private final static String SUB_PATH = "jstl/";
	
	@Autowired
	JSTLService jstlService;
	
	@Autowired
	private RequestMappingHandlerMapping requestMappingHandlerMapping;
	
	@GetMapping("")
	public ModelAndView list() {
		ModelAndView mav = new ModelAndView(SUB_PATH + "list");
		
		Map<RequestMappingInfo, HandlerMethod> map = requestMappingHandlerMapping.getHandlerMethods();
		for (Entry<RequestMappingInfo, HandlerMethod> elem : map.entrySet()) {
			logger.debug(
					elem.getKey().getPatternsCondition().getPatterns().toArray()[0]
					+ ", " + elem.getValue().getMethod().getDeclaringClass().getSimpleName()
					+ ", " + elem.getValue().getMethod().getName() 
					+ ", " + elem.getValue().getMethod().getReturnType().getSimpleName()
					);
		}
		
		//https://since.tistory.com/23
		return mav;
	}
	
	@GetMapping("/formattingTags")
	public ModelAndView formattingTags() {
		ModelAndView mav = new ModelAndView(SUB_PATH + "formattingTags");
		
		
		return mav;
	}

	@GetMapping("/functions")
	public ModelAndView functions() {
		ModelAndView mav = new ModelAndView(SUB_PATH + "functions");
		
		
		return mav;
	}

	@GetMapping("/sqlTags")
	public ModelAndView sqlTags(HttpServletRequest request) {
		ModelAndView mav = new ModelAndView(SUB_PATH + "sqlTags");
		
//		String header=request.getHeader("X-Forwarded-For");
//		String ipAddress=new StringTokenizer(header, ",").nextToken().trim();
		
		
		
		String ipAddress = jstlService.getClientIP(request);
		
		mav.addObject("ipAddress", ipAddress);
		
		return mav;
	}

	@GetMapping("/xmlTags")
	public ModelAndView xmlTags() {
		ModelAndView mav = new ModelAndView(SUB_PATH + "xmlTags");
		
		
		return mav;
	}

	@GetMapping("/coreTags")
	public ModelAndView coreTags() {
		ModelAndView mav = new ModelAndView(SUB_PATH + "coreTags");
		
		List<User> users = jstlService.getAllUsersForJstl();
		
		mav.addObject("users", users);
		
		return mav;
	}
	
	@GetMapping("/coreTags-1")
	public ModelAndView coreTags(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView(SUB_PATH + "coreTags-1");
		
		HttpSession session = req.getSession();
		
		Boolean result = (boolean)session.getAttribute("code");
		logger.debug("session result : " + result);
		
		mav.addObject("sessionResult", result);
		
		return mav;
	}
	
	@GetMapping("/importPage")
	public ModelAndView importPage(HttpServletRequest req) {
		ModelAndView mav = new ModelAndView(SUB_PATH + "importPage");
		
		String id = req.getParameter("id");
		logger.debug("id : " + id);
		
		return mav;
	}

}
