<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link rel="stylesheet" type="text/css" href="${ path }/resources/css/member.css">

<section>
	<div class="findId-container" >
		<form class="form-findId" action="${ path }/member/findId" method="POST">
			<div>
				<strong id="title">아이디찾기</strong>
			</div>
		
			<div id="findId-email" style="padding-bottom:45px;"> 
				<div class="input-with-icon">
					<input type="text" id="nickname" class="form-control" name="nickname" placeholder="닉네임" style="padding:0;" autocomplete="off" required autofocus>
				</div>
				<div id="emailCodeDiv" class="input-with-icon" style="display:none;">
					<input type="text" id="inputCode" class="form-control" name="emailCode" placeholder="인증번호" autocomplete="off" required>
				</div>
			</div>
			
			<button class="btn btn-lg btn-primary btn-block btn-findid" onclick="sendCode();" id="emailCodeBtn">인증번호 발송</button>
			<button class="btn btn-lg btn-primary btn-block btn-findid" type="submit" style="display:none;" id="findIdBtn">아이디 찾기</button>
		</form>
    </div>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>

<script>
	function sendCode(){
		var nickname = $('#nickname').val();
		var result = true;
		$.ajax({
			type: "post",
			url: "${path}/member/sendEmail",
			dataType: "json",
			async: false,
			data: {
				nickname
			},
			success: function(data) {
				alert(data.msg);
				result = data.validate;
			},
			error: function(e) {
				console.log(e);
			} 
		});
		
		if(result){
			$('#emailCodeDiv').show();
			$('#emailCodeBtn').hide();
			$('#findIdBtn').show();
			$('#nickname').attr("readonly",true); 
		}
	}
</script>