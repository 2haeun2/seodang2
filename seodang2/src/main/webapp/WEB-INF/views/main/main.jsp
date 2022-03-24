<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<style>
	.page-main a {
		font-size:22px;
	}
</style>

<!-- 메인 시작 -->
<div class="page-main">
	<a href="${pageContext.request.contextPath}/onclass/#">드로잉</a>
	<a href="${pageContext.request.contextPath}/onclass/#">플라워</a>
	<a href="${pageContext.request.contextPath}/onclass/#">공예</a>
	<a href="${pageContext.request.contextPath}/onclass/#">요리</a>
	<a href="${pageContext.request.contextPath}/onclass/#">베이킹</a>
</div>
<div style="width: 400px; margin:50px">
	<div id="carousel-example-generic" class="carousel slide" style="width:900px;">
		<ol class="carousel-indicators">
			<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
		</ol>
<div class="carousel-inner" role="listbox" style="width:900px;height:300px;">
	<div class="item active">
	<!-- 첫번째 이미지 -->
		<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQErfku7CEDRa37M1j0Jju5BAHtI9cThSrDpw&usqp=CAU" width="900" height="300">
	</div>
	<div class="item">
	<!-- 두번째 이미지 -->
		<img src="https://image.idus.com/image/files/f26d272932814e0fbc20313b5ac7af81_1080.jpg"  width="900" height="300">
	</div>
</div>
		<!-- 왼쪽 화살표 버튼 -->
		<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
		<!-- 왼쪽 화살표 -->
			<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
		</a>
		<!-- 오른쪽 화살표 버튼 -->
		<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
		<!-- 오른쪽 화살표 -->
			<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
		</a>
	</div>
</div>
<script>
	$(function(){
		$('#carousel-example-generic').carousel({
			//시간 조절 , false로 하면 멈춤
			interval: 100,
			// hover를 설정 마우스 올리면 멈춤
			pause: "hover",
			wrap: true,
			keyboard : true
			});
		});
</script>