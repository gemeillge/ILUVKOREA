<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

</head>
<body>
	<div>
		<h3>사용자 등록</h3>
		<form method="post">
			<div>
				<label>아이디 : </label>
				<input type="text" name="id" onchange="changeId()"> <input type="button" value="중복확인" onclick="checkId_Async()">
			</div>
			<div>
				<label>비밀번호 : </label>
				<input type="password" name="passwd" placeholder="영문숫자조합 8자리이상" required>
			</div>
			<div>
				<label>비밀번호 확인:</label>
				<input type="password" name="passwd_check">
			</div>
			<div>
				<label>이름 : </label>
				<input type="text" name="name">
			</div>
			<div>
				<label>주소 : </label>
				<input type="text" name="address">
			</div>
			<div>
				<label>전화번호 : </label>
				<input type="text" name="tel" placeholder="예시 : 010-1234-5678" maxlength="13">
			</div>
			<div>
				<label>이메일 : </label>
				<input type="text" name="email1" onfocus="this.value='';"> @ <input type="text" name="email2" value="" disabled> 
				<select name="email" onchange="email_change()">
					<option value="0">선택하세요</option>
					<option value="9">직접입력</option>
					<option value="naver.com">naver.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="daum.net">daum.net</option>
				</select>
				<div id="email_check"></div>
			</div>
			<div>
				<button>등록</button>
			</div>
		</form>
	</div>
	<div>
		<a href="list">목록</a>
	</div>
</body>
</html>