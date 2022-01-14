<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="b" tagdir="/WEB-INF/tags"%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="<%=request.getContextPath()%>/resources/css/icon/css/all.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link href="${pageContext.request.contextPath}/resources/css/homeart.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/picBoardlist.css" rel="stylesheet" type="text/css">

<title>List</title>

<style>
body {
	background-color: #222;
}

.card-img-top {
	height: 15rem;
	object-fit: cover;
}
</style>
<c:forEach items="${list }" var="picBoard">
<script>
	$(document).ready(function() {
		
		$("#card${picBoard.board_id}").hover(function() {
			$("#dropdown${picBoard.board_id}").css("display", "block");
		}, function() {
			$("#dropdown${picBoard.board_id}").css("display", "none");
		});
		
		// remove 버튼 실행.
		$("#removeSubmitButton").click(function(e) {
			e.preventDefault();
			if (confirm("삭제하시겠습니까?")) {
				$("#modifyForm").attr("action", "remove").submit();
			}
		});

	});
</script>
</c:forEach>



</head>
<body>

	<b:navBar></b:navBar>

	<div class="contents-wrap">

		<!-- Section art-->

		<section class="py-5">
			<div class="container px-4 px-lg-5 mt-5">
				<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">


					<c:forEach items="${list }" var="picBoard">


						<div class="col mb-5">
							<div class="card h-100" id="card${picBoard.board_id }">

								<!-- dropdown -->
								<div class="dropdown" id="dropdown${picBoard.board_id }" style="display: none;">
									<button class="btn btn-outline-dark dropdown-toggle position-absolute badge" style="top: 0.5rem; right: 0.5rem;" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-expanded="false">
										<i class="fas fa-ellipsis-h"></i>
									</button>
									<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">

										<!-- c:if 태그로 로그인 한 멤버와 아닌 멤버의 메뉴 다르게 보이게끔 함.  -->
										<c:if test="${sessionScope.loggedInMember.member_id eq picBoard.writer }">
											<a class="dropdown-item" href="modify?id=${picBoard.board_id }">modify</a>
											<a class="dropdown-item" href="remove" id="removeSubmitButton">delete</a>
										</c:if>

										<a class="dropdown-item" href="#">share</a>

										<c:if test="${sessionScope.loggedInMember.member_id ne picBoard.writer}">

											<a class="dropdown-item" href="getArtist?id=${picBoard.board_id }">go artist</a>
											<a class="dropdown-item" href="#">declaration</a>
										</c:if>
									</div>
								</div>

								<!-- HOT badge -->
								<div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; left: 0.5rem">Hot</div>

								<!-- Product image-->
								<img class="card-img-top" src="${staticUrl }/picShare/${picBoard.board_id }/${picBoard.file_name}" alt="${picBoard.file_name }">
								<!-- Product details-->
								<div class="card-body p-4">
									<div class="text-center">

										<!-- 작품 이름-->
										<h5 class="fw-bolder">${picBoard.title }</h5>
										<!-- text-warning이 글씨의 색깔을 나타냄. -->
										<!-- 작가 이름 -->
										<div class="d-flex justify-content-center small text-secondary mb-2">
											<div class="bi-star-fill">${picBoard.nickName }</div>
										</div>

									</div>
								</div>
								<!-- Product actions-->
								<div class="card-footer p-2 pt-0 border-top-0 bg-transparent">
									<div class="text-align-justify d-flex">
										<!-- like button -->
										<span class="mr-auto my-auto btn btn-outline-link text-danger text-lg">
											<i class="far fa-heart"></i>
											<span>0</span>
										</span>

										<!-- go art -->
										<a class="btn btn-outline-dark" href="get?id=${picBoard.board_id }">Go art</a>
									</div>
								</div>
							</div>
						</div>


					</c:forEach>


				</div>
			</div>
		</section>

		<!-- register button & search button -->
		<nav class="navbar" style="background-color: #222; padding-right: 100px;">
			<div class="container">
				<!-- register button -->
				<button class="btn btn-outline-light" type="button" onclick="location.href='${pageContext.request.contextPath}/picShare/register'">Post</button>
				<!-- search button -->
				<form class="d-flex">
					<div class="dropdown">
						<button class="btn btn-outline-light dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-expanded="false"></button>
						<div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
							<a class="dropdown-item" href="#">artist</a>
							<a class="dropdown-item" href="#">art name</a>
							<a class="dropdown-item" href="#">all</a>
						</div>
					</div>
					<input class="form-control me-2" type="search" placeholder="Search" aria-label="Search">
					<button class="btn btn-outline-light" type="submit">
						<i class="fas fa-search"></i>
					</button>
				</form>
			</div>
		</nav>

		<!-- pagination -->
		<nav aria-label="Page navigation">
			<ul class="pagination p1 justify-content-center">
				<c:if test="${picPageInfo.hasPrevButton }">
					<c:url value="/picShare/list" var="pageLink">
						<c:param name="page" value="${picPageInfo.leftPageNumber - 1 }" />
					</c:url>
					<li class="page-item disabled">
						<a href="${pageLink }">
							<i class="fas fa-chevron-left"></i>
						</a>
					</li>
				</c:if>

				<c:forEach begin="${picPageInfo.leftPageNumber }" end="${picPageInfo.rightPageNumber }" var="pageNumber">
					<c:url value="/picShare/list" var="pageLink">
						<c:param name="page" value="${pageNumber }" />
					</c:url>
					<li class="page-item">
						<a class="${picPageInfo.currentPage == pageNumber ? 'is-active' : 'active' }" href="${pageLink }">${pageNumber }</a>
					</li>
				</c:forEach>

				<c:if test="${picPageInfo.hasNextButton }">
					<c:url value="/picShare/list" var="pageLink">
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


		<b:bottomInfo></b:bottomInfo>
	</div>




	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

	<script>
		$(document).ready(function() {

		});
	</script>

</body>

</html>




























