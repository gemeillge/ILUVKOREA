<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.0.3/css/font-awesome.css">
<link href="/resources/css/table.css" rel="stylesheet">
<title></title>
</head>
<script>
/* 	$(document).ready(function(){
		$("save").click(function(){
			var bSubject = $("#bSubject").val();
			var bContent = $("#bContent").val();
			var bWriter = $("#bWriter").val();
			if(bSubject==""){
				alert("제목을 입력하세요")
				document.form.bSubject.focus();
				return;
			}
			if(bContent==""){
				alert("내용을 입력하세요")
				document.form.bContent.focus();
				return;
			}
			if(bWriter==""){
				alert("이름을 입력하세요")
				document.form.bWriter.focus();
				return;
				
			}
			document.form.submit()
		});
	}); */
</script>

<body>
<div class="page-content page-container" id="page-content">
	<div class="padding">
		<div class="container justify-content-center">
			 <div id="card" class="col-lg-5 grid-margin stretch-card">
			  <div class="card">
                    <div class="card-body">
                        <h4 class="card-title">플래너 등록</h4>
                        <p class="card-description">나만의 플래너를 만들어보세요!</p>
                        
                  <!-- form -->
                  
				
		<form name="form" method="post" action="add" class="forms-sample">
		 <!-- <input name="planId" id="planId" type="hidden">  -->
			<!-- div class="form-group"><label>작성일</label> 
				<input name="planRdate" id="planRdate" type="date" class="form-control">
			</div> -->
			<div class="form-group"><label>제목:</label> 
				<input name="planTitle" id="planTitle" type="text"class="form-control">
			</div>
			<div class="form-group"> <label>인원수</label>
				<select id="planMsize" name="planMsize" class="form-control">
					<option value="" selected="selected">선택하세요.</option>
					<option value="1">1인</option>
					<option value="2">2인</option>
					<option value="3">3인</option>
					<option value="4">4인</option>
					<option value="5">5인 이상</option>                                
				</select>
			</div>
			
			<div class="form-group"><label>내용:</label> 
				<input name="planConcept" id="planConcept" type="text" class="form-control">
			</div>
			
			<div class="form-group row">
				<div class="col"><label>시작일</label>
				<input name="planSday" id="planSday" type="date" class="form-control">
				</div>
				<div class="col"> <label>종료일</label>
				<input name="planEday" id="planEday" type="date" class="form-control">
				</div>
			</div>
						
			<div class="form-group row">
				<div class="col"><label>작성자</label> 
				<input name="id" id="id" class="form-control" value="${sessionScope.member.id}" readonly>
				</div>
				<div class="col"><label>일수</label>
				<select id="planDay" name="planDay" class="form-control">
					<option value="1일" selected="selected">1일</option>
					<option value="2일">2일</option>
					<option value="3일">3일</option>
					<option value="4일">4일</option>
					<option value="5일">5일</option>
					<option value="6일">6일</option>
					<option value="7일이상">7일이상</option>
				</select>
				
				</div>
			</div>
		
			<div>				
				<a href="./list" class="btn btn-outline-success btn-icon-text" type="button" style="float: right; ">
				<i class="fa fa-warning btn-icon-prepend">취소</i></a>
				<button class="btn btn-outline-secondary btn-icon-text" type="reset" style="float: right; margin-right: 10px; ">
				<i class="fa fa-pencil btn-icon-append">다시설정</i></button>
				<button id="save" type="submit" class="btn btn-outline-primary btn-icon-text" style="float: right; margin-right: 10px;">
				<i class="fa fa-check btn-icon-prepend"></i>등록</button>
			</div>
			
			</form>
	</div>
	</div>
	</div>
	</div>
	</div>
	</div>
</body>
</html>