<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="aside" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css" integrity="sha384-zCbKRCUGaJDkqS1kPbPd7TveP5iyJE0EjAuZQTgFLD2ylzuqKfdKlfG/eSrtxUkn" rel="stylesheet" crossorigin="anonymous">
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" integrity="sha512-1ycn6IcaQQ40/MKBW2W4Rhis/DbILU74C1vSrLJxCq57o941Ym01SwNsOMqvEBFlcgUa6xLiPY/NS5R+E6ztJQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<title>ManageMember</title>

<style>
span {
	color: rgb(173, 166, 146);
}

body {
	background: rgb(71, 66, 63) !important;
}
</style>

<script>
    	
    </script>
</head>
<body>
	<div class="container-fluid">
		
		<aside:CategoryAside/>

		<div class="row mt-3">
			<div class="col-3">
					<form id="searchForm" action="/controller/adminPage/adminMemManage/AdminMemManage" method="get">
						<div class="input-group mb-3">
						<input type="text" class="form-control" placeholder="회원ID" 
						aria-label="Recipient's username" aria-describedby="basic-addon2"
						id="input1" name="keyword" value="<c:out value='${pageMaker.cri.keyword}'/>"/>
						<div class="input-group-append">
							<button class="btn btn-default">찾기</button>
						</div>
						</div>
						<input type="hidden" name="pageNum" value="<c:out value='${pageMaker.cri.pageNum}'/>"/>
						<input type="hidden" name="amount" value="<c:out value='${pageMaker.cri.amount}'/>"/>
					</form>
				<h4>회원목록</h4>
				<div class="panel-body">
					<table width="100%" class="table table-striped table-bordered">
						<thead>
							<th>회원ID</th>
						</thead>
						<tbody id="table1">
							<c:forEach items="${list}" var="list">
								<tr class="odd">
									<td>
										<a onclick="
											location.search ='?pageNum=${pageMaker.cri.pageNum}&amount=${pageMaker.cri.amount}&member_id=${list.member_id}'
										"> 
										${list.member_id} 
										</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
					<form id="actionForm" action="/controller/adminPage/adminMemManage/AdminMemManage" method="get">
						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
						<input type="hidden" name="keyword" value="<c:out value='${pageMaker.cri.keyword}'/>"/>
					</form>
					
					<nav aria-label="Page navigation example">
					  <ul class="pagination">
					  	<c:if test="${pageMaker.prev}">
						    <li class="page-item">
						      <a class="page-link" href="${pageMaker.startPage - 1}" aria-label="Previous">
						        <span aria-hidden="true">&laquo;</span>
						      </a>
						    </li>
						</c:if>
						
						<c:forEach var="num" begin="${pageMaker.startPage}"
						end="${pageMaker.endPage}">
						    <li class='page-item ${pageMaker.cri.pageNum == num ? "active": ""}'>
						    <a class="page-link" href="${num}">${num}</a></li>
						</c:forEach>
						
						<c:if test="${pageMaker.next}">
						    <li class="page-item">
						      <a class="page-link" href="${pageMaker.endPage+1}" aria-label="Next">
						        <span aria-hidden="true">&raquo;</span>
						      </a>
						    </li>
						</c:if>
					  </ul>
					</nav>
				</div>
			</div>

			<div class="col-5 align-self-center justify-content-center">
				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroup-sizing-default">이름</span>
					</div>
					<input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" readonly="readonly" value="${list1.member_name}">
				</div>

				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroup-sizing-default">회원ID</span>
					</div>
					<input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" readonly="readonly" value="${list1.member_id}">
				</div>

				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroup-sizing-default">닉네임</span>
					</div>
					<input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" readonly="readonly" value="${list1.nickName}">
				</div>

				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroup-sizing-default">주소</span>
					</div>
					<input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" readonly="readonly" value="${list1.country}">
				</div>

				<div class="input-group mb-3">
					<div class="input-group-prepend">
						<span class="input-group-text" id="inputGroup-sizing-default">회원 밴</span>
					</div>
					<input type="text" class="form-control" aria-label="Default" aria-describedby="inputGroup-sizing-default" placeholder="사유 입력">
					<div class="input-group-append">
						<button class="btn" type="button">제출하기</button>
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
    
    $(document).ready(function() {
    	
    	var actionForm = $("#actionForm");
    	
    	$(".page-item a").on("click", function(e){
    		e.preventDefault();
    		
    		console.log('click');
    		
    		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
    		actionForm.submit();
    	});
	    
    	var searchForm = $("#searchForm");
	    
	    $("#searchForm button").on("click", function(e){
	    	if(!searchForm.find("input[name='keyword']").val()){
	    		alert("키워드를 입력하세요");
	    		return false;
	    	}
	    	
	    	searchForm.find("input[name='pageNum']").val("1");
	    	e.preventDefault();
	    	
	    	searchForm.submit();
	    });
    });
    
    
    </script>
</body>
</html>