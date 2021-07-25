<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ include file="/WEB-INF/views/mypage/mypage_header.jsp"%>

<fmt:parseDate value='${signinMember.birth}' var='parse_birth' pattern='yyyy-MM-dd HH:mm:ss.s'/>
<fmt:formatDate value="${parse_birth}" var='fmt_birth' pattern="yyyy-MM-dd" />

	<div class="mypage-update-container">
		<form name="updateForm" class="form-update" action="${ path }/mypage/update" method="POST">
			<div style="margin-bottom:5px;">
				<strong id="title">내 정보 수정</strong>
			</div>
			
			<div id="update-info" style="padding-bottom:15px">
				<div class="input-with-icon">
					<input type="text" id="update_id" class="form-control" name="u_id" 
					value="<c:if test='${signinMember.signup_type==0}'>${signinMember.u_id}</c:if><c:if test='${signinMember.signup_type != 0}'><c:out value="${fn:substring(signinMember.u_id,0,8)}"/></c:if>" disabled>
				</div>
				
				<div class="input-with-icon">
					<input type="password" id="update_pw" class="form-control" name="u_pwd" placeholder="새 비밀번호(영어,숫자,특문 2조합 8자 이상)" autocomplete="new-password" <c:if test="${signinMember.signup_type != 0}">disabled</c:if> >
					<div class="btn btn-default icon pw-icon">
						<button disabled><img src="#" id="img_pw"/></button>
					</div>
				</div>
				
				<div class="input-with-icon">
					<input type="password" id="update_pw_check" class="form-control" placeholder="새 비밀번호 확인" autocomplete="new-password"  <c:if test="${signinMember.signup_type != 0}">disabled</c:if> >
					<div class="btn btn-default icon pw-check-icon">
						<button disabled><img src="#" id="img_pw_check"/></button>
					</div>
				</div>
				
				<div class="input-with-icon">
					<input type="text" id="update_nickname" class="form-control" name="nickname" placeholder="<c:if test='${signinMember.u_id ne signinMember.nickname}'>${signinMember.nickname}</c:if>" >
					<div class="btn btn-default icon nickname-icon">
						<button disabled><img src="#" id="img_nickname"/></button>
					</div>
				</div>
				
				<div class="input-with-icon">
					<input type="email" id="update_email" class="form-control" name="email" placeholder="${signinMember.email}" <c:if test="${signinMember.signup_type != 0}">disabled</c:if>>
					<div class="btn btn-default icon email-icon">
						<button disabled><img src="#" id="img_email"/></button>
					</div>
				</div>
				<div class="input-with-icon">
					<input type="date" id="update_birth" class="form-control" name="birth" value="${fmt_birth}">
				</div>
			</div>
			
			<div id="check-info">
				<p id="pw_info" style="display:none;"><b></b></p>
				<p id="pw_check_info" style="display:none;"><b></b></p>
				<p id="nickname_info" style="display:none;"><b></b></p>
				<p id="email_info" style="display:none;"><b></b></p>
			</div>
			
			<button type="button" id="update_button" class="btn btn-lg btn-primary btn-block btn-signin" onclick="updateInfo();">정보 수정</button>
		</form>
		<hr style="margin: 0 0 10px 0;">
		<a href="#" onclick="deleteMember();return false;">회원탈퇴</a>
	</div>
	
