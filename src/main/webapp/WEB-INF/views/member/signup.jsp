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

<title>회원가입</title>

<style>

/* id,nickName */
#input1, #input4 { 
	width: 546px;
	display: inline;
}

/* password */
#input2, #input8 {
	width: 626px;
	display: inline;
}

/* other */
#input3,#input5,#input6,#input7 {
	width: 666px;
	margin-bottom: 10px;
}

#signupButton {
	margin: 10px 4px 10px 5px;
	width: 100px;
}

</style>

</head>
<body>
<b:navBar></b:navBar>
	<div class="container">
		<div class="row justify-content-center align-items-center vertical-center">
			<div class="col-9">
				<h1 style="margin: 10px;">회원가입</h1>
				
				<c:if test="${not empty alertMessage}">
			    	<div class="alert alert-warning">${alertMessage }</div>
			   	</c:if>
				
				<form method="post" id="signupForm">
					<p class="mustinfo">*는 필수 입력 항목입니다.</p>
					<table>
						<tr>
							<th nowrap>* 아이디</th>
							<td>
								<input type="text" class="form-control" id="input1" required name="member_id" value="${member.member_id }" />
								<a class="btn btn-dark" style="margin-left: 5px;" id="idCheckButton">중복 확인</a>
								<div class='valid'>아이디를 입력하세요. (영문 대/소문자, 숫자만 입력 가능)</div>
							</td>
						</tr>
						<tr>
							<th nowrap>* 비밀번호</th>
							<td>
								<input type="password" class="form-control" id="input2" required name="password" value="${member.password }" />
								<i id="pwchk1" class="fa fa-eye fa-lg"></i>
								<div class="valid">비밀번호를 입력하세요. (영문 대/소문자, 숫자만 입력 가능)</div>
							</td>
						</tr>
						<tr>
							<th nowrap>* 비밀번호 확인</th>
							<td>
								<input type="password" class="form-control" id="input8" required/>
								<i id="pwchk2" class="fa fa-eye fa-lg"></i>
								<div class="valid">비밀번호를 입력하세요. (영문 대/소문자, 숫자만 입력 가능)</div>
							</td>
						</tr>
						<tr>
							<th nowrap>* 이름</th>
							<td>
								<input type="text" class="form-control" id="input3" required name="member_name" value="${member.member_id }" />
							</td>
						</tr>
						<tr>
							<th nowrap>* 닉네임</th>
							<td>
								<input type="text" class="form-control" id="input4" required name="nickName" value="${member.nickName }" />
								<a class="btn btn-dark" style="margin-left: 5px;" id="nickNameCheckButton">중복 확인</a>
								<div class="valid">닉네임을 입력하세요. (영문 대/소문자, 숫자, 한글을 모두 포함)</div>
							</td>
						</tr>
						<tr>
							<th nowrap>이메일</th>
							<td>
								<input type="email" class="form-control" id="input5" name="email" value="${member.email }" />
							</td>
						</tr>
						<tr>
							<th nowrap>* 거주국가</th>
							<td>
								<input type="text" class="form-control" id="input6" required name="country" value="${member.country }" />
							</td>
						</tr>
						<tr>
							<th nowrap>* 관리자</th>
							<td>
								<input type="text" class="form-control" id="input7" required name="isAdmin" value="${member.isAdmin }" />
							</td>
						</tr>
					</table>
					<button class="btn btn-dark float-right" id="signupButton">가입</button>
				</form>
			</div>
		</div>
	</div>

<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<script>
	/* 비밀번호 보이기 */
	$(document).ready(function(){
	    $('#pwchk1').on('click',function(){
	        $(this).prev('input').toggleClass('active');
	        if($(this).prev('input').hasClass('active')){
	            $(this).attr('class',"fa fa-eye-slash fa-lg")
	            .prev('input').attr('type',"text");
	        }else{
	            $(this).attr('class',"fa fa-eye fa-lg")
	            .prev('input').attr('type','password');
	        }
	    });
	    
	    $('#pwchk2').on('click',function(){
	    	$(this).prev('input').toggleClass('active');
	        if($(this).prev('input').hasClass('active')){
	            $(this).attr('class',"fa fa-eye-slash fa-lg")
	            .prev('input').attr('type',"text");
	        }else{
	            $(this).attr('class',"fa fa-eye fa-lg")
	            .prev('input').attr('type','password');
	        }
	    });
	});

	/* 버튼마다 다른 행동
	$(document).ready(function(){
		const signupForm = $("#signupForm");
		
		$("#idCheck").click(function(e) {
			// 아이디 중복확인
			e.preventDefault();
			signupForm.attr("action", "");
			signupForm.submit();
		});
		
		$("#nickNameCheck").click(function(e) {
			// 닉네임 중복확인
			e.preventDefault();
			signupForm.attr("action", "");
			signupForm.submit();
		});
		
		$("#submit").click(function(e) {
			// 가입확인
			e.preventDefault();
			if(confirm("가입하시겠습니까?")){
				signupForm.attr("action", "remove");
				signupForm.submit();		
			}
		})
	});
	*/
</script>

</body>
</html>
