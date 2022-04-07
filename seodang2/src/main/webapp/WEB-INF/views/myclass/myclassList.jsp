<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myclassList.css">

<div class="container-right">
	<h3>내가 등록한 과목</h3>
</div>    
	<div class="item-space">
		<!-- foreach 문 시작 -->
		<c:forEach var="myclass" items="${list}">
			<div class="horizontal-area">
				<a href="myclassData.do?on_num=${myclass.on_num}">
					<div class="image-container">
						<!-- 폴더 저장 메인 이미지 -->
						<%-- <img src="${pageContext.request.contextPath}/resources/image_upload/${myclass.mimage}"> --%>
					</div>
					<div class="item-category">클래스 번호 : ${myclass.on_num}</div>
					<div class="name">${myclass.on_name}</div>
					<div></div>
					<div>
					<%-- <img src="${pageContext.request.contextPath}/resources/images/heart_gray.png"> --%>
					</div>
					<div class="align-right"><b>${myclass.on_price}원</b></div>
					<div></div>
				</a>
			</div>
		</c:forEach>
	</div>
	
	<div class="align-center">${pagingHtml}</div>
	
	<!-- 헤더 겹침 임시 위치 -->
	<a href="${pageContext.request.contextPath}/myclass/myclassList.do">전체보기</a>
	<a href="${pageContext.request.contextPath}/myclass/#">수강생 많은 순</a>
	
	
	