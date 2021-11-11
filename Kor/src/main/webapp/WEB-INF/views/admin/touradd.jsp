<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css">
<link href="/resources/css/admin.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<script>
	$(function() {
		$("#menu-toggle").click(function(e) {
			e.preventDefault();
			$("#wrapper").toggleClass("toggled");
		});

		$(window).resize(function(e) {
			if ($(window).width() <= 768) {
				$("#wrapper").removeClass("toggled");
			} else {
				$("#wrapper").addClass("toggled");
			}
		});

		$("textarea").summernote({
			height : 250, // 에디터 높이
			minHeight : null, // 최소 높이
			maxHeight : null, // 최대 높이
			focus : true, // 에디터 로딩후 포커스를 맞출지 여부
			lang : "ko-KR", // 한글 설정
			placeholder : '최대 2048자까지 쓸 수 있습니다' //placeholder 설정
		});

		$("#images").on("click", ".delete", function() {
			$(this).parent().remove();
		});
	});
</script>
<style>
.navbar {
	position: fixed;
	width: 100%;
	z-index: 2000;
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
				<li class="sidebar-brand" style="margin-top: 62px;"
					onclick="location.href='/admin'">관리자 페이지</li>
				<li><a href="/admin/noticelist">공지사항</a></li>
				<li><a href="/admin/memberlist">회원목록</a></li>
				<li><a href="/admin/tourlist">관광지</a></li>
				<li><a href="/area/list">지역입력</a></li>
				<li><a href="/city/list">도시입력</a></li>
			</ul>
		</div>

		<!-- Page Content -->
		<div class="page-content page-container" id="page-content">
			<div class="padding">
				<div class="row container d-flex justify-content-center"
					style="margin: auto;">
					<div class="col-lg-5 grid-margin stretch-card">
						<div class="card" style="margin-top: 20%;">
							<div class="card-body">
								<h4 class="card-title">관광지 등록</h4>
								<form method="post" enctype="multipart/form-data">
									<div class="form-group">
										<label>관광지명</label> <input type="text" name="tourName"
											class="form-control">
									</div>

									<div class="form-group row">
										<div class="col-6">
											<label>위도</label> <input type="text" name="tourMapx"
												class="form-control">
										</div>

										<div class="col-6">
											<label>경도</label> <input type="text" name="tourMapy"
												class="form-control">
										</div>
									</div>

									<div class="form-group row">
										<div class="col-6">
											<label>지역명:</label> <select name="areaId"
												class="form-control">
												<c:forEach var="areaitem" items="${arealist}">
													<option value="${areaitem.areaId}"
														${item.areaId == areaitem.areaId ? "selected" : ""}>${areaitem.areaName}</option>
													<!-- 셀렉트박스 -->
												</c:forEach>
											</select>
										</div>

										<div class="col-6">
											<label>도시명:</label> <select name="cityId" class="form-control">
												<c:forEach var="cityitem" items="${citylist}">
													<option value="${cityitem.cityId}"
														${item.cityId == cityitem.cityId ? "selected" : ""}>${cityitem.cityName}</option>
													<!-- 셀렉트박스 -->
												</c:forEach>
											</select>
										</div>
									</div>
									
									<div>
										<label for="formFile" class="form-label">상품이미지</label> <input
											type="file" name="files" class="form-control">
									</div>
									

									<div class="form-group">
										<label>내용</label>
										<textarea name="tourCon" rows="10" cols="20"
											class="form-control"></textarea>
									</div>
									<div style="margin-top: 10px;">
										<a href="./tourlist"
											class="btn btn-outline-success btn-icon-text" type="button"
											style="float: right;"> <i
											class="fa fa-warning btn-icon-prepend">취소</i></a>
										<button id="save" type="submit"
											class="btn btn-outline-primary btn-icon-text"
											style="float: right; margin-right: 8px;">
											<i class="fa fa-check btn-icon-prepend"></i>등록
										</button>
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