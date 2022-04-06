<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>     
<!-- 중앙 컨텐츠 시작 -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/board.reply.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/videoAdapter.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/kit_3.css">

<script type="text/javascript">
	$(function(){
		$('#search_form').submit(function(){
			if($('#keyword').val().trim()==''){
				alert('검색어를 입력하세요!');
				$('#keyword').val('').focus();
				return false;
			}
		});
	});
</script>
<script type="text/javascript">
$(function(){
	var status; //noFav or yesFav
	function selectData(kit_num){ //77라인 초기값 세팅
	   $.ajax({
	      type:'post',
	      data:{kit_num:kit_num}, //초기값 세팅에서 매개변수로 받아서 el 안씀
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
	$('#output_fav').click(function(){ //좋아요를 클릭했을때 실행되는 ajax
		$.ajax({
			url:'kitLike.do',
			type:'post',
			data:{kit_num:${kit.kit_num}},
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
	      $('#output_fav').attr('src',output); //id가 output_fav인 태그 src에 output 저장
	      $('#output_fcount').text(count); //id가 output_fcount인 태그 text에 count(좋아요 총 개수)저장
	   }
	
	   selectData(${kit.kit_num}); //초기값 세팅
	   
		$('#rateInsert').submit(function(){
			if($('#rate_text').val().trim()==''){
				alert('평가 내용을 입력하세요');
				$('#rate_text').val('').focus();
				return false;
			}
		});

	    
});
</script>

<div>
		<h3>키트상세</h3>
		<div class="align-right">
			<c:if test="${kit.user_num == session_user_num }">
				<input class="btn btn-outline-secondary"  type="button" value="수정" onclick="location.href='kitUpdate.do?kit_num=${kit.kit_num}'">
				<input type="button" value="삭제" id="delete_btn">
			<script type="text/javascript">
			let delete_btn = document.getElementById('delete_btn');
			delete_btn.onclick=function(){
				let choice = confirm('삭제하시겠습니까?');
				if(choice){
					location.replace('kitDelete.do?kit_num=${kit.kit_num}');
				}
			};
		</script>
			</c:if>
			<input type="button" value="목록" onclick="location.href='kitList.do'">
		</div>
	</div>
	<!--<c:if test="${!empty kit.filename}">
		<li>첨부파일 : <a href="file.do?board_num=${kit.kit_num}">${kit.filename}</a></li>
		</c:if>-->
	<div class="detail_content">
		<div class="ck_content">
		${kit.kit_content}
		<c:if test="${!empty kit.modify_date}">
		               최근 수정일 : ${kit.modify_date}
		</c:if>
		                      작성일 : ${kit.reg_date}
		</div>
		<!-- <div class="kitdetail"> -->
	<div class="sidebar">
			<div class="sidbar_content">
			<h6>키트번호 :${kit.kit_num}</h6>
			<h3>${kit.kit_name}</h3>
			<img src="imageView.do?kit_num=${kit.kit_num}"  style="width:300px; height:280px;" >
	<c:if test="${fn:endsWith(kit.filename,'.jpg') ||
	              fn:endsWith(kit.filename,'.JPG') ||
	              fn:endsWith(kit.filename,'.gif') ||
	              fn:endsWith(kit.filename,'.GIF') ||
	              fn:endsWith(kit.filename,'.png') ||
	              fn:endsWith(kit.filename,'.JPEG') ||
	              fn:endsWith(kit.filename,'.jpeg') ||
	              fn:endsWith(kit.filename,'.PNG')}">	
	
	</c:if>
	<div id="kit_quantity">남은 수량 : ${kit.kit_quantity}</div>
	<div class="box">
		<div class="box3">
		<div id="kit_content2">${kit.kit_content2}</div>
		<div class="price">가격</div>
		<div id="kit_price">${kit.kit_price}원</div></div>
       <div id="heart">
	  <img id="output_fav" src="../resources/image/heart1.png">
	  <span id="output_fcount" class="margin_right_10"></span>
	  </div> 
		<input type="button" value="장바구니"id="cart2" onclick="location.href='kitOder.do'"></div>
		<input type="button" value="관련클래스 구경하기" id="button2" onclick="location.href='class.do'">
	
	</div>

	</div>
	</div>
<!-- 중앙 컨텐츠 끝 -->







