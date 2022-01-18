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

<title>Insert title here</title>
<style>
body {
	background-color: #222;
}
.secondSection {
	background-color: rgb(173, 166, 146);
}
</style>

</head>
<body>

		<b:navBar></b:navBar>

<div class="contents-wrap">

		<!-- Product section-->
		<section class="py-4">
				<div class="container px-4 px-lg-8 my-5">
						<div class="row gx-4 gx-lg-5 align-items-center">
								<div class="col-md-6">
										<img class="card-img-top mb-5 mb-md-0" src="https://dummyimage.com/600x700/dee2e6/6c757d.jpg" alt="...">
								</div>
								<div class="col-md-6 text-white">

										<h1 class="display-5 fw-bolder">작품명</h1>
										<div class="fs-5 mb-5">
												<span class="text-decoration-line-through">작가</span>
												<span class="text-decoration-line-through">작가</span>
												<span class="text-decoration-line-through">작가</span>
												<span class="text-decoration-line-through">작가</span>
												<span class="text-decoration-line-through">작가</span>
										</div>
										<p class="lead text-white">작품 설명이 들어갈 것.raesentium at dolorem quidem modi. Nam sequi consequatur obcaecati excepturi alias magni, accusamus eius blanditiis delectus ipsam minima ea iste laborum vero?</p>
										<div class="d-flex">

												<button class="btn btn-light flex-shrink-0" type="button">Go Artist(작가 더보러가기)</button>
										</div>
								</div>
						</div>
				</div>
		</section>
		<!-- Related items section-->
		<section class="py-5 bg-rgb(173, 166, 146) secondSection">
				<div class="container px-4 px-lg-5 mt-5 bg-rgb(173, 166, 146)">
						<h2 class="fw-bolder mb-4">the Other arts</h2>
						<div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
								<div class="col mb-5">
										<div class="card h-100">
												<!-- Product image-->
												<img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="...">
												<!-- Product details-->
												<div class="card-body p-4">
														<div class="text-center">
																<!-- Product name-->
																<h5 class="fw-bolder">1art</h5>
																<div class="d-flex justify-content-center small text-warning mb-2">
																		<div class="bi-star-fill">artistName</div>
																</div>
																<!-- Product price-->
																Like View
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
												<!-- Sale badge-->
												<div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Hot</div>
												<!-- Product image-->
												<img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="...">
												<!-- Product details-->
												<div class="card-body p-4">
														<div class="text-center">
																<!-- Product name-->
																<h5 class="fw-bolder">2art</h5>
																<div class="d-flex justify-content-center small text-warning mb-2">
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
												<!-- Sale badge-->
												<div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Hot</div>
												<!-- Product image-->
												<img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="...">
												<!-- Product details-->
												<div class="card-body p-4">
														<div class="text-center">
																<!-- Product name-->
																<h5 class="fw-bolder">3art</h5>
																<div class="d-flex justify-content-center small text-warning mb-2">
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
												<!-- Product image-->
												<img class="card-img-top" src="https://dummyimage.com/450x300/dee2e6/6c757d.jpg" alt="...">
												<!-- Product details-->
												<div class="card-body p-4">
														<div class="text-center">
																<!-- Product name-->
																<h5 class="fw-bolder">4art</h5>
																<div class="d-flex justify-content-center small text-warning mb-2">
																		<div class="bi-star-fill">artistName</div>
																</div>

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
						</div>
				</div>
		</section>
		


	<b:bottomInfo></b:bottomInfo>
</div>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

</body>
</html>











