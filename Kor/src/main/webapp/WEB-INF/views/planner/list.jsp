<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="/resources/css/table.css/" rel="stylesheet">
<title></title>
</head>

<body>
	<div class="container mt-5">
		<div class="row">
			<div class="col-md-8 mx-auto">
			<div class="row">
			<h2 style="text-align: center;">플래너</h2>
			<!-- <div class="col-2">
			<select name="perPage" id="perPage" class="form-select form-select-sm">
						<option value="10">기본</option>
						<option value="5">5개씩</option>
						<option value="10">10개씩</option>
						<option value="20">20개씩</option>
						<option value="30">30개씩</option>
					</select>
			</div> -->
			<form>
			<div class="row">
				<div class="col-2">
						<select name="search" class="form-control form-control-sm">
						<option value="0">전체 검색</option>
						<option value="1" ${pager.search == 1 ? 'selected' : ''}>제목</option>
						<option value="2" ${pager.search == 2 ? 'selected' : ''}>내용</option>
					</select>
				</div>
					
				<div class="col-2 " >
					<input type="text" name="keyword" class="form-control form-control-sm" value="${pager.keyword}">
				</div>
				
				<div class="col-1" style="margin-left:auto;">
					<input type="submit" value="검색" class="btn-primary btn-sm mb-1">
				</div>
			</div>
		</form>
	<table class="table bg-white rounded border">
		<thead>
			<tr>
				<th scope="col">번호</th>
				<th scope="col">작성일</th>
				<th scope="col">제목</th>
				<th scope="col">인원수</th>
				<th scope="col">내용</th> 
				<!-- <th scope="col">일수</th> -->
				<th scope="col">시작일</th>
				<th scope="col">종료일</th>
				<!-- <th scope="col">회원</th> -->
				<th scope="col">관리</th>
			</tr> 
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${list.size() > 0}">
					<c:forEach var="item" items="${list}">
						<tr>
							<td scope="row" >${item.planId}</td>
							<td>${item.planRdate}</td>
							<td><a href="view/${item.planId}">${item.planTitle}</a></td>
							<td>${item.planMsize}</td>
							<td>${item.planConcept}</td>
							<%-- <td>${item.planDay}</td> --%>
							<td>${item.planSday}</td>
							<td>${item.planEday}</td>
				<%-- 			<td>${item.id}</td> --%>
						
							<td><a href="update?planId=${item.planId}">변경</a></td>
							<td><a href="delete?planId=${item.planId}">삭제</a></td>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="9">등록 된 내용이 없습니다</td>
					</tr>
				</c:otherwise>
			</c:choose>
		</tbody>
		<tfoot>
			<tr>
			<td colspan="12">
				<div class="pagination pagination-sm" style="justify-content:center">
					<div class="page-item"><a href="?page=1&${pager.query}" class="page-link">처음</a></div>
					<div class="page-item"><a href="?page=${pager.prev}&${pager.query}" class="page-link">이전</a></div>
					
						<c:forEach var="page" items="${pager.list}">
							<div class="page-item ${pager.page == page?'active':''}"><a href="?page=${page}&${pager.query}" class="page-link">${page}</a></div>
						</c:forEach>
					
					<div class="page-item"><a href="?page=${pager.next}&${pager.query}" class="page-link">다음</a></div>
					<div class="page-item"><a href="?page=${pager.last}&${pager.query}" class="page-link">마지막</a></div>
				</div>
			</td>  
		</tr>
		</tfoot>
	</table>
	</div>
	<div style="float:right;">
	<a type="button" class="btn btn-secondary" href="add">글쓰기</a>
	<a type="button" class="btn btn-primary" href="../">처음으로</a>
	</div>
	</div>
	</div>
	</div>
</body>
</html>














