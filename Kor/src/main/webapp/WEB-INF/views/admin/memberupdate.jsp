<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/admintable.css/" rel="stylesheet">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
<title></title>

</head>
<body>
	<nav class="navbar navbar-expand navbar-dark bg-primary"> 
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
			<div class="container-flouid mt-5">
		<div class="row">
			<div class="col-md-8 mx-auto">
			<h1 style="text-align: center;">회원수정</h1>
		<form method="post">
			<div class="form-group">
				<label>아이디:</label>
				<input type="text" value="${item.id}" readonly class="form-control">
			</div>
			<div class="form-group">
				<label>성명:</label>
				<input type="text" name="name" value="${item.name}" class="form-control">
			</div>
			<div class="form-group">
				<label>비밀번호:</label>
				<input type="password" name="passwd" value="${item.passwd}" class="form-control">
			</div>
			<div class="form-group">
				<label>주소:</label>
				<input type="text" name="address" value="${item.address}" class="form-control">
			</div>
			<div class="form-group">
				<label>전화번호:</label>
				<input type="text" name="tel" value="${item.tel}" class="form-control">
			</div>
			<div class="form-group">
				<label>이메일:</label>
				<input type="text" name="email" value="${item.email}" class="form-control">
			</div>
						
			<div>	
				<button class="btn btn-outline-success" style="float: right; margin-top: 15px;" onclick="location.href='list'">취소</button>
				<button class="btn btn-outline-primary" style="float: right; margin-top: 15px;">변경</button>
			</div>
		</form>
	</div>
	</div>
	</div>
	</div>
	</div>
</body>
</html>