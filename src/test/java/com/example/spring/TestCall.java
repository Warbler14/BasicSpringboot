package com.example.spring;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Random;

public class TestCall {

	public static void main(String [] args) {
		
		long seed = System.currentTimeMillis();
		Random rand = new Random(seed);
		
		try {
			while(true) {
				getJson();
				
				Thread.sleep(rand.nextInt(10000) + 2000);				
			}

		} catch (Exception e) {
			
		}
	}
	
	public static void getJson() {
		try {
			URL url= new URL("https://insungkook-eertj.run.goorm.site/date1/assets/css/app.css");
			HttpURLConnection conn = (HttpURLConnection)url.openConnection();
			
			conn.setRequestMethod("GET"); // http 메서드
			conn.setRequestProperty("Content-Type", "application/json"); // header Content-Type 정보
			conn.setRequestProperty("auth", "myAuth"); // header의 auth 정보
			conn.setDoOutput(true); // 서버로부터 받는 값이 있다면 true
			
			// 서버로부터 데이터 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			StringBuilder sb = new StringBuilder();
			String line = null;
			
			while((line = br.readLine()) != null) { // 읽을 수 있을 때 까지 반복
				sb.append(line);
			}
			
			System.out.println(sb.toString());
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
