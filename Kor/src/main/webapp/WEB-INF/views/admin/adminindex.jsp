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
                    <li class="sidebar-brand" onclick="location.href='/admin'"> ????????? ????????? </li>
                    <li> <a href="/admin/noticelist">????????????</a> </li>
                    <li> <a href="/admin/memberlist">????????????</a></li>
                    <li> <a href="/admin/tourlist">?????????</a></li>
                    <li> <a href="/area/list">????????????</a> </li>
                    <li> <a href="/city/list">????????????</a> </li>     
                </ul>
            </div> 
            
            <!-- Page Content -->
            <div id="page-content-wrapper">            	
                <div class="container-fluid">
                <div style="height: 100px; background-color: #ccccc; text-align: center; margin :1px solid #ccc">
            		<h3>?????????????????? ?????????</h3>
            	</div>
                    <div style="text-align: center;">
                    	<div class="d-flex justify-content-center">
						  <div class="mb-4 mx-5" >
						    <div class="card h-100">
						      <img src="/resources/image/icon/????????????.png" class="card-img-top " onclick="location.href='/admin/noticelist'" >
						      <div class="card-body">
						        <h5 class="card-title">????????????</h5>
						        <p class="card-text">??????????????? ?????? ??? ????????? ?????? ????????????</p>
						      </div>
						      <div class="card-footer">
						        <small class="text-muted"></small>
						      </div>
						    </div>
						  </div>
						  <div class="mb-4 mx-5">
						    <div class="card h-100">
						      <img src="/resources/image/icon/??????.png" class="card-img-top" onclick="location.href='/admin/memberlist'">
						      <div class="card-body">
						        <h5 class="card-title">?????? ??????</h5>
						        <p class="card-text">??????????????? ???????????? ????????????</p>
						      </div>
						      <div class="card-footer">
						        <small class="text-muted"></small>
						      </div>
						    </div>
						  </div>
						  <div class="mb-4 mx-5">
						    <div class="card h-100">
						      <img src="/resources/image/icon/?????????.png" class="card-img-top" onclick="location.href='/admin/tourlist'" >
						      <div class="card-body">
						        <h5 class="card-title">?????????</h5>
						        <p class="card-text">???????????? ?????? ??? ????????? ??????????????????</p>
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
					      <img src="/resources/image/icon/??????.png" class="card-img-top" onclick="location.href='/area/list'">
					      <div class="card-body">
					        <h5 class="card-title">??????</h5>
					        <p class="card-text">????????? ?????? ??? ????????? ???????????????</p>
					      </div>
					      <div class="card-footer">
					        <small class="text-muted"></small>
					      </div>
					    </div>
					  </div>
					  <div class="mb-4 mx-5">
					    <div class="card h-100">
					      <img src="/resources/image/icon/??????.png" class="card-img-top" onclick="location.href='/city/list'">
					      <div class="card-body">
					        <h5 class="card-title">??????</h5>
					        <p class="card-text">????????? ?????? ??? ?????? ??????????????????.</p>
					      </div>
					      <div class="card-footer">
					        <small class="text-muted"></small>
					      </div>
					    </div>
					  </div>
					  <div class="mb-4 mx-5">
					    <div class="card h-100">
					      <img src="/resources/image/icon/????????????.png" class="card-img-top" onclick="location.href='../'">
					      <div class="card-body">
					        <h5 class="card-title">?????????</h5>
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
	<a href="/admin/memberlist">????????????</a>
	<a href="/admin/tourlist">?????????</a>
	<a href="/admin/noticelist">????????????</a>
	<a href="/area/list">????????????</a>
	<a href="/city/list">????????????</a>
</div> -->

</body>
</html>