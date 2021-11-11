<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.1/font/bootstrap-icons.css">
<link href="/resources/css/index.css/" rel="stylesheet">
<title></title>
<script>
	$('#alerts').click(function(){
		alert("준비중입니다")
	});
	
	document.addEventListener("DOMContentLoaded", function(){
        document.querySelectorAll('.dropdown-menu').forEach(function(element){
        element.addEventListener('click', function (e) {
        e.stopPropagation();
        });
       })
   }); 
</script>
</head>
<body>
<div class="container">
<nav class="main-navigation">
	  <div class="navbar-header animated fadeInUp" style="margin-top: 1%;">
       <ul class="nav-list">
       <img src="/resources/image/logo.png" width="70" height="70" style="float: left;" onclick="location.href='..'">
            <li class="nav-list-item">
            <c:choose>
            	<c:when test="${sessionScope.member == null}">
                <a href="login" class="nav-link">Login</a>
            	</c:when>
            	<c:when test="${sessionScope.member != null}">
            	<a href="logout" class="nav-link">logout</a>
            	</c:when>
            </c:choose>
            
            </li>
            <li class="nav-list-item">
                <a href="planner/list" class="nav-link">Planner</a>
            </li>
            <li class="nav-list-item">
                <a href="board/list" class="nav-link">Board</a>
            </li>
            
             <li class="nav-list-item">
                <a href="tour/list" class="nav-link">Tour</a>
            </li>
            <c:if test="${sessionScope.member.id == 'admin'}">
            <li class="nav-list-item">
                <a href="admin/" class="nav-link">Admin</a>
            </li>
            </c:if>
              
            <c:if test="${sessionScope.member.id != null}">
            <li class="nav-list-item">
                <a href="member/update?id=${member.id}" class="nav-link">MyPage</a>
            </li>
            </c:if>
           
        </ul>
        </div>
	</nav>
	</div>
