<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/List.css">

<script type="text/javascript">
/* <c:forEach var="onclass" items="${list}"> */
$(function(){	
	var status; //noFav or yesFav
	function selectData(on_num){ //77라인 초기값 세팅
	   $.ajax({
	      type:'post',
	      data:{on_num:on_num}, //초기값 세팅에서 매개변수로 받아서 el 안씀
	      url:'getFav.do', //LikecountAction
	      dataType:'json',
	      cache:false,
	      timeout:30000,
	      success:function(data){
	         if(data.result=='success'){
	            displayFav(data);
	         }else{
	            alert('좋아요 읽기 오류');
	         }
	      },
	      error:function(){
	         alert('네트워크 오류');
	      }
	   });
	}
	
	$("img[id^='output_fav']").click(function(){ //좋아요를 클릭했을때 실행되는 ajax
		$.ajax({
			url:'like.do',
			type:'post',
			data:{on_num:${onclass.on_num}},
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(data){
					if(data.result=='logout'){
		               alert('로그인 후 누르세요');
		            }else if(data.result=='success'){ //추천하트 표시
		            	displayFav(data);
		            }
		            else{
		               alert('등록시 오류 발생!');
		            }
			},
			error:function(){
				alert('네트워크 오류 발생');
			}
		});
	});
	//좋아요 표시
	   function displayFav(data){
	      status = data.status;
	      var count = data.count;
	      var output;
	      if(status=='noFav'){
	         output = '../resources/image/heart1.png';
	      }else{
	         output = '../resources/image/heart2.png';
	      }         
	      //문서 객체에 추가
	      $("img[id^='output_fav']").attr('src',output); //id가 output_fav인 태그 src에 output 저장
	      $("span[id^='output_fcount']").text(count); //id가 output_fcount인 태그 text에 count(좋아요 총 개수)저장
	   }
	
	   selectData(${onclass.on_num}); //초기값 세팅
});
/* </c:forEach> */
</script>
      

<c:if test="${!empty session_user_num && session_user_auth == 3}">
<div><button type="button" class="btn btn-outline-secondary" onclick="location.href='onclassInsert.do'">수업등록</button></div>
</c:if>


<c:if test="${count == 0}">
	<div class="result-display">표시할 게시물이 없습니다.</div>
</c:if>

<div class="main-category">
	<div class="category-s"><i class="bi bi-calendar-check-fill"><a href="${pageContext.request.contextPath}/onclass/onclassList.do">최신순</a></i></div>
	<div class="category-s"><i class="bi bi-lightning-charge-fill">찜순</i></div>
	<div class="category-s"><i class="bi bi-list-ol"><a href="${pageContext.request.contextPath}/onclass/onclassList.do?category=1">조회순</a></i></div>
</div>

<form action="onclassList.do" id="search_form" method="get">
		<ul class="search">
			<li>
				<select name="keyfield" id="keyfield">
					<option value="1" <c:if test="${param.keyfield == 1}">selected</c:if>>강의 이름</option>
				</select>
			</li>
			<li>
			<input type="search" name="keyword" id="keyword" value="${param.keyword}">
			</li>
			<li>
				<input type="submit" value="검색">
			</li>
		</ul>
	</form>
<c:if test="${count > 0}">

<div class="container-right">
	<h3>온라인 CLASS</h3>
	<c:if test="${!empty session_user_num && session_user_auth>=3}">
	<div class="align-right">
		<input type="button" value="CLASS 등록" onclick="location.href='onclassInsert.do'" class="btn btn-outline-secondary">
	</div>
	</c:if>
<div class="item-space">
		<!-- foreach 문 시작 -->
		<c:forEach var="onclass" items="${list}" varStatus="vs">
			<div class="horizontal-area">
				<a href="onclassDetail.do?on_num=${onclass.on_num}">
					<div class="image-container">
						<!-- 바이트 저장 메인 이미지 -->
						<%-- <img src="imageView.do?on_num=${onclass.on_num}"> --%>
						<!-- 폴더 저장 메인 이미지 -->
						<img src="${pageContext.request.contextPath}/resources/image_upload/${onclass.mimage}">
					</div>
					<div class="item-category">${onclass.category_num }</div>
					<div class="name">${onclass.on_name }</div>
					<div>${onclass.on_name }</div>
					<div>
					<%-- <img src="${pageContext.request.contextPath}/resources/images/heart_gray.png"> --%>
					</div>
					<div class="align-right"><b>${onclass.on_price }원</b></div>
				</a>
					<!-- 찜 누르기 -->
					<img id="output_fav${vs.index}" src="../resources/image/heart1.png">
					<span id="output_fcount${vs.index}" class="margin_right_10"></span>
					<!-- 찜 누르기 -->
			
		<div>
			<form action="${pageContext.request.contextPath}/cart/cartInsert.do" method="post" style="width:100px;">
				<input type="hidden" name="order_quantity" value="1"> <!-- 주문시 기본 1 -->
				<input type="hidden" name="class_kind" value="on">
				<input type="hidden" name="class_num" value="${onclass.on_num}">
				<input type="submit" value="장바구니">
			</form>
		</div>					
			</div>
			
			
		</c:forEach>
	</div>

<div class="align-center">${pagingHtml}</div>

</c:if>
	</div>


    