<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

    
<%@ include file="/WEB-INF/views/common/header.jsp"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<section>

	<a href="https://www.w3schools.com/bootstrap4/default.asp">부트스트랩4 튜토리얼</a></br>
	<button type="button" class="btn">Basic</button>
	<button type="button" class="btn btn-primary">Primary</button>
	<button type="button" class="btn btn-secondary">Secondary</button>
	<button type="button" class="btn btn-success">Success</button>
	<button type="button" class="btn btn-info">Info</button>
	<button type="button" class="btn btn-warning">Warning</button>
	<button type="button" class="btn btn-danger">Danger</button>
	<button type="button" class="btn btn-dark">Dark</button>
	<button type="button" class="btn btn-light">Light</button>
	<button type="button" class="btn btn-link">Link</button>
	
	<P> <a href="${path }/party/party">파티원 모집으로 가기</a> </P>
</section>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>