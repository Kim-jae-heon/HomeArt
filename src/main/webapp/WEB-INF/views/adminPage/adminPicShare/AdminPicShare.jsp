<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="aside" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>Insert title here</title>

<style>
body {
	background: rgb(71, 66, 63) !important;
}

h4 {
	color: white;
}

.img-thumbnail {
	height: 150px;
}

.grid-image {
	display: flex;
	flex-wrap: wrap;
	align-items: flex-start;
	margin: 30px 0;
}

.grid-image img {
	width: calc(17% - 10px);
	margin: 0px 15px 15px 12.5%;
}

.grid-image img:nth-of-type(3n), .grid-image img:last-child {
	margin-right: 0;
}

@media screen and (max-width:480px) {
	.grid-image img:nth-of-type(2n) {
		margin-right: 0;
	}
	.grid-image img:nth-of-type(3n) {
		margin-right: 15px;
	}
}
</style>

</head>
<body>

	<div class="container-fluid">
		
		<aside:CategoryAside />

		<div class="row">
			<div class="col-7">
				<img src="${staticUrl}/picShare/${read.board_id}/${read.file_name}" class="w-100 p-3" alt="...">
			</div>

			<div class="col-1"></div>

			<div class="col-4">
			<form role="form" action="/controller/adminPage/adminPicShare/AdminPicShare?id=${read.board_id}">
				<div class="input-group mb-1">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">제목</span>
					</div>
					<input type="text" class="form-control" placeholder="그림제목" aria-label="Username" aria-describedby="basic-addon1" readonly="readonly" value="${read.title}">
				</div>
				<div class="input-group mb-1">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">글쓴이</span>
					</div>
					<input type="text" class="form-control" placeholder="아이디" aria-label="Username" aria-describedby="basic-addon1" readonly="readonly" value="${read.writer}">
				</div>

				<div class="input-group mb-1">
					<div class="input-group-prepend">
						<span class="input-group-text">내용</span>
					</div>
					<textarea class="form-control" rows="10" aria-label="With textarea" readonly="readonly"><c:out value="${read.content }" /></textarea>
				</div>

				<div class="btn-toolbar justify-content-between mb-1" role="toolbar" aria-label="Toolbar with button groups">
					<div class="btn-group" role="group" aria-label="First group">
						<input type="text" class="form-control" placeholder="추천수" aria-label="Username" aria-describedby="basic-addon1" size="2" disabled>
					</div>
					<div class="btn-group" role="group" aria-labelledby="Second group">
						<button class="btn btn-outline mr-1" type="button" data-toggle="collapse" data-target="#collapse" aria-expanded="false" aria-controls="collapse">삭제</button>
					</div>

				</div>

				<div class="collapse" id="collapse">
						<h4>삭제 사유를 입력해주세요</h4>
						<input type="textarea" class="form-control">
						<input type="submit" class="btn" value="입력완료" style="color: white;" id="deletion">
				</div>
			</form>
			</div>
		</div>
	</div>

	<div class="row">
		<div class="col">
			<form class="form-inline my-2 my-lg-0 ml-5">
				<input class="form-control mr-sm-2" type="search" placeholder="찾기" aria-label="Search">
				<button class="btn btn-outline-success my-2 my-sm-0" type="submit" style="border-color: white; color: white;">작가찾기</button>
			</form>
			<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
				<div class="carousel-inner">
					<div class="carousel-item active">
						<div class="grid-image">
							<c:forEach items="${list}" var="list">
								<img src="${staticUrl}/picShare/${list.board_id}/${list.file_name}" class="img-thumbnail" alt="${list.file_name }" onclick="location.search ='?id=${list.board_id}'">
							</c:forEach>
						</div>
					</div>
				</div>


				<nav aria-label="Page navigation">
					<ul class="pagination p1 justify-content-center">
						<c:if test="${picPageInfo.hasPrevButton }">
							<c:url value="/adminPage/adminPicShare/AdminPicShare" var="pageLink">
								<c:param name="page" value="${picPageInfo.leftPageNumber - 1 }" />
							</c:url>
							<li class="page-item disabled">
								<a href="${pageLink }">
									<i class="fas fa-chevron-left"></i>
								</a>
							</li>
						</c:if>

						<c:forEach begin="${picPageInfo.leftPageNumber }" end="${picPageInfo.rightPageNumber }" var="pageNumber">
							<c:url value="/adminPage/adminPicShare/AdminPicShare" var="pageLink">
								<c:param name="page" value="${pageNumber }" />
							</c:url>
							<li class="page-item">
								<a class="${picPageInfo.currentPage == pageNumber ? 'is-active' : 'active' }" href="${pageLink }">${pageNumber }</a>
							</li>
						</c:forEach>

						<c:if test="${picPageInfo.hasNextButton }">
							<c:url value="/adminPage/adminPicShare/AdminPicShare" var="pageLink">
								<c:param name="page" value="${picPageInfo.rightPageNumber + 1 }" />
							</c:url>
							<li class="page-item disabled">
								<a href="${pageLink }">
									<i class="fas fa-chevron-right"></i>
								</a>
							</li>
						</c:if>
					</ul>
				</nav>
			</div>
		</div>
	</div>



	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
	<script>
		$(document)
				.ready(
						function() {
							$('nav, .dropdown-menu').css('background-color','#b3b1b2');
							$('li>a, li>div>a').css('color', '#fff');
							$('.btn-toolbar>.btn-group>.btn, .btn-toolbar>.btn-group>.card>.btn')
									.css('color', '#fff');
							$('.btn-toolbar>.btn-group>.btn, .btn-toolbar>.btn-group>.card>.btn')
									.css('border-color', '#fff');
							$('.btn-toolbar>.btn-group>.card>.btn').css('background-color', '#b3b1b2');
							
							$("#deletion").click(function(e){
								e.preventDefault();
								$("form").attr("action", "/controller/adminPage/adminPicShare/remove?id=<c:out value='${read.board_id}'/>").submit();
							});
						});
	</script>
</body>
</html>