package com.springboot.mybatisweb.service;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.springboot.mybatisweb.model.CommentDo;

@Mapper
public interface CommentMapper {

	// 데이터 저장
	void insertComment(CommentDo cdo);

	// 전체 데이터 출력
	ArrayList<CommentDo> getCommentList(int seq);

	void deleteComment(CommentDo cdo);

	CommentDo getCommentInfo(int comments_id);

//	ArrayList<BoardDo> searchBoardList(String searchCon, String searchKey);

}
