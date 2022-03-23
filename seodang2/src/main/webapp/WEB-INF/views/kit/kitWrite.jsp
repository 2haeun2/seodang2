<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<!-- 중앙 컨텐츠 시작 -->
<!-- 부트스트랩 라이브러리 -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">

<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/kit.css">
<style>
.ck-editor__editable_inline{
	min-height:250px;
}
</style>
<!-- ckedior 라이브러리 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/ckeditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/uploadAdapter.js"></script>
<div>
	<h2>Kit 등록하기</h2>
	<form:form modelAttribute="kitVO" action="kitWrite.do" enctype="multipart/form-data" id="kit_register_form">
		<form:errors element="div" cssClass="error-color"/>
		<ul>
		
		    <li>
				<form:label path="kit_name" class="kit_name">키트이름</form:label>
				<form:input path="kit_name"/>
				<form:errors path="kit_name" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="kit_price">가격</form:label>
				<form:input type="number" path="kit_price" min="0"/>
				<form:errors path="kit_price" cssClass="error-color"/>
			</li>
			<li>
				<form:label path="kit_quantity">판매수량</form:label>
				<form:input type="number" path="kit_quantity" min="1"/>
				<form:errors path="kit_quantity" cssClass="error-color"/>
			</li>
			<li><b>내용</b></li>
			<li>
				<form:textarea path="kit_content"/>
				<form:errors path="kit_content" cssClass="error-color"/>
				<script>
				 function MyCustomUploadAdapterPlugin(editor) {
					    editor.plugins.get('FileRepository').createUploadAdapter = (loader) => {
					        return new UploadAdapter(loader);
					    }
					}
				 
				 ClassicEditor
		            .create( document.querySelector( '#kit_content' ),{
		            	extraPlugins: [MyCustomUploadAdapterPlugin]
		            })
		            .then( editor => {
						window.editor = editor;
					} )
		            .catch( error => {
		                console.error( error );
		            } );
			    </script>       
			</li>
			<li>
				<form:label path="upload">파일업로드</form:label>
				<input type="file" name="upload" id="upload">
				<form:errors path="upload" cssClass="error-color"/>
			</li>
		</ul>
		<div class="align-center">
			<form:button>등록하기</form:button>
			<input type="button" value="목록" 
			              onclick="location.href='kitList.do'">
		</div> 
		</form:form>		                                     
</div>
<!-- 중앙 컨텐츠 끝 -->



	              
