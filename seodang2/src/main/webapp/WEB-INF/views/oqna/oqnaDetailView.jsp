<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!-- 중앙컨텐츠 시작 -->
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style_dw.css" type="text/css"/>
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/videoAdapter.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/board.reply.js"></script>

<div class="page-main">

	<h2>${oqna.title }</h2>
	<ul>
		<li>글번호 : ${oqna.qna_num}</li>
		<li>작성자ID : ${oqna.id }</li>
		<li>작성자 : ${oqna.name}</li>
		<li>작성일 : ${oqna.reg_date}</li>
		
		<c:if test = "${!empty oqna.modify_date}">
			<li>최근 수정일 : ${oqna.modify_date}</li>
		</c:if>	
		
		<c:if test = "${!empty oqna.filename }">
			<li>첨부파일 : <a href ="file.do?qna_num=${oqna.qna_num}">${oqna.filename}</a></li>
		</c:if>
	</ul>

	<hr size="1" width="100%" noshade="noshade">
	<c:if test="${fn:endsWith(oqna.filename, '.jpg') || 
					  fn:endsWith(oqna.filename, '.JPG') ||
					  fn:endsWith(oqna.filename, '.gif') ||
					  fn:endsWith(oqna.filename, '.GIF') ||
					  fn:endsWith(oqna.filename, '.png') ||
					  fn:endsWith(oqna.filename, '.PNG')}">
		<div class="align-center">
			<img src="imageView.do?qna_num=${oqna.qna_num }" style="max-width:500px">
		</div>
	</c:if>

	<p>
		${oqna.content }
	</p>
	<hr size="1" width="100%" noshade="noshade">


	<div class="align-right">
		<c:if test="${!empty session_user_num && session_user_num==oqna.user_num }"> 
		<!--로그인이 되어있고, 로그인한 사람이 작성자일 경우 -->
			<input type="button" value="수정" onclick="location.href='oqnaUpdate.do?qna_num=${oqna.qna_num}'">
			<input type="button" value="삭제" id="delete_btn">
			<script type="text/javascript">
				let delete_btn = document.getElementById('delete_btn');
				delete_btn.onclick=function(){
					let choice = confirm('삭제하시겠습니까?');
					if(choice){
						location.replace('oqnaDelete.do?qna_num=${oqna.qna_num}');
					}
				};
			</script>
		</c:if>
		<input type="button" value="목록" onclick="location.href='oqnaList.do'">
	</div>
	<hr size="1" width="100%" noshade="noshade">





</div>