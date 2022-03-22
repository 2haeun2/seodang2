<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<form:form modelAttribute="ostarVO" action="qnaList.do" 
	                 enctype="multipart/form-data" id="register_form">
	<%-- 	<form:errors element="div" cssClass="error-color"/>
		<ul>
			<li>
				<form:radiobutton path="rating" value="0"/>0
				<form:radiobutton path="rating" value="1"/>1
			</li>
			<li>
				<form:label path="text">평점</form:label>
				<form:input path="text"/>
				<form:errors path="text" cssClass="error-color"/>
			</li>
		</ul>	 
		<div class="align-center">
			<form:button>전송</form:button>
		</div>   --%>
		
		
			<form:textarea path="text" cssClass="form-control" rows="5" />
			<!-- 평점 선택창 -->
			<form:label path="rating">평점: </form:label>
			<form:select path="rating">
			    <form:options items="${ map }"/>
			</form:select>
			<form:hidden path="user_num" />
			<form:hidden path="on_num" />
			<button class="btn btn-block btn-primary" type="submit">리뷰 등록</button>
		
		
		
		                                        
	</form:form>
	
	