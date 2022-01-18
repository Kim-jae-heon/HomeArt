<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="b" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">


<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<link href="${pageContext.request.contextPath}/resources/css/homeart.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/freeBoard/list.css" rel="stylesheet" type="text/css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<title>HomeArt 자유게시판</title>
</head>
<body>
	<!-- header tag -->
	<b:navBar></b:navBar>

<div class="contents-wrap">
	<div class="container">
		<div class="row">
			<div class="col">
				<h2 class="text-center">자유게시판</h2>
				
				<!-- 관리자일때 게시판목록 -->
				<div class="table-admin">
					<table class="table table-hover" style="margin-bottom: 0;">
						<thead>
							<tr>
								<th >No.</th>
								<th>제목</th>
								<th >작성자</th>
								<th>작성일</th>
								<th>조회수</th>
							</tr>
						</thead>
						
						<tbody class="table-active">
							<c:forEach items="${listAdmin }" var="freeBoard">
								<c:if test="${freeBoard.isAdmin == 1 && pageInfo.currentPage == 1 }">
								<tr>
									<td class="col-2"><i class="far fa-flag" style="color: red;"></i></td>
									<td class="col-4" style="color: red;">
										<a style="color: red;" href="get?id=${freeBoard.board_id }">
											<c:out value="${freeBoard.title }"></c:out>
										</a>
									</td>
									<td class="col-2">${freeBoard.nickName }</td>
									<td class="col-2">${freeBoard.boardInserted }</td>
									<td class="col-2">${freeBoard.viewCount }</td>
								</tr>
								</c:if>
							</c:forEach>
						</tbody>
					</table>
				</div>
				
				<!-- 일반회원 게시판 목록 -->
				<div class="table-member">
					<table class="table table-hover">
						
						<tbody>
							 <c:set var="num" value="${pageInfo.countBoard - ((pageInfo.currentPage-1)*10) }"/>
							 <c:forEach items="${listMember }" var="freeBoard" varStatus="status">
								<c:if test="${freeBoard.isAdmin == 0}">
								<tr>
									<td class="col-2">${num }</td>
									<td class="col-4">
										<a style="color: black;" href="get?id=${freeBoard.board_id }">
											<c:out value="${freeBoard.title }"></c:out>
										</a>
									</td>
									<td class="col-2">${freeBoard.nickName }</td>
									<td class="col-2">${freeBoard.boardInserted }</td>
									<td class="col-2">${freeBoard.viewCount }</td>
								</tr>
							</c:if>
							<c:set var="num" value="${num-1 }"></c:set>
							</c:forEach>
						</tbody>
					</table>
				</div>
				
				<nav class="navbar">
					<div class="container-fluid ">
						<!-- 버튼 - 글쓰기/작성 -->
						<a class="btn btn-dark" type="button" href="${pageContext.request.contextPath}/freeBoard/post">글쓰기</a>
						<!-- 검색창 -->
						<form class="d-flex">
							<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
							<button class="btn btn-dark" type="submit">
								<i class="fas fa-search"></i>
							</button>
						</form>
					</div>
				</nav>
				
				<!-- pagination -->
				<nav aria-label="Page navigation">
					<ul class="pagination p1 justify-content-center">
						<c:if test="${pageInfo.hasPrevButton }">
					  		<c:url value="/freeBoard/list" var="pageLink">
					    		<c:param name="page" value="${pageInfo.leftPageNumber - 1 }"></c:param>
					    	</c:url>
						    <li class="page-item">
						      <a href="${pageLink }" aria-label="Previous">
						        <i aria-hidden="true"class="fas fa-chevron-left"></i>
						      </a>
						    </li>
					  	</c:if>
					  	
					  	<c:forEach begin="${pageInfo.leftPageNumber }" end="${pageInfo.rightPageNumber }" var="pageNumber">
					    	<c:url value="/freeBoard/list" var="pageLink">
					    		<c:param name="page" value="${pageNumber }"></c:param>
					    	</c:url>
						    <li class="page-item">
						    	<a class="${pageInfo.currentPage == pageNumber ? 'active' : '' }" href="${pageLink }">${pageNumber }</a>
						    </li>
					    </c:forEach>
							
						<c:if test="${pageInfo.hasNextButton }">
					    	<c:url value="/freeBoard/list" var="pageLink">
					    		<c:param name="page" value="${pageInfo.rightPageNumber + 1 }"></c:param>
					    	</c:url>
						    <li class="page-item">
						      <a href="${pageLink }" aria-label="Next">
						        <i aria-hidden="true" class="fas fa-chevron-right"></i>
						      </a>
						    </li>
					    </c:if>
					</ul>
				</nav>
				</div>
			</div>
		</div>
<!-- modal -->
	<c:if test="${not empty result }">
		<div class="modal" tabindex="-1" id="modal1">
			<div class="modal-dialog">
				<div class="modal-content">
					<div class="modal-header">
						<h5 class="modal-title">처리 결과</h5>
						<button type="button" class="close" data-dismiss="modal" aria-label="Close">
							<span aria-hidden="true">&times;</span>
						</button>
					</div>
					<div class="modal-body">
						<p>${result }</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<b:bottomInfo></b:bottomInfo>
</div>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
</body>
</html>