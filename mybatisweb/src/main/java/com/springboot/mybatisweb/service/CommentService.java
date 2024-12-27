package com.springboot.mybatisweb.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.springboot.mybatisweb.model.CommentDo;
import com.springboot.mybatisweb.model.DogDo;

@Service("commentService")
public class CommentService {

	@Autowired
	private CommentMapper cMapper;

	// 데이터 저장
	public void insertComment(CommentDo cdo) {
		cMapper.insertComment(cdo);
	}

	// 전체 데이터 출력
	public ArrayList<CommentDo> getCommentList(int seq) {
		return cMapper.getCommentList(seq);
	}

	public void deleteComment(CommentDo cdo) {
		cMapper.deleteComment(cdo);
	}

	public CommentDo getCommentInfo(int comments_id) {
		return cMapper.getCommentInfo(comments_id);

	}

}
