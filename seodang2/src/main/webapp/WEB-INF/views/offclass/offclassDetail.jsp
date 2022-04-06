<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<link rel="stylesheet"
	href="${pageContext.request.contextPath}/resources/css/offclass.css">
<!-- 중앙 컨텐츠 시작 -->
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/videoAdapter.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/offclass.detail.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c937f1e64d49fa65f28e4eafd42ed12d&libraries=services"></script>

<div class="container-right">
	<div class="container-head">
		<h3>오프라인 클래스 상세</h3>
		<div>
			<c:if test="${offclass.user_num == session_user_num }">
				<input class="btn btn-outline-secondary" type="button" value="수정"
					onclick="location.href='offclassUpdate.do?off_num=${offclass.off_num}'">
			</c:if>
			<c:if
				test="${offclass.user_num == session_user_num || session_user_auth==4 }">
				<input class="btn btn-outline-secondary" type="button" value="삭제"
					onclick="location.href='offclassDelete.do?off_num=${offclass.off_num}'">
			</c:if>
		</div>
	</div>
	<div class="detail_content">
		<div></div>
		<div class="ck_content">
			<div>${offclass.off_content }</div>
			<!-- 위치 넣기 -->
			<div>
				<div>
					<div>오프라인 장소</div>
					<span id="offaddress1">${offclass.offaddress1 }</span>
					<span id="offaddress2">${offclass.offaddress2 }</span>
					<span id="offzipcode">(${offclass.offzipcode })</span>
				</div>
			<div id="map" style="width: 100%; height: 350px;"></div>
			</div>
			<hr class="off_detail" size="1">
			<div class="off_review align-right">
				<input type="button" class="btn" value="후기 작성하기"
					onclick="location.href='offclassReview.do?off_num=${offclass.off_num}'">
			</div>
			<div class="align-center">
				<div class="average-review display-flex">
					<div class="avg_rating">${rating }</div>
					<div>총 ${review_count }개</div>
				</div>
			</div>
			<div class="reviewList">
				<c:forEach var="offstarVO" items="${list2 }">
					<div class="review width-50">
							<div>
								<div class="review_start">
									<div class="user_image">
										<c:if test="${!empty offstarVO.photo_name }">
											<img src="imageViewUser.do?user_num=${offstarVO.user_num}">
										</c:if>
										<c:if test="${empty offstarVO.photo_name }">
											<img
												src="${pageContext.request.contextPath}/resources/images/face.png">
										</c:if>
									</div>
									<div class="name-rating">
										<div>
											<div>
												${offstarVO.name } <span class="re-date">${offstarVO.reg_date }</span>
											</div>
											<div class="star-ratings">
												<div class="star-ratings-fill space-x-2 text-lg"
													style="width:${offstarVO.rating_percent}%">
													<div>
														<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
													</div>
												</div>
												<div class="star-ratings-base space-x-2 text-lg">
													<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
												</div>
											</div>
										</div>
									</div>
								</div>
								<c:set var="offstarVO_text" value="${offstarVO.text }" />
								<c:choose>
									<c:when test="${fn:length(offstarVO_text)<=100}">
						        ${offstarVO.text }
						    </c:when>
									<c:otherwise>
						    	${fn:substring(offstarVO_text, 0,100)} ......<small>(더보기)</small>
									</c:otherwise>
								</c:choose>
							</div>
							<div class="writer-reply">
								<img
									src="${pageContext.request.contextPath}/resources/images/speech_bubble.png">
								<c:if test="${!empty offstarVO.writer_num}">
									<span> 1 </span>
								</c:if>
								<c:if test="${empty offstarVO.writer_num}">
									<span> 0 </span>
								</c:if>
							</div>
					</div>
				</c:forEach>
			</div>
			<div>
				<input type="button" value="후기 목록 더보기"
					onclick="location.href='offclassReviewList.do?off_num=${offclass.off_num}'">
			</div>
		</div>
		<div class="sidebar">
			<div class="sidbar_content">
				<input type="hidden" value="${offclass.off_num }" id="off_num">
				<div>${offclass.category_num }</div>
				<h3>${offclass.off_name }</h3>
				<h4>${offclass.off_price }원</h4>
				<hr size="1">
				<div class="schedule_calendar">
					<h4>클래스 일정</h4>
					<div class="swiper-wrapper"
						style="transition-duration: 0ms; transform: translate3d(0px, 0px, 0px);">
						<c:forEach var="offTimetableVO" items="${list }">
							<div id="time_date" data-timedate="${offTimetableVO.time_date }">
								<a class="schedules">
									<div class="time_date">${offTimetableVO.string_date }</div>
									<div class="time_date">${offTimetableVO.day }</div>
								</a>
							</div>
						</c:forEach>
					</div>
					<hr size="1" noshade>
					<div id="timetable"></div>
				</div>
				<hr size="1" noshade>
				<input class="btn btn-outline-secondary" type="button"
					value="장바구니 담기"><br> <input
					class="btn btn-outline-secondary" type="button" value="바로 구매">
				<c:choose>
					<c:when test="${likecheck eq '0' or empty likecheck}">
						<button class="btn" id="like_btn">
							<img
								src="${pageContext.request.contextPath }/resources/images/heart_nofill.png">
							<span id="like_count"></span>
						</button>
					</c:when>
					<c:otherwise>
						<button class="btn" id="like_btn">
							<img
								src="${pageContext.request.contextPath }/resources/images/heart_fill.png">
							<span id="like_count"></span>
						</button>
					</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</div>
<script>
	let offaddress1 = document.getElementById('offaddress1').innerText;
	let offaddress2 = document.getElementById('offaddress2').innerText;
	let offzipcode = document.getElementById('offzipcode').innerText;
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = {
	        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };  
	
	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	map.setDraggable(false);
	map.setZoomable(false); 
	
	// 주소-좌표 변환 객체를 생성합니다
	var geocoder = new kakao.maps.services.Geocoder();
	
	// 주소로 좌표를 검색합니다
	geocoder.addressSearch(offaddress1, function(result, status) {
	
	    // 정상적으로 검색이 완료됐으면 
	     if (status === kakao.maps.services.Status.OK) {
	
	        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
	
	        // 결과값으로 받은 위치를 마커로 표시합니다
	        var marker = new kakao.maps.Marker({
	            map: map,
	            position: coords
	        });
	
	        // 인포윈도우로 장소에 대한 설명을 표시합니다
	        var infowindow = new kakao.maps.InfoWindow({
	            content: '<div class="map-title">'+offaddress1+' '+ offaddress2+'</div>'
	        });
	        infowindow.open(map, marker);
	
	        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
	        map.setCenter(coords);
	    } 
});    
</script>
<!-- 중앙 컨텐츠 끝 -->