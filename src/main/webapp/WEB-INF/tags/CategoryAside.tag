<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<div class="row">
	<div class="col">
		<nav class="navbar navbar-expand-lg navbar-light">
			<a class="navbar-brand" href="/controller/adminPage/AdminMain">HomeArt</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active">
						<a class="nav-link" href="/controller/">
							홈아트
							<span class="sr-only">(current)</span>
						</a>
					</li>

					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-expanded="false"> 작가그림공유 </a>
						<div class="dropdown-menu" aria-labelledby="navbarDropdown">
							<a class="dropdown-item" href="/controller/adminPage/adminPicShare/AdminPicShare">공유게시판</a>

							<a class="dropdown-item" href="/controller/adminPage/adminPicShare/AdminPicAdmit">그림검열</a>
						</div>
					</li>

					<li class="nav-item active">
						<a class="nav-link" href="/controller/adminPage/adminPic/AdminPicBoard">
							명화게시판
							<span class="sr-only">(current)</span>
						</a>
					</li>

					<li class="nav-item active">
						<a class="nav-link" href="#">
							자유게시판
							<span class="sr-only">(current)</span>
						</a>
					</li>

					<li class="nav-item active">
						<a class="nav-link" href="/controller/adminPage/adminNotice/AdminNoticeCUD">
							공지사항
							<span class="sr-only">(current)</span>
						</a>
					</li>

					<li class="nav-item active">
						<a class="nav-link" href="/controller/adminPage/adminMemManage/AdminMemManage">
							회원관리
							<span class="sr-only">(current)</span>
						</a>
					</li>
				</ul>
			</div>
		</nav>
	</div>
</div>


