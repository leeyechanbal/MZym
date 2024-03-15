<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	            <img src="<%=contextPath %>/resources/img/common/메인사진1.jpg" alt="">
	          </div>
	          <div class="carousel-item">
	            <img src="<%=contextPath %>/resources/img/common/메인사진2.jpg" alt="">
	          </div>
	          <div class="carousel-item">
	            <img src="<%=contextPath %>/resources/img/common/메인사진3.jpg" alt="">
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