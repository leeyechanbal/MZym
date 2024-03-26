<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.carousel-inner {
    overflow: hidden; /* 내용이 부모 요소를 벗어날 경우 숨김 처리 */
}
.carousel-item img {
    width: 100%; /* 이미지를 부모 요소의 너비에 맞게 설정 */
    height: auto; /* 이미지의 비율을 유지하면서 조정 */
}
</style>
</head>
<body>
	<!--banner start-->
	
	    <div id="demo" class="carousel slide" data-ride="carousel">
	
	        <!-- Indicators -->
	        <ul class="carousel-indicators">
	          <li data-target="#demo" data-slide-to="0" class="active"></li>
	          <li data-target="#demo" data-slide-to="1"></li>
	          <li data-target="#demo" data-slide-to="2"></li>
	        </ul>
	      
	        <!-- The slideshow -->
	        <div class="carousel-inner">
	          <div class="carousel-item active">
	            <a href="<%=contextPath %>/location.me" target="_blank"><img class="img-fluid" src="<%=contextPath %>/resources/img/common/홈페이지소개.jpg" alt=""></a>
	          </div>
	          <div class="carousel-item">
	            <a href="<%=contextPath %>/product.list" target="_blank"><img class="img-fluid" src="<%=contextPath %>/resources/img/common/PT.png" alt=""></a>
	          </div>
	          <div class="carousel-item">
	            <a href="<%= contextPath%>/freelist.bo?type=4" target="_blank"><img class="img-fluid" src="<%=contextPath %>/resources/img/common/운동모임.jpg" alt=""></a>
	          </div>
	        </div>
	      
	        <!-- Left and right controls -->
	        <a class="carousel-control-prev" href="#demo" data-slide="prev">
	          <span class="carousel-control-prev-icon"></span>
	        </a>
	        <a class="carousel-control-next" href="#demo" data-slide="next">
	          <span class="carousel-control-next-icon"></span>
	        </a>
	      
	      </div>
	      <!-- banner end -->
</body>
</html>