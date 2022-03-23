<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.1/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
	.fa-star{margin-right:20px;}
	.btn{margin-top:30px;}
</style>
    
<form:form modelAttribute="ostarVO" action="qnaList.do" 
	                 enctype="multipart/form-data" id="qna_form">
		<form:hidden path="user_num" />
		<form:hidden path="on_num" />		
		<form:textarea path="text" cssClass="form-control" rows="5" />
		
		<form:radiobutton path="rating" onclick="starmark(this)" id="1one" value="1" style="font-size:40px;cursor:pointer;" class="fa fa-star checked" />
		<form:radiobutton path="rating" onclick="starmark(this)" id="2one" value="2" style="font-size:40px;cursor:pointer;" class="fa fa-star "/>
		<form:radiobutton path="rating" onclick="starmark(this)" id="3one" value="3" style="font-size:40px;cursor:pointer;" class="fa fa-star "/>
		<form:radiobutton path="rating" onclick="starmark(this)" id="4one" value="4" style="font-size:40px;cursor:pointer;" class="fa fa-star"/>
		<form:radiobutton path="rating" onclick="starmark(this)" id="5one" value="5" style="font-size:40px;cursor:pointer;" class="fa fa-star"/></br>		
			<button class="btn btn-block btn-primary" type="submit">리뷰 등록</button>     
	</form:form>
	
	<table class="table">
		  <thead>
		    <tr>
		      <th scope="col">아이디</th>
		      <th scope="col">별점</th>
		      <th scope="col">평가내용</th>
		    </tr>
		  </thead>
		  <tbody>
		  	<c:forEach items="${list}" var="ostar">
			    <tr>
			      <th scope="row">${ostar.id}</th>
			      <td>${ostar.rating}</td>
			      <td>${ostar.text}</td>
			    </tr>
		    </c:forEach>
		  </tbody>
	</table>
	
	
<script>
var count;

function starmark(item){
	count=item.id[0];
	sessionStorage.starRating = count;
	var subid= item.id.substring(1);
		for(var i=0;i<5;i++){
			if(i<count){
				document.getElementById((i+1)+subid).style.color="orange";
				}
			else{
				document.getElementById((i+1)+subid).style.color="black";
				}
			}
		}
function result()
{
//Rating : Count
//Review : Comment(id)
alert("Rating : "+count+"\nReview : "+document.getElementById("comment").value);
}		
</script>