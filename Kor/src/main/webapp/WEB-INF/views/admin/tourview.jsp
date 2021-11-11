<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="/resources/css/table.css/" rel="stylesheet">
<link href="/resources/css/admintable.css/" rel="stylesheet">
<title></title>
<style>

body {
	margin: 0 auto;
	text-align: center;
}

img{
	width: 50%;
	height: 500px;
	padding-bottom: 10px;
}
.navbar{
	position: fixed;
	width: 100%;
	z-index:2000;
	
}
</style>
<script>
$(function(){
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
                    <li class="nav-item"> <a class="nav-link" href="..">Home <span class="sr-only"></span></a> </li>
                </ul>
                <form class="form-inline my-2 my-md-0"> </form>
            </div>
        </nav>
        <div id="wrapper" class="toggled">
        
            <!-- Sidebar -->
            <div id="sidebar-wrapper" >
                <ul class="sidebar-nav" style="text-align: left;">
                    <li class="sidebar-brand" style="margin-top:62px;" onclick="location.href='/admin'"> 관리자 페이지 </li>
                    <li> <a href="/admin/noticelist">공지사항</a> </li>
                    <li> <a href="/admin/memberlist">회원목록</a></li>
                    <li> <a href="/admin/tourlist">관광지</a></li>
                    <li> <a href="/area/list">지역입력</a> </li>
                    <li> <a href="/city/list">도시입력</a> </li>     
                </ul>
            </div> 
            
            <!-- Page Content -->
	<div id="page-content-wrapper">   
		<div class="container">
			<h3 style="margin:auto; margin:7% 0 2% 0;">상세보기 페이지</h3>
			<div>
			<c:forEach var="item" items="${item.tourImages}">	
				<img src="/upload/files/${item.filename}">
			</c:forEach>
			</div>
			<table border="1" style="margin:0 auto; width: 50%;">
				<thead>
					<tr style="font-size:30px;"  >
						<td>${item.tourName}</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td style="font-size:16px;"> ${item.areaName} / ${item.cityName}</td>		
					</tr>
					<tr>
						<td style="font-size:14px;">${item.tourCon}</td>
					
					</tr>
				</tbody>
			</table>
	<div style="margin-top:20px; padding-left: 31%;">
	<button type="button" onclick='location.href = "/admin/tourupdate/${item.tourId}"' class="btn btn-primary btn-sm" style="">수정</button>
	<button type="button" onclick='location.href = "/admin/tourdelete/${item.tourId}"' class="btn btn-danger btn-sm" style="">삭제</button>
	<a type="button" class="btn btn-outline-success btn-sm" href="../tourlist">이전</a>
	</div>
</div>
</div>	
</div>
</body>
</html>