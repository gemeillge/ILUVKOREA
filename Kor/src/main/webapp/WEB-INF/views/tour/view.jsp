<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
<link href="/resources/css/table.css/" rel="stylesheet">
<title></title>
<style>


body {
	margin: 0 auto;
	text-align: center;
}

img{
	width: 600px;
	height: 500px;
	padding-bottom: 10px;
}

}
</style>
</head>
<body>
       
            <!-- Page Content -->
	<div id="page-content-wrapper">   
		<div class="container">
			<h3 style="margin:auto; margin-bottom:1%; margin-top: 5%;">상세보기 페이지</h3>
			<div>
			<c:forEach var="item" items="${item.tourImages}">	
				<img src="/upload/files/${item.filename}" >
			</c:forEach>
			</div>
			<table border="1" style="margin:0 auto; width: 600px;">
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
	<div>
	<a type="button" class="btn btn-primary btn-sm" href="../"  style="margin-left:41%; margin-top:10px;">이전</a>
	</div>
</div>
</div>	
</body>
</html>