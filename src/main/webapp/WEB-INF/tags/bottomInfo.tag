<%@ tag language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %> 

<style>
.logo2 {
	width: 100px;
	height: 80px;
	margin: auto;
}

.white-text {
	text-color: #FFFFFF;
}

.githubAddress {
	color: black;
	text-decoration-line: none
}

</style>

<footer class="footer">
<div class="container footer-container">
	<div class="row footer-info">
		<div class="col">
			<div class="white-text">
				<div> <i class="fas fa-user-circle"></i> 민경대, 강성빈, 김원표, 김재헌, 정시윤 </div>
				<div> <i class="fas fa-info-circle"></i> INFP*3 ENFP ISFP / A1O4 / M3W2 </div>
				<a href="https://github.com/rudwl1005a/HomeArt" class="githubAddress"> <i class="fab fa-github"></i> https://github.com/rudwl1005a/HomeArt </a>
				<div> COPYRIGHT HOMEART 2022 ALL RIGHTS RESERVED </div>
			</div>
		</div>	
		<img class="logo2" src="<spring:url value='/resources/img/bottomlogo.jpg'/>" height="100px">
	</div>
</div>
</footer>


