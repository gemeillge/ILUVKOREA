<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<script>
$(function() {
	
	$("#images").on("click", ".delete", function() {
		const tourImageId = $(this).data("id");
		const button = $(this);
		$.ajax({
			type: "DELETE",
			url: location.href + "/" + tourImageId,
			success: function(data) {					
				if(data == "OK") {						
					button.parent().remove();
				}
			}				
		});
	});
	
	$("#upload").click(function() {
		const form = document.getElementById("uploadForm");			
		const formData = new FormData(form);
		
		$.ajax({
			type: "POST",
			url: location.href + "/image",
			enctype: "multipart/form-data",
			data: formData,
			async: true,
			cache: false,
			contentType: false,
			processData: false,
			success: function(data) {					
				if(data != "") {
					let html = "<li><img src='/upload/files/";
					html += data.filename;
					html += "'><button class='delete' data-id='";
					html += data.tourImageId
					html += "'>삭제</button></li>"; 
					
					$("#images").append( $(html) );	
				}
			}
		});
	});
});
</script>

</head>
<body>
	<div>
		<h3>관광지 변경</h3>
		<form method="post" enctype="multipart/form-data">	
			<div>
				<label>관광지:</label>
					<input type="hidden" name="tourId" value="${item.tourId}">
			</div>		
			<div>
				<label>관광지명:</label>
				<input type="text" name="tourName" value="${item.tourName}">
			</div>	
			<div>
				<label>위도:</label>
				<input type="text" name="tourMapx" value="${item.tourMapx}">
			</div>		
			<div>
				<label>경도:</label>
				<input type="text" name="tourMapy" value="${item.tourMapy}">
			</div>
				<div>
				<label>지역명:</label>
				<select name="areaId" >
					<c:forEach var="areaitem" items="${arealist}">
					<option value="${areaitem.areaId}" ${item.areaId == areaitem.areaId ? "selected" : ""}>${areaitem.areaName}</option> <!-- 셀렉트박스 -->
					</c:forEach>
				</select>
			</div>
			
			<div>
				<label>도시명:</label>
				<select name="cityId">
					<c:forEach var="cityitem" items="${citylist}">
					<option value="${cityitem.cityId}" ${item.cityId == cityitem.cityId ? "selected" : ""}>${cityitem.cityName}</option> <!-- 셀렉트박스 -->
					</c:forEach>
				</select>
			</div>	
				<div>
				<label>내용:</label>
				<textarea name="tourCon" rows="60" cols="30">${item.tourCon}</textarea>
				</div>		
				
			
			<div>
				<button>변경</button>
			</div>
		</form>
	</div>
		<div>
		<ul id="images">
			<c:forEach var="item" items="${item.tourImages}">						
				<li><img src="/upload/files/${item.filename}"><button class="delete" data-id="${item.tourImageId}">삭제</button></li>
			</c:forEach>
			<c:if test="${item.tourImages == null || item.tourImages.size() < 1}">
				<li>등록 된 상품이미지가 없습니다</li>
			</c:if>
		</ul>
	</div>
	<div>
		<div>
			<form id="uploadForm">				
				<div>
					<input type="file" name="uploadFile">
				</div>
			</form>
		</div>
		<div>
			<button id="upload">상품이미지 등록</button>
		</div>	
	</div>
	<div>
		<a href="list">목록</a>
	</div>
</body>
</html>