<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<title></title>
</head>
<script>
	$(function() {
	
	$("textarea").summernote({
		  height: 300,                 // 에디터 높이
		  minHeight: null,             // 최소 높이
		  maxHeight: null,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
	});
	
	function goBack() {
		//history.back();
		location.href = ".";
	}
</script>

<body>
	<div class="page-content page-container" id="page-content">
		<div class="padding">
		<div class="row container d-flex justify-content-center">
			 <div id="card" class="col-lg-5 grid-margin stretch-card">	 
			  <div class="card mt-5">
                    <div class="card-body">
                        <h4 class="card-title">게시글 변경</h4>
		<form name="form" method="post" action="update" class="forms-sample">
			<div> <input type="hidden" name="noticeId" value="${item.noticeId}"> </div>
			<div class="form-group"><label>작성일자:</label> 
				<fmt:formatDate value="${item.nDate}" pattern="yyyy-MM-dd"/>
			</div>
			<div class="form-group">
				<label>조회수 : ${item.nviewCnt} </label>
			</div> 
			<div class="form-group">
				<label>제목:</label> 
				<input name="nSubject" type="text" value="${item.nSubject}" class="form-control">
			</div>
			<div class="form-group">
				<label>내용:</label>
				<textarea name="nContent" cols="80" rows="50">${item.nContent}</textarea>
			</div>
			<div class="form-group">
				<label>작성자</label>
				 <input name="nWriter" type="text" value="${item.nWriter}" class="form-control">
			</div>
		
       <%--   <div>
				<label>첨부파일:</label> <input name="fil" type="text" value="${item.fil}">
			</div> --%>
					
			
			<div>
				<button class="btn btn-outline-primary btn-icon-text"><i class="fa fa-check btn-icon-prepend">변경</i></button>				
				<button class="btn btn-outline-success btn-icon-text" onclick="goBack()"><i class="fa fa-warning btn-icon-prepend">취소</i></button>
			</div>
		</form>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
</body>
</html>