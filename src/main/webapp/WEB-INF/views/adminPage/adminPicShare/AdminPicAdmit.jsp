<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="aside" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" rel="stylesheet" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<title></title>

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
				<img src="" class="w-100 p-3" alt="...">
			</div>

			<div class="col-1"></div>

			<div class="col-4">
				<div class="input-group mb-1">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">제목</span>
					</div>
					<input type="text" class="form-control" placeholder="그림제목" aria-label="Username" aria-describedby="basic-addon1" readonly="readonly">
				</div>
				<div class="input-group mb-1">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">글쓴이</span>
					</div>
					<input type="text" class="form-control" placeholder="아이디" aria-label="Username" aria-describedby="basic-addon1" readonly="readonly">
				</div>
				
				<div class="input-group mb-1">
					<div class="input-group-prepend">
						<span class="input-group-text" id="basic-addon1">신고자</span>
					</div>
					<input type="text" class="form-control" placeholder="아이디" aria-label="Username" aria-describedby="basic-addon1" readonly="readonly">
				</div>

				<div class="input-group mb-1">
					<div class="input-group-prepend">
						<span class="input-group-text">내용</span>
					</div>
					<textarea class="form-control" rows="20" aria-label="With textarea"></textarea>
				</div>

				<div class="btn-toolbar justify-content-between mb-1" role="toolbar" aria-label="Toolbar with button groups">
					<div class="btn-group" role="group" aria-label="First group">
					</div>
					<div class="btn-group" role="group" aria-labelledby="Second group">
						<button type="submit" class="btn">삭제</button>
						<button class="btn btn-outline mr-1" type="button" data-toggle="collapse" data-target="#collapse" aria-expanded="false" aria-controls="collapse">거절</button>
					</div>

				</div>
				<div class="collapse" id="collapse">
					<form>
						<h4>거절 사유를 입력해주세요</h4>
						<input type="textarea" class="form-control">
						<input type="submit" class="btn" value="입력완료" style="color: white;">
					</form>
				</div>
			</div>
		</div>


		<div class="row">
			<div class="col">
				<div id="carouselExampleControls" class="carousel slide" data-ride="carousel">
					<div class="carousel-inner">
						<div class="carousel-item active">
							<div class="grid-image">
								<img src="" class="d-block img-thumbnail" alt="...">
								<img src="" class="d-block img-thumbnail " alt="...">
								<img src="" class="d-block img-thumbnail" alt="...">
							</div>
						</div>
					</div>
					<button class="carousel-control-prev" type="button" data-target="#carouselExampleControls" data-slide="prev">
						<span class="carousel-control-prev-icon" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</button>
					<button class="carousel-control-next" type="button" data-target="#carouselExampleControls" data-slide="next">
						<span class="carousel-control-next-icon" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</button>
				</div>
			</div>
		</div>
	</div>
	</div>



	<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
	<script>
	 $(document).ready(function (e) {
         $('nav, .dropdown-menu').css('background-color', '#b3b1b2')
     });

     $(document).ready(function () {
         $('li>a, li>div>a').css('color', '#fff')
     });

     $(document).ready(function () {
         $('.btn-toolbar>.btn-group>.btn, .btn-toolbar>.btn-group>.card>.btn').css('color', '#fff')
     });

     $(document).ready(function () {
         $('.btn-toolbar>.btn-group>.btn, .btn-toolbar>.btn-group>.card>.btn').css('border-color', '#fff')
     });

     $(document).ready(function () {
         $('.btn-toolbar>.btn-group>.card>.btn').css('background-color', '#b3b1b2')
     });
	</script>
		</body>
		</html>
	