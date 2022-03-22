<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/offclass.css">
<div class="container">
	<h4>오프라인 CLASS</h4>
	<c:if test="${!empty session_user_num && session_user_auth>=3}">
	<div class="align-right">
		<input type="button" value="CLASS 등록" onclick="location.href='offclassOpen.do'" class="btn btn-outline-secondary">
	</div>
	</c:if>
</div>