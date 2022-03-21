<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %> 
<script src="${pageContext.request.contextPath}/resources/js/jquery-3.6.0.min.js"></script>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
        
<style>
p { margin:20px 0px;}

</style>

<div><button type="button" class="btn btn-outline-secondary" onclick="location.href='onclassInsert.do'">수업등록</button></div>
<c:if test="${count == 0}">
	<div class="result-display">표시할 게시물이 없습니다.</div>
</c:if>
<c:if test="${count > 0}">
<c:forEach var="onclass" items="${list}">
<!--//////////////////////////////////////////////////////////////////////////////////////////  -->

	<div class="card-group" style="width:250px;height:300px">
		  <div class="card">
		    <a data-bs-toggle="modal" data-bs-target="#staticBackdrop">
		    <img class="card-img-top" src="${pageContext.request.contextPath}/upload/${onclass.filename}" alt="">
		    <c:if test="${fn:endsWith(onclass.filename,'.jpg') ||
		             		fn:endsWith(onclass.filename,'.JPG') ||
		              		fn:endsWith(onclass.filename,'.gif') ||
		            		fn:endsWith(onclass.filename,'.GIF') ||
		            		fn:endsWith(onclass.filename,'.png') ||
		            		fn:endsWith(onclass.filename,'.PNG')}">
				<div class="align-center">
					<img src="imageView.do?on_num=${onclass.on_num}" 
                                     					 style="max-width:200px;max-height:100px">
				</div>
			</c:if>
		    </a>    
		    <div class="card-body">
		      <h5 class="card-title">${onclass.on_name}</h5>
		      <p class="card-text">${onclass.on_content}</p>
		    </div>
		    <div class="card-footer">
		    <c:if test="${sessionScope.session_user_num == onclass.user_num}">
		    	<!-- 본인게시물만 삭제 수정 가능 %관리자도 삭제 가능하게 -->
		      <button type="button" class="btn btn-dark" onclick="location.href='onclassModify.do?on_num=${onclass.on_num}'">수정</button>
		      <button type="button" class="btn btn-dark" onclick="location.href='onclassDelete.do?on_num=${onclass.on_num}'">삭제</button>
		      <button type="button" class="btn btn-dark" onclick="location.href='onclassDetail.do?on_num=${onclass.on_num}'">상세보기</button>
		    </c:if>
		      <!-- 모달 시작 -->
		      	<div class="modal fade" id="staticBackdrop" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
				  <div class="modal-dialog">
				    <div class="modal-content">
				      <div class="modal-header">
				        <h5 class="modal-title" id="staticBackdropLabel">Modal title</h5>
				        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				      </div>
				      <div class="modal-body">
				        ...
				      </div>
				      <div class="modal-footer">
				        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
				        <button type="button" class="btn btn-primary">Understood</button>
				      </div>
				    </div>
				  </div>
				</div>
		      <!-- 모달 끝 -->
		            
		    </div>
		  </div>
		</div>
<!--//////////////////////////////////////////////////////////////////////////////////////////  -->
	</c:forEach>

	
	<div class="align-center" style="text-align: bottom;">${pagingHtml}</div>
	</c:if>
	


    