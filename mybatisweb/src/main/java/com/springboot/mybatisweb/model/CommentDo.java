package com.springboot.mybatisweb.model;

import java.time.LocalDateTime;

public class CommentDo {

	private int comments_id;
	private int dog_id;
	private String writer;
	private String password;
	private String content;

	private LocalDateTime createdDate;

	public int getComments_id() {
		return comments_id;
	}

	public void setComments_id(int comments_id) {
		this.comments_id = comments_id;
	}

	public int getDog_id() {
		return dog_id;
	}

	public void setDog_id(int dog_id) {
		this.dog_id = dog_id;
	}

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public LocalDateTime getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(LocalDateTime createdDate) {
		this.createdDate = createdDate;
	}

}
