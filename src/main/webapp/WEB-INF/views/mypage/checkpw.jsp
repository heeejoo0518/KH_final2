<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/mypage/mypage_header.jsp"%>

<section>
	<div class="checkPw-container">
		<h2><strong>비밀번호 재확인</strong></h2>
		<p>안전을 위해 비밀번호를 다시 한 번 입력해주세요.</p>
		<form action="${path}/mypage/checkpw" method="POST">
			<div style="margin-bottom:40px;">
				<input type="text" class="form-control" id="u_id" value="${ signinMember.u_id }" aria-describedby="basic-addon1" readonly required>
				<input type="password" class="form-control"  id="checkPw" name="u_pw" placeholder="비밀번호"/>
			</div>
			<input type="submit" class="btn btn-primary btn-block" id="confirmPw" value="확인" />
		</form>
	</div>
</section>


<%@ include file="/WEB-INF/views/mypage/mypage_footer.jsp"%>
<script>
/* 	$(document).ready(function(){
		$('#update-list-item')
	}); */
</script>