<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myclassList.css">    
<style>
	.main-left{
		background-color:yellow;
		width:300px;
		height:500px;
		float:left;
	}
	.main-center{
		width:600px;
		height:500px;
		margin-left:300px;
	}
	.main-left ul li{
		padding-top:50px;
		margin-left:30px;
		margin-top:30px;
		font-size:20px;
		font-color:gray;
	}
</style>

<div class="main-left">
	<ul>
		<li>
			<a href="${pageContext.request.contextPath}/myclass/myclassMain.do">홈</a>
		</li>
		<li>
			<a href="${pageContext.request.contextPath}/myclass/myclassList.do">내가 올린 강의</a>
		</li>
		<li>
			<a href="${pageContext.request.contextPath}/myclass/myclassMain.do">수익</a>
		</li>
	</ul>
</div>
<div class="main-center">
	<div class="home">
<ul>
<li>
	<form action="myclassList.do" id="search_form" method="get">
		<ul class="search">
			<li>
				<select name="keyfield" id="keyfield">
					<option value="1" <c:if test="${param.keyfield == 1}">selected</c:if>>강의 이름</option>
				</select>
			</li>
			<li>
			<input type="search" name="keyword" id="keyword" value="${param.keyword}">
			</li>
			<li>
				<input type="submit" value="검색">
			</li>
		</ul>
	</form>
	</li>
	<c:forEach var="myclass" items="${list}">
	<li>
		<div class="List">
			<div class="textone">
				<p>회원번호 : ${user_num}</p>			
				<p>강의 명 : ${myclass.on_name}</p>
				<p>강의 가격 : ${myclass.on_price}</p>
				<button type="button" class="btn btn-dark" onclick="location.href='${pageContext.request.contextPath}/onclass/qnaList.do?on_num=${myclass.on_num}'">후기</button>
				<button type="button" class="btn btn-dark" onclick="location.href='#'">상세보기</button>
			</div>
		</div>
	</li>	
	</c:forEach>
</ul>	
</div>

	<div class="align-center">${pagingHtml}</div>
</div>