<div class="container">
	<nav class="navbar navbar-expand-lg navbar-dark">
	<div class="container-fluid">
	<button class="navbar-toggler " type="button" data-bs-toggle="collapse" data-bs-target="#main_nav"  aria-expanded="false" aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
	<div class="collapse navbar-collapse d-flex justify-content-center" id="main_nav">
		<ul class="navbar-nav">
			<li class="nav-item active dropdown has-megamenu">
				<a class="nav-link" href="#" data-bs-toggle="dropdown" style="color:black; font-size: 15px;">서울</a>
				<div class="dropdown-menu megamenu" role="menu">
					<div class="row g-3">

						<div class="col-lg-3 col-6">
							<div class="col-megamenu">
								<ul class="list-unstyled">
									<li><a href="#">중구 / 종로구</a></li>
									<li><a href="#">서대문구 / 강서구</a></li>
									<li><a href="#">양천구 / 구로구</a></li>
								</ul>
							</div>
						</div>
						<div class="col-lg-3 col-6">
							<div class="col-megamenu">
								<ul class="list-unstyled">
									<li><a href="#">은평구 / 강북구</a></li>
									<li><a href="#">도봉구 / 노원구</a></li>
									<li><a href="#">중랑구 / 동대문구</a></li>
								</ul>
							</div>  
						</div>
						<div class="col-lg-3 col-6">
							<div class="col-megamenu">
								<ul class="list-unstyled">
									<li><a href="#">금천구 / 관악구</a></li>
									<li><a href="#">성동구 / 광진구</a></li>
									<li><a href="#">동작구 / 영등포구</a></li>
								</ul>
							</div>
						</div>    
						<div class="col-lg-3 col-6">
							<div class="col-megamenu">
								<ul class="list-unstyled">
									<li><a href="#">마포구 / 용산구</a></li>
									<li><a href="#">강동구 / 서초구</a></li>
									<li><a href="#">강남구 / 송파구 / 성북구</a></li>
								</ul>
							</div>  
						</div>
					</div>
				</div> 
			</li>
			
			<li class="nav-item dropdown has-megamenu">
				<a class="nav-link" href="#" data-bs-toggle="dropdown"style="color:black; font-size: 15px; padding-left:60px;">인천/경기</a>
				<div class="dropdown-menu megamenu" role="menu">
					<div class="row g-3">
						<div class="col-lg-3 col-6">
							<div class="col-megamenu">
								<ul class="list-unstyled">
									<li><a href="#">인천</a></li>
									<li><a href="/tour/list?search=2&keyword=가평">가평</a></li>
									<li><a href="#">김포시 / 고양시 </a></li>
									<li><a href="#">파주시 / 양주시</a></li>
									<li><a href="#">포천시 / 의정부시</a></li>
								</ul>
							</div>
						</div>
						<div class="col-lg-3 col-6">
							<div class="col-megamenu">
								<ul class="list-unstyled">
									<li><a href="#">양평군 / 부천시 </a></li>
									<li><a href="#">광명시 / 안양시 </a></li>
									<li><a href="#">과천시 / 의왕시 </a></li>
									<li><a href="#">시흥시 / 군포시</a></li>
								</ul>
							</div>  
						</div>
						<div class="col-lg-3 col-6">
							<div class="col-megamenu">
								<ul class="list-unstyled">
									<li><a href="#">용인시 / 평택시</a></li>
									<li><a href="#">남양주시 / 하남시 </a></li>
									<li><a href="#">안성시 / 성남시</a></li>
									<li><a href="#">동두천시 / 연천군</a></li>
								</ul>
							</div>
						</div>    
						<div class="col-lg-3 col-6">
							<div class="col-megamenu">
								<ul class="list-unstyled">
									<li><a href="#">광주시 / 이천시</a></li>
									<li><a href="#">수원시 / 화성시 </a></li>
									<li><a href="#">여주군 / 오산시</a></li>
									<li><a href="#">안성시 / 구리시</a></li>
								</ul>
							</div>  
						</div>
					</div>
				</div> 
			</li>
			
			<li class="nav-item dropdown has-megamenu">
				<a class="nav-link" href="#" data-bs-toggle="dropdown" style="color:black; font-size: 15px; padding-left:60px;">강원도</a>
				<div class="dropdown-menu megamenu" role="menu">
					<div class="row g-3">
						<div class="col-lg-3 col-6">
							<div class="col-megamenu">
								<ul class="list-unstyled">
									<li><a href="/tour/list?search=2&keyword=속초 ">속초시 / 양양군</a></li>
									<li><a href="#">양구군 / 인제군</a></li>
									<li><a href="#">고성군 / 삼척시</a></li>
								</ul>
							</div>
						</div>
						<div class="col-lg-3 col-6">
							<div class="col-megamenu">
								<ul class="list-unstyled">
									<li><a href="#">춘천시 / 동해시</a></li>
									<li><a href="#">태백시 / 철원군</a></li>
								</ul>
							</div>  
						</div>
						<div class="col-lg-3 col-6">
							<div class="col-megamenu">
								<ul class="list-unstyled">
									<li><a href="#">원주시 / 횡성군</a></li>
									<li><a href="#">화천군 / 화천시</a></li>
								</ul>
							</div>
						</div>    
						<div class="col-lg-3 col-6">
							<div class="col-megamenu">
								<ul class="list-unstyled">
									<li><a href="#">평창군 / 강릉시</a></li>
									<li><a href="#">영월군 / 정선군</a></li>
								</ul>
							</div>  
						</div>
					</div>
				</div> 
			</li>
			
			<li class="nav-item dropdown has-megamenu">
				<a class="nav-link" href="#" data-bs-toggle="dropdown" style="color:black; font-size: 15px; padding-left:60px;">충청도</a>
				<div class="dropdown-menu megamenu" role="menu">
					<div class="row g-3">
						<div class="col-lg-3 col-6">
							<div class="col-megamenu">
								<h6 class="title">Title Menu One</h6>
								<ul class="list-unstyled">
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
								</ul>
							</div>
						</div>
						<div class="col-lg-3 col-6">
							<div class="col-megamenu">
								<h6 class="title">Title Menu Two</h6>
								<ul class="list-unstyled">
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
								</ul>
							</div>  
						</div>
						<div class="col-lg-3 col-6">
							<div class="col-megamenu">
								<h6 class="title">Title Menu Three</h6>
								<ul class="list-unstyled">
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
								</ul>
							</div>
						</div>    
						<div class="col-lg-3 col-6">
							<div class="col-megamenu">
								<h6 class="title">Title Menu Four</h6>
								<ul class="list-unstyled">
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
								</ul>
							</div>  
						</div>
					</div>
				</div> 
			</li>
			
			<li class="nav-item dropdown has-megamenu">
				<a class="nav-link" href="#" data-bs-toggle="dropdown" style="color:black; font-size: 15px; padding-left:60px;">경상도</a>
				<div class="dropdown-menu megamenu" role="menu">
					<div class="row g-3">
						<div class="col-lg-3 col-6">
							<div class="col-megamenu">
								<h6 class="title">Title Menu One</h6>
								<ul class="list-unstyled">
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
								</ul>
							</div>
						</div>
						<div class="col-lg-3 col-6">
							<div class="col-megamenu">
								<h6 class="title">Title Menu Two</h6>
								<ul class="list-unstyled">
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
								</ul>
							</div>  
						</div>
						<div class="col-lg-3 col-6">
							<div class="col-megamenu">
								<h6 class="title">Title Menu Three</h6>
								<ul class="list-unstyled">
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
								</ul>
							</div>
						</div>    
						<div class="col-lg-3 col-6">
							<div class="col-megamenu">
								<h6 class="title">Title Menu Four</h6>
								<ul class="list-unstyled">
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
								</ul>
							</div>  
						</div>
					</div>
				</div> 
			</li>
			
			<li class="nav-item dropdown has-megamenu">
				<a class="nav-link" href="#" data-bs-toggle="dropdown" style="color:black; font-size: 15px; padding-left:60px;">광주/전라도</a>
				<div class="dropdown-menu megamenu" role="menu">
					<div class="row g-3">
						<div class="col-lg-3 col-6">
							<div class="col-megamenu">
								<h6 class="title">Title Menu One</h6>
								<ul class="list-unstyled">
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
								</ul>
							</div>
						</div>
						<div class="col-lg-3 col-6">
							<div class="col-megamenu">
								<h6 class="title">Title Menu Two</h6>
								<ul class="list-unstyled">
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
								</ul>
							</div>  
						</div>
						<div class="col-lg-3 col-6">
							<div class="col-megamenu">
								<h6 class="title">Title Menu Three</h6>
								<ul class="list-unstyled">
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
								</ul>
							</div>
						</div>    
						<div class="col-lg-3 col-6">
							<div class="col-megamenu">
								<h6 class="title">Title Menu Four</h6>
								<ul class="list-unstyled">
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
								</ul>
							</div>  
						</div>
					</div>
				</div> 
			</li>
			
			<li class="nav-item dropdown has-megamenu">
				<a class="nav-link " href="#" data-bs-toggle="dropdown" style="color:black; font-size: 15px; padding-left:60px;">부산</a>
				<div class="dropdown-menu megamenu" role="menu">
					<div class="row g-3">
						<div class="col-lg-3 col-6">
							<div class="col-megamenu">
								<h6 class="title">Title Menu One</h6>
								<ul class="list-unstyled">
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
								</ul>
							</div>
						</div>
						<div class="col-lg-3 col-6">
							<div class="col-megamenu">
								<h6 class="title">Title Menu Two</h6>
								<ul class="list-unstyled">
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
								</ul>
							</div>  
						</div>
						<div class="col-lg-3 col-6">
							<div class="col-megamenu">
								<h6 class="title">Title Menu Three</h6>
								<ul class="list-unstyled">
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
								</ul>
							</div>
						</div>    
						<div class="col-lg-3 col-6">
							<div class="col-megamenu">
								<h6 class="title">Title Menu Four</h6>
								<ul class="list-unstyled">
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
								</ul>
							</div>  
						</div>
					</div>
				</div> 
			</li>
			
			<li class="nav-item dropdown has-megamenu">
				<a class="nav-link" href="#" data-bs-toggle="dropdown" style="color:black; font-size: 15px; padding-left:60px;">대전/세종</a>
				<div class="dropdown-menu megamenu" role="menu">
					<div class="row g-3">
						<div class="col-lg-3 col-6">
							<div class="col-megamenu">
								<h6 class="title">Title Menu One</h6>
								<ul class="list-unstyled">
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
								</ul>
							</div>
						</div>
						<div class="col-lg-3 col-6">
							<div class="col-megamenu">
								<h6 class="title">Title Menu Two</h6>
								<ul class="list-unstyled">
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
								</ul>
							</div>  
						</div>
						<div class="col-lg-3 col-6">
							<div class="col-megamenu">
								<h6 class="title">Title Menu Three</h6>
								<ul class="list-unstyled">
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
								</ul>
							</div>
						</div>    
						<div class="col-lg-3 col-6">
							<div class="col-megamenu">
								<h6 class="title">Title Menu Four</h6>
								<ul class="list-unstyled">
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
								</ul>
							</div>  
						</div>
					</div>
				</div> 
			</li>
			
			<li class="nav-item dropdown has-megamenu">
				<a class="nav-link" href="#" data-bs-toggle="dropdown" style="color:black; font-size: 15px; padding-left:60px;">대구/울산</a>
				<div class="dropdown-menu megamenu" role="menu">
					<div class="row g-3">
						<div class="col-lg-3 col-6">
							<div class="col-megamenu">
								
								<ul class="list-unstyled">
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
								</ul>
							</div>
						</div>
						<div class="col-lg-3 col-6">
							<div class="col-megamenu">
								
								<ul class="list-unstyled">
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
								</ul>
							</div>  
						</div>
						<div class="col-lg-3 col-6">
							<div class="col-megamenu">
								
								<ul class="list-unstyled">
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
								</ul>
							</div>
						</div>    
						<div class="col-lg-3 col-6">
							<div class="col-megamenu">
								
								<ul class="list-unstyled">
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
									<li><a href="#">Custom Menu</a></li>
								</ul>
							</div>  
						</div>
					</div>
				</div> 
			</li>
			
			<li class="nav-item dropdown has-megamenu">
				<a class="nav-link" href="#" data-bs-toggle="dropdown" style="color:black; font-size: 15px; padding-left:60px;">제주도</a>
				<div class="dropdown-menu megamenu" role="menu">
					<div class="row g-3">
						<div class="col-lg-3 col-6">
							<div class="col-megamenu">
								<ul class="list-unstyled">
									<li><a href="/tour/list?search=2&keyword=서귀포시">서귀포시</a></li>
								</ul>
							</div>
						</div>
						<div class="col-lg-3 col-6">
							<div class="col-megamenu">
								<ul class="list-unstyled">
									<li><a href="/tour/list?search=2&keyword=서귀포시">제주시</a></li>
								</ul>
							</div>  
						</div>
						
					</div>
				</div> 
			</li>
			
		</ul>
	</div> 
