<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 페이지</title>
<style>
 .homePage_content{ /*메인 영역*/
    border: 2px solid #1ABC9C;
    width: 90%;
    height: 100%;
    margin: auto;
    margin-top: 50px;
    min-height: 1200px;
    padding: 50px;
    border-radius: 10px;
    display: flex;
  }
    .trainerInfo{
    
    width: 50%;
    height: 100%;
    margin: 50px auto;
    min-height: 1200px;
    padding: 50px;
    }
    .boardInfo{
    width: 50%;
    height: 100%;
    margin: 50px auto;
    min-height: 1200px;
    padding: 50px;
    }
    .noticeArea{
      border: 1px solid red;
      width: 80%;
      height: 100%;
      margin: 50px auto;
      min-height: 500px;
     
    }

    .boardArea{
      border: 1px solid red;
      width: 80%;
      height: 100%;
      margin: 50px auto;
      min-height: 500px;
     
    }
    .trainerArea{
      border: 2px solid #1ABC9C;
      width: 100%;
      height: 100%;
      margin: auto;
      min-height: 1200px;
      border-radius: 10px;
      display: flex;
      flex-direction: column;
      padding: 50px;
    }
    .trainerTitle{
      margin: 10px;
      width: 100%;
      text-align: center;
    }
   .trainer-wrapper{
    width: 100%;
    height: 100%;
    overflow: hidden;
    min-height: 1200px;
    border-radius: 10px;

   }
   .trainerImg img{
    min-height: 1200px;
   }
   .text-area li{
    list-style: none;
    display: flex;
    flex-direction: column;
    text-align: right;
    
   }
   .text-area h5{
      text-align: right;
      margin-left: 20px;
      margin-top: 50px;
   }
   .text-area h3{
      text-align: left;
      margin-left: 20px;
      margin-top: 50px;
   }




</style>
</head>
<body>
	<div class="wrap">

        <%@ include file="/views/common/Mzym_header.jsp" %>
        
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
	      
      
        <!-- Section start -->
        <section class="main_content">
		<%@ include file="/views/common/Mzym_sidebar.jsp" %>
          <div class="homePage_content">
            <div class="trainerInfo">
             
              <div class="trainerArea">

                <div class="trainerTitle"><span><h3>퍼스널 트레이너 소개</h3></span></div>
                 
                <div class="trainer-wrapper">

                <div id="trainer" class="carousel slide" data-ride="carousel">
                  <!-- Indicators -->
                  <ul class="carousel-indicators">
                    <li data-target="#trainer" data-slide-to="0" class="active"></li>
                    <li data-target="#trainer" data-slide-to="1"></li>
                    <li data-target="#trainer" data-slide-to="2"></li>
                  </ul>
                  <!-- The slideshow -->
                  <div class="carousel-inner trainerImg">
                    <div class="carousel-item active">
                      <img src="<%=contextPath %>/resources/img/common/트레이너 이미지 샘플.png" alt="트레이너 이미지1">
                      <div class="carousel-caption d-none d-md-block text-area">
                        <h3>홍길동 트레이너</h3>
                        <div>
                          <h5>자격증 및 수료증</h5>
                            <ul>
                              <li>홍길동 자격증1</li>
                              <li>홍길동 자격증2</li>
                              <li>홍길동 자격증3</li>
                              <li>홍길동 자격증4</li>
                              <li>홍길동 자격증5</li>
                              <li>홍길동 자격증5</li>
                              <li>홍길동 자격증5</li>
                              <li>홍길동 자격증5</li>
                              <li>홍길동 자격증5</li>
                              <li>홍길동 자격증5</li>
                              
                            </ul>
                        </div>
                      </div>
                    </div>
                    <div class="carousel-item">
                      <img src="<%=contextPath %>/resources/img/common/트레이너 이미지 샘플2.png" alt="트레이너 이미지2">
                      <div class="carousel-caption d-none d-md-block text-area">
                        <h3>김철수 트레이너</h3>
                        <div class="text-area">
                          <h5>자격증 및 수료증</h5>
                            <ul>
                              <li>김철수 자격증1</li>
                              <li>김철수자격증2</li>
                              <li>김철수 자격증3</li>
                              <li>김철수 자격증4</li>
                              <li>김철수 자격증5</li>
                            </ul>
                        </div>
                      </div>
                    </div>
                    <div class="carousel-item">
                      <img src="<%=contextPath %>/resources/img/common/트레이너 이미지 샘플3.png" alt="트레이너 이미지3">
                      <div class="carousel-caption d-none d-md-block text-area">
                        <h3>김민수 트레이너</h3>
                        <div>
                          <h5>자격증 및 수료증</h5>
                          <ul>
                            <li>김민수 자격증1</li>
                            <li>김민수 자격증2</li>
                            <li>김민수 자격증3</li>
                            <li>김민수 자격증4</li>
                            <li>김민수 자격증5</li>
                          </ul>
                        </div>
                      </div>
                    </div>
                  </div>
                  <!-- Left and right controls -->
                  <a class="carousel-control-prev" href="#trainer" data-slide="prev">
                    <span class="carousel-control-prev-icon"></span>
                  </a>
                  <a class="carousel-control-next" href="#trainer" data-slide="next">
                    <span class="carousel-control-next-icon"></span>
                  </a>
                </div>
                </div>
              </div>
            </div>
            <div class="boardInfo">
                <div class="noticeArea">
                  <div style="text-align: center;"><span><h3>공지사항</h3></span></div>
                 
                  공지사항 incloude
                </div>
                
                <div class="boardArea">
                  <div style="text-align: center;"><span><h3>자유게시판</h3></span></div>
                  자유게시판 incloude
                </div>
            
              </div>

        </div>  

        </section>
        <!-- Section end -->

        <%@ include file="/views/common/Mzym_footer.jsp" %>

    </div>
</body>
</html>