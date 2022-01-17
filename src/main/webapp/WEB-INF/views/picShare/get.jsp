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
<link href="${pageContext.request.contextPath}/resources/css/homeart.css" rel="stylesheet" type="text/css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<title>Get</title>

<style>
body {
	background-color: #222;
}

.secondSection {
	background-color: rgb(179, 177, 178);
}

#card-img-top {
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

		});
	</script>
</c:forEach>

<script>
//페이지가 처음 로딩될 때 1page를 보여주기 때문에 초기값을 1로 지정.
let currentPage = 1;
// 현재 페이지가 로딩중인지 여부를 저장할 변수.
let isLoading = false;

// 웹브라우저의 창을 스크롤 할 때 마다 호출되는 함수 등록
$(window).on("scroll", function () {
	// 위로 스크롤된 길이
	let scrollTop = $(window).scrollTop();
	// 웹브라우저의 창의 높이
	let windowHeight = $(window).height();
	// 문서 전체의 높이
	let documentHeight = $(document).height();
	// 바닥까지 스크롤 되었는지의 여부
	let isBottom = scrollTop+windowHeight + 10 >= documentHeight;
	
	if (isBottom) {
		
		// 만일 현재 마지막 페이지라면
		if(currentPage == ${totalPageCount} || isLoading) {
			return;
		}
		
		// 현재 로딩 중을 표시.
		isLoading = true;
		// 로딩바
		$(".back-drop").show();
		// 요청할 페이지 번호를 1 증가.
		currentPage++;
		// 추가로 받아올 페이지를 서버에 ajax 요청을 하고
		console.log("inscroll"+currentPage);
		GetList(currentPage);
			
	};
	
});	

const GetList = function (currentPage) {
	
	const appRoot = '${pageContext.request.contextPath}'; 
	let like_cnt = '${board.like_cnt}';
	
	console.log("inGetList"+currentPage);
	
	// 무한 스크롤 부분
	$.ajax ({
		url: "ajax_page.do",
		method: "GET",
		//검색 기능이 있는 경우 type과 keyword를 함께 넘겨줘야 한다.
		data: "pageNum="+currentPage+"&type=${type}&keyword=${keyword}",
		//ajax_page.jsp의 내용이 data로 들어온다.
		success: function (data) {
			console.log(data);
			//응답된 문자열은 html 형식이고 (picShare/ajax_page.jsp에 응답내용이 있다.)
			//해당 문자열을 .card-list-container div에 html로 해석하라고 추가한다.
			$(".card-list-container").append(data);
			//로딩바를 숨김.
			$(".back-drop").hide();
			isLoading=false;
			console.log("ajax");
			
	
			// 로그인을 한 상태에서 하트를 클릭했을 때 (로그인 상태의 a 태그의 class: heart-click)
			$(".heart-click").click(function () {
				
				// 게시물 번호를 idx로 전달받아 저장
				let boardId = $(this).attr('idx');
				console.log("heart-click"+boardId);
				
				// 빈하트를 눌렀을 때,
				if($(this).children('i').attr('class') == "far fa-heart") {
					console.log("빈하트 클릭" + boardId);
					
					$.ajax({
						url: 'saveHeart.do',
						type: 'GET',
						data: {
							boardId : boardId,
							like_cnt: like_cnt
						},
						success: function (board) {
							// 페이지 새로고침
							// document.location.reload(true);
							
						 	/* let heart = '${board.like_cnt}';  */
							
							console.log(board.like_cnt);
							
							$('#heart'+boardId).text(board.like_cnt);
							
							console.log("하트추가 성공");
						},
						error: function () {
							alert('서버 에러');
						}
					});
					console.log("꽉 찬 하트로 바뀌어 주겠지? 바껴라!");
					
					// 꽉찬하트로 바꾸기
					$(this).html(`<i class="fas fa-heart"></i>`);
					$('.heart_icon'+boardId).html(`<i class="fas fa-heart"></i>`);
					
				// 꽉 찬 하트를 눌렀을때는? 다시 빈 하트로 바뀌어야함.
				} else if($(this).children('i').attr('class') == "fas fa-heart") {
					console.log("꽉 찬 하트를 클릭" + boardId);
					
					$.ajax({
						url: 'removeHeart.do',
						type: 'GET',
						data: {
							boardId: boardId,
							like_cnt: like_cnt
						},
						success: function (board) {
							// 페이지 새로고침
							// document.location.reload(true);
							
						/* let heart = '${board.like_cnt}';  */
							
							// 페이지 하트 수 갱신
							$('#heart'+boardId).text(board.like_cnt);
							
							console.log("하트 삭제, 빈하트로 변경 성공!");
						},
						error: function () {
							alert('서버에러');
						}
					});
					console.log("빈하트로 다시 바뀌냐 ?");
					
					// 빈하트로 바꾸기
					$(this).html(`<i class="far fa-heart"></i>`);
					$('.heart_icon'+boardId).html(`<i class="far fa-heart"></i>`);
					
				}
				
				
			});
			
			// 로그인 한 상태에서 하트를 클릭하면 로그인 해야한다는 알림창을 뜨게끔
			$(".heart-notlogin").unbind('click');
			$(".heart-notlogin").click(function () {
				alert('로그인 후 이용가능합니다.');
			});
			
		}
	});
}

