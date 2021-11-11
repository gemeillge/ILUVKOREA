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
			<h2 style="text-align: center;">여기 어때?</h2>
			<form>
			<div class="row mb-1">
				<div class="col-2">
						<select name="search" class="form-control form-control-sm">
						<option value="0">전체 검색</option>
						<option value="1" ${pager.search == 1 ? 'selected' : ''}>제목</option>
						<option value="2" ${pager.search == 2 ? 'selected' : ''}>작성자</option>
					</select>
				</div>
					
				<div class="col-2">
					<input type="text" name="keyword" class="form-control form-control-sm" value="${pager.keyword}">
				</div>
				
				<div class="col-1" style="margin-left:auto;">
					<input type="submit" value="검색" class="btn-primary btn-sm">
				</div>
			</div>
		</form>
	<table class="table bg-white rounded border">
		<thead>
			<tr>
				<!-- <th scope="col">게시글번호</th> -->
				<th scope="col">제목</th>
				
				<th scope="col">작성자</th>
				<th scope="col">작성일</th> 
				<th scope="col">조회수</th>
			</tr> 
		</thead>
		<tbody>
			<c:choose>
				<c:when test="${list.size() > 0}">
					<c:forEach var="item" items="${list}">
						<tr>
							<input type="hidden" value="${item.boardId}">
							<td><a href="view/${item.boardId}">${item.bSubject}</a></td>
							
							<td>${item.bWriter}</td>
							<td><fmt:formatDate value="${item.bDate}" pattern="yyyy-MM-dd" /></td>
							<td>${item.viewCnt}</td>
							
							<%-- <td><a href="update?boardId=${item.boardId}">변경</a> <a
								href="delete?boardId=${item.boardId}">삭제</a></td> --%>
						</tr>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<tr>
						<td colspan="7">등록 된 내용이 없습니다</td>
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
	<div style="float: right">
	<button type="button" onclick=" location.href = '${path}/board/add';" class="btn btn-secondary" >글쓰기</button>
	<a type="button" href="../"  class="btn btn-primary">이전</a>
	</div>
	</div>
	</div>
	</div>
</body>
</html>














