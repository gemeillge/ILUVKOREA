<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<script src="/js/jquery-3.6.0.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="/resources/css/table.css/" rel="stylesheet">
<style>
.container .card{
	width :24%;
	margin-left : 1%;
	display: inline-block;
	margin-bottom:10px;
	
}

.card img{
 height: 250px;
}
</style>

<script>
$(function() {
	
	$(".toggle").click(function() {
		let id = $(this).parent().attr("data-item");
		$("tr[data-img='"+ id +"']").toggleClass("hide");
	});
	
});
</script>
</head>
<body>
<div class="containe mt-5">
		<div class="row">
		<div class="col-md-8 mx-auto">
			<h2 style="text-align: center;">관광지</h2>
			<form class="row">
				<div class="col-2 ms-1" >
						<select name="search" class="form-control form-control-sm">
						<option value="0">전체 검색</option>
						<option value="1" ${pager.search == 1 ? 'selected' : ''}>관광지명</option>
						<option value="2" ${pager.search == 2 ? 'selected' : ''}>도시명</option>
					</select>
				</div>					
				<div class="col-3 ms-1">
					<input type="text" name="keyword" class="form-control form-control-sm" value="${pager.keyword}" placeholder="검색어를 입력해주세요" style="float:right;">
				</div>				
				<div class="col-7 mb-1" style="margin-left: -1%;">
					<input type="submit" value="검색" class="btn btn-primary btn-sm" style="float:right;">
				</div>			
		
		<div class="container">
        <div style="margin:auto; font-size: 0;">			
			<c:forEach var="item" items="${list}">
			  <div class="card">
			    <img src="/upload/files/${item.tourImages[0].filename}" class="card-img-top img-fluid" onclick="location.href='view/${item.tourId}'">
			    <div class="card-body">
			      <h2 class="card-title">${item.tourName}</h2>
			      <h6 class="card-area">${item.areaName} ${item.cityName}</h6>
			      
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
				   
		<a type="button" class="btn btn-primary mx-1" href="../" style="float: right;">처음으로</a>
	</div>
	</div>
	</div> 
</body>
</html>