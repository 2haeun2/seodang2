<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/offclass.css">
<!-- 중앙 컨텐츠 시작 -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/ckeditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/ckeditor_style.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/uploadAdapter.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/offclass.time.js"></script>


<div class="container-right">
	<h4>오프라인 CLASS 등록하기</h4>
	<form:form action="offclassOpen.do" modelAttribute="offclassVO" id="open_form" enctype="multipart/form-data">
		<form:errors element="div" cssClass="error-color"/>
		<ul class="items">
			<li>
				<form:label path="category_num"><b>01</b></form:label>
				<form:label path="category_num">CLASS 분류</form:label><br>
				<form:select path="category_num" class="off-form-input" id="category_num">
					<form:option value="1">드로잉</form:option>
					<form:option value="2">플라워</form:option>
					<form:option value="3">공예</form:option>
					<form:option value="4">요리</form:option>
					<form:option value="5">베이킹</form:option>
				</form:select>
				<form:errors path="category_num" cssClas="error-color"/>
				<hr size="1" noshade>
			</li>
			<li>
				<form:label path="off_name"><b>02</b></form:label>
				<form:label path="off_name" maxlength='5'>수업명</form:label><br>
				<form:input path="off_name" placeholder="수업명을 입력해주세요." class="off-form-input" id="off_name"/>
				<form:errors path="off_name" cssClass="error-color"/>
				<hr size="1" noshade>
			</li>
			<li>
				<form:label path="off_limit"><b>03</b></form:label>
				<form:label path="off_limit">수업 인원</form:label><br>
				<form:input type="number" path="off_limit" min="1" class="off-form-input" id="off_limit"/>
				<form:errors path="off_limit"  cssClass="error-color"/>
				<hr size="1" noshade>
			</li>
			<li>
				<form:label path="off_price"><b>04</b></form:label>
				<form:label path="off_price">가격</form:label><br>
				<form:input type="number" path="off_price" min="0" class="off-form-input" id="off_price"/>
				<form:errors path="off_price"  cssClass="error-color"/>
				<hr size="1" noshade>
			</li>
			<li>
				<form:label path="off_price"><b>05</b></form:label>
				<form:label path="off_price">수업 장소</form:label><br>
				<form:input path="offzipcode" onclick="sample2_execDaumPostcode()" class="off-form-input" id="offzipcode"/>
				<input type="button" onclick="sample2_execDaumPostcode()" value="우편번호 찾기">
				<form:input path="offaddress1" class="off-form-input" placeholder="주소" id="offaddress1"/>
				<form:input path="offaddress2" class="off-form-input" placeholder="상세 주소" id="offaddress2"/>
				<hr size="1" noshade>
			</li>
			<li>
				<label for="time_date"><b>06</b></label>
				<label for="time_date">수업 일정</label><br>
				<input type="date" id="time_date" class="off-form-input"> <input type="time" id="time_start" class="off-form-input-date">~<input type="time" id="time_end" class="off-form-input-date">
				<input type="button" id="time_register" value="등록">
				<span id="message_id"></span>
			</li>
			<li id="time-item"><li>
			<li><hr size="1" noshade></li>
			<li><label for="off_content"><b>07</b></label></li>
			<li><label for="off_content">수업 상세</label><br></li>
			<li id="content">
				<form:errors path="off_content" cssClass="error-color"/>
				<form:textarea path="off_content" id="off_content"/>
				<!-- <script>
				
			    </script> -->      
			</li>
			<li>
				<form:label path="off_upload">대표사진 선택</form:label>
				<input type="file" name="off_upload" id="off_upload">
			</li>
		</ul>
		<div class="align-center">
			<form:button class="btn btn-outline-secondary" id="submit_btn">전송</form:button>
			<input type="button" value="목록" onclick="location.href='offclassList.do'" class="btn btn-outline-secondary">
		</div>
	</form:form>
<!-- 우편번호 스크립트 시작 -->
<!-- iOS에서는 position:fixed 버그가 있음, 적용하는 사이트에 맞게 position:absolute 등을 이용하여 top,left값 조정 필요 -->
<div id="layer" style="display:none;position:fixed;overflow:hidden;z-index:1;-webkit-overflow-scrolling:touch;">
<img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnCloseLayer" style="cursor:pointer;position:absolute;right:-3px;top:-3px;z-index:1" onclick="closeDaumPostcode()" alt="닫기 버튼">
</div>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
	//document.getElementById('offaddress1').readOnly = true;
    // 우편번호 찾기 화면을 넣을 element
    var element_layer = document.getElementById('layer');

    function closeDaumPostcode() {
        // iframe을 넣은 element를 안보이게 한다.
        element_layer.style.display = 'none';
    }

    function sample2_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    //(주의)address1에 참고항목이 보여지도록 수정
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    //(수정) document.getElementById("address2").value = extraAddr;
                
                } 
                //(수정) else {
                //(수정)    document.getElementById("address2").value = '';
                //(수정) }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('offzipcode').value = data.zonecode;
				document.getElementById('offzipcode').readOnly=true;
                //(수정) + extraAddr를 추가해서 address1에 참고항목이 보여지도록 수정
                document.getElementById("offaddress1").value = addr + extraAddr;
				document.getElementById('offaddress1').readOnly=true;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("offaddress2").focus();

                // iframe을 넣은 element를 안보이게 한다.
                // (autoClose:false 기능을 이용한다면, 아래 코드를 제거해야 화면에서 사라지지 않는다.)
                element_layer.style.display = 'none';
            },
            width : '100%',
            height : '100%',
            maxSuggestItems : 5
        }).embed(element_layer);

        // iframe을 넣은 element를 보이게 한다.
        element_layer.style.display = 'block';

        // iframe을 넣은 element의 위치를 화면의 가운데로 이동시킨다.
        initLayerPosition();
    }

    // 브라우저의 크기 변경에 따라 레이어를 가운데로 이동시키고자 하실때에는
    // resize이벤트나, orientationchange이벤트를 이용하여 값이 변경될때마다 아래 함수를 실행 시켜 주시거나,
    // 직접 element_layer의 top,left값을 수정해 주시면 됩니다.
    function initLayerPosition(){
        var width = 300; //우편번호서비스가 들어갈 element의 width
        var height = 400; //우편번호서비스가 들어갈 element의 height
        var borderWidth = 5; //샘플에서 사용하는 border의 두께

        // 위에서 선언한 값들을 실제 element에 넣는다.
        element_layer.style.width = width + 'px';
        element_layer.style.height = height + 'px';
        element_layer.style.border = borderWidth + 'px solid';
        // 실행되는 순간의 화면 너비와 높이 값을 가져와서 중앙에 뜰 수 있도록 위치를 계산한다.
        element_layer.style.left = (((window.innerWidth || document.documentElement.clientWidth) - width)/2 - borderWidth) + 'px';
        element_layer.style.top = (((window.innerHeight || document.documentElement.clientHeight) - height)/2 - borderWidth) + 'px';
    }
</script>
<!-- 중앙 컨텐츠 끝 -->
</div>
