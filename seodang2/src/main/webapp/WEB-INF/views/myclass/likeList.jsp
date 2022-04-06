<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>    
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myclassList.css">
    

    
<b>찜 목록</b></br>

<c:if test="${count==0 }">
	<div>찜한 클래스가 없습니다</div>
</c:if>

<c:if test="${count>0}">
	<div class="item-space">
		<c:forEach var="like" items="${list}">
			<div class="horizontal-area">
				<c:choose>
					<c:when test="${like.onoff == 1}"><a href="${pageContext.request.contextPath}/onclass/onclassDetail.do?on_num=${like.on_num}"></c:when>
					<c:when test="${like.onoff == 2}"><a href="${pageContext.request.contextPath}/offclass/offclassDetail.do?off_num=${like.on_num}"></c:when>
				</c:choose>
					<div class="image-container">
						<c:choose>
							<c:when test="${like.onoff == 1}">
								<img src="${pageContext.request.contextPath}/onclass/imageView.do?on_num=${like.on_num}" 
	                          		style="max-width:200px;max-height:200px;margin-left:15px; margin-top:10px; border-radius: 10%;">
	                        </c:when>
	                        <c:when test="${like.onoff == 2}">
	                        	<img src="${pageContext.request.contextPath}/offclass/imageView.do?off_num=${like.on_num}" 
	                          		style="max-width:200px;max-height:200px;margin-left:15px; margin-top:10px; border-radius: 10%;">
	                        </c:when>
                        </c:choose>
					</div>
					<div class="item-category">${like.onlike_num}</div>
					<div class="name">${like.on_name}</div>
					<div class="align-right"><b>${like.on_price}원</b></div>	
					</a>			
					<img onclick="likeDelete()" id="output_fav" src="../resources/image/heart2.png">
					<!-- 찜 누르기 (숨김)-->
					<form action="likeDelete.do" method="post"> 
					<input type="hidden" name="on_num" value="${like.on_num}"/>
					<input type="hidden" name="onoff" value="${like.onoff}"/>
					<input id="likeDelete_btn" type="submit" value="전송" style="display:none;">
					</form>
					<!-- 찜 누르기 -->
			</div>
		</c:forEach>
	</div>
	<div class="align-center">${pagingHtml}</div>
	</c:if>
	
<script>
function likeDelete() {
	document.getElementById('likeDelete_btn').click();
}
</script>    