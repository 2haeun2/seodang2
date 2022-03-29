<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>    
    
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
	<!-- 페이징 시작 -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.css"/>
    <!-- 페이징 끝 -->
    
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main.css">

<!-- 메인 시작 -->

<div class="main-content">
	<h1 class="main-title">
		<span>온라인수업과</span>
		<span>오프라인수업을</span>
		<span>찾는 가장 쉬운 방법</span>
	</h1>
	<div class="main-image">
	<img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTwS70r6aZEg6-wofSf66x7MU7FiZSEFSOIQA&usqp=CAU" weight="100" height="50" />
	<span class="sub-content">에서 수업을 찾아보세요</span>
	</div>
	
</div>


<div class="content-image">
	<div id="carousel-example-generic" class="carousel slide" style="width:700px;">
		<ol class="carousel-indicators">
			<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
			<li data-target="#carousel-example-generic" data-slide-to="1"></li>
		</ol>
<div class="carousel-inner" role="listbox" style="width:700px;height:300px;">
		<div class="item active">
		<!-- 첫번째 이미지 -->
			<img src="https://cdn.pixabay.com/photo/2021/02/11/23/50/dog-6006768_1280.png" width="900" height="350">
		</div>
		<div class="item">
		<!-- 두번째 이미지 -->
			<!-- <img src="https://image.idus.com/image/files/f26d272932814e0fbc20313b5ac7af81_1080.jpg"  width="900" height="300"> -->
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
<div style="padding-left:180px; padding-bottom:30px ">
<div class="bubble">원하는 카테고리로 필터링 해보세요</div>
</div>
<div class="mainOne">
<div class="page-main">
	<ul>
		<li><a id="category" href="${pageContext.request.contextPath}/main/main.do">#</a></li>
		<li><a id="category" href="${pageContext.request.contextPath}/main/main.do?category_num=1">#</a></li>
		<li><a id="category" href="${pageContext.request.contextPath}/main/main.do?category_num=2">#</a></li>
		<li><a id="category" href="${pageContext.request.contextPath}/main/main.do?category_num=3">#</a></li>
		<li><a id="category" href="${pageContext.request.contextPath}/main/main.do?category_num=4">#</a></li>
		<li><a id="category" href="${pageContext.request.contextPath}/main/main.do?category_num=5">#</a></li>
	</ul>
</div>

<div class="main-category">
	<div class="category-s"><i class="bi bi-calendar-check-fill">최신순</i></div>
	<div class="category-s"><i class="bi bi-lightning-charge-fill">인기순</i></div>
	<div class="category-s"><i class="bi bi-list-ol">조회순</i></div>
</div>
<!-- 시작 -->


<c:forEach var="onclass" items="${list}">
	<div class="card" style="display: inline-block">
		<ul>
			<li>
				<h5 class="card-header">수업</h5>
				<ul class="card-ul">
					<li>
						<p>수업 이름 : ${onclass.on_name}</p>
					</li>
					<li>
						<p>수업 가격 : ${onclass.on_price}</p>
					</li>
					<li>
						<!-- ck에디터 <p> 태그 삭제하기  -->
						<p>카테고리 번호 : ${onclass.category_num}</p>
					</li>			
				</ul>
			</li>
		</ul>
		<div style="bottom:0;">
		<i class="bi bi-eye"></i>
		<i class="bi bi-star"></i>
		<i class="bi bi-emoji-heart-eyes"></i>
		</div>
	</div>
</c:forEach>
	
<div class="align-center" style="padding-right:50px">${pagingHtml}</div>
</div>

<!-- 끝 -->

<script>
	$(function(){
		$('#carousel-example-generic').carousel({
			//시간 조절 , false로 하면 멈춤
			interval: 5000,
			// hover를 설정 마우스 올리면 멈춤
			pause: "hover",
			wrap: true,
			keyboard : true
			});
		});
</script>