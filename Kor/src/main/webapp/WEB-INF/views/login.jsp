<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="/resources/css/login.css" rel="stylesheet">
<head>
<meta charset="UTF-8">
</head>
<body>
	<div class="wrapper fadeInDown">
		<div id="formContent">
			<div class="fadeIn first">
     		<img src="/resources/image/logo.png" id="icon" alt="로고" />
    		</div>
			<form method="post">
				<div class="fadeIn second">
					<input type="text" name="id" placeholder="아이디를 입력하세요" required>
				</div>
				
				<div class="fadeIn third">
					<input type="password" name="passwd" placeholder="비밀번호를 입력하세요" required>
				</div>
				<div class="fadeIn fourth">
					<input type="submit" value="Login">
				</div>				
				<div class="footer">
					<a href="signup">회원가입</a>
					<a href="findId">아이디 찾기</a>
					<a href="findPwd">비밀번호 찾기</a>
				</div>	
		</form>		
		</div>
	</div>
</body>
</html>