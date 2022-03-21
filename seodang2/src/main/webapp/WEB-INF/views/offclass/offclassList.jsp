<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div class="container">
	<h2>오프라인 클래스 목록</h2>
	<c:if test="${!empty session_user_num && session_user_auth>=3}">
	<div class="align-right">
		<input type="button" value="클래스 등록" onclick="location.href='offclassWrite.do'">
	</div>
	</c:if>
</div>