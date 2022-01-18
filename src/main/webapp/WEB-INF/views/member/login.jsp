<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="b" tagdir="/WEB-INF/tags" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" crossorigin="anonymous">
<link href="${pageContext.request.contextPath}/resources/css/homeart.css" rel="stylesheet" type="text/css">
<link href="${pageContext.request.contextPath}/resources/css/member.css" rel="stylesheet" type="text/css">

<style>
#input1,#input2 {
	width: 517px;
	margin-bottom: 10px;
}

#loginButton, #signupButton {
	margin: 10px 7px 10px 0px;
	width: 150px;
}

table tr td {
	text-align: left;
	border-width: 1px;
	border-style: solid;
}

table tr th {
	text-align: center;
	border-style: solid;
	border-width: 1px;
}

</style>

<c:url value="/member/signup" var="signupUrl"></c:url>

<title>로그인</title>
</head>
<body>
<b:navBar></b:navBar>
	<div class="container">
		<div class="row justify-content-center align-items-center vertical-center">
			<div class="col-7">
				<h1 style="margin: 10px;">로그인</h1>
				<form method="post">
				<div class="row" style="margin-left: 5px;">
					<table>
						<tr>
							<th nowrap>아이디</th>
							<td>
								<input type="text" id="input1" class="form-control" name="member_id" required/>
							</td>
						</tr>
						<tr>
							<th nowrap>비밀번호</th>
							<td>
								<input type="password" id="input2" class="form-control" name="password" required />
							</td>
						</tr>
					</table>
					</div>
					<div style="text-align:center;">
						<button class="btn btn-dark" id="loginButton">로그인</button>
						<a class="btn btn-dark" id="signupButton" href="${signupUrl }">회원가입</a>
					</div>
				</form>
			</div>
		</div>
	</div>
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
</body>
</html>
