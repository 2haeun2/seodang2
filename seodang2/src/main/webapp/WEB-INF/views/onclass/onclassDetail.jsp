<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!-- 외부이미지 불러오기 -->
<%@taglib uri="http://www.springframework.org/tags" prefix="spring"%> 

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">



<!-- 모달 부트스트랩 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<!-- 리플 -->
<%-- <script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/onclass.reply.js"></script> --%>

<!-- 아임포트 임포트 -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/ratestar.css">


<script type="text/javascript">
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
	$('#output_fav').click(function(){ //좋아요를 클릭했을때 실행되는 ajax
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
	      $('#output_fav').attr('src',output); //id가 output_fav인 태그 src에 output 저장
	      $('#output_fcount').text(count); //id가 output_fcount인 태그 text에 count(좋아요 총 개수)저장
	   }
	
	   selectData(${onclass.on_num}); //초기값 세팅
	   
		$('#rateInsert').submit(function(){
			if($('#rate_text').val().trim()==''){
				alert('평가 내용을 입력하세요');
				$('#rate_text').val('').focus();
				return false;
			}
		});  
});

//결제 코드
function iamport(){
	
	const email = "${ouser.email}";
	const on_price = "${onclass.on_price}";
	const id = "${ouser.id}";
	const phone = "${ouser.phone}";
	const address1 = "${ouser.address1}";
	const address2 = "${ouser.address2}";
	const on_name = "${onclass.on_name}";
	
	const user_num = "${session_user_num}";
	
	console.log(user_num);
	
	if(user_num == ""){
		alert('로그인 후 구매 가능합니다.')
	}else if(user_num != null){
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
}
/////////////////////////////////////////////////////////////////////

</script>
<div class="img-one"">
<img src="${pageContext.request.contextPath}/resources/image_upload/${upfile0.file_name}">
</div>
<div class="img-two">
<img src="${pageContext.request.contextPath}/resources/image_upload/${upfile1.file_name}">
</div>
<div class="img-three">
<img src="${pageContext.request.contextPath}/resources/image_upload/${upfile2.file_name}">
</div>
<div class="img-four">
<img src="${pageContext.request.contextPath}/resources/image_upload/${upfile3.file_name}">
</div>



<!-- 다중이미지 불러오기 -->
<%-- <c:forEach var="uplist" items="${uplist}" varStatus="vs">
	<div style="float:left; width:25%;">
		<img src="${pageContext.request.contextPath}/resources/image_upload/${uplist.file_name}" height="200px">
	</div>
</c:forEach>    --%>

<div>
${onclass.on_name}
수업 등록일 : ${onclass.reg_date} 세션 : ${session_user_num}
글내용 : ${onclass.on_content}
${onclass.on_price}
${onclass.reg_date}
<a href="${pageContext.request.contextPath}/onclass/onclassModify.do?on_num=${onclass.on_num}">수정</a>
<a href="${pageContext.request.contextPath}/onclass/onclassDelete.do?on_num=${onclass.on_num}">삭제</a>
</div>
                  

            
		<!-- 찜 누르기 -->
		<img id="output_fav" src="../resources/image/heart1.png">
		<span id="output_fcount" class="margin_right_10"></span>
		<!-- 찜 누르기 -->
		<!-- 구매버튼 -->
		<button type="button" onclick="iamport()" class="btn btn-dark" style="width:230px">구매</button>
		<!-- 구매버튼 -->
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


<div class="align-center">${pagingHtml}</div>
