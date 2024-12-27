<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<!--css-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	
	<!--js-->
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" 
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<title>Document</title>
	
	<style>
		.my-container{
			max-width:1200px;
			margin-top: 40px;
			padding: 32px;
			background-color:#fff;
			border-radius: 10px;
			box-shadow: 0 8px 20px 0 rgba(0,105,0,0.5);
		}
		.qa-container {
		    padding: 5px;
		    border-radius: 8px;
		    background: #fff;
		    max-width: 1200px;
			transition: background-color 0.3s ease;
			background-color: #fff;
		}
		.qa-header {
		    display: flex;
		    align-items: center;
		    margin-bottom: 5px;
		}
		.qa-tags {
		    display: flex;
		    gap: 10px;
		    margin-left: 15px;
		}
		.tag {
		    padding: 5px 10px;
		    border-radius: 15px;
		    font-size: 14px;
		}
		.tag.yellow {
		    background: #FFF9C4;
		}
		.tag.green {
		    background: #E8F5E9;
		}
		.qa-content-wrapper {
		    display: flex;
		    gap: 20px;
		}
		.qa-content {
		    flex: 1;
		}
		.qa-question {
		    margin-top: 0;
		    margin-bottom: 10px;
			font-size: 20px;
		}
		.qa-description {
		    display: -webkit-box;
		    -webkit-box-orient: vertical;
		    -webkit-line-clamp: 1;
		    overflow: hidden;
		    text-overflow: ellipsis;
		    line-height: 1.5;
		    margin-bottom: 15px;
			max-width: 1200px;
		}
		.qa-info {
		    display: flex;
		    gap: 15px;
		    color: #666;
		    font-size: 14px;
		}
		textarea {
		    width: 100%;
		    height: 200px;
		    padding: 12px;
		    border: 2px solid #4CAF50;
		    border-radius: 5px;
		    resize: vertical;
		    font-size: 16px;
		    font-family: Arial, sans-serif;
		    background-color: #f9f9f9;
		    line-height: 1.5;
		    box-sizing: border-box;
		}
	</style>
</head>
<body>
	<div class="container my-container">
	  <!--제목-->
	  <p class="fs-2 text-center"> 게시판 등록 </p>
	  <form action="insertBoardProc.do"  method="post" enctype="multipart/form-data">
	  	  <div class="mb-3">
			<select class="form-select" id="categorySelect" name="category" required>
			   <option value="" selected disabled>카테고리를 선택하세요</option>
			   <option value="산책 친구 찾기">산책 친구 찾기</option>
			   <option value="정보 게시판">정보 게시판</option>
			   <option value="질문 게시판">질문 게시판</option>
			   <option value="사진 자랑">사진 자랑</option>
			   <option value="기타">기타</option>
			 </select>
	  	  </div>
		  
		  <div class="input-group input-group-sm mb-3">
		    <span class="input-group-text" id="inputGroup-sizing-sm" required>지역</span>
		    <input type="text" class="form-control"  name="location" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" placeholder="ex)성동구 사근동" required>
			<span class="input-group-text" id="inputGroup-sizing-sm">강아지 이름</span>
			<input type="text" class="form-control"  name="name" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" required>
			<span class="input-group-text" id="inputGroup-sizing-sm">강아지 종</span>
			<input type="text" class="form-control"  name="breed" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" required>
			<span class="input-group-text" id="inputGroup-sizing-sm">강아지 나이</span>
			<input type="text" class="form-control"  name="age" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" placeholder="나이/개월" required>
			<span class="input-group-text" id="inputGroup-sizing-sm">수정/삭제 비밀번호</span>
			<input type="text" class="form-control"  name="password" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-sm" required>						
		  </div>

		   <div class="qa-container">
		       <div class="qa-content-wrapper">
		           <div class="qa-content">
	               <h3 class="qa-question">
					<div class="mb-3">
						<input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" name="title" placeholder="제목을 입력해주세요." required>
					</div>
				   </h3> 
		  			 <hr>
	               <p class="qa-description">
					<textarea name="content" rows="100" cols="200" placeholder="글 내용을 입력해주세요."></textarea>
	               </p>

				   <div class="mb-3">
				     <label for="image" class="form-label">사진업로드</label>
				     <input type="file" class="form-control" id="image" name="uploadimage" accept="image/*">
				   </div>

				     <div class="d-grid gap-2 d-md-flex justify-content-md-end">
				   		<button type="submit" class="btn btn-primary">등록</button>
				     	<button type="reset" class="btn btn-secondary">초기화</button>
				   </div> 
	           </div>			  
	       </div>
		   <div class="d-grid gap-2 d-md-flex">
		   	<button onclick="window.location.href='getAllDogs.do'" class="btn btn-danger">취소</button>
		   </div>
		</div>
	  </form>
	</div> 
</body>
</html>