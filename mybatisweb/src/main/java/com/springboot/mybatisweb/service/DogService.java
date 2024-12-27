package com.springboot.mybatisweb.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.mybatisweb.model.DogDo;

@Service("dogService")
public class DogService {

	@Autowired
	private DogMapper dMapper;

	public void insertBoard(DogDo ddo) {
		dMapper.insertBoard(ddo);
	}

	public ArrayList<DogDo> getAllDogs() {
		return dMapper.getAllDogs();
	}

	public DogDo getDogsBoard(DogDo ddo) {
		return dMapper.getDogsBoard(ddo);
	}

	public void modifyBoard(DogDo ddo) {
		dMapper.modifyBoard(ddo);
	}

	public void deleteBoard(DogDo ddo) {
		dMapper.deleteBoard(ddo);
	}

	public ArrayList<DogDo> searchBoardList(String searchCon, String searchKey) {
		return dMapper.searchBoardList(searchCon, searchKey);
	}

	public ArrayList<DogDo> getDogsByCategory(String category) {
		return dMapper.getDogsByCategory(category);
	}

}
