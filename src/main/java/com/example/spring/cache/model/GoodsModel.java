package com.example.spring.cache.model;

import java.io.Serializable;


public class GoodsModel implements Serializable {

	private static final long serialVersionUID = -8803418149571063495L;

	private String name;
	
	private String code;
	
	public GoodsModel() {}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}
	
	public String getTag() {
		String tag = "";
		
		if(code != null && code.length() > 3) {
			Integer asterisk = code.indexOf("*");
			if(asterisk > 0) {
				tag = code.substring(0, 3);
			}
		}
		
		System.out.println("code : " + code + ", tag : " + tag);

		return tag;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("GoodsModel [name=");
		builder.append(name);
		builder.append(", code=");
		builder.append(code);
		builder.append("]");
		return builder.toString();
	}
	
	
}