</div> 
</nav>
</div>
<div class="container-lg">
    <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
        <div class="carousel-inner">
            <div class="carousel-item active" data-bs-interval="2000">
                <img src="/resources/image/main1.png" class="d-block w-100" alt="이미지1">
            </div>
            <div class="carousel-item" data-bs-interval="4000">
                <img src="/resources/image/main2.png" class="d-block w-100" alt="이미지2">
            </div>
            <div class="carousel-item" data-bs-interval="6000">
                <img src="/resources/image/main3.png" class="d-block w-100" alt="이미지3">
            </div>
        </div>
        <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
        </button>
    </div>
</div>
	<div class="container bg-white p-3 border-1">
    <div class="row g-2">
        <div class="col-md-2">
            <div class="card text-center" onclick="location.href='https://www.yanolja.com/motel'">
                <div class="image"> <img src="/resources/image/icon/motel.png" width="36" /> </div> <span >모텔</span>
            </div>
        </div>
        <div class="col-md-2">
            <div class="card text-center" onclick="location.href='https://www.yanolja.com/hotel'">
                <div class="image"> <img src="/resources/image/icon/hotel.png" width="36" /> </div> <span>호텔</span>
            </div>
        </div>
        <div class="col-md-2">
            <div class="card text-center" onclick="location.href='https://www.yanolja.com/guest-house'">
                <div class="image"> <img src="/resources/image/icon/guest.png" width="36" /> </div> <span>게스트 하우스</span>
            </div>
        </div>
        <div class="col-md-2">
            <div class="card text-center" onclick="location.href='https://www.yanolja.com/exhibition/20200429_172629_b68db51a?check_in_date=2021-10-26&check_out_date=2021-10-27&room%5B0%5D%5Badult%5D=2'">
                <div class="image"> <img src="/resources/image/icon/premium.png" width="36" /> </div> <span>프리미엄</span>
            </div>
        </div>
        <div class="col-md-2">
            <div class="card text-center" onclick="location.href='https://www.yanolja.com/exhibition/20200512_184328_a2b65d7b?check_in_date=2021-11-16&check_out_date=2021-11-17&room%5B0%5D%5Badult%5D=2'">
                <div class="image"> <img src="/resources/image/icon/kid.png" width="36" /> </div> <span>키즈</span>
            </div>
        </div>
        <div class="col-md-2">
            <div class="card text-center" onclick="location.href='https://www.yanolja.com/leisure'">
                <div class="image"> <img src="/resources/image/icon/Leisure.png" width="36" /> </div> <span>레저/스포츠</span>
            </div>
        </div>
        <div class="col-md-2">
            <div class="card text-center" onclick="location.href='https://www.yanolja.com/pension'">
                <div class="image"> <img src="/resources/image/icon/pension.png" width="36" /> </div> <span>펜션</span>
            </div>
        </div>
        <div class="col-md-2">
            <div class="card text-center" onclick="location.href='https://www.yanolja.com/exhibition/20200428_175541_4e2cb38a?check_in_date=2021-10-26&check_out_date=2021-10-27&room%5B0%5D%5Badult%5D=2'">
                <div class="image"> <img src="/resources/image/icon/camp.png" width="36" /> </div> <span>캠핑</span>
            </div>
        </div>
        <div class="col-md-2">
            <div class="card text-center" onclick="location.href='https://www.skcarrental.com'">
                <div class="image"> <img src="/resources/image/icon/car.png" width="36" /> </div> <span>렌터카</span>
            </div>
        </div>
        <div class="col-md-2">
            <div class="card text-center" onclick="location.href='https://www.letskorail.com/'">
                <div class="image"> <img src="/resources/image/icon/ktx.png" width="36" /> </div> <span>KTX/열차</span>
            </div>
        </div>
        <div class="col-md-2">
            <div class="card text-center" onclick="location.href='https://www.yanolja.com/flights'">
                <div class="image"> <img src="/resources/image/icon/fly.png" width="36" /> </div> <span>항공권</span>
            </div>
        </div>
        <div class="col-md-2">
            <div class="card text-center" onclick="location.href='https://www.yanolja.com/event'">
                <div class="image"> <img src="/resources/image/icon/gift.png" width="36" /> </div> <span>이벤트</span>
            </div>
        </div>
    </div>
