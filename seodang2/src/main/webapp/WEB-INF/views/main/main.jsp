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

<div class="mainOne">

<div class="page-main">
	<a id="category" href="${pageContext.request.contextPath}/main/main.do">전체보기</a>
	<a id="category" href="${pageContext.request.contextPath}/main/main.do?category_num=1">드로잉</a>
	<a id="category" href="${pageContext.request.contextPath}/main/main.do?category_num=2">플라워</a>
	<a id="category" href="${pageContext.request.contextPath}/main/main.do?category_num=3">공예</a>
	<a id="category" href="${pageContext.request.contextPath}/main/main.do?category_num=4">요리</a>
	<a id="category" href="${pageContext.request.contextPath}/main/main.do?category_num=5">베이킹</a>
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
					<p>수업 설명 : ${onclass.on_content}</p>
				</li>
				<li>
					<div style="text-align:left"><i class="bi bi-emoji-heart-eyes"></i></div>
				</li>
				<li>
					<i class="bi bi-eye"></i>
				</li>
				<li>
					<i class="bi bi-star"></i>
				</li>
			
			</ul>
		</li>
		
	</ul>

</div>
	</c:forEach>

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
	
	//동적ㅈ 페이지
	$(function(){
		var status; //noFav or yesFav
		$('#category').click(function(){ //좋아요를 클릭했을때 실행되는 ajax
			$.ajax({
				url:'like.do',
				type:'post',
				data:{category_num:${onclass.category_num}},
				dataType:'json',
				cache:false,
				timeout:30000,
				success:function(data){
						if(data.result=='success'){ //추천하트 표시
			            	displayFav(data);
			            }else{
			               alert('등록시 오류 발생!');
			            }
				},
				error:function(){
					alert('네트워크 오류 발생');
				}
			});
		});
</script>