$(document).ready(function () {
	GetList(1);
	
	
});

</script>

</head>
<body>
<body>

	<b:navBar></b:navBar>

	<div class="contents-wrap">

		<!-- Product section-->
		<section class="py-5 my-5">
			<div class="container px-4 px-lg-5 my-5 py-5">
				<div class="row gx-4 gx-lg-5 align-items-center">
					<div class="col-md-6">
						<img class="card-img-top mb-5 mb-md-0" src="${staticUrl }/picShare/${board.board_id }/${board.file_name}" alt="${board.file_name }">
					</div>
					<div class="col-md-6 text-white">

						<h1 class="display-5 fw-bolder">${board.title }</h1>
						<div class="fs-5 mb-5">
							<span class="text-decoration-line-through">${board.nickName }</span>

						</div>
						<p class="lead text-white">${board.content }</p>
						
						<!-- Product actions-->
				<div class="card-footer p-2 pt-0 border-top-0 bg-transparent">
					<div class="text-align-justify d-flex">
						<div class="container d-flex mr-auto my-auto">
							<!-- like button -->
							<c:choose>
								<%-- 로그인 상태일 때, 하트가 클릭되게끔 --%>
								<c:when test="${not empty sessionScope.loggedInMember.member_id }">
									<c:choose>
										<c:when test="${empty like.like_id }">
											<%-- 빈 하트일때 --%>
											<div>
												<a idx="${picBoard.board_id }" href="javascript:" class="heart-click heart_icons${picBoard.board_id } text-danger text-lg">
													<i class="far fa-heart"></i>
												</a>
											</div>
										</c:when>
										<c:otherwise>
											<%-- 찬 하트일때 --%>
											<div>
												<a idx="${picBoard.board_id }" href="javascript:" class="heart-click heart_icons${picBoard.board_id } text-danger text-lg">
													<i class="fas fa-heart"></i>
												</a>
											</div>
										</c:otherwise>
									</c:choose>
								</c:when>
								<%-- 로그인 상태가 아닐 때, 하트가 클릭 안되게끔 --%>
								<c:otherwise>
									<div>
										<a href="javascript:" class="heart-notlogin text-danger text-lg">
											<i class="far fa-heart"></i>
										</a>
									</div>
								</c:otherwise>
							</c:choose>
							<div class="container">
							<span class="text-danger text-lg" id="heart${picBoard.board_id }">${picBoard.like_cnt }</span>
							</div>
						</div>

						<%-- 
						<span id="like${picBoard.board_id }" class="mr-auto my-auto btn btn-outline-link text-danger text-lg">
							<i class="far fa-heart"></i>
							<span class="likeCount${picBoard.board_id }">0</span>
						</span>
						--%>

						<!-- go art -->
						<div class="container" style="text-align: right;">
							<a class="btn btn-outline-dark" href="get?id=${picBoard.board_id }">Go art</a>
						</div>
					</div>
				</div>
						<div class="d-flex"></div>
					</div>
				</div>

			</div>
		</section>

		<!-- Related items section 4 card carousel-->
		<section class="py-5 bg-rgb(173, 166, 146) secondSection">
			<div class="container px-4 px-lg-5 mt-5 bg-rgb(173, 166, 146)">
				<h2 class="fw-bolder mb-4">Other arts by the artist</h2>
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
											<a class="dropdown-item" href="remove?id=${picBoard.board_id }" id="removeSubmitButton">delete</a>
										</c:if>

										<a class="dropdown-item" href="#">share</a>

										<c:if test="${sessionScope.loggedInMember.member_id ne picBoard.writer}">

											<a class="dropdown-item" href="#">go artist</a>
											<a class="dropdown-item" href="#">declaration</a>
										</c:if>
									</div>
								</div>

								<!-- HOT badge -->
								<div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; left: 0.5rem">Hot</div>

								<!-- Product image-->
								<img class="card-img-top" id="card-img-top" src="${staticUrl }/picShare/${picBoard.board_id }/${picBoard.file_name}" alt="${picBoard.file_name }">
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
										<span class="mr-auto my-auto btn btn-outline-link text-danger text-lg" onclick="like()">
											<i class="far fa-heart"></i>
											<span></span>
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


		<b:bottomInfo></b:bottomInfo>
	</div>

</body>


<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>

<script>
	$(document).ready(function() {
		//remove 버튼 실행.
		$("#removeSubmitButton").click(function(e) {
			e.preventDefault();
			if (confirm("삭제하시겠습니까?")) {
				$("#modifyForm").attr("action", "remove").submit();
			}
		});
	});
</script>

</body>
</html>