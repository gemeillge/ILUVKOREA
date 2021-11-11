<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link href="/resources/css/admin.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>

<script>
$(function() {
	
	 $("#menu-toggle").click(function(e) {
	        e.preventDefault();
	        $("#wrapper").toggleClass("toggled");
	    });

	    $(window).resize(function(e) {
	      if($(window).width()<=768){
	        $("#wrapper").removeClass("toggled");
	      }else{
	        $("#wrapper").addClass("toggled");
	      }
	    });
	    
		$("textarea").summernote({
			  height: 250,                 // 에디터 높이
			  minHeight: null,             // 최소 높이
			  maxHeight: null,             // 최대 높이
			  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
			  lang: "ko-KR",					// 한글 설정
			  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
		});
	
	$("#images").on("click", ".delete", function() {
		const tourImageId = $(this).data("id");
		const button = $(this);
		$.ajax({
			type: "DELETE",
			url: location.href + "/" + tourImageId,
			success: function(data) {					
				if(data == "OK") {						
					button.parent().remove();
				}
			}				
		});
	});
	
	$("#upload").click(function() {
		const form = document.getElementById("uploadForm");			
		const formData = new FormData(form);
		
		$.ajax({
			type: "POST",
			url: location.href + "/image",
			enctype: "multipart/form-data",
			data: formData,
			async: true,
			cache: false,
			contentType: false,
			processData: false,
			success: function(data) {					
				if(data != "") {
					let html = "<li><img src='/upload/files/";
					html += data.filename;
					html += "'><button class='delete' data-id='";
					html += data.tourImageId
					html += "'>삭제</button></li>"; 
					
					$("#images").append( $(html) );	
				}
			}
		});
	});
});
</script>
<style>
.navbar{
	position: fixed;
	width: 100%;
	z-index:2000;
	
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand navbar-dark bg-primary">
		<a href="#menu-toggle" id="menu-toggle" class="navbar-brand"> <span
			class="navbar-toggler-icon"></span></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarsExample02" aria-controls="navbarsExample02"
			aria-expanded="false">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarsExample02">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a class="nav-link" href="..">Home <span
						class="sr-only"></span></a></li>
			</ul>
			<form class="form-inline my-2 my-md-0"></form>
		</div>
	</nav>
	<div id="wrapper" class="toggled">

		<!-- Sidebar -->
		<div id="sidebar-wrapper">
			<ul class="sidebar-nav">
				<li class="sidebar-brand" style="margin-top:62px;" onclick="location.href='/admin'">관리자
					페이지</li>
				<li><a href="/admin/noticelist">공지사항</a></li>
				<li><a href="/admin/memberlist">회원목록</a></li>
				<li><a href="/admin/tourlist">관광지</a></li>
				<li><a href="/area/list">지역입력</a></li>
				<li><a href="/city/list">도시입력</a></li>
			</ul>
		</div>
		<div class="page-content page-container" id="page-content">
			<div class="padding">
				<div class="row container d-flex justify-content-center"
					style="margin: auto;">
					<div class="col-lg-5 grid-margin stretch-card">
						<div class="card" style="margin-top: 20%;">
							<div class="card-body">
								<h3>관광지 변경</h3> 
								
		<form method="post" enctype="multipart/form-data">
			<div>
				<a type="button" class="btn btn-outline-secondary btn-sm" href="/admin/tourlist" style="float: right; margin-bottom:5px;">목록</a>
				<button class="btn btn-outline-success btn-sm" style="float: right;margin-bottom:5px; margin-right:5px;">변경</button>
			</div>	
			<div>
				<input type="hidden" name="tourId" value="${item.tourId}">
			</div>		
			<div class="form-group"><label>관광지명</label>
				<input type="text" name="tourName" value="${item.tourName}" class="form-control">
			</div>	
			
			<div class="form-group row">
				<div class="col-6"><label>위도</label>
				<input type="text" name="tourMapx" value="${item.tourMapx}" class="form-control">
				</div>		
				<div class="col-6"><label>경도</label>
				<input type="text" name="tourMapy" value="${item.tourMapy}" class="form-control">
				</div>
			</div>
		
		<div class="form-group row"> 
				<div class="col-6"><label>지역명</label>
				<select name="areaId" class="form-control">
					<c:forEach var="areaitem" items="${arealist}">
					<option value="${areaitem.areaId}" ${item.areaId == areaitem.areaId ? "selected" : ""}>${areaitem.areaName}</option> <!-- 셀렉트박스 -->
					</c:forEach>
				</select>
				</div>
			
				<div class="col-6"> <label>도시명</label>
				<select name="cityId" class="form-control">
					<c:forEach var="cityitem" items="${citylist}">
						<option value="${cityitem.cityId}" ${item.cityId == cityitem.cityId ? "selected" : ""}>${cityitem.cityName}</option> <!-- 셀렉트박스 -->
					</c:forEach>
				</select>
				</div>	
			</div>
			
			<div class="form-group"><label>내용</label>
				<textarea name="tourCon" rows="60" cols="30">${item.tourCon}</textarea>
			</div>			
		</form>
	<div style="margin:5px 0;">		
		<form id="uploadForm">				
				<div class="input-group">
					<input type="file" name="uploadFile" class="form-control" id="inputGroupFile04">
					<button id="upload" class="btn btn-outline-secondary"  type="button" >이미지 추가</button>
				</div>
		</form>
			<ul id="images" style="list-style:none; list-style-type:none;">
			<c:forEach var="item" items="${item.tourImages}">						
				<li><img src="/upload/files/${item.filename}" width="250px;">
				<button class="delete" data-id="${item.tourImageId}">삭제</button></li>
			</c:forEach>
			<c:if test="${item.tourImages == null || item.tourImages.size() < 1}">
				<li>등록 된 상품이미지가 없습니다</li>
			</c:if>
		</ul>
	</div> 
	</div>	
	</div>
	</div>
	</div>
	</div>
	</div>
</div>
</body>
</html>