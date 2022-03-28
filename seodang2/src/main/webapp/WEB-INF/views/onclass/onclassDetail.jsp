<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link href="css/styles.css" rel="stylesheet" />
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<!-- 아임포트 임포트 -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<style>
	.list-unstyled img{
		display: block;
		float:left;
	}
</style>

<script type="text/javascript">
$(function(){
	var status; //noFav or yesFav
	$('#output_fav').click(function(){ //좋아요를 클릭했을때 실행되는 ajax
		$.ajax({
			url:'like.do',
			type:'post',
			data:{on_num:${onclass.on_num}},
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
	   }
});

//결제 코드
function iamport(){
	
	const email = "${ouser.email}";
	const on_price = "${onclass.on_price}";
	const id = "${ouser.id}";
	const phone = "${ouser.phone}";
	const address1 = "${ouser.address1}";
	const address2 = "${ouser.address2}";
	const on_name = "${onclass.on_name}"
	//가맹점 식별코드
	IMP.init('imp62760166');
	IMP.request_pay({
	    pg : 'kcp',
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : on_name , //결제창에서 보여질 이름
	    amount : on_price, //실제 결제되는 가격, 최소금액 500원 이상 , 500이하시 결제 오류
	    buyer_email : email,
	    buyer_name : id,
	    buyer_tel : phone,
	    buyer_addr : address1+address2
	    /* buyer_postcode : '123-456' */
	}, function(rsp) {
		console.log(rsp);
	    if ( rsp.success ) {
	    	var msg = '결제가 완료되었습니다.';
	        msg += '고유ID : ' + rsp.imp_uid;
	        msg += '상점 거래ID : ' + rsp.merchant_uid;
	        msg += '결제 금액 : ' + rsp.paid_amount;
	        msg += '카드 승인번호 : ' + rsp.apply_num;
	        document.getElementById('paymentData_btn').submit();
	    } else {
	    	 var msg = '결제에 실패하였습니다.';
	         msg += '에러내용 : ' + rsp.error_msg;
	    }
	    alert(msg);
	});
}
</script>
   
 <div class="container mt-5">
            <div class="row">
                <div class="col-lg-8">
                    <!-- Post content-->
                    <article>
                        <!-- Post header-->
                        <header class="mb-4">
                            <!-- Post title-->
                            <h1 class="fw-bolder mb-1">${onclass.on_name}</h1>
                            <!-- Post meta content-->
                            <div class="text-muted fst-italic mb-2">수업 등록일 : ${onclass.reg_date}</div>
                            <!-- Post categories-->
                            <a class="badge bg-secondary text-decoration-none link-light" href="#!">Web Design</a>
                            <a class="badge bg-secondary text-decoration-none link-light" href="#!">Freebies</a>
                        </header>
                        <!-- Preview image figure-->
                        <figure class="mb-4">
                        	<c:if test="${fn:endsWith(onclass.filename,'.jpg') ||
	             						fn:endsWith(onclass.filename,'.JPG') ||
	              						fn:endsWith(onclass.filename,'.gif') ||
	            					 	fn:endsWith(onclass.filename,'.GIF') ||
	            					  	fn:endsWith(onclass.filename,'.png') ||
	            					  	fn:endsWith(onclass.filename,'.PNG')}">
							<div class="align-center">
								<img src="imageView.do?on_num=${onclass.on_num}" 
		                                      					 style="max-width:500px">
							</div>
							</c:if>
                        </figure>
                        
                        <!-- Post content-->
                        <section class="mb-5">
                            <p class="fs-5 mb-4">${onclass.on_content}</p>
                            <p class="fs-5 mb-4">The universe is large and old, and the ingredients for life as we know it are everywhere, so there's no reason to think that Earth would be unique in that regard. Whether of not the life became intelligent is a different question, and we'll see if we find that.</p>
                            <p class="fs-5 mb-4">If you get asteroids about a kilometer in size, those are large enough and carry enough energy into our system to disrupt transportation, communication, the food chains, and that can be a really bad day on Earth.</p>
                        </section>
                    </article>
                </div>
                <!-- Side widgets-->
                <div class="col-lg-4">
                    <div class="card mb-4">
                        <div class="card-header">강의 정보</div>
                        <div class="card-body">
                            <div class="row">
                                <div class="col-sm-6">
                                    <ul class="list-unstyled mb-0">
                                        <li>가격</li>
                                        <li>강의등록일</li>
                                        <li>강의 평점</li>
                                    </ul>
                                </div>
                                <div class="col-sm-6">
                                    <ul class="list-unstyled mb-0">
                                        <li>${onclass.on_price}</li>
                                        <li>${onclass.reg_date}</li>
                                        <li>
                                        	<!-- 별 아이콘 반복 -->
	                                        <c:if test="${onclass.avgqna == 0}">
	                                        		<img src="../resources/image/star2.png" width="15px" height="15px">
	                                        		<img src="../resources/image/star2.png" width="15px" height="15px">
	                                        		<img src="../resources/image/star2.png" width="15px" height="15px">
	                                        		<img src="../resources/image/star2.png" width="15px" height="15px">
	                                        		<img src="../resources/image/star2.png" width="15px" height="15px">        			                                        	
	                                        </c:if>
	                                        <c:if test="${onclass.avgqna == 1}">
	                                        		<img src="../resources/image/star1.png" width="15px" height="15px">
	                                        		<img src="../resources/image/star2.png" width="15px" height="15px">
	                                        		<img src="../resources/image/star2.png" width="15px" height="15px">
	                                        		<img src="../resources/image/star2.png" width="15px" height="15px">
	                                        		<img src="../resources/image/star2.png" width="15px" height="15px">        			                                        	
	                                        </c:if>
	                                        <c:if test="${onclass.avgqna == 2}">
	                                        		<img src="../resources/image/star1.png" width="15px" height="15px">
	                                        		<img src="../resources/image/star1.png" width="15px" height="15px">
	                                        		<img src="../resources/image/star2.png" width="15px" height="15px">
	                                        		<img src="../resources/image/star2.png" width="15px" height="15px">
	                                        		<img src="../resources/image/star2.png" width="15px" height="15px">        			                                        	
	                                        </c:if>
	                                        <c:if test="${onclass.avgqna == 3}">
	                                        		<img src="../resources/image/star1.png" width="15px" height="15px">
	                                        		<img src="../resources/image/star1.png" width="15px" height="15px">
	                                        		<img src="../resources/image/star1.png" width="15px" height="15px">
	                                        		<img src="../resources/image/star2.png" width="15px" height="15px">
	                                        		<img src="../resources/image/star2.png" width="15px" height="15px">        			                                        	
	                                        </c:if>
	                                        <c:if test="${onclass.avgqna == 4}">
	                                        		<img src="../resources/image/star1.png" width="15px" height="15px">
	                                        		<img src="../resources/image/star1.png" width="15px" height="15px">
	                                        		<img src="../resources/image/star1.png" width="15px" height="15px">
	                                        		<img src="../resources/image/star1.png" width="15px" height="15px">
	                                        		<img src="../resources/image/star2.png" width="15px" height="15px">        			                                        	
	                                        </c:if>
	                                        <c:if test="${onclass.avgqna == 5}">
	                                        		<img src="../resources/image/star1.png" width="15px" height="15px">
	                                        		<img src="../resources/image/star1.png" width="15px" height="15px">
	                                        		<img src="../resources/image/star1.png" width="15px" height="15px">
	                                        		<img src="../resources/image/star1.png" width="15px" height="15px">
	                                        		<img src="../resources/image/star1.png" width="15px" height="15px">        			                                        	
	                                        </c:if>
	                                        
	                                        
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- Side widget-->
                    <div class="card mb-4">
                        <div class="card-header">Side Widget</div>
                        <div class="card-body">
                        	<ul class="list-unstyled mb-0">
                                <li><i class="bi bi-cart"></i>&nbsp&nbsp장바구니 담기</li>
                                <li><i class="bi bi-archive"></i>&nbsp&nbsp키트구매</li>
                                <li><i class="bi bi-question-circle"></i>&nbsp&nbsp1:1 QnA</li>
                                <li><i class="bi bi-chat-left-dots"></i><a href="${pageContext.request.contextPath}/onclass/qnaList.do?on_num=${onclass.on_num}" class="menu-item">&nbsp&nbsp강의후기 게시판</a></li>
                                <li><img id="output_fav" src="../resources/image/heart1.png"></li>	
                            </ul>
                        </div>
                    </div>
                    <button type="button" onclick="iamport()" class="btn btn-dark" style="width:230px">구매</button>
                </div>
            </div>
        </div>
<div>
	<!-- 안보이게 하기 -->
	<form action="payment.do" id="paymentData_btn" method="post" id="paymentData"> 
		<input type="hidden" name="on_num" value="${onclass.on_num}"/>
		<input type="hidden" name="on_payment" value="2"/>
		<input type="hidden" name="on_status" value="1"/>  
	   	<input type="submit" value="임시 구매 버튼">
	</form>
	<!-- 안보이게 하기 -->
</div>