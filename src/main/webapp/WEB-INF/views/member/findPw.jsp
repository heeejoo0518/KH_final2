<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<link rel="stylesheet" type="text/css" href="${ path }/resources/css/member.css">

<section>
	<div class="findPw-container" >
		<form class="form-findPw" action="${ path }/member/findPw" method="POST">
			<div>
				<strong id="title">비밀번호찾기</strong>
			</div>
		
			<div id="findPw-info" style="padding-bottom:45px;"> 
				<div class="input-with-icon">
					<input type="text" id="inputId" class="form-control" name="userId" placeholder="아이디" style="padding:0;" autocomplete="off" required autofocus>
				</div>
			</div>
			
			<button class="btn btn-lg btn-primary btn-block btn-findpw" type="submit">임시 비밀번호 발급</button>
		</form>
    </div>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>