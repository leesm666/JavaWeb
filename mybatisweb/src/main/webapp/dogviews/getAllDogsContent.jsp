<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
	
	<!--css-->
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" 
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css">
	
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
		.resize-image{
			max-width: 50%;
			height: auto;
			display: block;
			margin: 0 auto;
		}
		.qa-container {
		    padding: 5px;
		    border-radius: 8px;
		    background: #fff;
		    max-width: 1200px;

		}
		.qa-header {
		    display: flex;
		    align-items: center;
		    margin-bottom: 5px;
			margin-left: 50px;
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
			font-size: 35px;
			margin-left: 50px;
		}
		.qa-description {
		    display: -webkit-box;
		    -webkit-box-orient: vertical;
		    overflow: hidden;
		    text-overflow: ellipsis;
		    line-height: 1.5;
		    margin-bottom: 15px;
			max-width: 1100px;
			font-size:18px;
			margin-left: 50px;
			padding-top: 10px;
			padding-bottom: 40px;
		}
		.qa-info {
		    display: flex;
		    gap: 15px;
		    color: #666;
		    font-size: 14px;
		}
		.pass{
			max-width: 300px;
			float: right;
			margin-right: 10px;
		}
		.cate{
			margin-left: 20px;
		}
		.separator {
		  height: 50px;
		  border-top: 3px double #8c8b8b;
		  margin: 20px 0;
		  box-shadow: 0px 0px 5px 2px rgba(204,204,204,1);
		}
		.delete{
			float: right;
			max-width: 150px;
		}
		.btn-com{
			margin-left: 1040px;
		}
		
		.ctime{
			margin-left:15px;
			font-size:13px;
			color: #666;

		}
	</style>
</head>
<body>
	
	<div class="container my-container">
	 <div class="qa-container">
	     <div class="qa-header">
	         <h2 class="qa-title tag green" >${dogsboard.category}</h2> <h3 class="qa-title tag">${dogsboard.breed} · ${dogsboard.age} · ${dogsboard.name} · ${dogsboard.location}</h3>
	     </div>
	     <div class="qa-content-wrapper">
	         <div class="qa-content">
	             <h3 class="qa-question">${dogsboard.title}</h3>
				 <hr>
	             <p class="qa-description">
	 			${dogsboard.content}
	             </p>
	         </div>
	     </div>
		 <div class="mb-3">		    
		 <img src="/images/${dogsboard.image}" alt="" class="resize-image"/>
		 </div>
		 <hr class="separator">
	 </div>
	<div class="pass qa-container">
		 <form action="boardAction.do" method="post">
			<div class="input-group">
			<input type="hidden" name="seq" value="${dogsboard.seq}">
			  <input type="password" name="password" class="form-control" placeholder="비밀번호" required>
			  <button class="btn btn-outline-primary" type="submit" name="action" value="modify">수정</button>
			  <button  class="btn btn-outline-danger" type="submit" name="action" value="delete">삭제</button>
			</div>
		 </form>
		 <!-- 에러 메시지 표시 영역 -->
		 <c:if test="${not empty errorMessage1}">
		   <div class="alert alert-danger" role="alert">
		     ${errorMessage1}
		   </div>
		 </c:if>
	</div>
	<div class="d-grid gap-2 d-md-flex cate">
		<button onclick="window.location.href='getAllDogs.do'" class="btn btn-secondary">목록</button>
	</div>
	  <div class="mt-5 comment">
	      <h3>댓글 목록</h3>
		  <hr>
		  <!-- 에러 메시지 표시 영역 추가 -->
		  <c:if test="${not empty errorMessage}">
		      <div class="alert alert-danger" role="alert">
		          ${errorMessage}
		      </div>
		  </c:if>
	      <c:if test="${empty comments}">
	          <p>등록된 댓글이 없습니다.</p>
	      </c:if>
	      <c:if test="${not empty comments}">
	          <c:forEach items="${comments}" var="comment">
	                  <div class="card-body">
						<h5><i class="bi bi-person"></i></i>${comment.writer}</h5>
	                    <span>${comment.content}</span>
						<div class = 'delete'>
	                      <!-- 삭제 폼 -->
	                      <form action="/comment/delete.do" method="post" style="display: inline;">
							<!-- 폼 제출시 서버로 전송해야하는 데이터  -->
							<div class="input-group mb-3">
							<input type="hidden" name="comments_id" value="${comment.comments_id}">
							<input type="hidden" name="dog_id" value="${dogsboard.seq}">
							  <input type="password" class="form-control"  name="password" placeholder="비밀번호" required>
							  <button class="btn btn-outline-danger" type="submit" id="button-addon2">삭제</button>
							</div>
	                      </form>
						  </div>
	              </div>	
				    <div class='ctime'>
				  	  <fmt:parseDate value="${comment.createdDate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime" type="both" />
				  	  <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${parsedDateTime}" />
				  </div>
				  <hr>					 
	          </c:forEach>
	      </c:if>
	  </div>
  		  <!-- 댓글 작성 폼 -->
  		  <div class="mt-3">
  		      <form action="/comment/write.do" method="post">
  		          <input type="hidden" name="dog_id" value="${dogsboard.seq}">

				  <div class="input-group input-group-sm mb-3">
				    <span class="input-group-text" id="inputGroup-sizing-sm">작성자</span>
				    <input type="text" class="form-control" id="writer" name="writer" required>
				    <span class="input-group-text" id="inputGroup-sizing-sm">비밀번호</span>
				    <input type="password" class="form-control" id="password" name="password" required>
				  </div>					  
  		          <div class="mb-3">
  		              <label for="commentContent" class="form-label">새 댓글</label>
  		              <textarea class="form-control" id="commentContent" name="content" rows="3" required></textarea>
  		          </div>
  		          <button type="submit" class="btn btn-primary btn-com">댓글 작성</button>
  		      </form>
  		  </div>
	</div>
</body>
</html>