</div>
    <hr>
<section class="py-3 d-flex flex-wrap" style="margin:0 auto; max-width: 1288px; width: 100%;"> 
    <div class="container-fluid">
            <div class="col-md-12">
                <div class="row">
                    <div class="col-md-3 ">
                        <div class="card  shadow">
                         <kbd>Notice</kbd>
                            <div class="card-body">  
                            	<h6>알립니다</h6>                      
                                <small>공지사항입니다 </small>
                            </div>
                            <div class="card-footer">
                                <a type="button" class="btn btn-sm btn-outline-primary" href="notice/list">더보기</a> 
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card shadow">
                            <kbd>Board</kbd>
                            <div class="card-body">
                                <h6>자유게시판</h6>                            
                                <small>정보교환하는 게시판입니다</small>
                            </div>
                            <div class="card-footer">
                                <a type="button" class="btn btn-sm btn-outline-primary" href="board/list">더보기</a> 
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card  shadow">
                            <kbd>Planner</kbd>
                            <div class="card-body">
                                <h6>플래너</h6>
                                <small>나만의 계획을 만들어보세요</small>
                            </div>
                            <div class="card-footer">
                                <a type="button" class="btn btn-sm btn-outline-primary" href="planner/list">더보기</a> 
                            </div>
                        </div>
                    </div>
                    <div class="col-md-3">
                        <div class="card  shadow">
                            <kbd>Service</kbd>
                            <div class="card-body">
                                <h6>고객센터</h6>
                                <small>Tel. 042-1234-5678</small>,
                            </div>
                            <div class="card-footer">
                                <button type="button" class="btn btn-sm btn-outline-primary">더보기</button> 
                            </div>
                        </div>
                    </div>               
                </div>
            </div>
      <div style="text-align: center;">
		<p class="cp-text">
		    © Copyright 2021 Company I Love Korea. All rights reserved.
		</p>
		</div>
        </div>
</section>
</body>
</html>