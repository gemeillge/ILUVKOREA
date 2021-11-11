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
<link href="/resources/css/admin.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<title></title>
</head>
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
		  height: 230,                 // 에디터 높이
		  minHeight: null,             // 최소 높이
		  maxHeight: null,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: '최대 2048자까지 쓸 수 있습니다'	//placeholder 설정
	});
});
	
</script>

<body>
 <nav class="navbar navbar-expand navbar-dark bg-primary" > 
     <a href="#menu-toggle" id="menu-toggle" class="navbar-brand">
     <span class="navbar-toggler-icon"></span></a> 
     <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarsExample02" aria-controls="navbarsExample02" aria-expanded="false"> 
     <span class="navbar-toggler-icon"></span> </button>
            <div class="collapse navbar-collapse" id="navbarsExample02">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item"> <a class="nav-link" href="..">Home <span class="sr-only">(current)</span></a> </li>
                </ul>
                <form class="form-inline my-2 my-md-0"> </form>
            </div>
        </nav>
        <div id="wrapper" class="toggled">
        
            <!-- Sidebar -->
            <div id="sidebar-wrapper">
                <ul class="sidebar-nav">
                    <li class="sidebar-brand" onclick="location.href='/admin'"> 관리자 페이지 </li>
                    <li> <a href="/admin/noticelist">공지사항</a> </li>
                    <li> <a href="/admin/memberlist">회원목록</a></li>
                    <li> <a href="/admin/tourlist">관광지</a></li>
                    <li> <a href="/area/list">지역입력</a> </li>
                    <li> <a href="/city/list">도시입력</a> </li>     
                </ul>
            </div> 
            
            <!-- Page Content -->
            <div id="page-content-wrapper">      
	<div class="page-content page-container" id="page-content">
		<div class="padding">
		<div class="row container d-flex justify-content-center" style="margin:auto;">
			 <div id="card" class="col-lg-5 grid-margin stretch-card">	 
			  <div class="card mt-5">
                    <div class="card-body">
                        <h4 class="card-title">게시글 변경</h4>
		<form name="form" method="post" class="forms-sample">
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
				 <input name="nWriter" type="text" value="${item.nWriter}" class="form-control" readonly>
			</div>
		
       <%--   <div>
				<label>첨부파일:</label> <input name="fil" type="text" value="${item.fil}">
			</div> --%>
	
			<div>
				<button class="btn btn-outline-success btn-icon-text mx-2" style="float: right;"><i class="fa fa-warning btn-icon-prepend" onclick="location.href='/adminlist'">취소</i></button>
				<button class="btn btn-outline-primary btn-icon-text" style="float: right;"><i class="fa fa-check btn-icon-prepend">변경</i></button>				
			</div>
		</form>
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