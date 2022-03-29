<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/offclass.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ck_style.css">
<!-- 중앙 컨텐츠 시작 -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/videoAdapter.js"></script>

<div class="container-right">
	<div class="container-head">
		<h3>오프라인 클래스 상세</h3>
		<div>
			<c:if test="${offclass.user_num == session_user_num }">
				<input class="btn btn-outline-secondary"  type="button" value="수정" onclick="location.href='offclassUpdate.do?off_num=${offclass.off_num}'">
			</c:if>
			<c:if test="${offclass.user_num == session_user_num || session_user_auth==4 }">
				<input class="btn btn-outline-secondary"  type="button" value="삭제" onclick="location.href='offclassDelete.do?off_num=${offclass.off_num}'">
			</c:if>
		</div>
	</div>
	<%-- <div class="picture">
		<img class="detial-img" src=${offclass.img_file }>
	</div> --%>
	<div class="detail_content">
		<div class="ck_content">
			${offclass.off_content }
		</div>
		<div class="sidebar">
			<div class="sidbar_content">
				<div>
				${offclass.category_num }
				</div>
				<h3>${offclass.off_name }</h3>
				<h4>${offclass.off_price }원</h4>
				<input class="btn btn-outline-secondary" type="button" value="장바구니 담기"><br>
				<input class="btn btn-outline-secondary" type="button" value="바로 구매">
				<img id="like_btn" src="../resources/image/heart1.png">
				<span id="like_count"></span>
			</div>
		</div>
	</div>
</div>
<!-- 중앙 컨텐츠 끝 -->