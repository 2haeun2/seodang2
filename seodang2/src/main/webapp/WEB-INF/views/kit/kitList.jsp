<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 회원상태 (0탈퇴회원,1정지회원,2일반회원,선생님회원,3관리자), 디폴트값 2 -->
<!-- 중앙 컨텐츠 시작 -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
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
	<form action="list.do" id="search_form" method="get">
		<ul class="search">
			<li>
				<select name="keyfield" id="keyfield">
					<option value="1" <c:if test="${param.keyfield == 1}">selected</c:if>>제품명</option>
					<option value="2" <c:if test="${param.keyfield == 2}">selected</c:if>>판매자</option>
					<option value="3" <c:if test="${param.keyfield == 3}">selected</c:if>>내용</option>
					<option value="4" <c:if test="${param.keyfield == 4}">selected</c:if>>제목+내용</option>
				</select>
			</li>
			<li>
				<input type="search" name="keyword" id="keyword"
				                             value="${param.keyword}">
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
		<input type="button" value="글쓰기" 
		                         onclick="location.href='kitWrite.do'">
	</div>
	</c:if>
	<c:if test="${count == 0}">
	<div class="result-display">표시할 게시물이 없습니다.</div>
	</c:if>
	<c:if test="${count > 0}">
	<table>
		<tr>
			<th>키트번호</th>
			<th width="400">제품명</th>
			<th>키트가격</th>
			<th>판매자</th>
			<th>남은수량</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="kit" items="${list}">
		<tr>
		    <td>${kit.kit_num}</td>
			<td>${kit.name}</td>
			<td><a href="detail.do?kit_num=${kit.kit_num}">${kit.name}</a></td>
			<td>${kit.price}</td>
			<td></td>
			<td>${kit.user_num}</td>
			<td>${kit.reg_date}</td>
		</tr>
		</c:forEach>
	</table>
	<div class="align-center">${pagingHtml}</div>
	</c:if>
</div>
<!-- 중앙 컨텐츠 끝 -->
<!--  <div class="container">
	<h2>키트 목록</h2>
	<c:if test="${!empty session_user_num && session_user_auth>=2}">
	<div class="align-right">
		<input type="button" value="키트등록" onclick="location.href='kitWrite.do'">
	</div>
	</c:if>
	<c:if test="${count == 1}">
	<div class="result-display">표시할 게시물이 없습니다.</div>
	</c:if>

	<c:if test="${count>0}">
	<ul class="list-main flex-row">
		<c:forEach var="product" items="${list}">
		<li>
			<a class="flex-column" href="${pageContext.request.contextPath}/kit/kitdetail.do?kit_num=${kit.kit_num}">
			<img src="${pageContext.request.contextPath}/upload/${kit.photo1}">
			<div>${kit.name}</div>
			<div>
				<c:if test="${kit.price==0}">
				품절
				</c:if>
				<c:if test="${kit.price>0}">
				<fmt:formatNumber value="${kit.price}"/>원
				</c:if>
			</div>
			<div>
				관심 ${kit.likes}
			</div>
			</a>
		</li>
		</c:forEach>
	</ul>
	<div class="paging flex-row justify-center">
		${pagingHtml}
	</div>
	</c:if>
	</div>
     목록 출력 끝
	<c:if test="${count > 0}">
	<table>
		<tr>
		    <th>키트번호</th>
			<th width="400">제품명</th>
			<th>키트가격</th>
			<th>판매자</th>
			<th>남은수량</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:forEach var="kit" items="${list}">
		<tr>
		    <td>${kit.kit_num}</td>
			<td>${kit.name}</td>
			<td><a href="detail.do?kit_num=${kit.kit_num}">${kit.name}</a></td>
			<td>${kit.price}</td>
			<td></td>
			<td>${kit.user_num}</td>
			<td>${kit.reg_date}</td>
		</tr>
		</c:forEach>
	</table>
	<div class="align-center">${pagingHtml}</div>
	</c:if>
</div> 
-->

