<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.6.0/font/bootstrap-icons.css">
<link href="/resources/css/sign.css" rel="stylesheet">
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script>
	let check_id = false;

	function checkId() {
		const form = document.signupForm;

		const xhr = new XMLHttpRequest();

		xhr.open("GET", "checkId?id=" + form.id.value, false);

		xhr.send();

	}
	function signup() {
		const form = document.signupForm;

		if (form.id.value == '') {
			alert('아이디를 입력해주세요');
			form.id.focus();
			return;
		}

		if (!check_id) {
			alert('아이디 중복 검사를 해주세요.')
			return;
		}

		if (form.passwd.value == '') {
			alert('비밀번호를 입력해주세요');
			form.passwd.focus();
			return;
		}

		if (form.passwd_check.value == '') {
			alert('비밀번호 확인을 입력해주세요');
			form.passwd_check.focus();
			return;
		}

		if (form.passwd.value !== form.passwd_check.value) {
			alert('입력한 비밀번호가 일치하지 않습니다.');
			form.passwd_check.focus();
			return;
		}

		if (form.name.value == '') {
			alert('이름을 입력해주세요');
			form.name.focus();
			return;
		}

		if (form.address.value == '') {
			alert('주소를 입력해주세요');
			form.address.focus();
			return;
		}

		if (form.tel.value == '') {
			alert('전화번호를 입력해주세요');
			form.tel.focus();
			return;
		}
		if (form.email1.value == '') {
			alert('이메일를 입력해주세요');
			form.email.focus();
			return;
		}
		
		
		const email = form.email1.value + form.email2.value;
		
		form.email.value = email;
		
		form.submit();
		alert("가입되었습니다")

	}

	function checkId_Async() {
		const form = document.signupForm;
		const xhr = new XMLHttpRequest();

		xhr.open("GET", "checkId?id=" + form.id.value, true);

		xhr.onreadystatechange = function() { //onreadystatechange가 되면 다음의 function을 실행
			if (xhr.readyState == XMLHttpRequest.DONE) { //XMLHttpRequest가 완료된 상태가 되었다면
				if (xhr.status == 200) { //완료된 상태가 정상적으로 수행된 값
					if (xhr.responseText == "OK") {
						check_id = true;
						alert("사용 가능한 아이디 입니다.")
					} else {
						alert("이미 등록된 아이디 입니다. 다른 아이디를 입력해주세요.")
					}
				}
			}
		};

		xhr.send();

	}

	function changeId() {
		check_Id = false;
	}

	function goBack() {
		//history.back();
		location.href = ".";
	}
	
	function email_change(){

		if(document.signupForm.email3.options[document.signupForm.email3.selectedIndex].value == '0'){

		 document.signupForm.email2.disabled = true;

		 document.signupForm.email2.value = "";

		}

		if(document.signupForm.email3.options[document.signupForm.email3.selectedIndex].value == '9'){

		 document.signupForm.email2.disabled = false;

		 document.signupForm.email2.value = "";

		 document.signupForm.email2.focus();

		} else{

		 document.signupForm.email2.disabled = true;

		 document.signupForm.email2.value = document.signupForm.email3.options[document.signupForm.email3.selectedIndex].value;

		}

		}

</script>
</head>
<body>
	<div class="wrapper fadeInDown">
		<div id="formContent">
     		<img src="/resources/image/logo.png" id="icon" alt="로고" />
			<form name="signupForm" method="post">
				<div class="fadeIn first">
					<h6>아이디</h6>
					<div class="id">
						<input type="text" name="id" onchange="changeId()" placeholder="아이디를 입력하세요" required>
						<a style="font-size: small;" onclick="checkId_Async()">중복확인</a>
					</div>
				</div>
				
				<div class="fadeIn second">
					<h6>비밀번호</h6>
					<input type="password" name="passwd" placeholder="영문숫자조합 8자리이상" required>
				</div>
				
				<div class="fadeIn third">
					<h6>비밀번호 확인</h6>
					<input type="password" name="passwd_check"  placeholder="비밀번호를 일치시켜주세요" required>
				</div>
				
				<div class="fadeIn fourth">
					<h6>이름</h6>
					<input type="text" name="name"  placeholder="이름을 입력하세요" required>
				</div>
				
				<div class="fadeIn fifth">
					<h6>주소</h6>
					<input type="text" name="address"  placeholder="주소를 입력하세요" required>
				</div>
				
				<div class="fadeIn sixth">
					<h6>전화번호</h6>
					<input type="text" name="tel" placeholder="예시 : 010-1234-5678" maxlength="13">
				</div>
				
				<div class="fadeIn seventh"> 
				<h6>이메일</h6>
				<div class="input-group">
 				<input type="text" class="form-control form-control-sm" style="margin-left: 40px; margin-right: 10px;" name= "email1" onfocus="this.value='';">
 				<input type="text" class="form-control form-control-sm" style="margin-right: 10px;" name="email2" value="" disabled>
 					<select name="email3" style="margin-right: 40px; width: 60px;" onchange="email_change()" class="form-select form-select-sm">
					<option value="0">선택하세요</option>
					<option value="9">직접입력</option>
					<option value="@naver.com">@naver.com</option>
					<option value="@gmail.com">@gmail.com</option>
					<option value="@daum.net">@daum.net</option>
				</select>
				<input type="hidden" name="email">
				</div>
			</div>
				
			<div class="btn-group mt-1" >
				<button type="button" id="sign" class="btn btn-outline-primary bi bi-person-plus-fill " style="margin-right: 30px; border-radius: 5px" onclick="signup()">회원가입</button>
				
				<button type="button" id="cancil" class="btn btn-outline-danger bi bi-x-octagon-fill "style= "border-radius: 5px" onclick="goBack()">취소</button>
			</div>
		</form>
		</div>
	</div>
</body>
</html>