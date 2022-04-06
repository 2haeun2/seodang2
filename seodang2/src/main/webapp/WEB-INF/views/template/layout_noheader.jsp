<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><tiles:getAsString name="title"/></title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/style.css">
</head>
<body>
<div id="main-noheader">
	<div id="main-bodyfooter">
	<div id="main_body review">
		<tiles:insertAttribute name="body"/>
	</div>
	<div id="main_footer">
		<tiles:insertAttribute name="footer"/>
	</div>
	</div>
</div>
</body>
</html>





