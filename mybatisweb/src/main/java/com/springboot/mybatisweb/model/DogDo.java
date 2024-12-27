package com.springboot.mybatisweb.model;

import java.time.LocalDateTime;

import org.springframework.web.multipart.MultipartFile;

public class DogDo {
	private int seq;
	private String category;
	private String title;
	private String location;
	private String name;
	private String breed;
	private String age;
	private String password;
	private String content;
	private MultipartFile uploadimage;
	private String image;

	private LocalDateTime createdDate;

	@Override
	public String toString() {
		return "DogDo [seq=" + seq + ", category=" + category + ", title=" + title + ", location=" + location
				+ ", name=" + name + ", breed=" + breed + ", age=" + age + ", password=" + password + ", content="
				+ content + ", uploadimage=" + uploadimage + ", image=" + image + ", createdDate=" + createdDate + "]";
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getBreed() {
		return breed;
	}

	public void setBreed(String breed) {
		this.breed = breed;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
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

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public MultipartFile getUploadimage() {
		return uploadimage;
	}

	public void setUploadimage(MultipartFile uploadimage) {
		this.uploadimage = uploadimage;
	}

	public LocalDateTime getCreatedDate() {
		return createdDate;
	}

	public void setCreatedDate(LocalDateTime createdDate) {
		this.createdDate = createdDate;
	}

}
