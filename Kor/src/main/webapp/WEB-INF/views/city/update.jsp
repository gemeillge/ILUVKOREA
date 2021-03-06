<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css">
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="/resources/css/table.css" rel="stylesheet">
<link href="/resources/css/admin.css" rel="stylesheet">
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
<div class="page-content page-container" id="page-content">
	<div class="padding">
		<div class="container justify-content-center">
			 <div id="card" class="col-lg-5 grid-margin stretch-card">
			  <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">?????? ??????</h4>
                        
		<form method="post" enctype="multipart/form-data">	
			<div class="form-group">
			<%-- <input type="hidden" name="cityId" value="${item.cityId}" class="form-control"> --%>
						<label>?????????</label>
				<select name="areaId" class="form-control">
					<c:forEach var="areaitem" items="${arealist}">
					<option value="${areaitem.areaId}" ${item.areaId == areaitem.areaId ? "selected" : ""}>${areaitem.areaName}</option> <!-- ??????????????? -->
					</c:forEach>
				</select>
			</div>		
			
			
					
			<div class="form-group">
				<label>?????????</label>
				<input type="text" name="cityName" class="form-control" value="${item.cityName}">
			</div>	
			
			<div style="padding-left:49%;">
				<button id="save" type="submit" class="btn btn-outline-primary btn-icon-text">
				<i class="fa fa-check btn-icon-prepend"></i>??????</button>
				<a href="./list" class="btn btn-outline-success btn-icon-text" type="button" >
				<i class="fa fa-warning btn-icon-prepend">??????</i></a>
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