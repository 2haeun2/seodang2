<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<div class="page-main">
	<h2>글쓰기</h2>										  <!-- 파일업로드 처리하기 위해  enctype -->
	<form:form modelAttribute="oqnaVO" action="oqnaWrite.do" enctype="multipart/form-data" id="register_form">
		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>
				<form:label path="title">제목</form:label>
				<form:input path="title"/>
				<form:errors path="title" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="content">내용</form:label>
				<form:textarea path="content"/>
				<form:errors path="content" cssClass="error-color"/>      
			</li>
			<li>
				<form:label path="upload">파일업로드</form:label>
				<input type="file" name="upload" id="upload">
				<form:errors path="upload" cssClass="error-color"/>	
				<!-- 파일업로드는 필수항목은 아니다.(그래도 에러처리는 해봤음) -->
			</li>			
		</ul>
		<div class="align-center">
			<form:button>전송</form:button>
			<input type="button" value="목록" onclick="location.href='oqnaList.do'">
		</div>
	</form:form>
</div>
<!-- 중앙컨텐츠 끝 -->