<%@ include file="/WEB-INF/views/mypage/mypage_footer.jsp"%>
<script>
	var status_pw = true;
	var status_pw_check = true;
	var status_nickname = true;
	var status_email = true;
	
	$('#update_pw').on('propertychange change keyup paste input',function(){
		if($(this).val().length == 0 && $('#update_pw_check').val().length == 0) {
			status_pw = true;
			$('.pw-icon').hide();
			$('.pw-check-icon').hide();
			showNotice("","#pw_info");
			return;
		}
	
		status_pw = checkPw($(this).val());
		var src = status_pw? "${ path }/images/check.png" : "${ path }/images/remove.png";
		document.getElementById('img_pw').src = src;
		$('.pw-icon').show();
	});
	
	$('#update_pw_check').on('propertychange change keyup paste input',function(){
		if($(this).val().length == 0 && $('#update_pw').val().length == 0) {
			status_pw_check = true;
			$('.pw-icon').hide();
			$('.pw-check-icon').hide();
			showNotice("","#pw_check_info");
			return;
		}
	
		status_pw_check = checkPwEquals($(this).val());
		var src = status_email? "${path}/images/check.png" : "${path}/images/remove.png";
		document.getElementById('img_pw_check').src = src;
		$('.pw-check-icon').show();
	});
	
	$('#update_nickname').on('propertychange change keyup paste input',function(){
		if($(this).val().length == 0 || $(this).val() == "<c:out value='${signinMember.nickname}'/>"){
			status_nickname = true;
			$('.nickname-icon').hide();
			showNotice("","#nickname_info");
			return;
		}
	
		status_nickname = checkNickname($(this).val());
		var src = status_nickname? "${path}/images/check.png" : "${path}/images/remove.png";
		document.getElementById('img_nickname').src = src;
		$('.nickname-icon').show();
	});
	
	$('#update_email').on('propertychange change keyup paste input',function(){
		if($(this).val().length == 0 || $(this).val() == "<c:out value='${signinMember.email}'/>"){
			status_email = true;
			$('.email-icon').hide();
			showNotice("","#email_info");
			return;
		}
	
		status_email = checkEmail($(this).val());
		var src = status_email? "${path}/images/check.png" : "${path}/images/remove.png";
		document.getElementById('img_email').src = src;
		$('.email-icon').show();
	});
	
	
	function checkPw(pw){
		var check = /^(?=.*[a-zA-Z])((?=.*\d)|(?=.*\W)).{8,16}$/;
	
		if(pw.length<8||pw.length>16){
			showNotice("비밀번호는 8글자 이상 16글자 이하로 입력해주세요.","#pw_info");
			return false;
		}
		
		if(!check.test(pw)){
			showNotice("비밀번호는 영문, 숫자, 특수문자 중 두 조합 이상 포함해야 합니다.","#pw_info");
			return false;
		}
		
		showNotice("","#pw_info");
		return true;
	}
	
	function checkPwEquals(pw_check){
		if(!status_pw){
			showNotice("먼저 올바른 비밀번호를 입력해주세요.","#pw_check_info");
			return false;
		}
		
		var pw = $('#update_pw').val();
		
		if(pw != pw_check){
			showNotice("비밀번호가 일치하지 않습니다.","#pw_check_info");
			return false;
		}
		
		showNotice("","#pw_check_info");
		return true;
	}
	
	function checkNickname(nickname){
		var result = true;
		
		if(nickname.length < 2){
			showNotice("닉네임은 두 글자 이상 입력해주세요.","#nickname_info");
			return false;
		}
		
		$.ajax({
			type: "get",
			url: "${path}/member/nicknameCheck",
			dataType: "json",
			async: false,
			data: {
				nickname
			},
			success: function(data) {
				result = data.validate;
				if(data.validate) {
					showNotice("이미 사용중인 닉네임입니다.","#nickname_info");
					return false;
				} 
			},
			error: function(e) {
				console.log(e);
			}
		}); 
		
		if(!result)	showNotice("","#nickname_info");		
		return !result;
	}
	
	function checkEmail(email){
		var check = /^[a-z0-9_+.-]+@([a-z0-9-]+\.)+[a-z0-9]{2,4}$/;
		if(!check.test(email)){
			showNotice("이메일은 형식에 맞게 입력해주세요.","#email_info");
			return false;
		}
		showNotice("","#email_info");
		return true;
	}
	
	function showNotice(notice, tag){
		if(notice!=""){
			$(tag+' b').text(notice);
			$(tag).show();
		}else {
			$(tag).hide();
		}
	}
	
	function updateInfo(){
		var form = document.updateForm;
		if(!status_pw){
			document.getElementById("update_pw").focus();
		}
		else if(!status_pw_check){
			document.getElementById("update_pw_check").focus();
		}
		else if(!status_nickname){
			document.getElementById("update_nickname").focus();
		}
		else if(!status_email){
			document.getElementById("update_email").focus();
		}
		else {
			form.submit();
		}
	}
</script><script>
	function deleteMember(){
		if (confirm("정말 탈퇴하시겠습니까? \n탈퇴 후 같은 아이디나 sns 계정으로 다시 가입하실 수 없습니다.")) {
			location.href = "${path}/member/delete"; 
		} 
	}
</script>