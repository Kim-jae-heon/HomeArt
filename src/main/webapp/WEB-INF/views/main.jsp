<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="b" tagdir="/WEB-INF/tags" %>
<!-- 이미지 테스트 (나중에삭제) -->
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<link href="${pageContext.request.contextPath}/resources/css/mainpage.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/homeart.css" rel="stylesheet" type="text/css">

<c:url value="/mypage" var="mypageUrl"></c:url>

<title>HomeArt</title>
</head>

<body>
<b:navBar></b:navBar>

<div class="contents-wrap">
	<!-- BEST작품 -->
	<div class="background1">
		<div class="small">
			<div id="carouselExampleCaptions" class="carousel slide" data-ride="carousel">
			  <ol class="carousel-indicators">
			    <li data-target="#carouselExampleCaptions" data-slide-to="0" class="active"></li>
			    <li data-target="#carouselExampleCaptions" data-slide-to="1"></li>
			    <li data-target="#carouselExampleCaptions" data-slide-to="2"></li>
			  </ol>
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <img src="<spring:url value='/resources/img/logo.jpg'/>" class="d-block w-100" alt="Today's best">
			      <div class="carousel-caption d-none d-md-block">
			        <h5>Today's BEST!</h5>
			        <p>작품이름 - 작가이름</p>
			      </div>
			    </div>
			    <div class="carousel-item" >
			      <img src="<spring:url value='/resources/img/logo1.jpg'/>" class="d-block w-100" alt="Monthly best">
			      <div class="carousel-caption d-none d-md-block">
			        <h5>Month's BEST!</h5>
			        <p>작품이름 - 작가이름</p>
			      </div>
			    </div>
			    <div class="carousel-item">
			      <img src="<spring:url value='/resources/img/logo2.jpg'/>" class="d-block w-100" alt="Yearly best">
			      <div class="carousel-caption d-none d-md-block">
			        <h5>Year's BEST!</h5>
			        <p>작품이름 - 작가이름</p>
			      </div>
			    </div>
			  </div>
			  <button class="carousel-control-prev" type="button" data-target="#carouselExampleCaptions" data-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="sr-only">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-target="#carouselExampleCaptions" data-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="sr-only">Next</span>
			  </button>
			</div>
		</div>
	</div>
	<!-- 공지사항 -->
	<div class="container">
		<div class="row">
			<div class="col">
				<h3>공지사항 <i class="fas fa-bullhorn" style="color: red;"></i></h3>
				<table class="table">
					<thead>
						<tr>
							<th>
								<i class="fab fa-slack-hash"></i>
							</th>
							<th>제목</th>
							<th>작성자</th>
							<th>작성일</th>
						</tr>
					</thead>
					<tbody>
						<!-- DB만들어서 수정 -->
						<%
							for(int i=1; i<6; i++){
						%>
						<tr>
							<td><%= i %></td>
							<td style="color: red">공지사항<%= i %></td>
							<td>작성자<%= i %></td>
							<td>등록시간<%= i %></td>
						</tr>
						<%
							}
						%>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	
	<!-- modal -->
	<c:if test="${not empty result }">
		<div class="modal" tabindex="-1" id="modal1">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title">결과</h5>
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
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<script>
	$(document).ready(function(){
		if(history.state == null){
			$("#modal1").modal('show');
			history.replaceState({}, null);
		}
	});
</script>

</body>
</html>
