<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css">
<link href="/resources/css/addboard.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
</head>
<script>
	$(function() {
		$("#btnDelete").click(function() {
			if (alert("삭제하시겠습니까?")) {
				document.form1.action = "/delete?planId=${item.planId}";
				// 폼에 입력한 데이터를 서버로 전송
				document.form1.submit();
			}
		});
	});

</script>
<body>
<div class="page-content page-container" id="page-content">
		<div class="padding">
		<div class="row container d-flex justify-content-center" style="margin:auto; margin-top:5%;">
			 <div class="col-lg-5 grid-margin stretch-card">	 
			  <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">글 상세보기</h4>
	<form name="form" method="post">
		<div class="form-group">번호: ${item.planId}</div>
		<div class="form-group">제목: ${item.planTitle}</div>
		<div class="form-group">인원수: ${item.planMsize}</div>
		<div class="form-group">내용: ${item.planConcept}</div>
		<div class="form-group">일수: ${item.planDay}</div>
		<div class="form-group">시작일: ${item.planSday}</div>
		<div class="form-group">종료일: ${item.planEday }</div>
		</form>
		</div>
		<div style="width: 100%; text-align: right;">
			<!-- 게시물번호를 hidden으로 처리 -->
		    <input type="hidden" name="planId" value="${item.planId}"> 
			<input type="button" value="수정" onClick="location.href = '/planner/update?planId=${item.planId}'" class="btn btn-secondary btn-sm mb-1">
			<button type="button" onclick="location.href='../list'" class="btn btn-outline-success btn btn-sm mb-1" style="margin-right: 5px;">이전</button></div>
		</div>
		</div>
		</div>
		</div>
		</div>

</body>
</html>