<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style_dw.css" type="text/css"/>

<h1>주문 내역 상세</h1> 
	<table>
		<tr>
			<th style="width:15%">상품 분류</th>
			<th style="width:30%">상품명</th>
			<th style="width:15%">상품가격</th>
			<th style="width:10%">수량</th>
			<th style="width:15%">합계</th>			
			<th style="width:15%">상태</th>
		</tr>
		
	   <c:set var = "total" value = "0" />
	   <c:forEach var="list" items="${detailList}">		
		<tr>	
			<td>
				<c:if test="${list.class_kind eq 'kit'}">키트</c:if>
				<c:if test="${list.class_kind eq 'on'}">온라인 클래스</c:if>
				<c:if test="${list.class_kind eq 'off'}">오프라인 클래스</c:if>
			</td>       	
			<td>${list.item_name}</td>
			<td><fmt:formatNumber value="${list.item_price}" pattern="#,###" /></td>   
			<td>${list.order_quantity}</td>
			<td><fmt:formatNumber value="${list.item_total}" pattern="#,###" /></td> 
			<td>
				<!--배송 및 수강 상태 (1:배송대기 /2:배송준비중 /3:배송중 /4:배송완료 /5:수강신청/6:수강중/7:수강완료/8:주문취소)-->
					<c:if test="${list.status == 1}">배송대기</c:if>
					<c:if test="${list.status == 2}">배송준비중</c:if>
					<c:if test="${list.status == 3}">배송중</c:if>
					<c:if test="${list.status == 4}">배송완료</c:if>
					<c:if test="${list.status == 5}">수강신청 완료</c:if>
					<c:if test="${list.status == 6}">수강중</c:if>
					<c:if test="${list.status == 7}">수강완료</c:if>
					<c:if test="${list.status == 8}">주문취소</c:if>
			</td>
		</tr>
		</c:forEach>
	</table>
	<div class="align-center">
		<input type="button" value="주문내역" onclick="location.href='${pageContext.request.contextPath}/cart/orderList.do'">
		<input type="button" value="장바구니" onclick="location.href='${pageContext.request.contextPath }/cart/cartList.do'">
		<input type="button" value="홈으로" onclick="location.href='${pageContext.request.contextPath}/main/main.do'">
	</div>