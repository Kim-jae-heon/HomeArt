<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="b" tagdir="/WEB-INF/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<link href="${pageContext.request.contextPath}/resources/css/homeart.css" rel="stylesheet" type="text/css">

<title>Masterpiece-list</title>

<style>
body {
	background-color: #222;
}


/* 카테고리 */
#category_menu  {
	position: relative;
}

/* 색 변경하기 그리고 하나만 클릭되도록 바꿔보기 */
#category_menu:hover  {
	background-color: red;
}

#category {
	display: none;
	position: absolute;
	background-color: white;
	color: black;
	/* box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
	left: 0px;
	top: 50px;
	padding: 14px;
	width: 80px; */
}

.main_category:active .category {
	display: block;
} 
</style>

<script>
/* $("#btn3").click(function () {
    $("h1").toggle("fast");
}); */
</script>
</head>
<body>

	<b:navBar></b:navBar>

<div class="contents-wrap">

	<!-- header board -->
	<!-- 상단 이미지 보드 -->
	<!-- .header_board>ul.header_wp>li.header_items -->
	<section class="py-4">
				<div class="container px-4 px-lg-8 my-5">
						<div class="row gx-4 gx-lg-5 align-items-center">
								<div class="col-md-6">
										<img class="card-img-top mb-5 mb-md-0" src="https://dummyimage.com/600x700/dee2e6/6c757d.jpg" alt="...">
								</div>
								<div class="col-md-6 text-white">

										<h1 class="display-5 fw-bolder">1 art</h1>
										<div class="fs-5 mb-5">
												<span class="text-decoration-line-through">1 artist</span>

										</div>
										<p class="lead text-white">작품 설명이 들어갈 것.raesentium at dolorem quidem modi. Nam sequi consequatur obcaecati excepturi alias magni, accusamus eius blanditiis delectus ipsam minima ea iste laborum vero?</p>
										<div class="d-flex">

												<button class="btn btn-light flex-shrink-0" type="button">Go Artist(작가 더보러가기)</button>
										</div>
								</div>
						</div>
				</div>
		</section>
	<!-- main board -->
	<!-- 이미지 게시판 -->
	<!-- .container>.main_board>.main_content -->
	<section class="py-5">
	<div class="container px-4 px-lg-5 mt-5">
		<div class="main_board" style="background-color: white;">
			<!-- 검색바 및 카테고리 분류판 -->
			<!-- 여기서 ajax사용해서 하단 이미지 리스트 보여주기 바꾸고싶다 -->
			<!-- ul.main_search>li.search_bar^ul.main_select>li.category*4 -->
			<ul class="main_category">
				<!-- <li class="search_bar"></li> 검색창은 필요한가??-->
				<div class="row">
					<li class="col" id="category_menu">COUNTRY <!-- <i class="fas fa-caret-down"></i> -->
						<div class="category" id="category">나라1</div>
						<div class="category" id="category">나라2</div>
						<div class="category" id="category">나라3</div>
					</li>
					<li class="col">ARTIST</li>
					<li class="col">AGE</li>
				</div>
			</ul>

		</div>
		<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
			<!-- 이미지 게시판 콘텐츠 -->
			<div class="col mb-5">
				<div class="card h-100">
					<!-- <img src="" alt="" class="card-img-top">
					<div class="card-body">
						<ul class="body_content">IMAGE
						</ul>
					</div>
					<div class="card-footer">
						<ul class="footer_content">GO ART
						</ul>
					</div> -->
					<!-- Product image-->
					<img class="card-img-top"
						src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="...">
					<!-- Product details-->
					<div class="card-body p-4">
						<div class="text-center">
							<!-- Product name-->
							<h5 class="fw-bolder">3 art</h5>
							<!-- 작가 이름 -->
							<div
								class="d-flex justify-content-center small text-warning mb-2">
								<div class="bi-star-fill">artistName</div>
							</div>
							<!-- Product price-->
							<span class="text-muted text-decoration-line-through">Like View</span>
						</div>
					</div>
					<!-- Product actions-->
					<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
						<div class="text-center">
							<a class="btn btn-outline-dark mt-auto" href="#">Go art</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col mb-5">
				<div class="card h-100">
					<!-- <img src="" alt="" class="card-img-top">
					<div class="card-body">
						<ul class="body_content">IMAGE
						</ul>
					</div>
					<div class="card-footer">
						<ul class="footer_content">GO ART
						</ul>
					</div> -->
					<!-- Product image-->
					<img class="card-img-top"
						src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="...">
					<!-- Product details-->
					<div class="card-body p-4">
						<div class="text-center">
							<!-- Product name-->
							<h5 class="fw-bolder">3 art</h5>
							<!-- 작가 이름 -->
							<div
								class="d-flex justify-content-center small text-warning mb-2">
								<div class="bi-star-fill">artistName</div>
							</div>
							<!-- Product price-->
							<span class="text-muted text-decoration-line-through">Like View</span>
						</div>
					</div>
					<!-- Product actions-->
					<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
						<div class="text-center">
							<a class="btn btn-outline-dark mt-auto" href="#">Go art</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col mb-5">
				<div class="card h-100">
					<!-- <img src="" alt="" class="card-img-top">
					<div class="card-body">
						<ul class="body_content">IMAGE
						</ul>
					</div>
					<div class="card-footer">
						<ul class="footer_content">GO ART
						</ul>
					</div> -->
					<!-- Product image-->
					<img class="card-img-top"
						src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="...">
					<!-- Product details-->
					<div class="card-body p-4">
						<div class="text-center">
							<!-- Product name-->
							<h5 class="fw-bolder">3 art</h5>
							<!-- 작가 이름 -->
							<div
								class="d-flex justify-content-center small text-warning mb-2">
								<div class="bi-star-fill">artistName</div>
							</div>
							<!-- Product price-->
							<span class="text-muted text-decoration-line-through">Like View</span>
						</div>
					</div>
					<!-- Product actions-->
					<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
						<div class="text-center">
							<a class="btn btn-outline-dark mt-auto" href="#">Go art</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col mb-5">
				<div class="card h-100">
					<!-- <img src="" alt="" class="card-img-top">
					<div class="card-body">
						<ul class="body_content">IMAGE
						</ul>
					</div>
					<div class="card-footer">
						<ul class="footer_content">GO ART
						</ul>
					</div> -->
					<!-- Product image-->
					<img class="card-img-top"
						src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="...">
					<!-- Product details-->
					<div class="card-body p-4">
						<div class="text-center">
							<!-- Product name-->
							<h5 class="fw-bolder">3 art</h5>
							<!-- 작가 이름 -->
							<div
								class="d-flex justify-content-center small text-warning mb-2">
								<div class="bi-star-fill">artistName</div>
							</div>
							<!-- Product price-->
							<span class="text-muted text-decoration-line-through">Like View</span>
						</div>
					</div>
					<!-- Product actions-->
					<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
						<div class="text-center">
							<a class="btn btn-outline-dark mt-auto" href="#">Go art</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col mb-5">
				<div class="card h-100">
					<!-- <img src="" alt="" class="card-img-top">
					<div class="card-body">
						<ul class="body_content">IMAGE
						</ul>
					</div>
					<div class="card-footer">
						<ul class="footer_content">GO ART
						</ul>
					</div> -->
					<!-- Product image-->
					<img class="card-img-top"
						src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="...">
					<!-- Product details-->
					<div class="card-body p-4">
						<div class="text-center">
							<!-- Product name-->
							<h5 class="fw-bolder">3 art</h5>
							<!-- 작가 이름 -->
							<div
								class="d-flex justify-content-center small text-warning mb-2">
								<div class="bi-star-fill">artistName</div>
							</div>
							<!-- Product price-->
							<span class="text-muted text-decoration-line-through">Like View</span>
						</div>
					</div>
					<!-- Product actions-->
					<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
						<div class="text-center">
							<a class="btn btn-outline-dark mt-auto" href="#">Go art</a>
						</div>
					</div>
				</div>
			</div>
			<div class="col mb-5">
				<div class="card h-100">
					<!-- <img src="" alt="" class="card-img-top">
					<div class="card-body">
						<ul class="body_content">IMAGE
						</ul>
					</div>
					<div class="card-footer">
						<ul class="footer_content">GO ART
						</ul>
					</div> -->
					<!-- Product image-->
					<img class="card-img-top"
						src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="...">
					<!-- Product details-->
					<div class="card-body p-4">
						<div class="text-center">
							<!-- Product name-->
							<h5 class="fw-bolder">3 art</h5>
							<!-- 작가 이름 -->
							<div
								class="d-flex justify-content-center small text-warning mb-2">
								<div class="bi-star-fill">artistName</div>
							</div>
							<!-- Product price-->
							<span class="text-muted text-decoration-line-through">Like View</span>
						</div>
					</div>
					<!-- Product actions-->
					<div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
						<div class="text-center">
							<a class="btn btn-outline-dark mt-auto" href="#">Go art</a>
						</div>
					</div>
				</div>
			</div>
		
				<td>
             	   <img class="fit-picture"
				     <%-- src="${ }" --%>
				     src="${staticUrl }/${masterpiece.id }/${masterpiece.newFileName}"
				     alt="에러">
     			</td>
		</div>
	</div>
	</section>





	<b:bottomInfo></b:bottomInfo>
</div>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
		integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
		crossorigin="anonymous" referrerpolicy="no-referrer"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
		crossorigin="anonymous"></script>
</body>
</html>