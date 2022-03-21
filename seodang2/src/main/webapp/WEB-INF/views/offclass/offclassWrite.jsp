<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 중앙 컨텐츠 시작 -->
<div class="container">
	<h2>오프라인 클래스 등록하기</h2>
	<form:form action="write.do" modelAttribute="offclassVO" id="register_form" enctype="multipart/form-data">
		<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>
				<form:label path="category_num">클래스 카테고리</form:label>
				<form:select path=""></form:select>
				<form:errors path="category_num" cssClas="error-color"/>
			</li>
			<li>
				<form:label path="off_name">이름</form:label>
				<form:input path="off_name" placeholder="클래스 이름 입력해주세요."/>
				<form:errors path="off_name" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="off_limit">정원</form:label>
				<form:input path="off_limit"/>
				<form:errors path="off_limit" cssClas="error-color"/>
			</li>
			<li>
				<form:label path="off_limit">정원</form:label>
				<form:input path="off_limit"/>
				<form:errors path="off_limit" cssClas="error-color"/>
			</li>
			<li>
				<form:label path="off_limit">정원</form:label>
				<form:input path="off_limit"/>
				<form:errors path="off_limit" cssClas="error-color"/>
			</li>
		</ul>
	</form:form>
</div>
<!-- 중앙 컨텐츠 끝 -->