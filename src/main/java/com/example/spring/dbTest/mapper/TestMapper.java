package com.example.spring.dbTest.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import test.model.TestModel;


@Mapper
public interface TestMapper {

	public List<TestModel> selectAll();
}
