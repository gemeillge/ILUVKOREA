<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<link href="/resources/css/admintable.css/" rel="stylesheet">
<link href="/resources/css/table.css" rel="styleshhet">
</head>
<style>
.container .card{
	width :23%;
	margin-left : 1%;
	display: inline-block;
	margin-bottom:10px;
	
}

.card img{
 height: 250px;
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
            <div id="sidebar-wrapper">
                <ul class="sidebar-nav">
                    <li class="sidebar-brand" style="margin-top:62px;"onclick="location.href='/admin'"> 관리자 페이지 </li>
                    <li> <a href="/admin/noticelist">공지사항</a> </li>
                    <li> <a href="/admin/memberlist">회원목록</a></li>
                    <li> <a href="/admin/tourlist">관광지</a></li>
                    <li> <a href="/area/list">지역입력</a> </li>
                    <li> <a href="/city/list">도시입력</a> </li>     
                </ul>
            </div> 
            
            <!-- Page Content -->
    <div id="page-content-wrapper">   
		<div class="containe mt-5">
		<div class="row">
		<div class="col-md-8 mx-auto">
			<h2 style="text-align: center; margin-top: 5%;">관광지</h2>
			<form class="row">
				<div class="col-2 ms-1">
						<select name="search" class="form-control form-control-sm">
						<option value="0">전체 검색</option>
						<option value="1" ${pager.search == 1 ? 'selected' : ''}>관광지명</option>
						<option value="2" ${pager.search == 2 ? 'selected' : ''}>도시명</option>
					</select>
				</div>					
				<div class="col-3 ms-1">
					<input type="text" name="keyword" class="form-control form-control-sm" value="${pager.keyword}" placeholder="검색어를 입력해주세요" style="float:right;">
				</div>				
				<div class="col-7 mb-1" style="margin-left : -1%">
					<input type="submit" value="검색" class="btn btn-primary btn-sm mb-1" style="float:right;">
				</div>			
		
		<div class="container">
        <div style="margin:auto;">			
			<c:forEach var="item" items="${list}">
			  <div class="card">
			    <img src="/upload/files/${item.tourImages[0].filename}" class="card-img-top img-fluid" onclick="location.href='./tourview/${item.tourId}'">
			    <div class="card-body">
			      <h2 class="card-title">${item.tourName}</h2>
			      <h6 class="card-area">${item.areaName} ${item.cityName}</h6>
			      <a href="delete?tourId=${item.tourId}"></a>
			      </div>
			  </div>
			  </c:forEach>
			</div>	
			 
			</div>
				</form>
			<div class="pagination pagination-sm" style="justify-content:center">
					<div class="page-item"><a href="?page=1&${pager.query}" class="page-link">처음</a></div>
					<div class="page-item"><a href="?page=${pager.prev}&${pager.query}" class="page-link">이전</a></div>
						<c:forEach var="page" items="${pager.list}">
							<div class="page-item ${pager.page == page?'active':''}"><a href="?page=${page}&${pager.query}" class="page-link">${page}</a></div>
						</c:forEach>
					<div class="page-item"><a href="?page=${pager.next}&${pager.query}" class="page-link">다음</a></div>
					<div class="page-item"><a href="?page=${pager.last}&${pager.query}" class="page-link">마지막</a></div>
				</div>
		
		<a type="button" class="btn btn-primary mx-1" href="./" style="float: right;">이전</a>
		
				   <c:if test="${sessionScope.member.id == 'admin'}">
			<a type="button" class="btn btn-secondary" href="/admin/touradd" style="float: right;">등록</a>
			    </c:if>
		</div>
		</div>
		</div>
		</div>
		</div>
</body>
</html>