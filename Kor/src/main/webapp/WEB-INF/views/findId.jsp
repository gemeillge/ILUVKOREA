<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link href="/resources/css/login.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<head>
<meta charset="UTF-8">
<script>
$(function(){
	$("#findId").click(function(){
		const find = {
				name: $("input[name='name']").val(),
				email: $("input[name='email']").val()
		}
		
		$.ajax({
			method: "POST",
			url: "/findId",
			data: JSON.stringify(find),
			contentType: "application/json",
			dataType: "text",
			success: function(data){
				console.log(data);
				
				if(data == 'null'){
					alert('일치하는 아이디가 없습니다.')	
					return false;
					
				}else{
					alert('회원님의 아이디는'+ data +'입니다.')
				}
				return;
			}
			
		})
	})
})

	
</script>
</head>
<body>
	<div class="wrapper fadeInDown">
		<div id="formContent">
			<div class="fadeIn first">
     		<img src="/resources/image/logo.png" id="icon" alt="로고" />
    		</div>
			
				<div class="fadeIn second">
					<input type="text" name="name" placeholder="이름을 입력하세요" required>
				</div>
				
				<div class="fadeIn third">
					<input type="text" name="email" placeholder="이메일를 입력하세요" required>
				</div>
				
				<div class="fadeIn fourth">
				<input id="findId" type="submit" value="아이디 찾기">
				</div>
					
						
				<div class="footer">
					<a href="findPwd">비밀번호 찾기</a>
					<a href=".">이전</a>
				</div>	
			
			
		</div>
	</div>
</body>
</html>