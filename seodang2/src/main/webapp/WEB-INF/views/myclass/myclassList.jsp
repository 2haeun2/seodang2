<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myclassList.css">

<div class="container-right">
	<h3>수강중인 과목</h3>
</div>    
	<div class="item-space">
		<!-- foreach 문 시작 -->
		<c:forEach var="myclass" items="${list}" varStatus="vs">
			<div class="horizontal-area">
				<a href="onclassDetail.do?on_num=">
					<div class="image-container">
						<!-- 폴더 저장 메인 이미지 -->
						<%-- <img src="${pageContext.request.contextPath}/resources/image_upload/${onclass.mimage}"> --%>
						<!-- 오프라인 mimage 컬럼 추가하면 주석 제거 -->
					</div>
					<div class="item-category">온오프 넘버 : ${myclass.onoff}</div>
					<div class="name">${myclass.on_name}</div>
					<div></div>
					<div>
					<%-- <img src="${pageContext.request.contextPath}/resources/images/heart_gray.png"> --%>
					</div>
					<div class="align-right"><b>${myclass.on_price}원</b></div>
				</a>
			</div>
			
			<!-- 오프 -->
			<div class="horizontal-area">
				<a href="onclassDetail.do?on_num=">
					<div class="image-container">
						<!-- 폴더 저장 메인 이미지 -->
						<%-- <img src="${pageContext.request.contextPath}/resources/image_upload/${onclass.mimage}"> --%>
						<!-- 오프라인 mimage 컬럼 추가하면 주석 제거 -->
					</div>
					<div class="item-category">온오프 넘버 : ${myclass.onoff}</div>
					<div class="name">${myclass.on_name}</div>
					<div></div>
					<div>
					<%-- <img src="${pageContext.request.contextPath}/resources/images/heart_gray.png"> --%>
					</div>
					<div class="align-right"><b>${myclass.on_price}원</b></div>
				</a>
			</div>
		</c:forEach>
	</div>
	
	<div class="align-center">${pagingHtml}</div>
	
	<!-- 헤더 겹침 임시 위치 -->
	<a>전체보기</a>
	<a>전체보기</a>
	<a>전체보기</a>
	
	
	