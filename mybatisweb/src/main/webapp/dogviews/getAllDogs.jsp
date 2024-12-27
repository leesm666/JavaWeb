<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
			max-width:1000px;
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
		    max-width: 900px;
			transition: background-color 0.3s ease;
			background-color: #fff;
		}
		.qa-container:hover {
		    background-color: #f5f5f5; /* 연한 회색으로 변경 */
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
			max-width: 500px;
		}

		.qa-info {
		    display: flex;
		    gap: 15px;
		    color: #666;
		    font-size: 14px;
		}

		.qa-image {

			height: 100px;
		    flex-shrink: 0;
		}

		.qa-image img {

		    height: 70%;
		    border-radius: 8px;
		    object-fit: cover;
		}

		
		.btn-outline-secondary.active {
		    background-color: #6c757d;
		    color: white;
		    font-weight: bold;
		}
		
		.gradient-button {
		    background: linear-gradient(135deg, #2E8B57, #3CB371);
		    color: white;
		    padding: 8px 16px;
		    border: none;
		    border-radius: 20px;
		    transition: all 0.3s ease;
		}

		.gradient-button:hover {
		    transform: translateY(-2px);
		    box-shadow: 0 5px 15px rgba(60, 179, 113, 0.4);
		}
		.search{
			padding: 20px;
		}
		.sel{
			width: 10%;
			
		}
	</style>
	
</head>
<body>
	<div class="container my-container">
		  <nav class="navbar navbar-light bg-light">
			  <div class ="container-fluid">
				<p class="fs-2 text-center">Dog Community</p>
			  <!--게시판 추가-->
			  <!-- Category Buttons -->
	              <div>
					<form action="getAllDogs.do" method="get" style="display: inline;">
					    <button type="submit" class="btn btn-outline-success btn-sm rounded-pill ${empty param.category ? 'active' : ''}">전체 게시판</button>
					</form>

					<form action="filterByCategory.do" method="get" style="display: inline;">
					    <input type="hidden" name="category" value="산책 친구 찾기">
					    <button type="submit" class="btn btn-outline-success btn-sm rounded-pill ${param.category eq '산책 친구 찾기' ? 'active' : ''}">산책 친구 찾기</button>
					</form>

					<form action="filterByCategory.do" method="get" style="display: inline;">
					    <input type="hidden" name="category" value="정보 게시판">
					    <button type="submit" class="btn btn-outline-success btn-sm rounded-pill ${param.category eq '정보 게시판' ? 'active' : ''}">정보 게시판</button>
					</form>

					<form action="filterByCategory.do" method="get" style="display: inline;">
					    <input type="hidden" name="category" value="질문 게시판">
					    <button type="submit" class="btn btn-outline-success btn-sm rounded-pill ${param.category eq '질문 게시판' ? 'active' : ''}">질문 게시판</button>
					</form>
					
					<form action="filterByCategory.do" method="get" style="display: inline;">
					    <input type="hidden" name="category" value="사진 자랑">
					    <button type="submit" class="btn btn-outline-success btn-sm rounded-pill ${param.category eq '사진 자랑' ? 'active' : ''}">사진 자랑</button>
					</form>

					<form action="filterByCategory.do" method="get" style="display: inline;">
					    <input type="hidden" name="category" value="기타">
					    <button type="submit" class="btn btn-outline-success btn-sm rounded-pill ${param.category eq '기타' ? 'active' : ''}">기타</button>
					</form>
	              </div>
				  <button class = "gradient-button" onclick="location.href='insertBoard.do'"> <i class="bi bi-pencil-square"></i> 글쓰기</button>
			</div>
		</nav>
		
		<!--테이블 내용 검색-->
		<div class = 'search'>
			<form class ="d-flex" action="searchBoardList.do" method="post">
			<div class="input-group mb-3">
				<select name="searchCon" class="form-select sel" aria-label="Default select example">
					<option value="title">제목 </option>
					<option value="location">지역 </option>
					<option value="breed">강아지 종</option>
				</select>
			  <input type="text"  name="searchKey" class="form-control" placeholder="Search" aria-label="Search" aria-describedby="button-addon2">
			  <button class="btn btn-outline-success" type="submit" id="button-addon2"><i class="bi bi-search"></i> </button>
			</div>
			</form>
		</div>
		<c:choose>
		    <c:when test="${not empty dList}">
		        <c:set var="listSize" value="${fn:length(dList)}"/>
		        <c:forEach var="i" begin="0" end="${listSize - 1}" step="1">
					<c:set var="dogsboard" value="${dList[listSize - 1 - i]}"/>
							    
							    <div class="qa-container" onclick="location.href='getAllDogsContent.do?seq=${dogsboard.seq}'" style="cursor: pointer;">
							        <div class="qa-header">
							            <h2 class="qa-title tag green">${dogsboard.category}</h2> <h3 class="qa-title tag">${dogsboard.breed} · ${dogsboard.name} · ${dogsboard.age}</h3>
							        </div>
							        
							        <div class="qa-content-wrapper">
							            <div class="qa-content">
							                <h3 class="qa-question">${dogsboard.title}</h3>
							                <p class="qa-description">
							                    ${dogsboard.content}
							                </p>
							                <div class="qa-info"> 
							                    <span class="reply-count">${dogsboard.location} ·
													
													<fmt:parseDate value="${dogsboard.createdDate}" pattern="yyyy-MM-dd'T'HH:mm:ss" var="parsedDateTime" type="both" />
													<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${parsedDateTime}" />
												 </span>
							                </div>
							            </div>
							            <div class="qa-image">
							                <img src="/images/${dogsboard.image}" alt="" class="resize-image"/>
							            </div>
							        </div>
							    </div>
							    <hr>
		        </c:forEach>
		    </c:when>
		    <c:otherwise>
		        <p>등록된 게시글이 없습니다.</p>
		    </c:otherwise>
		</c:choose>
	

	    </tbody>
	  </table>
	</div>
</body>
</html>