<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>시설 안내</title>
<style>
	 .FacilityPage_content{ /*메인 영역*/
	    border: 2px solid #1ABC9C;
	    width: 100%;
	    height: 100%;
	    margin: auto;
	    margin-top: 50px;
	    min-height: 1200px;
	    padding: 50px;
	    border-radius: 10px;
	  }
	  .FacilityPage_content > div {
	    flex: 1;
	    margin: 20px;
		}
		.pageTitle{
		    height: 20%;
		    position: relative;
		    
		}
	.text-overlay {
	      position: absolute;
	      top: 50%;
	      left: 80%;
	      transform: translate(-50%, -50%);
	      color: white;
	      padding: 10px;
	      display: flex;
	      justify-content: center;
	      align-items: center;
	      flex-wrap: nowrap;
	      width: 50%;
	    
	    }
	.pageTitle img{
	    width: 100%;
	    height: 100%;
	    border-radius: 10px;
	   
	}
	.addressArea{
	    height: 10%;
	    flex-wrap: nowrap;
	    font-size: 30px;
	    border-bottom: 4px solid #e0e0e0;
	}
	
	.contentArea{
	    height: 20%;
	}
	.informationArea{
	  width: 100%;
	  min-height: 800px;
	  display:inline-block;
	  
	}
	.informationItem{
	  min-height: 250px;
	  margin: 50px auto;
	  padding: 10px;
	  border-radius: 15px;
	  background-color: #e0e0e0;
	  display: flex;
	}
	.itemImg{
	  width: 20%;
	  margin: 20px;
	  border-radius: 10px;
	}
	.itemImg img {
	  width: 100%;
	  height: 100%;
	  object-fit: cover; /* 이미지를 확대 또는 축소하여 해당 요소에 맞춥니다. */
	  border-radius: 10px;
	}
	.itemContent{
	  width: 70%;
	  margin: 20px;
	 
	  border-radius: 10px;
	  background-color: #1ABC9C;
	  color: white;
	  font-weight: bold;
	}
	.itemContent > *{
	  margin: 20px;
	}
	h3{
	  text-align: left;
	}
	.itemContent li{
	 list-style-type: decimal; 
	 margin-top: 20px;
	 font-size: 20px;
	}
	

</style>
</head>
<body>
	<div class="wrap">
	<%@ include file="/views/common/Mzym_header.jsp" %>
	<%@ include file="/views/common/Mzym_banner.jsp" %>
	      
      
        <!-- Section start -->
        <section class="main_content">
		<%@ include file="/views/common/Mzym_sidebar.jsp" %>
          <div class="FacilityPage_content">
          	<div class="pageTitle">
                <img src="<%=contextPath %>/resources/img/common/제목 배경사진.png">
                <div class="text-overlay">
                    <h1>Mzym 운동시설 소개</h1>
                </div>
            </div>
            <div class="addressArea"><span style="font-size: 40px; font-weight: bold;">시설 소개</span></div>
           
            <div class="contentArea">
                <div class="contentField">서울 금천구에 위치한 MYZE은 쾌적하고 넓은 운동공간과 세련되고 깔끔한 인테리어 디자인, 개별부스 샤워시설 및 깔끔한 파우더룸, 12대 이상의 파워렉과 뉴텍 토쳐 머신이 준비된 프리미엄 피트니스 센터입니다.</div>
            </div>
            <div class="informationArea">
                <div class="informationItem">  
                  <div class="itemImg"><img src="<%=contextPath %>/resources/img/common/시설소개_유산소운동존.png"></div>
                  <div class="itemContent">
                    <h3>유산소 운동 zone</h>
                      <ul>
                        <li>넷플릭스등 OTT 시청이 가능한 최신식 런닝머신</li>
                        <li>고가의 천국의 계단, 사이클 머신 다수 보유</li>
                        <li>안정적인 기동성과 관절에 부담이 적은 인체 공학 설계로 안전한 트레이닝 머신</li>
                      </ul>
                  </div>
                </div>
                <div class="informationItem"> 
                  <div class="itemImg"><img src="<%=contextPath %>/resources/img/common/시설소개_프리웨이트운동존.png"></div>
                  <div class="itemContent">
                    <h3>프리웨이트 운동 zone</h>
                      <ul>
                        <li>운동하기 최적화된 동선을 짜기 위해 
                          렉 전용 프리 웨이트
                          덤벨 전용 프리웨이트존을
                          각각 운용</li>
                        <li>평, 인클라인 벤치를 이용하여 
                          다양한 종류의 덤벨 응용 운동도 가능
                          정면, 측면에 큰 전신거울 설치</li>
                        <li>초보자를 위한 10kg 저중량 덤벨부터 숙련자를 위한 60kg 덤벨까지 다양한 무게 구비</li>
                      </ul>
                  </div>
                </div>
                <div class="informationItem">
                  <div class="itemImg"><img src="<%=contextPath %>/resources/img/common/시설소개-스트레칭존.png"></div>
                  <div class="itemContent">
                    <h3>스트레칭 운동 zone</h>
                      <ul>
                        <li>운동전 오직 스트레칭만을 위해 넓은 장소의 스트레칭존 운영중</li>
                        <li>부족하지 않도록 다양한 여분 매트와 소도구 구비</li>
    
                      </ul>
                  </div>
                </div>
            </div>
          
          
          
          </div>
		</section>
        <!-- Section end -->
        
	<%@ include file="/views/common/Mzym_footer.jsp" %>



	</div>
</body>
</html>