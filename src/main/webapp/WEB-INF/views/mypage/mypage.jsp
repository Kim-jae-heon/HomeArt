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
<link href="${pageContext.request.contextPath}/resources/css/mypage.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/homeart.css" rel="stylesheet" type="text/css">

<c:url value="/mypage" var="mypageUrl"></c:url>
<c:url value="/mypage/my_picture" var="mypicUrl"></c:url>
<c:url value="/mypage/favorite_picture" var="favpicUrl"></c:url>
<c:url value="/mypage/my_post" var="mypostUrl"></c:url>
<c:url value="/mypage/my_reply" var="myreplyUrl"></c:url>
<style>

</style>



<title>MyPage</title>
</head>
<body>
<b:navBar></b:navBar>
<div class="contents-wrap">
	<div class="container" style="max-width: 900px;">
		<div class="row">
			<div class="col">
				<!-- 회원 정보 -->
				<div class="row memberInfo">
					<c:choose>
					<c:when test="${sessionScope.loggedInMember.member_id == member.member_id }">
						<img src="<spring:url value='/resources/img/cat1.jpg'/>" class="profilepic">
						<div class="col" style="padding-left: 20px;">
							<div style="font-weight: bold;"><i class="fas fa-info-circle" style="color: rgb(173, 166, 146);"></i> MyInfo</div>
							<div>아이디 : ${sessionScope.loggedInMember.member_id }</div>
							<div>이름 : ${sessionScope.loggedInMember.member_name }</div>
							<div>닉네임 : ${sessionScope.loggedInMember.nickName }</div>
							<div>국가 : ${sessionScope.loggedInMember.country }</div>
							<div>이메일 : ${sessionScope.loggedInMember.email }</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="col">
							<div>이름 : ${member.member_name }</div>
							<div>닉네임 : ${member.nickName }</div>
						</div>
					</c:otherwise>
					</c:choose>
				</div>
				
				<!-- 방명록 -->
				<h2> ${member.nickName }님의 방명록 </h2>
				<c:forEach items="${list }" var="guestbook">
					<div class="row guestbook">
						<img class="pic40" src="<spring:url value='/resources/img/logo3.jpg'/>" class="img-thumbnail" alt="...">
						<a class="guestbookContent" href="${mypageUrl }?member_id=${guestbook.member_id }">${guestbook.member_id }</a>
						<p class="guestbookContent">　　</p>
						<p class="guestbookContent">${guestbook.content }</p>
						<div class="guestbookButton ml-auto">
							<span class="guestbookModify">수정</span>
							<span class="guestbookDelete">삭제</span>
							<span class="guestbookReply">답글</span>
						</div>
					</div>
					<div class="guestbookCommentWrap">
						<c:forEach items="${commentList }" var="guestbookComment">
							<c:if test="${guestbookComment.key == guestbook.guestbook_id}">
								<div class="col">
									<c:forEach items="${guestbookComment.value }" var="comment">
										<div class="row guestbookComment">
											<a class="guestbookCommentContent" href="${mypageUrl }?member_id=${comment.member_id }">${comment.member_id }</a>
											<p class="guestbookCommentContent">　　</p>
											<p class="guestbookCommentContent">${comment.content }</p>
											<div class="guestbookButton ml-auto">
												<span class="guestbookCommentModify">수정</span>
												<span class="guestbookCommentDelete">삭제</span>
											</div>						
										</div>
									</c:forEach>
								</div>
							</c:if>
						</c:forEach>
						<div class="input-group mb-3 guestbookCommentSubmit">
						  <input type="text" class="form-control" placeholder="댓글을 작성해주세요. (최대 100자)" aria-label="댓글" aria-describedby="button-addon2">
						  <div class="input-group-append">
						    <button class="btn btn-outline-secondary" type="button" id="button-addon2">작성</button>
						  </div>
						</div>
					</div>
				</c:forEach>
				
				<c:if test="${sessionScope.loggedInMember.member_id != member.member_id }">
					<div class="input-group mb-3 guestbookSubmit">
					  <input type="text" class="form-control" placeholder="방명록을 작성해주세요. (최대 100자)" aria-label="방명록" aria-describedby="button-addon2">
					  <div class="input-group-append">
					    <button class="btn btn-outline-secondary" type="button" id="button-addon2">작성</button>
					  </div>
					</div>
				</c:if>
				
				<!-- 내 활동 -->
				<c:if test="${sessionScope.loggedInMember.member_id == member.member_id }">
					<div class="activeBox">
						<div class="row">
							<h3>내 그림들</h3>
							<a href="${mypicUrl }">더보기</a>
						</div>
						<div class="row">
							<img class="pic100" src="<spring:url value='/resources/img/logo.jpg'/>" class="img-thumbnail" alt="...">	
							<img class="pic100" src="<spring:url value='/resources/img/logo1.jpg'/>" class="img-thumbnail" alt="...">	
							<img class="pic100" src="<spring:url value='/resources/img/logo2.jpg'/>" class="img-thumbnail" alt="...">	
							<img class="pic100" src="<spring:url value='/resources/img/logo3.jpg'/>" class="img-thumbnail" alt="...">	
							<img class="pic100" src="<spring:url value='/resources/img/logo4.jpg'/>" class="img-thumbnail" alt="...">	
						</div>
					</div>
					<div class="activeBox">
						<div class="row">
							<h3>좋아요 누른 그림</h3>
							<a  href="${favpicUrl }">더보기</a>
						</div>
						<div class="row">
							<img class="pic100" src="<spring:url value='/resources/img/logo.jpg'/>" class="img-thumbnail" alt="...">	
							<img class="pic100" src="<spring:url value='/resources/img/logo1.jpg'/>" class="img-thumbnail" alt="...">	
							<img class="pic100" src="<spring:url value='/resources/img/logo2.jpg'/>" class="img-thumbnail" alt="...">	
							<img class="pic100" src="<spring:url value='/resources/img/logo3.jpg'/>" class="img-thumbnail" alt="...">	
							<img class="pic100" src="<spring:url value='/resources/img/logo4.jpg'/>" class="img-thumbnail" alt="...">	
						</div>
					</div>
					<div class="activeBox">
						<div class="row">
							<h3>내가 쓴 글</h3>
							<a  href="${mypostUrl }">더보기</a>
						</div>
						<ul>
							<li>글글글1</li>
							<li>글글글2</li>
							<li>글글글3</li>
							<li>글글글4</li>
							<li>글글글5</li>
						</ul>
					</div>
					<div class="activeBox">
						<div class="row">
							<h3>내 댓글</h3>
							<a  href="${myreplyUrl }">더보기</a>
						</div>
						<ul>
							<li>댓글댓글댓글1</li>
							<li>댓글댓글댓글2</li>
							<li>댓글댓글댓글3</li>
							<li>댓글댓글댓글4</li>
							<li>댓글댓글댓글5</li>
						</ul>
					</div>
				</c:if>
			</div>
		</div>
	</div>
	
	<b:bottomInfo></b:bottomInfo>
	
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

<script>
	/* 답글 토글 */
	$(document).ready(function(){
		$(".guestbookReply").click(function(){
			var element = $(this).parent();
			var element2 = element.parent();
			element2.next().slideToggle("fast");
		});
	});
</script>
</body>
</html>
