<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     
<!-- 중앙 컨텐츠 시작 -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/board.reply.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/videoAdapter.js"></script>
<div class="page-main">
	<h2>${kit.kit_name}</h2>
	<ul>
		<li>키트번호 : ${kit.kit_num}</li>
		<li>키트명 : ${kit.kit_name}</li>
		<li>조회수 : ${kit.hit}</li>
		<c:if test="${!empty kit.modify_date}">
		<li>최근 수정일 : ${kit.modify_date}</li>
		</c:if>
		<li>작성일 : ${kit.reg_date}</li>
		<c:if test="${!empty kit.filename}">
		<li>첨부파일 : <a href="file.do?kit_num=${kit.kit_num}">${kit.filename}</a></li>
		</c:if>
	</ul>
	<hr size="1" width="100%" noshade="noshade">
	<c:if test="${fn:endsWith(board.filename,'.jpg') ||
	              fn:endsWith(board.filename,'.JPG') ||
	              fn:endsWith(board.filename,'.gif') ||
	              fn:endsWith(board.filename,'.GIF') ||
	              fn:endsWith(board.filename,'.png') ||
	              fn:endsWith(board.filename,'.PNG')}">
	<div class="align-center">
		<img src="imageView.do?kit_num=${kit.kit_num}" 
		                                       style="max-width:500px">
	</div>
	</c:if>
	<p>
		${kit.kit_content}
	</p>
	<hr size="1" width="100%" noshade="noshade">
	<div class="align-right">
		<c:if test="${!empty user_num && user_num == kit.user_num}">
		<input type="button" value="수정"  
		onclick="location.href='update.do?kit_num=${kit.kit_num}'">
		<input type="button" value="삭제" id="delete_btn">
		<script type="text/javascript">
			let delete_btn = document.getElementById('delete_btn');
			delete_btn.onclick=function(){
				let choice = confirm('삭제하시겠습니까?');
				if(choice){
					location.replace('delete.do?board_num=${board.board_num}');
				}
			};
		</script>
		</c:if>
		<input type="button" value="목록" onclick="location.href='kitList.do'">
	</div>
	</div>
<!-- 중앙 컨텐츠 끝 -->







