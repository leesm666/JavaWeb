package com.springboot.mybatisweb.service;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.springboot.mybatisweb.model.CommentDo;
import com.springboot.mybatisweb.model.DogDo;

@Mapper
public interface DogMapper {

	// 데이터 저장
	void insertBoard(DogDo ddo);

	// 전체 데이터 출력
	ArrayList<DogDo> getAllDogs();

	DogDo getDogsBoard(DogDo ddo);

	void modifyBoard(DogDo ddo);

	void deleteBoard(DogDo ddo);

	ArrayList<DogDo> searchBoardList(String searchCon, String searchKey);

	ArrayList<DogDo> getDogsByCategory(String category);

}
