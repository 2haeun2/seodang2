<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!-- 회원상태 (0탈퇴회원,1정지회원,2일반회원,선생님회원,3관리자), 디폴트값 2 -->
<!-- 중앙 컨텐츠 시작 -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/kit.css">
<script type="text/javascript">
	$(function(){
		$('#search_form').submit(function(){
			if($('#keyword').val().trim()==''){
				alert('검색어를 입력하세요!');
				$('#keyword').val('').focus();
				return false;
			}
		});
	});
</script>
<div class="page-main">
	<h2>키트 목록</h2>
	<div class="align-right">
		<input type="button" value="키트등록" onclick="location.href='kitWrite.do'">
	</div>
	<form action="kitList.do" id="search_form" method="get">
		<ul class="search">
			<li>
				<select name="keyfield" id="keyfield">
					<option value="1" <c:if test="${param.keyfield == 1}">selected</c:if>>키트이름</option>
					<option value="2" <c:if test="${param.keyfield == 2}">selected</c:if>>판매자</option>
					<option value="3" <c:if test="${param.keyfield == 3}">selected</c:if>>내용</option>
					<option value="4" <c:if test="${param.keyfield == 4}">selected</c:if>>키트이름+내용</option>
				</select>
			</li>
			<li>
				<input type="search" name="keyword" id="keyword" value="${param.keyword}">
			</li>
			<li>
				<input type="submit" value="검색">
				<input type="button" value="목록" 
				                        onclick="location.href='kitList.do'">
			</li>
		</ul>
	</form>
	<c:if test="${!empty user_num}">
	<div class="align-right">
		<input type="button" value="키트 등록" onclick="location.href='kitWrite.do'">
	</div>
	</c:if>
	<c:if test="${count == 0}">
	<div class="result-display">표시할 게시물이 없습니다.</div>
	</c:if>
	
	<div class="list-main">	
	<c:if test="${count > 0}">
	<c:forEach var="kit" items="${list}">
	<ul>
	
	<li>
	<div class="box"><!-- 판매 금액,남은 수량 표시가 안된다.... -->
	<div><a href="kitDetail.do?kit_num=${kit.kit_num}"><img src="imageView.do?kit_num=${kit.kit_num}"  style="width:200px; height:200px;"></a></div>
	    <div> <a href="kitDetail.do?kit_num=${kit.kit_num}">${kit.kit_name}</a></div>
	    <div>${kit.kit_num}</div>
	    <div class="price">판매 금액 : ${kit.kit_price}원</div>
		<div>남은 수량 : ${kit.kit_quantity}</div>
		<div>조회수 : ${kit.hit}</div>
		<div>등록일 : ${kit.reg_date}</div>	
	</div>
	</li>
	</ul>
	</c:forEach>
	</c:if>
	</div>
	<div class="page_num">${pagingHtml}</div>

</div>
<!-- 중앙 컨텐츠 끝 -->
