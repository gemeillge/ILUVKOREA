<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/resources/css/admin.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-bs4.min.js"></script>
<title></title>
<script>
	$(function(){
		$("#btnDelete").click(function() {
			if (alert("삭제하시겠습니까?")) {
				document.form1.action = "/delete?noticeId=${item.noticeId}";
				// 폼에 입력한 데이터를 서버로 전송
				document.form1.submit();
			}
		});
		
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
		  });

</script>
</head>
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
		<div class="row container d-flex justify-content-center" style="margin:auto; margin-top:10%;">
			 <div class="col-lg-5 grid-margin stretch-card">	 
			  <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">게시글 상세보기</h4>
	<form name="form1" method="post">
		<div class="form-group"><!-- 원하는 날짜형식으로 출력하기 위해 fmt태그 사용 -->
			작성일자 :
		<fmt:formatDate value="${item.nDate}" pattern="yyyy-MM-dd " />
			<!-- 날짜 형식 => yyyy 4자리연도, MM 월, dd 일, a 오전/오후, HH 24시간제, hh 12시간제, mm 분, ss 초 -->
		</div>
		<div class="form-group">조회수 : ${item.nviewCnt}</div>
		<div class="form-group">
			제목 : 
			${item.nSubject}
		</div>
		<div class="form-group">
			내용
			<div>${item.nContent}</div>
		</div>
		<div class="form-group">
			작성자 : ${item.nWriter}
		</div>		

		</form>
		</div>
		<c:if test="${sessionScope.member.id == 'admin'}">
		<div style="width: 650px; text-align: center;">
			<!-- 게시물번호를 hidden으로 처리 -->
		    <input type="hidden" name="noticeId" value="${item.noticeId}"> 
			<input type="button" value="수정" onclick="location.href = '/admin/noticeupdate?noticeId=${item.noticeId}'" class="btn btn-secondary btn-sm mb-1"> 
			<button type="button" onclick='location.href = "/admin/noticedelete?noticeId=${item.noticeId}"' class="btn btn-danger btn-sm mb-1">삭제</button>
			<button type="button" onclick="location.href='../'" class="btn btn-outline-success btn-sm mb-1">이전</button></div>
		</c:if>	
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
</body>
</html>