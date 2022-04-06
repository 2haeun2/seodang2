<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath }/resources/css/header.css">
<header>
	<div class="mainpage">
		<div class="flexdisplay">
		<div class="logo">
				<a href="${pageContext.request.contextPath }/main/main.do"
					class="align-left"><b>서당개3년</b></a>
			</div>
		<div class="menu clearfix">
				<a href="${pageContext.request.contextPath}/onclass/onclassList.do"
					class="menu-item"><b>온라인</b></a> <a
					href="${pageContext.request.contextPath}/offclass/offclassList.do"
					class="menu-item"><b>오프라인</b></a> <a
					href="${pageContext.request.contextPath}/kit/kitList.do"
					class="menu-item"><b>키트</b></a>
			</div>
			<div class="login align-right">
				<c:if test="${!empty session_user_num && !empty session_user_photo}">
					<img src="${pageContext.request.contextPath}/user/photoView.do"
						width="25" height="25" class="my-photo">
				</c:if>
				<c:if test="${!empty session_user_num && empty session_user_photo}">
					<img
						src="${pageContext.request.contextPath}/resources/images/face.png"
						width="25" height="25" class="my-photo">
				</c:if>

				<c:if test="${session_user_auth==2 }">일반회원</c:if>
				<c:if test="${session_user_auth==3 }">강사</c:if>
				<c:if test="${session_user_auth==4 }">관리자</c:if>

				<c:if test="${!empty session_user_num}">
				[<span>${session_user_name}</span>]
				<a href="${pageContext.request.contextPath}/user/logout.do">로그아웃</a>
				</c:if>
				<c:if test="${empty session_user_num}">
					<a href="${pageContext.request.contextPath}/user/registerUser.do">회원가입</a>
					<a href="${pageContext.request.contextPath}/user/login.do">로그인</a>
				</c:if>
				<c:if test="${!empty session_user_num}">
					<a href="${pageContext.request.contextPath}/user/myMenu.do">MY메뉴</a>
				</c:if>

				<a href="${pageContext.request.contextPath}/main/main.do">홈으로</a>
			</div>
			
		</div>

		<div class="header2">
			<a href="${pageContext.request.contextPath}/news/list.do" class="menu-item"><b>취업 뉴스</b></a>
			<a href="${pageContext.request.contextPath}/oqna/oqnaList.do" class="menu-item">Q&amp;A</a>
			<c:if test="${!empty session_user_num && session_user_auth == 4}">
				<a href="${pageContext.request.contextPath}/admin/adminMemberList.do">회원관리</a>
			</c:if>	
			<c:if test="${!empty session_user_num}">
				<a href="${pageContext.request.contextPath}/cart/cartList.do" class="menu-item"><b>장바구니</b></a>
				<a href="${pageContext.request.contextPath}/cart/orderList.do" class="menu-item"><b>주문내역</b></a>
			</c:if>			
			
		</div>
	</div>
</header>
<!-- 상단 끝 -->