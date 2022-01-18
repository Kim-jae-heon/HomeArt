<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css"
	integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn"
	crossorigin="anonymous">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
	integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
<title>Insert title here</title>
<style>
.vertical-center {
	min-height: 70%;
	min-height: 60vh;
	display: flex;
	align-items: center;
}

body {
	background: rgb(71, 66, 63) !important;
}

.btn {
	border-color: rgb(173, 166, 146);
	background-color: rgb(173, 166, 146);
}

.btn:hover {
	background-color: rgb(71, 66, 63);
}
</style>
</head>
<body>
	<div class="container">
		<div class="row vertical-center">
			<div class="col-sm-4">
				<div class="card">
					<h5 class="card-header">작가그림공유</h5>
					<div class="card-body">
						<p class="card-text">작가그림공유 페이지의 게시판 관리를 할 수 있습니다.</p>
						<a href="adminPicShare/AdminPicShare" class="btn btn-primary">공게</a> <a
							href="adminPicShare/AdminPicAdmit" class="btn btn-primary">그림신고</a>
					</div>
				</div>
			</div>
			<div class="col-sm-4">
				<div class="card">
					<h5 class="card-header">명화</h5>
					<div class="card-body">
						<p class="card-text">명화 페이지의 게시판 관리를 할 수 있습니다.</p>
						<a href="adminPic/AdminPicBoard" class="btn btn-primary">명게</a>
					</div>
				</div>
			</div>
			<div class=col-sm-4>
				<div class="card">
					<h5 class="card-header">자유 게시판</h5>
					<div class="card-body">
						<p class="card-text">자유 게시판 페이지의 게시판 관리를 할 수 있습니다.</p>
						<a href="#" class="btn btn-primary">자게</a>
					</div>
				</div>
			</div>
		</div>

		<div class="row">
			<div class="col-sm-4">
				<div class="card">
					<h5 class="card-header">공지사항</h5>
					<div class="card-body">
						<p class="card-text">공지사항을 생성, 수정, 삭제를 할 수 있습니다.</p>
						<a href="adminNotice/AdminNoticeCUD" class="btn btn-primary">공지사항 가기</a>
					</div>
				</div>
			</div>
			<div class=col-sm-4>
				<div class="card">
					<h5 class="card-header">회원관리</h5>
					<div class="card-body">
						<p class="card-text">회원의 포인트 및 거부 설정을 할 수 있습니다.</p>
						<a href="adminMemManage/AdminMemManage" class="btn btn-primary">회원관리</a>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
		crossorigin="anonymous"></script>
</body>
</html>