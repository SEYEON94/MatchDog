<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>
<style>
	.findForm{
		width:400px;
		height:600px;
		margin: 0 auto;
	}
</style>
</head>
<body>
	<div class="container">
		<a href="./home.go"><img src="./resources/img/maticon.PNG" src="매칭해주개메인" /></a>
	</div>
	<div class="findForm">
		<h2>비밀번호 찾기</h2>
		<p/>&nbsp<h3>아이디</h3>
		<p/><input type="text" name="member_id" placeholder="아이디를 입력 하세요" />
		<p/>&nbsp<h3>이메일</h3>
		<div>
			<p/><input type="text" id="usermail" name="member_email" placeholder="메일 주소를 입력 하세요" />@
			<select name="emailhost" id="mailhost">
				<option value="naver.com">naver.com</option>	
				<option value="gmail.com">gmail.com</option>
				<option value="daum.net">daum.net</option>
				<option value="nate.com">nate.com</option>
			</select>
			<button type="button" id="identifymail">인증요청</button>
			<!-- 인증요청 버튼 눌렀을 시 아이디와 이메일이 일치하는 아이디가 없을 경우 해당하는 아이디가 없다고 알려줘야 함  -->
		</div>
		<p/><h3>인증번호</h3>
		<p/><input type="text" name= "checkNum" placeholder="인증번호를 입력해주세요" maxlength="6"/>
		<button type="button" id="checkMail">인증하기</button>
		
		<p/><span id="informPw"></span><br/><hr/>
		
		<a href="./login.go">로그인</a> / <a href="./idFind.go">아이디 찾기</a> / <a href="./joinAgree.go">회원가입</a>
	</div>
</body>
<script>
$('#identifymail').on('click',function(){
	var member_id = $('input[name="member_id"]').val();
	var member_email = $('input[name="member_email"]').val()+"@"+$('select[name="emailhost"]').val();
	console.log('id='+member_id+"/"+'email='+member_email);
	
	$.ajax({
		type : 'post',
		url : 'identifymail',
		data : {'member_id':member_id,'member_email':member_email},
		dataType : 'JSON',
		success : function(data){
			console.log(data);
		},
		error : function(e){
			console.log(e);
		}		
	});
	
	$('#checkMail').on('click',function(){
		var inputCode = $('input[name="checkNum"]').val();
		var $resultMsg = $('#informPw');
		
		if(inputCode == code){
			$resultMsg.html('임시 비밀번호를 이메일로 보내드렸습니다.');
			$resultMsg.css('color','green');
			$('#identifyMail').attr('disabled',true);
			$('#usermail').attr('readonly',true);
			$('#mailhost').attr('readonly',true);		
		}else{
			$resultMsg.html('인증번호가 일치하지 않습니다.');
			$resultMsg.css('color','red');
		}
	});	
	
});

</script>
</html>