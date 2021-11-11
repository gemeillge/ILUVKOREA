<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="/resources/css/admin.css" rel="stylesheet">
<link href="/resources/css/table.css" rel="styleshhet">
<style>
	.card{
	width: 200px;
	}
.card-img-top{
  padding: 0 30px;
  text-align: center;
  margin:5%;
  width: 90%;
}
</style>
<title></title>
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
                <div class="container-fluid">
                <div style="height: 100px; background-color: #ccccc; text-align: center; margin :1px solid #ccc">
            		<h3>관리자페이지 입니다</h3>
            	</div>
                    <div style="text-align: center;">
                    	<div class="d-flex justify-content-center">
						  <div class="mb-4 mx-5" >
						    <div class="card h-100">
						      <img src="/resources/image/icon/공지사항.png" class="card-img-top " onclick="location.href='/admin/noticelist'" >
						      <div class="card-body">
						        <h5 class="card-title">공지사항</h5>
						        <p class="card-text">공지사항을 수정 및 관리를 할수 있습니다</p>
						      </div>
						      <div class="card-footer">
						        <small class="text-muted"></small>
						      </div>
						    </div>
						  </div>
						  <div class="mb-4 mx-5">
						    <div class="card h-100">
						      <img src="/resources/image/icon/멤버.png" class="card-img-top" onclick="location.href='/admin/memberlist'">
						      <div class="card-body">
						        <h5 class="card-title">회원 목록</h5>
						        <p class="card-text">회원분들을 관리할수 있습니다</p>
						      </div>
						      <div class="card-footer">
						        <small class="text-muted"></small>
						      </div>
						    </div>
						  </div>
						  <div class="mb-4 mx-5">
						    <div class="card h-100">
						      <img src="/resources/image/icon/관광지.png" class="card-img-top" onclick="location.href='/admin/tourlist'" >
						      <div class="card-body">
						        <h5 class="card-title">관광지</h5>
						        <p class="card-text">관광지를 추가 및 관리를 할수있습니다</p>
						      </div>
						      <div class="card-footer">
						        <small class="text-muted"></small>
						      </div>
						    </div>
						  </div>
						</div>
                      
                   
				 <div class="d-flex justify-content-center">
					  <div class="mb-4 mx-5">
					    <div class="card h-100">
					      <img src="/resources/image/icon/지역.png" class="card-img-top" onclick="location.href='/area/list'">
					      <div class="card-body">
					        <h5 class="card-title">지역</h5>
					        <p class="card-text">지역을 추가 및 관리할 수있습니다</p>
					      </div>
					      <div class="card-footer">
					        <small class="text-muted"></small>
					      </div>
					    </div>
					  </div>
					  <div class="mb-4 mx-5">
					    <div class="card h-100">
					      <img src="/resources/image/icon/도시.png" class="card-img-top" onclick="location.href='/city/list'">
					      <div class="card-body">
					        <h5 class="card-title">도시</h5>
					        <p class="card-text">도시를 추가 및 관리 할수있습니다.</p>
					      </div>
					      <div class="card-footer">
					        <small class="text-muted"></small>
					      </div>
					    </div>
					  </div>
					  <div class="mb-4 mx-5">
					    <div class="card h-100">
					      <img src="/resources/image/icon/뒤로가기.png" class="card-img-top" onclick="location.href='../'">
					      <div class="card-body">
					        <h5 class="card-title">홈으로</h5>
					        <p class="card-text"></p>
					      </div>
					      <div class="card-footer">
					        <small class="text-muted"></small>
					      </div>
					    </div>
					  </div>
					</div>
					</div>
                </div>
            </div> 
        </div> 

<!-- <div>
	<a href="/admin/memberlist">회원목록</a>
	<a href="/admin/tourlist">관광지</a>
	<a href="/admin/noticelist">공지사항</a>
	<a href="/area/list">지역입력</a>
	<a href="/city/list">도시입력</a>
</div> -->

</body>
</html>