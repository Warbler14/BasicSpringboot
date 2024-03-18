package com.example.spring.configurer;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import java.net.URLClassLoader;
import java.net.URLStreamHandler;
import java.util.ArrayList;
import java.util.List;
import java.io.File;
import java.net.URL;

/*
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
		
		
		
		FileClassLoader fileClassloader = new FileClassLoader();
	
		String classPath = "/Users/kook/workspaces/javawork/union/simple/target/";
		
		try {
			List<Class<?>> classList = fileClassloader.getClass(classPath, new String[]{"com.lotus.jewel.simple.model.TestModel"});
			for(Class<?> clazz : classList) {
				System.out.println(">>" + clazz.getName());
				Object obj = clazz.newInstance();
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
	
	public static class FileClassLoader {
		
		public List<Class<?>> getClass(String classPath, String[] classNames) throws Exception {
			List<Class<?>> out = new ArrayList<Class<?>>();
			
			List<URL> urls = new ArrayList<URL>();
			URLStreamHandler urlStreamHandler = null;
			File classPathFile = new File(classPath);
			
			urls.add(new URL(null, "file:" + classPathFile.getCanonicalPath() + File.separator, urlStreamHandler));
			
			File[] files = classPathFile.listFiles();
			for(File file : files) {
				if(file.isFile() && file.getName().endsWith(".jar")) {
					urls.add(new URL(null, "file:" + file.getCanonicalPath(), urlStreamHandler));					
				}
			}
			
			URLClassLoader urlLoader = new URLClassLoader((URL[])urls.toArray(new URL[urls.size()]));
			for(String className : classNames) {
				Class<?> clazz = urlLoader.loadClass(className);
				//Class<?> clazz = Class.forName(className, true, urlLoader); 
				out.add(clazz);
			}
			
			if (urlLoader != null) {
				urlLoader.close();
			}
			
			return out;
		}
	}
	
}