<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	$(document).ready(function(){
		$("save").click(function(){
			var bSubject = $("#bSubject").val();
			var bContent = $("#bContent").val();
			var bWriter = $("#bWriter").val();
			if(bSubject==""){
				alert("제목을 입력하세요")
				document.form.bSubject.focus();
				return;
			}
			if(bContent==""){
				alert("내용을 입력하세요")
				document.form.bContent.focus();
				return;
			}
			if(bWriter==""){
				alert("이름을 입력하세요")
				document.form.bWriter.focus();
				return;
				
			}
			document.form.submit()
		});
	});
	
	$(function() {
		
		$("textarea").summernote({
			  height: 300,                 // 에디터 높이
			  minHeight: null,             // 최소 높이
			  maxHeight: null,             // 최대 높이
			  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
			  lang: "ko-KR",					// 한글 설정
			  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
		});
	});
		
		$("#add").click(function() {
			html = '<div>';;
			html+='<input type="file" name="files">';
			html+='<p class="delete">삭제</p>';
			html+='</div>';
			
			$("#images").append( $(html) );
		});
		
		$("#images").on("click", ".delete", function(){
			$(this).parent().remove();
		});
	
</script>

<body>
	<div class="page-content page-container" id="page-content">
		<div class="padding">
		<div class="row container d-flex justify-content-center" style="margin: 5% auto;">
			 <div class="col-lg-5 grid-margin stretch-card">	 
			  <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">게시글 등록</h4>
		<form name="form" method="post" action="add" class="forms-sample"> 
			<div class="form-group"><label>제목:</label> 
			<input name="bSubject" id="bSubject" type="text" class="form-control">
			</div>
			
			<div class="form-group"><label>내용:</label> 
				<textarea name="bContent" id="bContent" cols="80" rows="50"></textarea>
			</div>
			<div class="form-group"><label>작성자:</label> 
				<input name="bWriter" id="bWriter" class="form-control" value="${sessionScope.member.id}" readonly>
			</div>
			<!-- <div>
				<label>작성일:</label>
				<input name="bDate" id="bDate" type="date">
			</div> -->
		
			<div>
				<button type="button" onclick="location.href = '${path}/board/list';"  class="btn btn-outline-success btn-icon-text" style="float: right; ">
				<i class="fa fa-warning btn-icon-prepend">취소</i></button>
				
				<button class="btn btn-outline-secondary btn-icon-text" type="reset" style="float: right; margin-right: 10px; ">
				<i class="fa fa-pencil btn-icon-append">다시설정</i></button>
				<button id="save" type="submit" class="btn btn-outline-primary btn-icon-text" style="float: right; margin-right: 10px;">
				<i class="fa fa-check btn-icon-prepend">등록</i></button>
			
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