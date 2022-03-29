<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 

<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/List.css">
       
<style>
p { margin:20px 0px;}
.container{width:1200px; max-width:none!important;}
</style>

<c:if test="${session_user_auth == 3}">
<div><button type="button" class="btn btn-outline-secondary" onclick="location.href='onclassInsert.do'">수업등록</button></div>
</c:if>


<c:if test="${count == 0}">
	<div class="result-display">표시할 게시물이 없습니다.</div>
</c:if>

<a href="${pageContext.request.contextPath}/onclass/onclassList.do" class="menu-item">등록일순</a>
<a href="${pageContext.request.contextPath}/onclass/onclassList.do?category=1" class="menu-item">조회수순</a>

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
<c:forEach var="onclass" items="${list}">
<!--//////////////////////////////////////////////////////////////////////////////////////////  -->

	<div class="home">
<ul>
	<li>
		<div class="List">
			<div>
				<c:if test="${fn:endsWith(onclass.filename,'.jpg') ||
		             		fn:endsWith(onclass.filename,'.JPG') ||
		              		fn:endsWith(onclass.filename,'.gif') ||
		            		fn:endsWith(onclass.filename,'.GIF') ||
		            		fn:endsWith(onclass.filename,'.png') ||
		            		fn:endsWith(onclass.filename,'.PNG')}">
				<div class="align-center">
					<div class="list_img">
					<a data-bs-toggle="modal" data-bs-target="#staticBackdrop">
						<img src="imageView.do?on_num=${onclass.on_num}" 
	                                     					 style="max-width:200px;max-height:200px">
					</a>	                                     					 
					</div>                                     					 
			<div class="btn_one">                                     					 
				<c:if test="${sessionScope.session_user_num == onclass.user_num}">
			    		<!-- 본인게시물만 삭제 수정 가능 %관리자도 삭제 가능하게 -->
				      <button type="button" class="btn btn-dark" onclick="location.href='onclassModify.do?on_num=${onclass.on_num}'">수정</button>
				      <button type="button" class="btn btn-dark" onclick="location.href='onclassDelete.do?on_num=${onclass.on_num}'">삭제</button>		      
			    </c:if>
			    <button type="button" class="btn btn-dark" onclick="location.href='onclassDetail.do?on_num=${onclass.on_num}'">상세보기</button>	
			</div>					
			<div class="icon_one">
				<!-- 찜하기 아이콘  -->
				<i class="bi bi-person">${onclass.hit}</i>	
			</div>										         							                                     					 	
				</div>
			</c:if>
			</div>
		</div>
	</li>	
</ul>	
</div>
<!-- 모달 시작 -->
      	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <h5 class="modal-title" id="staticBackdropLabel">${onclass.on_name}</h5>
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
		      </div>
		      <div class="modal-body">
		       	<c:if test="${fn:endsWith(onclass.filename,'.jpg') ||
		             		fn:endsWith(onclass.filename,'.JPG') ||
		              		fn:endsWith(onclass.filename,'.gif') ||
		            		fn:endsWith(onclass.filename,'.GIF') ||
		            		fn:endsWith(onclass.filename,'.png') ||
		            		fn:endsWith(onclass.filename,'.PNG')}">
		           <img src="imageView.do?on_num=${onclass.on_num}" 
		           									style="max-width:400px;max-height:300px">	
           		</c:if>
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
		        <button type="button" class="btn btn-primary">Understood</button>
		      </div>
		    </div>
		  </div>
		</div>
<!-- 모달 끝 -->
</c:forEach>

		

<div class="align-center">${pagingHtml}</div>


</c:if>
	


    