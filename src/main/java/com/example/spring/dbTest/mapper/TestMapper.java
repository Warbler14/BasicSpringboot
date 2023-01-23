package com.example.spring.dbTest.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import example.model.TestModel;


@Mapper
public interface TestMapper {

	public List<TestModel> selectAll();
}
