<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!-- 중앙 컨텐츠 시작 -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/style.css">
<div class="page-main">
	<h2>my메뉴</h2>
	<ul class="profile-photo">
		<li>
			<img id="cen_img" src="${pageContext.request.contextPath}/resources/images/face.png"
			                     width="160" height="160" class="my-photo" onclick="location.href='myPage.do'">내정보
		</li>
		<li>
			<img id="cen_img" src="${pageContext.request.contextPath}/resources/images/"
			                     width="160" height="160" class="my-photo" onclick="location.href='delete.do'">my클래스     
		</li>
		<li>
			<img id="cen_img" src="${pageContext.request.contextPath}/resources/images/"
			                     width="160" height="160" class="my-photo" onclick="location.href='oqnaList.do'">1:1문의 내역
		</li>
		<li>
			<img id="cen_img" src="${pageContext.request.contextPath}/resources/images/"
			                     width="160" height="160" class="my-photo" onclick="location.href='myMenu.do'">찜목록
		</li>
		<li>
			<img id="cen_img" src="${pageContext.request.contextPath}/resources/images/"
			                     width="160" height="160" class="my-photo" onclick="location.href='myMenu.do'">장바구니
		</li>
		<li>
			<img id="cen_img" src="${pageContext.request.contextPath}/resources/images/"
			                     width="160" height="160" class="my-photo" onclick="location.href='myMenu.do'">구매내역
		</li>
	</ul>
</div>
<!-- 중앙 컨텐츠 끝 -->


