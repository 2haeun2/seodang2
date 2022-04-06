<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>    
<!-- 중앙 컨텐츠 시작 -->
<!-- 부트스트랩 라이브러리 -->
<link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/ckeditor_style.js"></script>
<script type="text/javascript" src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/kit_2.css">
<style>
.ck-editor__editable_inline{
	min-height:250px;
}
</style>
<script type="text/javascript">
$(function(){
	$('#photo_btn').click(function(){
		$('#photo_choice').show();
		$(this).hide();
	});
	
	//처음 화면에 보여지는 이미지 읽기
	let photo_path = $('.kitVO.filename').attr('src');
	let my_photo;
	$('#upload').change(function(){
		kitVO.filename = this.files[0];
		if(!kitVO.filename){
			$('.kitVO.filename').attr('src',photo_path);
			return;
		}
		
		
		//이미지 미리보기
		var reader = new FileReader();
		reader.readAsDataURL(kitVO.filename);
		
		reader.onload=function(){
			$('.kitVO.filename').attr('src',reader.result);
		};
	});//end of change

</script>
<!-- ckedior 라이브러리 -->
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/ckeditor.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/uploadAdapter.js"></script>
<div class="page-main">
	<h2>Kit 등록하기</h2>
	<form:form modelAttribute="kitVO" action="kitWrite.do" enctype="multipart/form-data" ><!-- id="register_form" -->
		<form:errors element="div" cssClass="error-color"/>
		<div class="kitwrite">
			<form:button>등록하기</form:button>
			<input type="button" value="목록" 
			              onclick="location.href='kitList.do'">
		</div> 
		<ul id="box4">
		    <li>
	 <c:if test="${empty kitVO.filename}">
			<img src="${pageContext.request.contextPath}/resources/images/face.png"
			                     width="200" height="200" class="my-photo">
			</c:if>
			<c:if test="${!empty kitVO.filename}">
			<img src="imageView.do?kit_num=${kitVO.filename}"  
			style="width:200px; height:200px; border-radius:5px;">
			</c:if>	
			</li>
			<li id="file">
				<form:label path="upload">대표사진</form:label>
				<input type="file" name="upload" id="upload">
				<form:errors path="upload" cssClass="error-color"/>
			</li>
		    <li id="name">
				<form:label path="kit_name" class="kit_name">키트이름</form:label>
				<form:input path="kit_name"/>
				<form:errors path="kit_name" cssClass="error-color"/>
			</li>			
			<li id="price">
				<form:label path="kit_price">가격</form:label>
				<form:input type="number" path="kit_price" min="1"/>
				<form:errors path="kit_price" cssClass="error-color"/>
			</li>
			<li id="quantity">
				<form:label path="kit_quantity">판매수량</form:label>
				<form:input type="number" path="kit_quantity" min="1"/>
				<form:errors path="kit_quantity" cssClass="error-color"/>
			</li>
			<li id="content2">
				<form:label path="kit_content2">설명</form:label>
				<form:input path="kit_content2"/>
				<form:errors path="kit_content2" cssClass="error-color"/>
			</li>
			<li id="content">
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
			
	</ul>
		
		</form:form>		                                     
</div>
<!-- 중앙 컨텐츠 끝 -->

	              
