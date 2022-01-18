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
	background-color: white;
}

</style>

</head>
<body>

<b:navBar></b:navBar>

<div class="contents-wrap">

		<div class="container px-4 px-lg-8 my-5">
				<h1>명화 추천</h1>
			<div class="row gx-4 gx-lg-5 align-items-center">
				<div class="row align-items-center">
					<form method="post" enctype="multipart/form-data">
					<div class="image-container">
						<img style="width: 500px;" id="preview-image"
							src="https://dummyimage.com/500x500/ffffff/000000.png&text=preview+image">
						<input style="display: block;" type="file" id="input-image" name="file">
					</div>
					<!-- form>.form-group*3>label[for=input$]+input.form-control#input$ -->
						<div class="form-group">
							<label for="input1">작품명</label> <input type="text"
								class="form-control" id="input1" name="title">
						</div>
						<div class="form-group">
							<label for="input2">국가</label> <input type="text"
								class="form-control" id="input2" name="country">
						</div>
						<div class="form-group">
							<label for="input3">작가</label> <input type="text"
								class="form-control" id="input3" name="artist">
						</div>
						<div class="form-group">
							<label for="input4">시대</label> <input type="text"
								class="form-control" id="input4" name="age">
						</div>
						<div class="form-group">
							<label for="input5">작품 설명</label> <input type="text"
								class="form-control" id="input5" name="content">
						</div>
						<div class="form-group">
							<label for="input6">id</label> <input type="text"
								class="form-control" id="input6" name="member_id">
						</div>
						
						<!-- .form-group>label[for=input4]+input[type=file].form-control-file#input4[name=files] -->
						<!-- <div class="form-group">
          				<label for="input6">이미지 파일</label>
         			 	<input type="file" class="form-control-file" id="input4" name="files" accept="image/*" multiple>
        				  </div>
						<input type="hidden" name="member_id"
							value="${sessionScope.loggedInMember.member_id }"> -->

						<button class="btn btn-outline-primary" type="submit">등록</button>
					</form>
				</div>
			</div>
		</div>

		<b:bottomInfo></b:bottomInfo>
</div>

<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF" crossorigin="anonymous"></script>
<script>
function readImage(input) {
    // 인풋 태그에 파일이 있는 경우
    if(input.files && input.files[0]) {
        // 이미지 파일인지 검사 (생략)
        // FileReader 인스턴스 생성
        const reader = new FileReader()
        // 이미지가 로드가 된 경우
        reader.onload = e => {
            const previewImage = document.getElementById("preview-image")
            previewImage.src = e.target.result
        }
        // reader가 이미지 읽도록 하기
        reader.readAsDataURL(input.files[0])
    }
}
// input file에 change 이벤트 부여
const inputImage = document.getElementById("input-image")
inputImage.addEventListener("change", e => {
    readImage(e.target)
});
</script>

</body>
</html>











