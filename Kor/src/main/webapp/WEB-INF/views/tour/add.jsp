<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<script>
$(function() {
	$("textarea").summernote();
	
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
});

</script>

</head>
<body>
	<div>
	<div class="page-content page-container" id="page-content">
		<div class="padding">
		<div class="row container d-flex justify-content-center" style="margin:auto;">
			 <div class="col-lg-5 grid-margin stretch-card">	 
			  <div class="card mt-5">
                    <div class="card-body">
                        <h4 class="card-title">관광지 등록</h4>
		<form method="post" enctype="multipart/form-data " class="forms-sample">	
			<div class="form-group"><label>관광지명:</label>
				<input type="text" name="tourName" class="forms-sample" id="tourName">
			</div>	
			<div class="form-group"><label>위도:</label>
				<input type="text" name="tourMapx" class="forms-sample" id="tourMapx">
			</div>		
			<div class="form-group">
				<label>경도:</label>
				<input type="text" name="tourMapy" class="forms-sample" id="tourMapy">
			</div>	
			
			<div class="form-group"><label>지역명:</label>
				<select name="areaId">
					<c:forEach var="item" items="${arealist}">
					<option value="${item.areaId}">${item.areaName}</option> <!-- 셀렉트박스 -->
					</c:forEach>
				</select>
			</div>
			
			<div class="form-group"><label>도시명:</label>
				<select name="cityId">
					<c:forEach var="item" items="${citylist}">
					<option value="${item.cityId}">${item.cityName}</option> <!-- 셀렉트박스 -->
					</c:forEach>
				</select>
			</div>		
			<div class="form-group">
			<label>상품이미지:</label>				
					<p id="add">추가</p>				
				<div>
					<input type="file" name="files"> 					
				</div>
			</div>	
				<div class="form-group">
				<label>내용:</label>
				<textarea id="tourCon" name="tourCon" rows="60" cols="30"></textarea>		
			</div>
				
				
			<div>
				<button id="save" type="submit" class="btn btn-outline-primary btn-icon-text">
				<i class="fa fa-check btn-icon-prepend">등록</i></button>
				<button class="btn btn-outline-secondary btn-icon-text" type="reset">
				<i class="fa fa-pencil btn-icon-append">다시설정</i></button>
				<a type="button" href="list" class="btn btn-outline-success btn-icon-text">
				<i class="fa fa-warning btn-icon-prepend"></i>목록으로</a>
			</div>
		</form>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
</body>
</html>